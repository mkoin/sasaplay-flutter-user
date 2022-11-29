import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:progress_loader_overlay/progress_loader_overlay.dart';

import '../utils/size_config.dart';

var spinkit = SpinKitSpinningLines(color: ThemeData().canvasColor, size: 40);
showProgreessIndicator({required BuildContext context}) {
  ProgressLoader().widgetBuilder = (context, _) => Center(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: SpinKitSpinningLines(
                  color: Theme.of(context).primaryColor.withGreen(50),
                  size: getProportionalScreenHeight(50),
                ),
              ),
            ],
          ),
        ),
      );

  ProgressLoader().show(context);
}

showProgreessIndicator2(
    {required BuildContext context, required String message}) {
  ProgressLoader().widgetBuilder = (context, _) => Center(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                child: Container(
                  height: SizeConfig.screenHeight * .2,
                  width: SizeConfig.screenWidth * .5,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SpinKitSpinningLines(
                        color: Theme.of(context).primaryColor.withGreen(50),
                        size: getProportionalScreenHeight(50),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: DefaultTextStyle(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white70),
                          child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  message,
                                  speed: const Duration(milliseconds: 140),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  ProgressLoader().show(context);
}
