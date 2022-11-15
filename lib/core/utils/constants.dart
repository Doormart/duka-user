import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

InputDecoration kFormTextDecoration = InputDecoration(
  hintStyle: const TextStyle(
    color: Palette.inactiveGrey,
  ),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      SizeMg.radius(10),
    ),
    borderSide: BorderSide(
      width: SizeMg.width(2),
      color: Palette.inactiveGrey,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      SizeMg.radius(10),
    ),
    borderSide: BorderSide(
      width: SizeMg.width(2),
      color: Palette.staleBlue,
    ),
  ),
);

InputDecoration kProfileInputDecoration = InputDecoration(
  filled: true,
  fillColor: Palette.offWhite,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(SizeMg.radius(15),),
  ),
);

NumberFormat kNumFormatNoDecimal = NumberFormat('#,###');

NumberFormat kNumFormatDecimal = NumberFormat('#,###.0#');