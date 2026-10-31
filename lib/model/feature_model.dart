import 'package:flutter/material.dart';

class FeatureModel {
  const FeatureModel({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}
