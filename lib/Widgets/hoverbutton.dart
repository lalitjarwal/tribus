import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';

class HoverButton extends StatefulWidget {
  final Function onPressed;
  final String title;
  final bool selected;
  HoverButton({@required this.title, @required this.onPressed,this.selected=false});
  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _hover = false;
  Color buildColor(bool selected){
      if(selected)
      return kBlueColor;
      else if(_hover)
        return kBlueColor;
        else return Colors.grey[700];

    }
      double buildSize(bool selected){
      if(selected)
      return 1.3;
      else if(_hover)
        return 1.3;
        else return 1.2;

    }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _hover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _hover = false;
        });
      },
      child: FlatButton(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          textColor: buildColor(widget.selected),
          onPressed: widget.onPressed,
          child: Text(
            widget.title,
            textScaleFactor: buildSize(widget.selected),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
    );
    
  }
}

