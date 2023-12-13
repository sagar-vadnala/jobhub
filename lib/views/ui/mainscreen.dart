import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Consumer<ZoomNotifier>(
      //   builder: (context, zoomNotifier, child){
      //     // return ZoomDrawer(
      //     //   menuScreen: , mainScreen: mainScreen)
      //   }
      //   )
    );
  }
}