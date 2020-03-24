import 'package:flutter/material.dart';
import 'package:meals/models/model_filter.dart';
import 'package:meals/models/model_meals.dart';
import 'package:meals/widget_icon_button.dart';
import 'package:provider/provider.dart';

class ViewFilters extends StatelessWidget {
  static const route = 'ViewFilters';

  @override
  Widget build(BuildContext context) {
    final Meals meals = Provider.of<Meals>(context);
    final Filter filter = Provider.of<Filter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          WIconButton(
            onPressed: () {
              meals.filteredData({
                'vegan': filter.isVegan,
                'vegetarian': filter.isVegetarian,
                'lactose': filter.isLactoseFree,
                'gluten': filter.isGlutenFree,
              });
              Navigator.pop(context);
            },
            icon: Icons.check,
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Adjust meal selection',
                style: TextStyle(fontSize: 18),
              ),
            ),
            filter == null
                ? Center(child: CircularProgressIndicator())
                : Flexible(
                    child: ListView(
                      children: <Widget>[
                        SwitchListTile(
                          title: Text('Gluten Free'),
                          value: filter.isGlutenFree,
                          subtitle: Text('Only include gluten-free meals'),
                          onChanged: (bool value) {
                            filter.setGluten(value);
                          },
                        ),
                        SwitchListTile(
                          title: Text('Lactose Free'),
                          value: filter.isLactoseFree,
                          subtitle: Text('Only include lactose-free meals'),
                          onChanged: (bool value) {
                            filter.setLactose(value);
                          },
                        ),
                        SwitchListTile(
                          title: Text('Vegan'),
                          value: filter.isVegan,
                          subtitle: Text('Only include vegan meals'),
                          onChanged: (bool value) {
                            filter.setVegan(value);
                          },
                        ),
                        SwitchListTile(
                          title: Text('Vegetarian'),
                          value: filter.isVegetarian,
                          subtitle: Text('Only include vegetarian meals'),
                          onChanged: (bool value) {
                            filter.setVegetarian(value);
                          },
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}