import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_meal.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  void _updateFilter(WidgetRef ref, Filter filterType, bool isChecked) {
    ref.read(filtersProvider.notifier).setFilter(filterType, isChecked);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          FilterMeal(
            filterSet: activeFilters[Filter.glutenFree]!,
            filterTitle: 'Gluten-free',
            filterSubtitle: 'Only include gluten-free meals.',
            onChange:
                (isChecked) =>
                    _updateFilter(ref, Filter.glutenFree, isChecked),
          ),
          FilterMeal(
            filterSet: activeFilters[Filter.lactoseFree]!,
            filterTitle: 'Lactose-free',
            filterSubtitle: 'Only include lactose-free meals.',
            onChange:
                (isChecked) =>
                    _updateFilter(ref, Filter.lactoseFree, isChecked),
          ),
          FilterMeal(
            filterSet: activeFilters[Filter.vegetarian]!,
            filterTitle: 'Vegetarian',
            filterSubtitle: 'Only include vegetarian meals.',
            onChange:
                (isChecked) =>
                    _updateFilter(ref, Filter.vegetarian, isChecked),
          ),
          FilterMeal(
            filterSet: activeFilters[Filter.vegan]!,
            filterTitle: 'Vegan',
            filterSubtitle: 'Only include vegan meals.',
            onChange:
                (isChecked) => _updateFilter(ref, Filter.vegan, isChecked),
          ),
        ],
      ),
    );
  }
}
