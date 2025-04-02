import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int video;

  const LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.video = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json['name'] ?? 'No name',
        videoUrl: json['videoUrl'],
        likes: json['likes'] ?? 0,
        video: json['views'] ?? 0,
      );

  Map<String, dynamic> toJson() {
    return {'name': name, 'videoUrl': videoUrl, 'likes': likes, 'views': video};
  }

  VideoPost toVideoPostEntity() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: video);
}
