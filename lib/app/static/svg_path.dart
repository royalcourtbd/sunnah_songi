/// Utility class for commonly used SVG path assets in the app.
///
/// Provides constant strings for the file paths of commonly used SVG assets.
///
/// Note that hardcoding the file paths in the app's code can lead to potential
/// mistakes and inconsistencies if the file paths change or if different
/// developers use different file paths for the same asset.
///
/// By using constants from this class, we ensure that all the file paths are
/// consistent and easily editable from a single location.
///
class SvgPath {
  SvgPath._();

  static const String imgMinar = "assets/images/minar.png";
  static const String icSun = "assets/images/sunrise.png";
}
