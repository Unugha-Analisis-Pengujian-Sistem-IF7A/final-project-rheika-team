import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1E88E5); // Biru tombol
  static const Color gradientTop = Color(0xFF7F9CF5); // Ungu muda (atas)
  static const Color gradientBottom = Color(0xFFFFFFFF); // Putih (bawah)
  static const Color textDark = Color(0xFF212121);
  static const Color textGray = Color(0xFF616161);
  static const Color border = Color(0xFFBDBDBD);
}

class AppTextStyle {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle inputLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );
}
