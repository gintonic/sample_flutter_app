import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog.freezed.dart';
part 'blog.g.dart';

@freezed
class Blog with _$Blog {
  factory Blog(
      {required DateTime date,
      required String shortIntroText,
      required bool isGuest,
      String? url,
      required int id,
      required int memberId,
      required String header,
      required String text,
      String? transits,
      required bool isPublic,
      required bool acceptComments,
      required bool showTransits,
      int? nbComments,
      required DateTime writtenAt,
      String? emailText,
      DateTime? emailedAt,
      String? bannerImage,
      String? category,
      DateTime? createdAt,
      DateTime? updatedAt}) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
}
