import 'dart:math';

import 'package:club_and_resort/Constants/const.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome Back, Adnan',style: CustomTextStyles.title20BlackBold,),

          SizedBox(height: 20,),


          Text('Upcoming',style:CustomTextStyles.grey14Normal,),
          SizedBox(height: 5,),

          Row(
            children: [
              CircleAvatar(
                backgroundColor: CustomAppColors.yellowBackground,
                child: ImageIcon(AssetImage('assets/icons/calendar.png'),color: CustomAppColors.primaryColor,),
              ),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tennis Court Booking',style:CustomTextStyles.blackText14Bold,),
                  Text('Tomorrow, 10:00 AM - 11:00 AM',style:CustomTextStyles.grey14Normal,),
                ],
              )

            ],
          ),

          SizedBox(height: 10,),

          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage('assets/images/scene.png'))
            ),
          ),

          SizedBox(height: 10,),



          CustomWhiteContainer(childWidget:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Balance',style: CustomTextStyles.title14PinkBold,),
              Text('10,000 PKR',style: CustomTextStyles.title20BlackBold,),
              Text('Due by July 15th',style: CustomTextStyles.grey12,),
            ],
          )),




          Text('Quick Actions',style: CustomTextStyles.blackText16Bold,),



          GridView.count(
            childAspectRatio: 1.8,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: const [
              CustomIconWithText(iconName: 'user', text: 'Add Guest'),
              CustomIconWithText(iconName: 'user', text: 'Add Guest'),
              CustomIconWithText(iconName: 'user', text: 'Add Guest'),
              CustomIconWithText(iconName: 'user', text: 'Add Guest'),
              CustomIconWithText(iconName: 'user', text: 'Add Guest'),
              CustomIconWithText(iconName: 'user', text: 'Add Guest'),
            ],
          )








        ],
      ),
    );
  }
}

class CustomWhiteContainer extends StatelessWidget {
  const CustomWhiteContainer({super.key,required this.childWidget});

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CustomAppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),

      ),
      child:childWidget,
    );
  }
}

class CustomIconWithText extends StatelessWidget {
  final String text;
  final String iconName;

  const CustomIconWithText({
    super.key,
    required this.text,
    required this.iconName,
  });

  static final List<Color> colorList = [
    Color(0xffF44336), // Red
    Color(0xff4CAF50), // Green
    Color(0xff2196F3), // Blue
    Color(0xffFF9800), // Orange
    Color(0xff9C27B0), // Purple
    Color(0xff00BCD4), // Cyan
    Color(0xffFFEB3B), // Yellow
  ];


  Color get randomColor => colorList[Random().nextInt(colorList.length)];

  @override
  Widget build(BuildContext context) {
    final Color baseColor = randomColor;

    return CustomWhiteContainer(
      childWidget: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: baseColor.withValues(alpha: 0.2),
            ),
            alignment: Alignment.center,
            child: ImageIcon(
              AssetImage('assets/icons/$iconName.png'),
              color: baseColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: CustomTextStyles.blackText14Bold,
            ),
          ),
        ],
      ),
    );
  }
}





