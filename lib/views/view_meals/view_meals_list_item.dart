import 'package:flutter/material.dart';
import 'package:meals/models/model_meal.dart';
import 'package:meals/views/view_meal/view_meal.dart';

class ViewMealsListItem extends StatefulWidget {
  final Meal meal;

  ViewMealsListItem({this.meal});

  @override
  _ViewMealsListItemState createState() => _ViewMealsListItemState();
}

class _ViewMealsListItemState extends State<ViewMealsListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, ViewMeal.route, arguments: widget.meal),
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: <Widget>[
            // Image and Title
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    widget.meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                    ),
                    child: Text(
                      widget.meal.title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                )
              ],
            ),
            // Duration, Complexity, Affordability,
            Container(
              height: 50,
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
                            child: Text('${widget.meal.duration} min'))
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
                            child: Text(widget.meal.getComplexity))
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        Container(child: Text(widget.meal.getAffordability))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
