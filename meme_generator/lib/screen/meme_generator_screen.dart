import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart' as ip;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class MemeGeneratorScreen extends StatefulWidget {
  const MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => _MemeGeneratorScreenState();
}

enum ImageSource { clipboard, camera, galery }

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _memeKey = GlobalKey();

  String _imageNetworkLink = '';
  ip.XFile? _pickedFile;

  _clearAllSources() {
    _imageNetworkLink = '';
    _pickedFile = null;
    setState(() {});
  }

  Future<void> _share() {
    List<String> imagePaths = [];
    final RenderBox box = context.findRenderObject() as RenderBox;
    return Future.delayed(const Duration(milliseconds: 20), () async {
      RenderRepaintBoundary? boundary =
          _memeKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile = File('$directory/screenshot.png');
      imagePaths.add(imgFile.path);
      imgFile.writeAsBytes(pngBytes).then((value) async {
        await Share.shareFiles(imagePaths,
            subject: 'Share',
            text: 'Check this Out!',
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      }).catchError((onError) {
        debugPrint(onError);
      });
    });
  }

  bool get _allSourcesEmpty => _imageNetworkLink.isEmpty && _pickedFile == null;

  bool get _shareable => !_allSourcesEmpty && _controller.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.black,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _shareable && !_focusNode.hasFocus
              ? FloatingActionButton(
                  onPressed: _share,
                  child: const Icon(Icons.share),
                )
              : null,
          body: LayoutBuilder(
              builder: (context, constraints) => ListView(children: [
                    Container(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Power Demotivator Maker',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Impact',
                                  fontSize: 40,
                                  color: Colors.white54,
                                )),
                            RepaintBoundary(
                              key: _memeKey,
                              child: ColoredBox(
                                color: Colors.black,
                                child: DecoratedBox(
                                  decoration: decoration,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        if (_allSourcesEmpty)
                                          SizedBox(
                                              width: double.infinity,
                                              height: 200,
                                              child: InkResponse(
                                                onTap: () {},
                                                child: DecoratedBox(
                                                  decoration: decoration,
                                                  child: PopupMenuButton<
                                                          ImageSource>(
                                                      position:
                                                          PopupMenuPosition
                                                              .over,
                                                      onOpened: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                      },
                                                      onSelected:
                                                          (value) async {
                                                        switch (value) {
                                                          case ImageSource
                                                                .clipboard:
                                                            final clipboardData =
                                                                await Clipboard
                                                                    .getData(
                                                                        'text/plain');
                                                            setState(() {
                                                              _imageNetworkLink =
                                                                  clipboardData
                                                                          ?.text ??
                                                                      '';
                                                            });
                                                            break;
                                                          case ImageSource
                                                                .camera:
                                                            _pickedFile = await ip
                                                                    .ImagePicker()
                                                                .pickImage(
                                                                    source: ip
                                                                        .ImageSource
                                                                        .camera);
                                                            setState(() {});
                                                            break;
                                                          case ImageSource
                                                                .galery:
                                                            _pickedFile = await ip
                                                                    .ImagePicker()
                                                                .pickImage(
                                                                    source: ip
                                                                        .ImageSource
                                                                        .gallery);
                                                            setState(() {});
                                                            break;
                                                        }
                                                      },
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            12.5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Text(
                                                              'Добавить картинку',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      itemBuilder: (context) {
                                                        return <PopupMenuEntry<
                                                            ImageSource>>[
                                                          const PopupMenuItem(
                                                            enabled: false,
                                                            child: Row(
                                                              children: [
                                                                Text('Вставка'),
                                                              ],
                                                            ),
                                                          ),
                                                          const PopupMenuDivider(),
                                                          const PopupMenuItem<
                                                              ImageSource>(
                                                            value: ImageSource
                                                                .clipboard,
                                                            child: Text(
                                                                'Буфер обмена'),
                                                          ),
                                                          const PopupMenuItem<
                                                              ImageSource>(
                                                            value: ImageSource
                                                                .camera,
                                                            child: Text(
                                                                'Сделать фото'),
                                                          ),
                                                          const PopupMenuItem<
                                                              ImageSource>(
                                                            value: ImageSource
                                                                .galery,
                                                            child:
                                                                Text('Галерея'),
                                                          ),
                                                        ];
                                                      }),
                                                ),
                                              )),
                                        if (_pickedFile != null)
                                          Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                height: 200,
                                                child: DecoratedBox(
                                                  decoration: decoration,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Image.file(
                                                      File(_pickedFile!.path),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IconButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.white)),
                                                    onPressed: _clearAllSources,
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                    )),
                                              )
                                            ],
                                          ),
                                        if (_imageNetworkLink.isNotEmpty)
                                          Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                height: 200,
                                                child: DecoratedBox(
                                                  decoration: decoration,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Image.network(
                                                      _imageNetworkLink,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          const Center(
                                                        child: Text(
                                                          'Некорректная ссылка',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IconButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.white)),
                                                    onPressed: _clearAllSources,
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                    )),
                                              )
                                            ],
                                          ),
                                        IntrinsicWidth(
                                          child: TextField(
                                            focusNode: _focusNode,
                                            maxLines: null,
                                            controller: _controller,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Impact',
                                              fontSize: 20,
                                            ),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    'Демотивировать картинку',
                                                hintStyle: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ]))),
    );
  }
}
