import 'package:english_words/english_words.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/repositories/timeline_repository.dart';

class TimelineController extends StateNotifier<AsyncValue<List<WordPair>>> {
  TimelineController(this._timelineRepository, {required this.qty})
      : super(const AsyncValue.loading()) {
    getTimeline(qty: qty);
  }
  final TimelineRepository _timelineRepository;
  final int qty;

  Future<void> getTimeline({required int qty}) async {
    try {
      state = const AsyncValue.loading();
      final suggestions = _timelineRepository.getTimelineWordsList(qty: qty);
      state = AsyncValue.data(suggestions);
    } catch (err) {
      state = AsyncValue.error(err);
    }
  }
}

final timelineControllerProvider = StateNotifierProvider.autoDispose
    .family<TimelineController, AsyncValue<List<WordPair>>, int>((ref, qty) {
  final timelineRepository = ref.watch(timelineRepositoryProvider);
  return TimelineController(timelineRepository, qty: qty);
});
