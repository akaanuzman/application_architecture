import '../app/app_constants.dart';

class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = ImageConstants.init();
      return _instance!;
    }
  }

  ImageConstants.init();

  String get logo => toPng("logo");

  String toPng(String name) =>
      "${ApplicationConstants.IMAGE_ASSET_PATH}$name.png";
}
