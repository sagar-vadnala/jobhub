import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/height_spacer.dart';

import '../../../../constants/app_constants.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hieght,
      color: Color(kDarkBlue.value),
      child: Column(
        children: [
          const HeightSpacer(size: 65),
          Padding(padding: EdgeInsets.all(8.h),
          child: Image.asset("assets/images/page2.png"),
          ),
          const HeightSpacer(size: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Stable Yourself \n With Your Ability",
              textAlign: TextAlign.center,
              style: appstyle(30, kLight, FontWeight.w500),),
              const HeightSpacer(size: 10),
              Padding(padding: EdgeInsets.all(8.h),
              child: Text("We help you find your dream job according to your skillset, location and preference to build your carrer",
              textAlign: TextAlign.center,
               style: appstyle(14, Color(kLight.value), FontWeight.normal),),
              )
            ],
          )
          
        ],
      ),
    );
  }
}