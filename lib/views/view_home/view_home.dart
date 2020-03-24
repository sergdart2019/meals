import 'package:flutter/material.dart';
import '../../models/model_categories.dart';
import '../../models/model_category.dart';
import '../view_meals/view_meals.dart';
import 'view_home_grid_item.dart';

class ViewHome extends StatelessWidget {
  static const route = 'ViewHome';
  @override
  Widget build(BuildContext context) {
    final Categories categories = Categories();
    return GridView(
      padding: EdgeInsets.all(5),
      children: categories.data
          .map((Category category) => ViewHomeGridItem(
                title: category.title,
                color: category.color,
                onPressed: () => Navigator.pushNamed(
                  context,
                  ViewMeals.route,
                  arguments: {'title': category.title, 'id': category.id},
                ),
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}
