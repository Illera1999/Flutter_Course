

import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostDataSource {
  Future<String> getFavoriteVideosByPage(String userId);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}