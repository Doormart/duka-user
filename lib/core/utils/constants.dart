import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';

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