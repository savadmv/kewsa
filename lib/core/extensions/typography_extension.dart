// ignore_for_file: public_member_api_docs

import 'package:kewsa/imports_bindings.dart';

///* For store global typography properties and methords
extension TextStyleX on TextStyle {
  //*Colors
  TextStyle get dark => copyWith(color: AppColors.dark);
  TextStyle get accent => copyWith(color: AppColors.accent);
  TextStyle get light => copyWith(color: AppColors.light);
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get error => copyWith(color: AppColors.error);

  //* Custom methords
  TextStyle kcolor(Color color) => copyWith(color: color);

  //opacity methods
  ///
  TextStyle opacity(double opacity) => copyWith(color: color?.withOpacity(opacity));
}
