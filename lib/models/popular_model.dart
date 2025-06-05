import 'package:flutter/material.dart';

class PopularDietsModels {
  String name;
  IconData icon2;
  String level;
  String duration;
  String calories;
  bool boxIsSelected;

  PopularDietsModels({
    required this.name,
    required this.icon2,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxIsSelected,
  });

  static List<PopularDietsModels> getPopularDiets() {
    List<PopularDietsModels> popularDiets = [];

    popularDiets.add(
      PopularDietsModels(
        name: 'Blueberry Pancake',
        icon2: Icons.fastfood,
        level: 'Medium',
        duration: '25 mins',
        calories: '250 kCal',
        boxIsSelected: true,
      ),
    );
    popularDiets.add(
      PopularDietsModels(
        name: 'Avocado Toast',
        icon2: Icons.fastfood, // or another IconData, e.g., Icons.local_dining
        level: 'Easy',
        duration: '15 mins',
        calories: '180 kCal',
        boxIsSelected: false,
      ),
    );
    popularDiets.add(
      PopularDietsModels(
        name: 'salmon Nigiri',
        icon2: Icons.fastfood, // or another IconData, e.g., Icons.local_dining
        level: 'Easy',
        duration: '15 mins',
        calories: '180 kCal',
        boxIsSelected: false,
      ),
    );

    return popularDiets;
  }
}
