import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meme_generator/routers/routes.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/screen/widgets/shared_content.dart';
import 'package:meme_generator/theme/colors.dart';

part 'parts/tapping_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'How to create meme?',
            style: TextStyle(
              color: AppColors.mainWhite,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: gradientDecoration(),
          child: SafeArea(
            child: Padding(
              padding: mainPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TappingContainer(
                    borderColor: AppColors.mainGreen,
                    text: 'From scratch',
                    onTap: () =>
                        context.pushNamed(mainRoutesName(MainRoutes.createNew)),
                  ),
                  Space.v5,
                  const Center(
                    child: Text(
                      'Tap to your fighter',
                      style: TextStyle(color: AppColors.mainWhite),
                    ),
                  ),
                  Space.v5,
                  TappingContainer(
                    borderColor: AppColors.mainBlue,
                    text: 'Use samples',
                    onTap: () => context
                        .pushNamed(mainRoutesName(MainRoutes.chooseSample)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
