import 'package:english_words/english_words.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimelineRepository {
  List<WordPair> getTimelineWordsList({required int qty}) {
    final suggestions = <WordPair>[];
    suggestions.addAll(generateWordPairs().take(qty));
    return suggestions;
  }
}

final timelineRepositoryProvider = Provider<TimelineRepository>((ref) {
  return TimelineRepository();
});
