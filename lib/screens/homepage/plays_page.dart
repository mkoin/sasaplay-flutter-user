import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_it/get_it.dart';
import 'package:sasa_play/helpers/load_network_image.dart';
import 'package:sasa_play/models/data/video.dart';
import 'package:sasa_play/models/feed_view_model.dart';
import 'package:sasa_play/screens/widgets/actions_tool_bar.dart';
import 'package:sasa_play/screens/widgets/play_profile_desc.dart';
import 'package:sasa_play/utils/custom_themes_colors.dart';
import 'package:sasa_play/utils/size_config.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedsPage> {
  final locator = GetIt.instance;
  final feedViewModel = GetIt.instance<FeedViewModel>();
  @override
  void initState() {
    feedViewModel.loadVideo(0);
    feedViewModel.loadVideo(1);

    super.initState();
  }

  int _count = 0;

  // Pass this method to the child page.
  void _update(int count) {
    setState(() => _count = count);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) => videoScreen(),
        viewModelBuilder: () => feedViewModel);
  }

  Widget videoScreen() {
    return Scaffold(
      backgroundColor: GetIt.instance<FeedViewModel>().actualScreen == 0
          ? Colors.black
          : Colors.white,
      body: feedVideos(),
    );
  }

  Widget feedVideos() {
    return Stack(
      children: [
        PageView.builder(
          controller: PageController(
            initialPage: 0,
            viewportFraction: 1,
          ),
          itemCount: feedViewModel.videoSource?.listVideos.length,
          onPageChanged: (index) {
            index = index % (feedViewModel.videoSource!.listVideos.length);
            feedViewModel.changeVideo(index);
          },
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            index = index % (feedViewModel.videoSource!.listVideos.length);
            return videoCard(feedViewModel.videoSource!.listVideos[index]);
          },
        ),
        Container(
            height: 100,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(31, 60, 60, 60),
                  Color(0x00000000)
                ]))),
      ],
    );
  }

  Widget videoCard(Video video) {
    final controller = video.controller!;
    return Stack(
      children: [
        video.controller != null
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Center(
                    child: SizedBox(
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          video.controller!.value.isInitialized
                              ? AspectRatio(
                                  aspectRatio:
                                      video.controller!.value.aspectRatio / 1.2,
                                  child: VideoPlayer(video.controller!),
                                )
                              : Center(
                                  child: LoadPhotoViewImage(
                                  imageProvider: NetworkImage(video.userPic),
                                )),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 35),
                            child: PlayPauseOverlay(controller: controller),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       bottom: getProportionalScreenHeight(80)),
                          //   child: Align(
                          //     alignment: Alignment.bottomCenter,
                          //     child: VideoProgressIndicator(controller,
                          //         allowScrubbing: true),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                color: Colors.black,
                child: const Center(
                  child: Text("Loading"),
                ),
              ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ProfileDescription(video.user),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: getProportionalScreenHeight(70)),
                  child: ActionsToolbar(
                      video.likes, video.comments, video.songName),
                ),
              ],
            ),
            const SizedBox(height: 100)
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    feedViewModel.controller?.dispose();
    super.dispose();
  }
}

class PlayPauseOverlay extends StatefulWidget {
  const PlayPauseOverlay({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  State<PlayPauseOverlay> createState() => _PlayPauseOverlayState();
}

class _PlayPauseOverlayState extends State<PlayPauseOverlay>
    with TickerProviderStateMixin {
  late bool _visible = false;

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
    super.initState();
  }

  // Dispose the controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 650),
          child: Center(
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _controller,
              size: 90,
              color: kPrimaryColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (widget.controller.value.isPlaying) {
              await widget.controller.pause(); //pause on tap
              _visible = true;
              await _controller.reverse();
            } else {
              await widget.controller.play(); //play on tap
              _visible = false;
              await _controller.forward();
            }
            //update icon visibility.
            setState(() {});
          },
        ),
      ],
    );
  }
}
