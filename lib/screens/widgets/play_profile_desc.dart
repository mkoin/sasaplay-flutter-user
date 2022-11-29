import 'package:flutter/material.dart';
import 'package:sasa_play/helpers/load_network_image.dart';
import 'package:sasa_play/utils/app_constants.dart';

class ProfileDescription extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;
  // The size of the profile image in the follow Action
  static const double ProfileImageSize = 50.0;

  final username;

  ProfileDescription(this.username);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 120.0,
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 1.0, bottom: 10),
                  child: Column(children: const [
             
                    Icon(
                      Icons.monetization_on_outlined,
                      size: 20.0,
                      color: Colors.white,
                    ),

                    Text("Tip",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'FjallaOne'))
                  ]),
                ),
                Row(
                  children: [
                    _getProfilePicture(
                        userPic:
                            "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg"),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.35),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  '@' + username,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'FjallaOne'),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                SizedBox(
                                  height: 20.0,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            const Color.fromRGBO(242, 242, 242, 1),
                                      ),
                                      child: const Text("Follow",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  212, 175, 55, 1),
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'FjallaOne')),
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const Text(
                              "Early moring Selfie...",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'FjallaOne'),
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget _getProfilePicture({required String userPic}) {
    return Positioned(
      left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
      child: Container(
        padding: const EdgeInsets.all(1.0), // Add 1.0 point padding to create border
        height: ProfileImageSize, // ProfileImageSize = 50.0;
        width: ProfileImageSize, // ProfileImageSize = 50.0;
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
        // import 'package:cached_network_image/cached_network_image.dart'; at the top to use CachedNetworkImage
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10000.0),
          child: LoadPhotoViewImage(imageProvider: NetworkImage(userPic),)
        ),
      ),
    );
  }
}
