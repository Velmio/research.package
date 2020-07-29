import 'package:flutter/material.dart';
import 'velmio_material_color.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final bool enablePadding;
  final Function action;

  const CustomCard(
      {Key key, this.child, this.enablePadding = true, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: enablePadding
          ? EdgeInsets.only(left: 20, right: 20)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
                color: Color(0x29bababa),
                offset: Offset(0, 3),
                blurRadius: 10,
                spreadRadius: 0),
          ]),
      child: action != null ? Material(
            color: Colors.transparent,
            child: InkWell(
            
            borderRadius: BorderRadius.all(Radius.circular(10)),
            highlightColor: Colors.transparent,
            splashColor: velmioColor.withOpacity(0.3),
            onTap: action,
            child: this.child),
      ) : this.child,
    );
  }
}
