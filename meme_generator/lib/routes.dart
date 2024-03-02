import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meme_generator/ui/pages/generate_image_page.dart';
import 'package:meme_generator/ui/pages/on_boarding_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/generate',
      name: 'generate',
      pageBuilder: (context, state) => NoTransitionPage(
        child: GenerateImage(),
      ),
      /*routes: [
          GoRoute(
            path: 'home-detail-:guideId',
            name: 'home-detail',
            builder: (context, state) {
              final personId =
              int.tryParse(state.pathParameters['guideId']!);
              final _tyuw =
                  BlocProvider.of<GuideListCubit>(context).state;
              final foodlist = (_tyuw as GuideLoaded).guidesList;
              GuideEntity food = foodlist[0];
              for (int i = 0; i < foodlist.length; i++) {
                if (foodlist[i].id == personId) {
                  food = foodlist[i];
                }
              }
              return HomeDetailsScreen(
                guide: food,
              );
            },
          ),
        ],*/
    ),
  ],
);
