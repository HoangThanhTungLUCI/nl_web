part of style;

abstract class AppTheme {
  ThemeData get lightTheme;

  ThemeData get darkTheme;
}

class BaseTheme extends AppTheme {
  @override
  ThemeData get lightTheme => ThemeData(
        // brightness: Brightness.light,
        primaryColor: AppColor.mCPrimary,
        primaryColorDark: AppColor.mCPrimary,
        primaryColorLight: AppColor.mCPrimary,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: AppColor.mCPrimary,
          iconTheme: const IconThemeData(
            color: AppColor.mCInk500,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColor.mCInk500,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          toolbarTextStyle: TextTheme(
            headline6: AppStyles.mSTH500,
          ).bodyText2,
          titleTextStyle: const TextTheme(
            headline6: TextStyle(
              color: AppColor.mCInk900,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ).headline6,
        ),
        textTheme: TextTheme(
          headline5: const TextStyle(color: AppColor.mCInk900),
          subtitle1: const TextStyle(color: AppColor.mCInk900),
          bodyText1: const TextStyle(color: AppColor.mCInk900),
          headline4: const TextStyle(color: AppColor.mCInk900),
          headline3: const TextStyle(color: AppColor.mCInk900),
          headline2: const TextStyle(color: AppColor.mCInk900),
          headline1: const TextStyle(color: AppColor.mCInk900),
          caption: const TextStyle(color: AppColor.mCInk900),
          headline6: const TextStyle(color: AppColor.mCInk900),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColor.mCPrimary,
          cursorColor: AppColor.mCPrimary,
          selectionHandleColor: AppColor.mCPrimary,
        ),
        dialogTheme: const DialogTheme(
          contentTextStyle: TextStyle(
            color: AppColor.mCInk900,
            fontSize: 16.0,
          ),
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
          highlightColor: Colors.white.withOpacity(0.25),
          splashColor: Colors.white.withOpacity(0.25),
        ),
        cardColor: AppColor.mCWhite,
        cardTheme: const CardTheme(
          margin: EdgeInsets.all(0),
          color: AppColor.mCWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          elevation: 4.0,
        ),
        disabledColor: AppColor.mCInk900,
        secondaryHeaderColor: AppColor.mCInk900,
        hintColor: AppColor.mCInk900,
        indicatorColor: AppColor.mCPrimary,
        unselectedWidgetColor: Colors.black.withOpacity(0.5),
        tabBarTheme: TabBarTheme(
          labelColor: AppColor.mCPrimary,
          labelStyle: AppStyles.mSTBaseLineLarge,
          unselectedLabelColor: Colors.black.withOpacity(0.5),
        ),
        dividerColor: AppColor.mCInk400,
        dividerTheme: const DividerThemeData(
          color: AppColor.mCInk400,
          thickness: 1,
          space: 1,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          textStyle: TextStyle(
            color: AppColor.mCInk800,
            fontSize: 16,
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColor.mCPrimary),
      );

  @override
  ThemeData get darkTheme => ThemeData(
        // brightness: Brightness.light,
        primaryColor: AppColor.mCPrimary,
        primaryColorDark: AppColor.mCPrimary,
        primaryColorLight: AppColor.mCPrimary,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: AppColor.mCPrimary,
          iconTheme: const IconThemeData(
            color: AppColor.mCInk500,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColor.mCInk500,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          toolbarTextStyle: TextTheme(
            headline6: AppStyles.mSTH500,
          ).bodyText2,
          titleTextStyle: const TextTheme(
            headline6: TextStyle(
              color: AppColor.mCInk900,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ).headline6,
        ),
        textTheme: TextTheme(
          headline5: const TextStyle(color: AppColor.mCInk900),
          subtitle1: const TextStyle(color: AppColor.mCInk900),
          bodyText1: const TextStyle(color: AppColor.mCInk900),
          headline4: const TextStyle(color: AppColor.mCInk900),
          headline3: const TextStyle(color: AppColor.mCInk900),
          headline2: const TextStyle(color: AppColor.mCInk900),
          headline1: const TextStyle(color: AppColor.mCInk900),
          caption: const TextStyle(color: AppColor.mCInk900),
          headline6: const TextStyle(color: AppColor.mCInk900),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColor.mCPrimary,
          cursorColor: AppColor.mCPrimary,
          selectionHandleColor: AppColor.mCPrimary,
        ),
        dialogTheme: const DialogTheme(
          contentTextStyle: TextStyle(
            color: AppColor.mCInk900,
            fontSize: 16.0,
          ),
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
          highlightColor: Colors.white.withOpacity(0.25),
          splashColor: Colors.white.withOpacity(0.25),
        ),
        cardColor: AppColor.mCWhite,
        cardTheme: const CardTheme(
          margin: EdgeInsets.all(0),
          color: AppColor.mCWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          elevation: 4.0,
        ),
        disabledColor: AppColor.mCInk900,
        secondaryHeaderColor: AppColor.mCInk900,
        hintColor: AppColor.mCInk900,
        indicatorColor: AppColor.mCPrimary,
        unselectedWidgetColor: Colors.black.withOpacity(0.5),
        tabBarTheme: TabBarTheme(
          labelColor: AppColor.mCPrimary,
          labelStyle: AppStyles.mSTBaseLineLarge,
          unselectedLabelColor: Colors.black.withOpacity(0.5),
        ),
        dividerColor: AppColor.mCInk400,
        dividerTheme: const DividerThemeData(
          color: AppColor.mCInk400,
          thickness: 1,
          space: 1,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          textStyle: TextStyle(
            color: AppColor.mCInk800,
            fontSize: 16,
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColor.mCPrimary),
      );
}

class ApplicationTheme extends BaseTheme {
  @override
  ThemeData get lightTheme => super.lightTheme.copyWith(
        appBarTheme: super.lightTheme.appBarTheme.copyWith(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              actionsIconTheme: const IconThemeData(
                color: Colors.white,
              ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: AppColor.mCPrimary,
        tabBarTheme: super.lightTheme.tabBarTheme.copyWith(
              labelColor: AppColor.mCWhite,
              labelStyle: const TextStyle(
                color: AppColor.mCInk900,
                fontWeight: FontWeight.w600,
              ),
            ),
      );

  @override
  ThemeData get darkTheme => super.darkTheme.copyWith(
        scaffoldBackgroundColor: AppColor.mCInk900,
        backgroundColor: AppColor.mCPrimary,
        toggleButtonsTheme: lightTheme.toggleButtonsTheme,
        toggleableActiveColor: lightTheme.toggleableActiveColor,
      );
}
