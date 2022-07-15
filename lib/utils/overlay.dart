import 'dart:developer';

import 'package:flutter/material.dart';

import 'global.dart';

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  final layerLink = LayerLink();
  OverlayEntry? entry;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => showOverlay(widgetState));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OverlayWidget oldWidget) {
    // TODO: implement didUpdateWidget
    log(widgetState.toString());
    widgetState == 1 ? WidgetsBinding.instance!
        .addPostFrameCallback((_) => showOverlay(widgetState)) : WidgetsBinding.instance!
        .addPostFrameCallback((_) => hideOverlay());
    super.didUpdateWidget(oldWidget);
  }

  void showOverlay(int state) {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final width = MediaQuery.of(context).size.width / 2;
    final height = MediaQuery.of(context).size.height / 2;
    if (state != 0) {
      entry = OverlayEntry(
        builder: (context) => Positioned(
          width: width,
          height: height,
          child: CompositedTransformFollower(
            followerAnchor: Alignment.topRight,
            targetAnchor: Alignment.bottomLeft,
            link: layerLink,
            offset: Offset(renderBox.size.width / 2, renderBox.size.height / 5),
            child: buildOverlay(),
          ),
        ),
      );
      overlay.insert(entry!);
      setState(() {
        widgetState = 1;
      });
    }
  }

  hideOverlay() {
    entry?.remove();
    entry = null;
    setState(() {
      widgetState = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: ElevatedButton(
        onPressed: () {
          // setState(() {
          //   widgetState = 0;
          // });
          hideOverlay();
        },
        child: const Icon(null, color: Colors.white),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          primary: Colors.yellow,
        ),
      ),
    );
  }

  buildOverlay() {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(
            width: 3,
            color: Colors.blue,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "This is Chatbox",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
