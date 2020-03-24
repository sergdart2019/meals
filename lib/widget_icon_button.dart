import 'package:flutter/material.dart';

class WIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final Color color;
  final bool favorite;

  WIconButton({this.onPressed, this.icon, this.color, this.favorite});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
      height: 55,
      minWidth: 55,
      onPressed: onPressed,
      color: color,
      child: Icon(
        icon,
        color: favorite == true ? Theme.of(context).primaryColor : Colors.white,
      ),
    );
  }
}
