import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals/models/model_meals.dart';
import 'package:provider/provider.dart';
import '../../models/model_meal.dart';
import '../../widget_icon_button.dart';

class ViewMeal extends StatelessWidget {
  static const route = 'ViewMeal';

  String getIngredients(List<String> ingredients) {
    String temp = '';
    for (int i = 0; i < ingredients.length; i++) {
      temp += '- ${ingredients[i]}\n';
    }
    return temp;
  }

  String getSteps(List<String> steps) {
    String temp = '';
    for (int i = 0; i < steps.length; i++) {
      temp += '${i + 1}.    ${steps[i]}\n';
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;
    final Meals meals = Provider.of<Meals>(context);
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isFavorite = meals.isFavorite(meal.id);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // Top Background, Title, Back Button
            Stack(
              children: <Widget>[
                // Background
                Container(
                  height: orientation == Orientation.portrait ? 300 : 200,
                  width: double.infinity,
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                // Title
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.black54,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      meal.title,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 25,
                    color: Colors.black54,
                  ),
                ),
                // Back Button
                Positioned(
                  top: 30,
                  left: 5,
                  child: Container(
                    height: 50,
                    width: 50,
                    child: WIconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icons.arrow_back,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                // Favorites Button
                Positioned(
                  top: 30,
                  right: 5,
                  child: Container(
                    height: 50,
                    width: 50,
                    child: WIconButton(
                      onPressed: () {
                        meals.toggleFavorite(meal.id);
                      },
                      icon: isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      favorite: isFavorite,
                    ),
                  ),
                )
              ],
            ),
            // Bottom ListView
            Flexible(
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                children: <Widget>[
                  // Duration, Complexity, Affordability,
                  Container(
                    padding: EdgeInsets.only(bottom: 10, top: 12),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.schedule),
                              Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text('${meal.duration} min'))
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.work),
                              Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(meal.getComplexity))
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.attach_money),
                              Container(child: Text(meal.getAffordability))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Table Vegan Vegetarian Lactose Free Gluten Free
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Table(
                      border: TableBorder.all(color: Colors.grey, width: 1),
                      children: [
                        TableRow(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Vegetarian:',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  meal.isVegetarian
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Vegan:',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  meal.isVegan
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )
                                ],
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Gluten free:',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  meal.isGlutenFree
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Lactose free:',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  meal.isLactoseFree
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Ingredients
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Ingredients',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      getIngredients(meal.ingredients),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  // Steps
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Steps',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      getSteps(meal.steps),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
