// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Blog _$$_BlogFromJson(Map<String, dynamic> json) => _$_Blog(
      date: DateTime.parse(json['date'] as String),
      shortIntroText: json['shortIntroText'] as String,
      isGuest: json['isGuest'] as bool,
      url: json['url'] as String?,
      id: json['id'] as int,
      memberId: json['memberId'] as int,
      header: json['header'] as String,
      text: json['text'] as String,
      transits: json['transits'] as String?,
      isPublic: json['isPublic'] as bool,
      acceptComments: json['acceptComments'] as bool,
      showTransits: json['showTransits'] as bool,
      nbComments: json['nbComments'] as int?,
      writtenAt: DateTime.parse(json['writtenAt'] as String),
      emailText: json['emailText'] as String?,
      emailedAt: json['emailedAt'] == null
          ? null
          : DateTime.parse(json['emailedAt'] as String),
      bannerImage: json['bannerImage'] as String?,
      category: json['category'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_BlogToJson(_$_Blog instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'shortIntroText': instance.shortIntroText,
      'isGuest': instance.isGuest,
      'url': instance.url,
      'id': instance.id,
      'memberId': instance.memberId,
      'header': instance.header,
      'text': instance.text,
      'transits': instance.transits,
      'isPublic': instance.isPublic,
      'acceptComments': instance.acceptComments,
      'showTransits': instance.showTransits,
      'nbComments': instance.nbComments,
      'writtenAt': instance.writtenAt.toIso8601String(),
      'emailText': instance.emailText,
      'emailedAt': instance.emailedAt?.toIso8601String(),
      'bannerImage': instance.bannerImage,
      'category': instance.category,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
