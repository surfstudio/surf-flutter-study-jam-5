import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/screen/widgets/shared_content.dart';

class ChooseSample extends StatelessWidget {
  const ChooseSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Not enough time, please go back',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: gradientDecoration(),
        child: SafeArea(
            child: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: CachedNetworkImage(
              imageUrl: 'https://i.imgflip.com/2wgjzj.jpg',
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
