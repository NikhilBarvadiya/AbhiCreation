import 'package:abhicreativefashion/Common/Image/Images.dart';
import 'package:abhicreativefashion/Common/Utils/Colors_Utils.dart';
import 'package:abhicreativefashion/Common/Widget/Custom_bottomBar.dart';
import 'package:flutter/material.dart';

class Maltiple_Bottom extends StatelessWidget {
  final int? selectedIndex;
  void Function(int) onItemTapped;

  Maltiple_Bottom(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitledBottomNavigationBar(
      indicatorColor: red,
      indicatorHeight: 3,
      items: [
        TitledNavigationBarItem(
          // icon: Image(
          //   image: AssetImage(Images.icHome),
          //   color: selectedIndex == 0 ? red : Colors.grey,
          // ),
          icon: Icon(
            Icons.home,
            color: selectedIndex == 0 ? red : white,
            size: 30,
          ),
          title: const Text(""),
          backgroundColor: selectedIndex == 0 ? white: red,
        ),
        TitledNavigationBarItem(
          icon:Image.asset(
            Images.scanner,
            color: selectedIndex == 1 ?red: white,
            fit: BoxFit.scaleDown,
            scale: 15,
          ),
          title: const Text(""),
          backgroundColor: selectedIndex == 1 ? white: red,
        ),
        TitledNavigationBarItem(
          icon:Image.asset(
            Images.data,
            color: selectedIndex == 2 ?red: white,
            fit: BoxFit.scaleDown,
            scale: 15,
          ),
          title: const Text(""),
          backgroundColor: selectedIndex == 2 ? white: red,
        ),
        TitledNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: selectedIndex == 3 ?red: white,
            size: 30,
          ),
          title: const Text(""),
          backgroundColor: selectedIndex == 3 ? white: red,
        ),
      ],
      onTap: onItemTapped,
      currentIndex: selectedIndex!,
    );
  }
}
