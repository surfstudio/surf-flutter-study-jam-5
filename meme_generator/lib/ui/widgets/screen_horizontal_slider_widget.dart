import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meme_generator/viewcontroller/slider_controller.dart';

class ScreenHorizontalSliderWidget extends StatefulWidget {
  final Size indicatorSize;
  final SliderController controller;
  final Color? color;
  final double screenWidth;
  final Duration duration;

  ScreenHorizontalSliderWidget(
      {super.key,
      required this.indicatorSize,
      required this.controller,
      this.color = Colors.white,
      required this.screenWidth, required this.duration});

  @override
  State<ScreenHorizontalSliderWidget> createState() =>
      _ScreenHorizontalSliderWidgetState();
}

class _ScreenHorizontalSliderWidgetState
    extends State<ScreenHorizontalSliderWidget> {
  late final double maxScrollWidth;
  late final ScrollController scrollController;

  double currentFactor = 0;

  @override
  void initState() {
    super.initState();
    maxScrollWidth = widget.screenWidth - widget.indicatorSize.width;
    scrollController = ScrollController(initialScrollOffset: maxScrollWidth);
    widget.controller.stream.listen((factor) {
      if (factor != currentFactor) {
        unawaited(scrollController.animateTo(
          factor * maxScrollWidth,
          duration: widget.controller.animateDuration,
          curve: Curves.linear,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notice) {
        if (notice is ScrollUpdateNotification) {
          currentFactor = (maxScrollWidth - notice.metrics.pixels) / maxScrollWidth;
          widget.controller.add(currentFactor);
        }

        return true;
      },
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Container(
                  width: maxScrollWidth,
                  height: 1,
                  color: Colors.grey.shade400,
                ),
                AnimatedContainer(
                  duration: widget.duration,
                  width: widget.indicatorSize.width,
                  height: widget.indicatorSize.height,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.all(
                        Radius.circular(widget.indicatorSize.height.w)),
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: -2,
                          blurRadius: 2,
                          offset: Offset(0, 3)),
                    ],
                  ),
                ),
                Container(
                  width: maxScrollWidth,
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
