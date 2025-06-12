import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_meal.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  void _updateFilter(String filterType, bool isChecked) {
    setState(() {
      switch (filterType) {
        case 'gluten':
          _glutenFreeFilterSet = isChecked;
          break;
        case 'lactose':
          _lactoseFreeFilterSet = isChecked;
          break;
        case 'vegetarian':
          _vegetarianFilterSet = isChecked;
          break;
        case 'vegan':
          _veganFilterSet = isChecked;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          FilterMeal(
            filterSet: _glutenFreeFilterSet,
            filterTitle: 'Gluten-free',
            filterSubtitle: 'Only include gluten-free meals.',
            onChange:
                (isChecked) => _updateFilter('gluten', isChecked),
          ),
          FilterMeal(
            filterSet: _lactoseFreeFilterSet,
            filterTitle: 'Lactose-free',
            filterSubtitle: 'Only include lactose-free meals.',
            onChange:
                (isChecked) => _updateFilter('lactose', isChecked),
          ),
          FilterMeal(
            filterSet: _vegetarianFilterSet,
            filterTitle: 'Vegetarian',
            filterSubtitle: 'Only include vegetarian meals.',
            onChange:
                (isChecked) => _updateFilter('vegetarian', isChecked),
          ),
          FilterMeal(
            filterSet: _veganFilterSet,
            filterTitle: 'Vegan',
            filterSubtitle: 'Only include vegan meals.',
            onChange:
                (isChecked) => _updateFilter('vegan', isChecked),
          ),
        ],
      ),
    );
  }
}
