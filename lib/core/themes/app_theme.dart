import 'package:kewsa/imports_bindings.dart';

///*
final lightTheme = ThemeData(
  fontFamily: 'PlayfairDisplay',
  scaffoldBackgroundColor: AppColors.light,
  primarySwatch: Colors.lightGreen,
  primaryColor: AppColors.primary,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  canvasColor: AppColors.light,
  dropdownMenuTheme: const DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.light),
      surfaceTintColor: WidgetStatePropertyAll(AppColors.light),
    ),
  ),
  cardTheme: const CardTheme(
    color: Color.fromARGB(255, 252, 255, 249),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.light,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.light,
  ),
  dialogBackgroundColor: AppColors.light,
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.light,
    surfaceTintColor: AppColors.light,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        8,
      ),
      side: const BorderSide(
        color: Color(0xffCECECE),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppStyles.text16Px.light,
      padding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.light,
      disabledBackgroundColor: AppColors.lightPrimary,
      disabledForegroundColor: AppColors.light,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixStyle: const TextStyle(fontSize: 14),
    filled: true,
    fillColor: const Color(0xffF6F6F6),
    labelStyle: AppStyles.text16Px,
    // isDense: true,
    // isCollapsed: true,
    contentPadding: const EdgeInsets.all(20),
    hintStyle: AppStyles.text16Px.kcolor(const Color(0xffACACAC)),
    errorStyle: AppStyles.text14Px.error,
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        width: 0,
        color: Colors.transparent,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.error,
        width: 0,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: AppColors.error,
        width: 0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xffE3E5E5),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xffE3E5E5),
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xffE3E5E5),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.dark,
      disabledForegroundColor: AppColors.lightPrimary,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'PlayfairDisplay'),
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      side: const BorderSide(color: Colors.grey),
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.dark,
  ),
  textTheme: TextTheme(
    displaySmall: AppStyles.text13Px.dark,
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: AppStyles.text16Px.dark,
    toolbarHeight: 68,
    centerTitle: true,
    backgroundColor: AppColors.light,
    surfaceTintColor: AppColors.light,
  ),
);
