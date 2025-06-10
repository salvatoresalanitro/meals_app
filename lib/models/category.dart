import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange //falbback, when is no provided this color will be used
  });

  final String id;
  final String title;
  final Color color;
}