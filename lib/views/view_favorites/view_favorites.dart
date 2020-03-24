import 'package:flutter/material.dart';
import 'package:meals/models/model_meal.dart';
import 'package:meals/models/model_meals.dart';
import 'package:meals/views/view_meals/view_meals_list_item.dart';
import 'package:provider/provider.dart';

class ViewFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Meals meals = Provider.of<Meals>(context);
    return meals.dataFavorites.length == 0
        ? Center(
            child: Text(
            'No Favorites found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ))
        : ListView.builder(
            itemCount: meals.dataFavorites.length,
            itemBuilder: (context, index) {
              return ViewMealsListItem(
                meal: meals.dataFavorites[index],
              );
            });
  }
}
