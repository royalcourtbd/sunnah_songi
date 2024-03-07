/// A utility class for commonly used font families in the app.
///
/// Provides constants for commonly used font families
///
/// Using this class to access the font families
/// ensures that there are no typos or spelling mistakes in the font
/// family names.
///
/// Note that hardcoding the font family names in the app's code can
/// lead to potential mistakes and inconsistencies if the font family
/// names change or if different developers use different spellings
/// for the same font family.
///
/// By using constants from this class, we ensure that all the font family names
/// are consistent and easily editable from a single location.
///
/// For example, we can switch to a different font package or a different
/// implementation of the 'GoogleFonts' package without changing the code that
/// uses the 'Hind Siliguri' font family.
class FontFamily {
  FontFamily._();

  static const String kalpurush = 'Kalpurush';
}
