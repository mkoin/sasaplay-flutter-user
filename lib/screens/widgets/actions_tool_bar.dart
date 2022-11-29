import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        //_getFollowAction(pictureUrl: userPic),

        _getSocialAction(icon: FontAwesomeIcons.crown, title: "Challenge"),
        _getSocialAction(
            icon: FontAwesomeIcons.signLanguage, title: widget.numLikes),
        _getSocialAction(
            icon: FontAwesomeIcons.commentAlt, title: widget.numComments),
     
        Text(widget.songName,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontFamily: 'FjallaOne',
                fontSize: 10.0)),
        _getSocialAction(
            icon: FontAwesomeIcons.share, title: 'Share', isShare: true),
      ]),
    );
  }

  bool isLike = false;

  Widget _getSocialAction({
    required String title,
    required IconData icon,
    bool isShare = false,
    Color? color,
  }) {
    return InkWell(
      onTap: () {
        if (icon == Icons.favorite) {
          setState(() {
            isLike = !isLike;
          });
        }
      },
      child: Container(
          margin: EdgeInsets.only(top: 15.0),
          width: 60.0,
          height: 60.0,
          child: Column(children: [
            FaIcon(icon,
                size: 30, color: color == null ? Colors.grey.shade300 : color),
            Padding(
              padding: EdgeInsets.only(top: isShare ? 8.0 : 8.0),
              child: Text(title,
                  style: TextStyle(
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
      ], stops: [
        0.0,
        0.4,
        0.6,
        1.0
      ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  Widget _getMusicPlayerAction() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: ActionsToolbar.ActionWidgetSize,
      height: ActionsToolbar.ActionWidgetSize,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(1.0),
              height: ActionsToolbar.ProfileImageSize,
              width: ActionsToolbar.ProfileImageSize,
              decoration: BoxDecoration(
                  gradient: musicGradient,
                  borderRadius: BorderRadius.circular(
                      ActionsToolbar.ProfileImageSize / 2)),
              child: Icon(
                Icons.music_note_rounded,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
