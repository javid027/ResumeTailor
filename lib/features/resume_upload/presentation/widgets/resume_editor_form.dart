import 'package:flutter/material.dart';

import '../../domain/models/education_entry.dart';
import '../../domain/models/experience_entry.dart';
import '../../domain/models/parsed_contact.dart';
import '../../domain/models/resume.dart';

class ResumeEditorForm extends StatefulWidget {
  const ResumeEditorForm({
    super.key,
    required this.resume,
    required this.isSaving,
    required this.onSave,
    required this.onStartOver,
    required this.onAddJobDescription,
  });

  final Resume resume;
  final bool isSaving;
  final ValueChanged<Resume> onSave;
  final VoidCallback onStartOver;
  final VoidCallback onAddJobDescription;

  @override
  State<ResumeEditorForm> createState() => _ResumeEditorFormState();
}

class _ResumeEditorFormState extends State<ResumeEditorForm> {
  late final _name = TextEditingController(text: widget.resume.parsedContact?.name);
  late final _email = TextEditingController(text: widget.resume.parsedContact?.email);
  late final _phone = TextEditingController(text: widget.resume.parsedContact?.phone);
  late final _location = TextEditingController(text: widget.resume.parsedContact?.location);
  late final _summary = TextEditingController(text: widget.resume.summary);
  late final List<String> _skills = List.of(widget.resume.skills ?? const []);
  final _newSkillController = TextEditingController();
  late final List<_ExperienceDraft> _experience =
      (widget.resume.experience ?? const []).map(_ExperienceDraft.new).toList();
  late final List<_EducationDraft> _education =
      (widget.resume.education ?? const []).map(_EducationDraft.new).toList();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _location.dispose();
    _summary.dispose();
    _newSkillController.dispose();
    for (final e in _experience) {
      e.dispose();
    }
    for (final e in _education) {
      e.dispose();
    }
    super.dispose();
  }

  void _addSkill() {
    final skill = _newSkillController.text.trim();
    if (skill.isEmpty) return;
    setState(() {
      _skills.add(skill);
      _newSkillController.clear();
    });
  }

  void _save() {
    final draft = widget.resume.copyWith(
      parsedContact: ParsedContact(
        name: _orNull(_name.text),
        email: _orNull(_email.text),
        phone: _orNull(_phone.text),
        location: _orNull(_location.text),
      ),
      summary: _summary.text,
      skills: _skills,
      experience: _experience.map((e) => e.toEntry()).toList(),
      education: _education.map((e) => e.toEntry()).toList(),
    );
    widget.onSave(draft);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionCard(
          title: 'Contact',
          child: Column(
            children: [
              TextField(controller: _name, decoration: const InputDecoration(labelText: 'Name')),
              TextField(controller: _email, decoration: const InputDecoration(labelText: 'Email')),
              TextField(controller: _phone, decoration: const InputDecoration(labelText: 'Phone')),
              TextField(
                controller: _location,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
            ],
          ),
        ),
        _SectionCard(
          title: 'Summary',
          child: TextField(
            controller: _summary,
            maxLines: 4,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        _SectionCard(
          title: 'Skills',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  for (final skill in _skills)
                    Chip(
                      label: Text(skill),
                      onDeleted: () => setState(() => _skills.remove(skill)),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _newSkillController,
                      decoration: const InputDecoration(labelText: 'Add a skill'),
                      onSubmitted: (_) => _addSkill(),
                    ),
                  ),
                  IconButton(onPressed: _addSkill, icon: const Icon(Icons.add)),
                ],
              ),
            ],
          ),
        ),
        _SectionCard(
          title: 'Experience',
          child: Column(
            children: [
              for (final entry in _experience)
                _ExperienceEditor(
                  draft: entry,
                  onRemove: () => setState(() => _experience.remove(entry)),
                ),
              TextButton.icon(
                onPressed: () => setState(() => _experience.add(_ExperienceDraft(null))),
                icon: const Icon(Icons.add),
                label: const Text('Add experience'),
              ),
            ],
          ),
        ),
        _SectionCard(
          title: 'Education',
          child: Column(
            children: [
              for (final entry in _education)
                _EducationEditor(
                  draft: entry,
                  onRemove: () => setState(() => _education.remove(entry)),
                ),
              TextButton.icon(
                onPressed: () => setState(() => _education.add(_EducationDraft(null))),
                icon: const Icon(Icons.add),
                label: const Text('Add education'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: widget.isSaving ? null : _save,
                child: widget.isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save changes'),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: widget.isSaving ? null : widget.onStartOver,
              child: const Text('Start over'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: widget.isSaving ? null : widget.onAddJobDescription,
          icon: const Icon(Icons.description_outlined),
          label: const Text('Add job description'),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _ExperienceDraft {
  _ExperienceDraft(ExperienceEntry? entry)
      : company = TextEditingController(text: entry?.company),
        title = TextEditingController(text: entry?.title),
        startDate = TextEditingController(text: entry?.startDate),
        endDate = TextEditingController(text: entry?.endDate),
        bullets = (entry?.bullets ?? const []).map((b) => TextEditingController(text: b)).toList();

  final TextEditingController company;
  final TextEditingController title;
  final TextEditingController startDate;
  final TextEditingController endDate;
  final List<TextEditingController> bullets;

  ExperienceEntry toEntry() => ExperienceEntry(
        company: _orNull(company.text),
        title: _orNull(title.text),
        startDate: _orNull(startDate.text),
        endDate: _orNull(endDate.text),
        bullets: bullets.map((c) => c.text.trim()).where((b) => b.isNotEmpty).toList(),
      );

  void dispose() {
    company.dispose();
    title.dispose();
    startDate.dispose();
    endDate.dispose();
    for (final b in bullets) {
      b.dispose();
    }
  }
}

class _EducationDraft {
  _EducationDraft(EducationEntry? entry)
      : institution = TextEditingController(text: entry?.institution),
        degree = TextEditingController(text: entry?.degree),
        startDate = TextEditingController(text: entry?.startDate),
        endDate = TextEditingController(text: entry?.endDate);

  final TextEditingController institution;
  final TextEditingController degree;
  final TextEditingController startDate;
  final TextEditingController endDate;

  EducationEntry toEntry() => EducationEntry(
        institution: _orNull(institution.text),
        degree: _orNull(degree.text),
        startDate: _orNull(startDate.text),
        endDate: _orNull(endDate.text),
      );

  void dispose() {
    institution.dispose();
    degree.dispose();
    startDate.dispose();
    endDate.dispose();
  }
}

String? _orNull(String value) => value.trim().isEmpty ? null : value.trim();

class _ExperienceEditor extends StatefulWidget {
  const _ExperienceEditor({required this.draft, required this.onRemove});

  final _ExperienceDraft draft;
  final VoidCallback onRemove;

  @override
  State<_ExperienceEditor> createState() => _ExperienceEditorState();
}

class _ExperienceEditorState extends State<_ExperienceEditor> {
  @override
  Widget build(BuildContext context) {
    final draft = widget.draft;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: draft.title,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                ),
                IconButton(onPressed: widget.onRemove, icon: const Icon(Icons.delete_outline)),
              ],
            ),
            TextField(
              controller: draft.company,
              decoration: const InputDecoration(labelText: 'Company'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: draft.startDate,
                    decoration: const InputDecoration(labelText: 'Start date'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: draft.endDate,
                    decoration: const InputDecoration(labelText: 'End date'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (final bullet in draft.bullets)
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: bullet,
                      decoration: const InputDecoration(labelText: 'Bullet'),
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      draft.bullets.remove(bullet);
                      bullet.dispose();
                    }),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            TextButton.icon(
              onPressed: () => setState(() => draft.bullets.add(TextEditingController())),
              icon: const Icon(Icons.add),
              label: const Text('Add bullet'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EducationEditor extends StatelessWidget {
  const _EducationEditor({required this.draft, required this.onRemove});

  final _EducationDraft draft;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: draft.institution,
                    decoration: const InputDecoration(labelText: 'Institution'),
                  ),
                ),
                IconButton(onPressed: onRemove, icon: const Icon(Icons.delete_outline)),
              ],
            ),
            TextField(
              controller: draft.degree,
              decoration: const InputDecoration(labelText: 'Degree'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: draft.startDate,
                    decoration: const InputDecoration(labelText: 'Start date'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: draft.endDate,
                    decoration: const InputDecoration(labelText: 'End date'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
