import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';
import 'package:toktik/presentation/widgets/video/video_backgorund.dart';
import 'package:toktik/presentation/widgets/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return Stack(
          children: [
            //Videos player + gradiente
            SizedBox.expand(
              child: FullscreenPlayer(
                videoUrl: video.videoUrl,
                caption: video.caption,
              )
            ),
            VideoBackgorund(
              stops: [0.8, 1.0],
            ),
            //Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: video))
          ],
        );
      },
    );
  }
}


