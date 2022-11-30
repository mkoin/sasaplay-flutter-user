import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:like_button/like_button.dart';
import 'package:sasa_play/helpers/fonts_functions.dart';
import 'package:sasa_play/helpers/loadAssetImage.dart';
import 'package:sasa_play/utils/custom_themes_colors.dart';
import 'package:sasa_play/utils/size_config.dart';

Widget elevatedButtonMethodOutlined(
    {onPressed()?,
    required String label,
    double? width,
    double? fontSize,
    double buttonRadius = 11}) {
  return SizedBox(
    width: width,
    child: ElevatedButton(
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize),
      ),
      onPressed: () {
        onPressed!();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
            side: const BorderSide(color: Color(0xFF757574)))),
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent.withOpacity(0.2)),

        // backgroundColor: MaterialStateProperty.all(Color(0xFF3776D4)),
      ),
    ),
  );
}

class CustomElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget? child;

  final String? label;
  final double? fontSize;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.child,
    this.borderRadius,
    this.fontSize,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [
      Color.fromARGB(255, 233, 240, 253),
      Color.fromARGB(255, 244, 245, 246)
    ]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ??
        BorderRadius.circular(getProportionalScreenWidth(16));
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Material(
        elevation: 3,
        borderRadius: borderRadius,
        child: Container(
          alignment: Alignment.center,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 9),
          height: height,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: borderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                label ?? '',
                style:
                    kibmPlexSansArabic(color: Colors.white, fontSize: fontSize),
              ),
              child ?? const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

class FollowUnfollowButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;

  final VoidCallback onPressed;
  final bool? isLoading;

  final bool isfollow;
  final double? fontSize;

  const FollowUnfollowButton({
    Key? key,
    required this.onPressed,
    this.isfollow = false,
    this.isLoading = false,
    this.borderRadius,
    this.fontSize,
    this.width,
    this.height = 44.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ??
        BorderRadius.circular(getProportionalScreenWidth(16));
    return InkWell(
      onTap: isLoading ?? false
          ? null
          : () {
              onPressed();
            },
      child: Material(
        elevation: 3,
        borderRadius: borderRadius,
        child: Container(
          alignment: Alignment.center,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 9),
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              color: isfollow ? kredPinkColor.withAlpha(140) : kredPinkColor,
            ),
            gradient: isfollow
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kredPinkColor.withAlpha(100),
                      kredPinkColor.withAlpha(90),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 233, 240, 253),
                      Color.fromARGB(255, 244, 245, 246)
                    ],
                  ),
            borderRadius: borderRadius,
          ),
          child: isLoading ?? false
              ? const SpinKitDoubleBounce(
                  color: kredPinkColor,
                  size: 50.0,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      isfollow ? "Follow" : "UnFollow",
                      style: krubik(
                        color: isfollow ? Colors.black : kredPinkColor,

                        //  ktertiarycolor,
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

Widget likeContentWidget(
    {required int likesCount,
    required bool isLiked,
    required Function onLike}) {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: LikeButton(
        animationDuration: const Duration(milliseconds: 800),
        countPostion: CountPostion.bottom,
        size: getProportionalScreenWidth(35),
        circleColor:
            const CircleColor(start: kPrimaryColor, end: ktertiarycolor),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: kredPinkColor,
          dotThirdColor: ktertiarycolor,
        ),
        onTap: (islike) async {
          onLike;
          return !islike;
        },
        isLiked: isLiked,
        likeCount: likesCount,
        likeBuilder: (bool hasLiked) {
          return SizedBox(
            width: 60.0,
            height: 60.0,
            child: loadImage(
              imageUrl: hasLiked
                  ? "assets/images/heart.png"
                  : "assets/images/heart2.png",
            ),
          );
        },
        countBuilder: (int? likeCount, bool isApplauded, String? text) {
          return Text(
            likeCount.toString(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontFamily: 'FjallaOne',
              fontSize: 12,
            ),
          );
        },
      ),
    ),
  );
}
