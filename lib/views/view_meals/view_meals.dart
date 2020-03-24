import 'package:flutter/material.dart';
import 'package:meals/views/view_meals/view_meals_list_item.dart';
import 'package:provider/provider.dart';
import '../../models/model_meals.dart';
import '../../models/model_meal.dart';

class ViewMeals extends StatelessWidget {
  static const route = 'ViewMeals';

  @override
  Widget build(BuildContext context) {
    final Meals meals = Provider.of<Meals>(context);
    final Map<String, dynamic> data = ModalRoute.of(context).settings.arguments;
    final String categoryTitle = data['title'];
    final String categoryId = data['id'];

    List<Meal> mealsList;
    if (meals.dataFiltered == null) {
      mealsList =
          meals.data.where((Meal meal) => meal.categories.contains(categoryId)).toList();
    } else {
      mealsList = meals.dataFiltered
          .where((Meal meal) => meal.categories.contains(categoryId))
          .toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle, style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (context, index) => ViewMealsListItem(
          meal: mealsList[index],
        ),
      ),
    );
  }
}
