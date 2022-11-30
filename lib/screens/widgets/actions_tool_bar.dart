import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:sasa_play/helpers/loadAssetImage.dart';
import 'package:sasa_play/screens/widgets/custom_buttons.dart';

class ActionsToolbar extends StatefulWidget {
  static const double ActionWidgetSize = 50.0;

  static const double ActionIconSize = 25.0;

  static const double ShareActionIconSize = 25.0;

  static const double ProfileImageSize = 40.0;

  static const double PlusIconSize = 20.0;

  final String numLikes;
  final String numComments;
  final String songName;

  ActionsToolbar(this.numLikes, this.numComments, this.songName);

  @override
  _ActionsToolbarState createState() => _ActionsToolbarState();
}

class _ActionsToolbarState extends State<ActionsToolbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          likeContentWidget(
            likesCount: int.parse(widget.numLikes),
            isLiked: widget.numLikes.length >= 1000,
            onLike: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: _getSocialAction(
              icon: loadImage(imageUrl: "assets/images/comment.png"),
              title: widget.numComments,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: _getSocialAction(
              icon: loadImage(imageUrl: "assets/images/watch.png"),
              title: "Watch",
            ),
          ),
        ],
      ),
    );
  }

  bool isLike = false;

  Widget _getSocialAction({
    required String title,
    required Widget icon,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.only(top: 15.0),
          width: 60.0,
          height: 60.0,
          child: Column(children: [
            icon,
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'FjallaOne',
                      fontSize: 10.0)),
            )
          ])),
    );
  }

  LinearGradient get musicGradient => LinearGradient(colors: [
        Colors.grey[800]!,
        Colors.grey[900]!,
        Colors.grey[900]!,
        Colors.grey[800]!
      ], stops: const [
        0.0,
        0.4,
        0.6,
        1.0
      ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  Widget _getMusicPlayerAction() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      width: ActionsToolbar.ActionWidgetSize,
      height: ActionsToolbar.ActionWidgetSize,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(1.0),
              height: ActionsToolbar.ProfileImageSize,
              width: ActionsToolbar.ProfileImageSize,
              decoration: BoxDecoration(
                  gradient: musicGradient,
                  borderRadius: BorderRadius.circular(
                      ActionsToolbar.ProfileImageSize / 2)),
              child: const Icon(
                Icons.music_note_rounded,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
