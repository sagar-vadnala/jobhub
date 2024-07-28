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
      color: Colors.white,
      child: Column(
        children: [
          const HeightSpacer(size: 65),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Image.asset("assets/images/delivery_guy.png"),
          ),
          Container(
            height: 300,
            width: 350,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 19, 2, 72),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 50.0,
                  ),
                  child: Text(
                    "All your kitchen Needs are Here",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                const HeightSpacer(size: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "it is a long established fact that a reader will be distracted by the readable.",
                    textAlign: TextAlign.center,
                    style: appstyle(14, Color(kLight.value), FontWeight.normal),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
