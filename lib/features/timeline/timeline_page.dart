import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/controllers/timeline_controller.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelinePage extends ConsumerWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timelineDataValue = ref.watch(timelineControllerProvider(10));
    return Container(
      child: timelineDataValue.when(
          data: (timelineData) => TimelineContent(data: timelineData),
          error: (e, __) => Text(e.toString()),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}

class TimelineContent extends ConsumerWidget {
  const TimelineContent({Key? key, required this.data}) : super(key: key);
  final List<WordPair> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(child: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (context, i) {
          return _buildRow(data[i], i <= 0, i == data.length - 1);
        });
  }

  Widget _buildRow(WordPair pair, isFirst, isLast) {
    return TimelineTile(
      beforeLineStyle: const LineStyle(color: Colors.white),
      afterLineStyle: const LineStyle(color: Colors.white),
      indicatorStyle: IndicatorStyle(
        width: 30,
        color: Colors.white,
        iconStyle: IconStyle(
          color: Colors.blue,
          iconData: Icons.thumb_up,
        ),
      ),
      alignment: TimelineAlign.center,
      isFirst: isFirst,
      isLast: isLast,
      endChild: Container(
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        child: Column(children: [
          Text(pair.asPascalCase,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
          Text(pair.asPascalCase,
              style: const TextStyle(fontSize: 12, color: Colors.white))
        ], mainAxisAlignment: MainAxisAlignment.center),
      ),
      startChild: Container(
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        child: Center(
            child: Text(pair.asPascalCase,
                style: const TextStyle(fontSize: 15, color: Colors.white))),
      ),
    );
  }
}
