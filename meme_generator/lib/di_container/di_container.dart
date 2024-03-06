import 'package:flutter/material.dart';
import 'package:meme_generator/domain/data_providers/image_holder_provider.dart';
import 'package:meme_generator/domain/data_providers/text_holder_provider.dart';
import 'package:meme_generator/domain/entity/image_holder.dart';
import 'package:meme_generator/domain/entity/text_holder.dart';
import 'package:meme_generator/main.dart';
import 'package:meme_generator/routers/routes.dart';
import 'package:meme_generator/screen/widgets/app/my_app.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/stores/text_and_image_handler.dart';
import 'package:meme_generator/stores/text_store.dart';

AppFactory makeAppFactory() => _AppFactoryDefault();

class _AppFactoryDefault implements AppFactory {
  final _diContainer = _DiContainer();
  @override
  Widget makeApp() => MyApp(
        navigation: _diContainer._mainNavigation,
      );
}

class _DiContainer {
  final MainNavigation _mainNavigation = MainNavigation();
  ImageHolder makeImageHolder() => ImageHolder();
  ImageHolderProvider makeImageHolderProvider() =>
      ImageHolderProviderDefault(imageHolder: makeImageHolder());
  TextHolder makeTextHolder() => TextHolder();
  TextHolderProvider makeTextHolderProvider() => TextHolderProviderDefault(
        textHolder: makeTextHolder(),
      );

  _DiContainer();
}

void initStores() {
  _DiContainer diContainer = _DiContainer();

  getIt.registerLazySingleton<TextStore>(() => TextStore(
        textHolder: diContainer.makeTextHolder(),
        textHolderProvider: diContainer.makeTextHolderProvider(),
      ));
  getIt.registerLazySingleton<ImageStore>(() => ImageStore(
        imageHolder: diContainer.makeImageHolder(),
        imageHolderProvider: diContainer.makeImageHolderProvider(),
      ));
}
