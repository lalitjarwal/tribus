import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';

class HoverIcons extends StatefulWidget {
  final IconData icon;
  final double size;
  HoverIcons({Key key,this.icon,this.size}) : super(key: key);

  @override
  _HoverIconsState createState() => _HoverIconsState();
}

class _HoverIconsState extends State<HoverIcons> {
  var _hover=false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _hover=true;
        });
      },
      onExit: (event) {
       setState(() {
         _hover=false;
       }); 
      },
          child: Icon(
        widget.icon,
        size: widget.size,
        color: _hover?kBlueColor:Colors.white.withOpacity(0.8),
      ),
    );
  }
}