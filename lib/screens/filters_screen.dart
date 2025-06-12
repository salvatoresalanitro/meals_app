import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_meal.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  void _updateFilter(Filter filterType, bool isChecked) {
    setState(() {
      switch (filterType) {
        case Filter.glutenFree:
          _glutenFreeFilterSet = isChecked;
          break;
        case Filter.lactoseFree:
          _lactoseFreeFilterSet = isChecked;
          break;
        case Filter.vegetarian:
          _vegetarianFilterSet = isChecked;
          break;
        case Filter.vegan:
          _veganFilterSet = isChecked;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            FilterMeal(
              filterSet: _glutenFreeFilterSet,
              filterTitle: 'Gluten-free',
              filterSubtitle: 'Only include gluten-free meals.',
              onChange:
                  (isChecked) =>
                      _updateFilter(Filter.glutenFree, isChecked),
            ),
            FilterMeal(
              filterSet: _lactoseFreeFilterSet,
              filterTitle: 'Lactose-free',
              filterSubtitle: 'Only include lactose-free meals.',
              onChange:
                  (isChecked) =>
                      _updateFilter(Filter.lactoseFree, isChecked),
            ),
            FilterMeal(
              filterSet: _vegetarianFilterSet,
              filterTitle: 'Vegetarian',
              filterSubtitle: 'Only include vegetarian meals.',
              onChange:
                  (isChecked) =>
                      _updateFilter(Filter.vegetarian, isChecked),
            ),
            FilterMeal(
              filterSet: _veganFilterSet,
              filterTitle: 'Vegan',
              filterSubtitle: 'Only include vegan meals.',
              onChange:
                  (isChecked) =>
                      _updateFilter(Filter.vegan, isChecked),
            ),
          ],
        ),
      ),
    );
  }
}
