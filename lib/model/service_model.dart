import 'package:flutter/material.dart';

class ServiceModel {
  const ServiceModel({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}
