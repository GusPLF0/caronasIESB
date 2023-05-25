import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          color: Colors.grey,
          mainAxisAlignment: MainAxisAlignment.center,
          gap: 4,
          activeColor: redIdColor,
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: redIdColor),
          tabs: [
            GButton(
              icon: Icons.hail_outlined,
              iconSize: 24,
              text: 'Pedir carona',
              textStyle: TextStyle(fontSize: 14.0, color: redIdColor),
            ),
            GButton(
              icon: Icons.directions_car_outlined,
              iconSize: 24,
              text: 'Oferecer carona',
              textStyle: TextStyle(fontSize: 14.0, color: redIdColor),
            ),
            GButton(
              icon: Icons.grid_view_outlined,
              iconSize: 24,
              text: 'Atividade',
              textStyle: TextStyle(fontSize: 14.0, color: redIdColor),
            ),
          ]),
    );
  }
}