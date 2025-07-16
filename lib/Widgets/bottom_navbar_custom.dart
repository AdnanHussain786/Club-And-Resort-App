
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/const.dart';
import '../Utils/providers.dart';

class BottomNavigationBarCustomDashboard extends StatefulWidget {

  final ValueChanged<int> onItemTapped;

  BottomNavigationBarCustomDashboard({
    required this.onItemTapped,
  });



  @override
  _BottomNavigationBarCustomDashboardState createState() => _BottomNavigationBarCustomDashboardState();
}

class _BottomNavigationBarCustomDashboardState extends State<BottomNavigationBarCustomDashboard> {
  int _selectedIndex=0;

  BottomNavigationBarItem _buildBottomNavigationBarItem(String iconName,int index) {
    _selectedIndex=Provider.of<OurProviderClass>(context).getIndex;

    return BottomNavigationBarItem(
        label: '',

        activeIcon: SizedBox(
            height: 30,
            child: Center(
                child: ImageIcon(
                    AssetImage('assets/bottom_bar_icons/${iconName}_f.png'),
                    size: 24,
                    color:CustomAppColors.primaryColor
                ))),

        icon: SizedBox(
            height: 30,
            child: Center(
                child: ImageIcon(
                  AssetImage('assets/bottom_bar_icons/$iconName.png'),
                  size: 24,
                  color:CustomAppColors.blackColor,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          height: 0.5,
          color: Colors.transparent,
        ),

        Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: CustomAppColors.primaryColor,
            unselectedItemColor: CustomAppColors.primaryColor,
            backgroundColor: Colors.white,

            // AppSharedPreferences.getIsDarkMode() == true
            //     ? CustomAppColors.blackColor
            //     : CustomAppColors.whiteColor,

            items: [



              _buildBottomNavigationBarItem('home',0),
              _buildBottomNavigationBarItem('calendar',1),
              _buildBottomNavigationBarItem('card', 2),
              _buildBottomNavigationBarItem('search', 3),
              _buildBottomNavigationBarItem('upcoming', 4),
            ],
            currentIndex: _selectedIndex,
            onTap:(index){

              widget.onItemTapped(index);
              changeIndex(context, index);


            } ,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
          ),
        ),


      ],
    );
  }




}
void changeIndex(BuildContext context,int index) {
  Provider.of<OurProviderClass>(context, listen: false).changeBottomNavBarIndex(index);
}

