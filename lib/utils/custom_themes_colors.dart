import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  late ThemeData lightTheme;
  late ThemeData darkTheme;
}

const Color ktertiarycolor = Color(0xff006875);
const Color ksecondaryColor = Color(0xffdf96b1);
const Color kPrimaryColor = Color(0xff0277bd);
const Color kredPinkColor = Color(0xFF970231);

class CustomThemeBlue extends CustomTheme {
  @override
  ThemeData get lightTheme {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xff0277bd),
        primaryContainer: Color(0xffd0e4ff),
        secondary: Color(0xffdf96b1),
        secondaryContainer: Color(0xffffdbcf),
        tertiary: Color(0xff006875),
        tertiaryContainer: Color(0xff95f0ff),
        appBarColor: Color(0xffffdbcf),
        error: Color(0xffb00020),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 9,
      appBarOpacity: 0.98,
      appBarElevation: 2.0,
      subThemesData: const FlexSubThemesData(
        outlinedButtonBorderWidth: 1.5,
        tabBarItemSchemeColor: SchemeColor.inverseSurface,
        tabBarIndicatorSchemeColor: SchemeColor.onPrimary,
        bottomNavigationBarElevation: 4.0,
      ),
      keyColors: const FlexKeyColors(
        keepSecondary: true,
        keepTertiary: true,
        keepTertiaryContainer: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      // To use the playground font, add GoogleFonts package and uncomment
      fontFamily: GoogleFonts.mukta().fontFamily,

      // fontFamily: GoogleFonts.jaldi().fontFamily,
      // fontFamily: GoogleFonts.karla().fontFamily,
      // fontFamily: GoogleFonts.muktaVaani().fontFamily,
      // fontFamily: GoogleFonts.koHo().fontFamily,
    );
  }

  @override
  ThemeData get darkTheme {
    return FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xff0277bd),
        primaryContainer: Color(0xffd0e4ff),
        secondary: Color(0xffdf96b1),
        secondaryContainer: Color(0xffffdbcf),
        tertiary: Color(0xff006875),
        tertiaryContainer: Color(0xff95f0ff),
        appBarColor: Color(0xffffdbcf),
        error: Color(0xffb00020),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 15,
      subThemesData: const FlexSubThemesData(
        outlinedButtonBorderWidth: 1.5,
        bottomNavigationBarElevation: 4.0,
      ),
      keyColors: const FlexKeyColors(
        keepSecondary: true,
        keepSecondaryContainer: true,
        keepTertiaryContainer: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      // To use the Playground font, add GoogleFonts package and uncomment
      fontFamily: GoogleFonts.mukta().fontFamily,
    );
  }
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}

class CustomeThemeGreen extends CustomTheme {
  @override
  ThemeData get lightTheme {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xff065808),
        primaryContainer: Color(0xff9bbc9c),
        secondary: Color(0xff365b37),
        secondaryContainer: Color(0xffaebdaf),
        tertiary: Color(0xff2c7e2e),
        tertiaryContainer: Color(0xffb8e6b9),
        appBarColor: Color(0xffb8e6b9),
        error: Color(0xffb00020),
      ),
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      appBarOpacity: 0.95,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
        thinBorderWidth: 1.5,
        chipRadius: 8.0,
        dialogRadius: 8.0,
        timePickerDialogRadius: 8.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      // To use the playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    )

// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
        ;
  }

  @override
  ThemeData get darkTheme => FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff629f80),
          primaryContainer: Color(0xff273f33),
          secondary: Color(0xff81b39a),
          secondaryContainer: Color(0xff4d6b5c),
          tertiary: Color(0xff88c5a6),
          tertiaryContainer: Color(0xff356c50),
          appBarColor: Color(0xff356c50),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          thinBorderWidth: 1.5,
          chipRadius: 8.0,
          dialogRadius: 8.0,
          timePickerDialogRadius: 8.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
}

class CustomThemeIndigo extends CustomTheme {
  @override
  ThemeData get lightTheme => FlexThemeData.light(
        scheme: FlexScheme.indigo,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
          thinBorderWidth: 1.5,
          chipRadius: 8.0,
          dialogRadius: 8.0,
          timePickerDialogRadius: 8.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
  @override
  ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.indigo,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          thinBorderWidth: 1.5,
          chipRadius: 8.0,
          dialogRadius: 8.0,
          timePickerDialogRadius: 8.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
}

class CustomThemePurpleBrown extends CustomTheme {
  @override
  ThemeData get lightTheme => FlexThemeData.light(
        scheme: FlexScheme.purpleBrown,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
          thinBorderWidth: 1.5,
          chipRadius: 8.0,
          dialogRadius: 8.0,
          timePickerDialogRadius: 8.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
  @override
  ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.purpleBrown,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          thinBorderWidth: 1.5,
          chipRadius: 8.0,
          dialogRadius: 8.0,
          timePickerDialogRadius: 8.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
}

class CustomThemeDellGenoaGreen extends CustomTheme {
  @override
  ThemeData get lightTheme => FlexThemeData.light(
        scheme: FlexScheme.dellGenoa,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
          thinBorderWidth: 1.5,
          chipRadius: 8.0,
          dialogRadius: 8.0,
          timePickerDialogRadius: 8.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );

  @override
  ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.dellGenoa,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          thinBorderWidth: 1.5,
          chipRadius: 8.0,
          dialogRadius: 8.0,
          timePickerDialogRadius: 8.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
}

class CustomThemeOuterSpaceRange extends CustomTheme {
  @override
  ThemeData get lightTheme => FlexThemeData.light(
        scheme: FlexScheme.outerSpace,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );

  @override
  ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.outerSpace,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarOpacity: 0.90,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
}

class CustomThemeVesuviusBurned extends CustomTheme {
  @override
  ThemeData get lightTheme => FlexThemeData.light(
        scheme: FlexScheme.vesuviusBurn,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );

  @override
  ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.vesuviusBurn,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarOpacity: 0.90,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
}
