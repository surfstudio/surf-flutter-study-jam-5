import 'package:meme_generator/data/image_url.dart';
import 'package:meme_generator/widgets/html_cache_image.dart';
import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:provider/provider.dart';


class ImageRotateWidget extends StatefulWidget {
  const ImageRotateWidget({Key? key}) : super(key: key);

  @override
  State<ImageRotateWidget> createState() => _ImageRotateWidgetState();
}

class _ImageRotateWidgetState extends State<ImageRotateWidget> {

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return
      MatrixGestureDetector
        (
        onMatrixUpdate: (m, tm, sm, rm) {
          notifier.value = m;
        },
        child: AnimatedBuilder(
          animation: notifier,
          builder: (ctx, child) {
            return Transform(
              transform: notifier.value,
              child: HtmlCacheImage(imageUrl: context.watch<ImageUrl>().getUrl),//Image.network(context.watch<ImageUrl>().getUrl),
              //Image.asset('assets/story.png'),
            );
          },

        )

        ,

      );
  }
}