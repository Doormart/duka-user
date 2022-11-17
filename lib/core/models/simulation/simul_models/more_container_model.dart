import 'package:flutter/material.dart';

class MoreContainerModel{
  final String name;
  final int index;
  final IconData? icon;

  MoreContainerModel({
    required this.name,
    required this.index,
    this.icon,
  });
}