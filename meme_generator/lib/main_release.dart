import 'package:meme_generator/config/app_config.dart';
import 'package:meme_generator/config/environment/build_types.dart';
import 'package:meme_generator/config/environment/environment.dart';
import 'package:meme_generator/config/urls.dart';
import 'package:meme_generator/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: AppConfig(
      url: Url.prodUrl,
    ),
  );

  run();
}
