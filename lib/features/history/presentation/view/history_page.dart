import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/di/injection.dart';
import '../../../tailoring/presentation/view/tailoring_result_page.dart';
import '../../domain/models/history_item.dart';
import '../cubit/history_cubit.dart';
import '../cubit/history_state.dart';
import '../widgets/history_item_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HistoryCubit>(),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: BlocConsumer<HistoryCubit, HistoryState>(
        listenWhen: (previous, current) => current is HistoryLoadMoreFailure,
        listener: (context, state) {
          final failure = state as HistoryLoadMoreFailure;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(failure.message)));
        },
        builder: (context, state) {
          return switch (state) {
            HistoryInitial() || HistoryLoading() =>
              const Center(child: CircularProgressIndicator()),
            HistoryFailure(:final message) => _ErrorView(
                message: message,
                onRetry: () => context.read<HistoryCubit>().load(),
              ),
            HistoryLoaded(:final items, :final total) =>
              _HistoryList(items: items, total: total, isLoadingMore: false),
            HistoryLoadingMore(:final items, :final total) =>
              _HistoryList(items: items, total: total, isLoadingMore: true),
            HistoryLoadMoreFailure(:final items, :final total) =>
              _HistoryList(items: items, total: total, isLoadingMore: false),
          };
        },
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  const _HistoryList({required this.items, required this.total, required this.isLoadingMore});

  final List<HistoryItem> items;
  final int total;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => context.read<HistoryCubit>().load(),
        child: ListView(
          children: const [
            SizedBox(height: 120),
            Center(child: Text('No tailoring history yet.')),
          ],
        ),
      );
    }

    final hasMore = items.length < total;

    return RefreshIndicator(
      onRefresh: () => context.read<HistoryCubit>().load(),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          final nearBottom =
              notification.metrics.pixels >= notification.metrics.maxScrollExtent - 200;
          if (hasMore && !isLoadingMore && nearBottom) {
            context.read<HistoryCubit>().loadMore();
          }
          return false;
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: items.length + (hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= items.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final item = items[index];
            return HistoryItemCard(
              item: item,
              onTap: () => context.push(
                AppRoute.tailoring.path,
                extra: ViewTailoringArgs(tailoringId: item.id),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Try again')),
          ],
        ),
      ),
    );
  }
}
