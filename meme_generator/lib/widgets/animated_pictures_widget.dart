import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:meme_generator/widgets/enter_picture_link_widget.dart';
import 'package:shimmer/shimmer.dart';

class AnimatedPictureWidget extends StatefulWidget {
  const AnimatedPictureWidget({
    super.key,
    required this.images,
    required this.backgroundImage,
  });
  final List<String> images;
  final String backgroundImage;
  @override
  State<AnimatedPictureWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AnimatedPictureWidget> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    Future.delayed(
      const Duration(seconds: 1),
      () => _controller.animateTo(
        _controller.offset + 60,
        duration: const Duration(seconds: 2),
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final resultingList = List.from(widget.images)
      ..insert(widget.images.length, 'Custom picture');
    // Простите за запутанный код, не успеваю.
    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size.fromHeight(200)),
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        itemCount: resultingList.length,
        itemBuilder: (BuildContext context, int index) {
          if (resultingList[index] == 'Custom picture') {
            return GestureDetector(
              onTap: () async {
                final (bool, String)? fromPhone = await showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      topLeft: Radius.circular(16.0),
                    ),
                  ),
                  backgroundColor: const Color(0xff282a33),
                  builder: (context) {
                    return DraggableScrollableSheet(
                        expand: false,
                        builder: (context, scrollController) {
                          return const EnterPictureLinkWidget();
                        });
                  },
                );
                if (fromPhone?.$1 == true) {
                  // ignore: use_build_context_synchronously
                  context.read<ImagePickerBloc>().add(
                        ImagePickerEventChangePicture(),
                      );
                } else if (fromPhone?.$1 == false) {
                  if (fromPhone!.$2.isNotEmpty) {}
                  // ignore: use_build_context_synchronously
                  context.read<ImagePickerBloc>().add(
                        ImagePickerEventChangePictureWithLink(
                            url: fromPhone.$2),
                      );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                    builder: (context, state) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: switch (state) {
                              ImagePickerStateProccess() => Shimmer.fromColors(
                                  baseColor: Colors.white12,
                                  highlightColor: Colors.greenAccent,
                                  child: const Center(
                                    child: Text('1 sec'),
                                  ),
                                ),
                              ImagePickerStateInitial() ||
                              ImagePickerStateChangingBad() =>
                              // Для выбора своего фона
                                const Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Choose your own,',
                                        style: TextStyle(
                                          fontFamily: 'Impact',
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 44,
                                      ),
                                    )
                                  ],
                                ),
                              ImagePickerStateChangingSuccess() =>
                                state.useUrlSource
                                    ? Image.network(
                                        state.newUrl,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'При загрузке произошла ошибка, попробуйте другую ссылку',
                                              style: TextStyle(
                                                fontFamily: 'Impact',
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Image.file(
                                        File(
                                          state.newUrl,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                            }),
                      );
                    },
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                resultingList[index],
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
