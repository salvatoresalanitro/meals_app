import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealDetailScreen(
              meal: meal,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content =
        meals.isNotEmpty
            ? ListView.builder(
              itemCount: meals.length,
              itemBuilder:
                  (ctx, index) => MealItem(
                    meal: meals[index],
                    onSelectMeal: (meal) {
                      _selectMeal(context, meal);
                    },
                  ),
            )
            : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Uh oh ...nothing here!',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge!.copyWith(
                      color:
                          Theme.of(
                            context,
                          ).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Try selecting a different category',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(
                      color:
                          Theme.of(
                            context,
                          ).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            );

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
