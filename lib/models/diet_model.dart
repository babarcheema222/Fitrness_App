import 'package:flutter/material.dart';

class DietModel {
  String name;
  IconData icon1;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.icon1,
    required this.level,
    required this.boxColor,
    required this.duration,
    required this.calories,

    required this.viewIsSelected,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        name: 'Honey Pancake',
        icon1: Icons.spa,
        level: 'Easy',
        duration: '30 mins',
        calories: '200 kCal',
        boxColor: const Color.fromARGB(255, 199, 169, 223),
        viewIsSelected: true,
      ),
    );

    diets.add(
      DietModel(
        name: 'Canai Bread',
        icon1: Icons.spa,
        level: 'Easy',
        duration: '20 mins',
        calories: '150 kCal',
        boxColor: const Color.fromARGB(255, 177, 255, 191),
        viewIsSelected: true,
      ),
    );

    diets.add(
      DietModel(
        name: 'Peanut Butter',
        icon1: Icons.spa,
        level: 'Easy',
        duration: '20 mins',
        calories: '180 kCal',
        boxColor: const Color.fromARGB(255, 102, 173, 216),
        viewIsSelected: true,
      ),
    );

    return diets;
  }
}
