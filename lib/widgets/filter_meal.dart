import 'package:flutter/material.dart';

class FilterMeal extends StatelessWidget {
  const FilterMeal({
    super.key,
    required this.filterSet,
    required this.filterTitle,
    required this.filterSubtitle,
    required this.onChange,
  });

  final bool filterSet;
  final String filterTitle;
  final String filterSubtitle;
  final void Function(bool isChecked) onChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterSet,
      onChanged: onChange,
      title: Text(
        filterTitle,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        filterSubtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
    );
  }
}
