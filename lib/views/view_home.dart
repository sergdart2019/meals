import 'package:flutter/material.dart';
import '../models/model_categories.dart';
import '../models/model_category.dart';
import '../views/view_home_grid_item.dart';
import 'view_details.dart';

class ViewHome extends StatefulWidget {
  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  Categories categories = Categories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Deli Meals'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: GridView(
          children: categories.data
              .map((Category category) => ViewHomeGridItem(
                    title: category.title,
                    color: category.color,
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ViewDetails())),
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
          ),
        ),
      ),
    );
  }
}
