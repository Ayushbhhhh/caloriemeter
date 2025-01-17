import 'package:flutter/cupertino.dart';
import 'dart:math';

class Calculate {
  final int height, weight, age;
  final String gender, goal, activity;
  late double _bmi, _calorie_activity, _calorie_goal, _bmr;

  Calculate(
      {required this.height,
      required this.weight,
      required this.age,
      required this.gender,
      required this.goal,
      required this.activity});
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String calculateBMR() {
    if (gender == 'Female')
      _bmr = (10 * weight + 6.25 * height * 2.54 - 5 * age - 161) - 166;
    else
      _bmr = (10 * weight + 6.25 * height - 5 * age + 5) + 166;
    return _bmr.toStringAsFixed(2);
    // return height.toString();
  }

  String getActivity() {
    if (activity == "Little to no exercise")
      _calorie_activity = _bmr * 1.2;
    else if (activity == "Light exercise (1–3 days per week)")
      _calorie_activity = _bmr * 1.375;
    else if (activity == "Moderate exercise (3–5 days per week)")
      _calorie_activity = _bmr * 1.55;
    else if (activity == "Heavy exercise (6–7 days per week")
      _calorie_activity = _bmr * 1.725;
    else
      _calorie_activity = _bmr * 1.9;
    return _calorie_activity.toStringAsFixed(2);
  }

  String getGoal() {
    if (goal == "Lose 0.5kg per week")
      _calorie_goal = _calorie_activity - 500;
    else if (goal == "Lose 1kg per week")
      _calorie_goal = _calorie_activity - 1000;
    else if (goal == "Gain 0.5kg per week")
      _calorie_goal = _calorie_activity + 500;
    else if (goal == "Gain 1kg per week")
      _calorie_goal = _calorie_activity + 1000;
    else
      _calorie_goal = _calorie_activity;
    return _calorie_goal.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25)
      return "Overweight";
    else if (_bmi > 18.5)
      return "Normal";
    else
      return "Underweight";
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return "You have a higher than normal body weight. Try to exercise more.";
    else if (_bmi > 18.5)
      return "You have normal body weight. Good Job!!";
    else
      return "You have a lower than normal body weight. You can eat a bit more.";
  }
}
