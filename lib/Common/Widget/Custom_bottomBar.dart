import 'dart:ui';import 'package:flutter/material.dart';class TitledNavigationBarItem {  final Widget title;  final Widget icon;  final Color backgroundColor;  TitledNavigationBarItem({    required this.icon,    required this.title,    this.backgroundColor = Colors.red,  });}class TitledBottomNavigationBar extends StatefulWidget {  final bool reverse;  final Curve curve;  final Color? activeColor;  final Color? inactiveColor;  final Color? inactiveStripColor;  final Color? indicatorColor;  final bool enableShadow;  int currentIndex;  final ValueChanged<int> onTap;  final List<TitledNavigationBarItem> items;  final double indicatorHeight;  final double height;  static const double DEFAULT_BAR_HEIGHT = 60;  static const double DEFAULT_INDICATOR_HEIGHT = 2;  TitledBottomNavigationBar({    Key? key,    this.reverse = false,    this.curve = Curves.linear,    required this.onTap,    required this.items,    this.activeColor,    this.inactiveColor,    this.inactiveStripColor,    this.indicatorColor,    this.enableShadow = true,    this.currentIndex = 0,    this.height = DEFAULT_BAR_HEIGHT,    this.indicatorHeight = DEFAULT_INDICATOR_HEIGHT,  })  : assert(items.length >= 2 && items.length <= 5),        super(key: key);  @override  State createState() => _TitledBottomNavigationBarState();}class _TitledBottomNavigationBarState extends State<TitledBottomNavigationBar> {  bool get reverse => widget.reverse;  Curve get curve => widget.curve;  List<TitledNavigationBarItem> get items => widget.items;  double width = 0;  Color? activeColor;  Duration duration = Duration(milliseconds: 270);  double _getIndicatorPosition(int index) {    var isLtr = Directionality.of(context) == TextDirection.ltr;    if (isLtr) {      return lerpDouble(-1.0, 1.0, index / (items.length - 1))!;    } else {      return lerpDouble(1.0, -1.0, index / (items.length - 1))!;    }  }  @override  Widget build(BuildContext context) {    width = MediaQuery.of(context).size.width;    activeColor = widget.activeColor ?? Theme.of(context).indicatorColor;    return Container(      height: widget.height + MediaQuery.of(context).viewPadding.bottom,      width: width,      child: Stack(        children: <Widget>[          Positioned(            top: widget.indicatorHeight,            child: Row(              crossAxisAlignment: CrossAxisAlignment.end,              children: items.map((item) {                var index = items.indexOf(item);                return GestureDetector(                  onTap: () => _select(index),                  child: _buildItemWidget(item, index == widget.currentIndex),                );              }).toList(),            ),          ),          Positioned(            top: 0,            width: width,            child: AnimatedAlign(              alignment:              Alignment(_getIndicatorPosition(widget.currentIndex), 0),              curve: curve,              duration: duration,              child: Container(                color: widget.indicatorColor ?? activeColor,                width: width / items.length,                height: widget.indicatorHeight,              ),            ),          ),        ],      ),    );  }  void _select(int index) {    widget.currentIndex = index;    widget.onTap(widget.currentIndex);    setState(() {});  }  Widget _buildIcon(TitledNavigationBarItem item) {    return IconTheme(      data: IconThemeData(        color: reverse ? widget.inactiveColor : activeColor,      ),      child: item.icon,    );  }  Widget _buildItemWidget(TitledNavigationBarItem item, bool isSelected) {    return Container(      color: item.backgroundColor,      height: widget.height,      width: width / items.length,      child: _buildIcon(item),    );  }}