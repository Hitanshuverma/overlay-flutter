

import 'package:flo_works/utils/overlay.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2;
    final height = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      body: Center(
        child: Stack(children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.red,
                width: 2 * width,
              ),
              const Text(
                'App Home Screen',
                style: TextStyle(
                  fontSize: 30
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    widgetState == 1 ? widgetState = 0 :  widgetState = 1 ;
                  });
                },
                child: const Text(
                  'Launch Overlay Link',
                  style: TextStyle(
                      fontSize: 30,
                    decoration: TextDecoration.underline,
                    color: Colors.blueAccent
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            // right: width,
            left: 1.66* width,
            top: height/1.5,
            child: OverlayWidget(),
          ),
        ]),
      ),
    );
  }
}
