import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  IconData icon;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });
}

List<CategoryModel> getCategories() {
  return [
    CategoryModel(
      name: 'Salad',
      icon: Icons.local_dining,
      boxColor: const Color.fromARGB(255, 199, 169, 223),
    ),
    CategoryModel(
      name: 'Cake',
      icon: Icons.cake,
      boxColor: const Color.fromARGB(255, 177, 255, 191),
    ),
    CategoryModel(
      name: 'Pie',
      icon: Icons.pie_chart,
      boxColor: const Color.fromARGB(255, 154, 207, 230),
    ),
    CategoryModel(
      name: 'Smoothie',
      icon: Icons.local_drink,
      boxColor: const Color.fromARGB(255, 209, 227, 167),
    ),
    CategoryModel(
      name: 'Soup',
      icon: Icons.soup_kitchen,
      boxColor: const Color.fromARGB(255, 255, 224, 178),
    ),
  ];
}
