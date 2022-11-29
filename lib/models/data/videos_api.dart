import 'package:sasa_play/models/data/demo_data.dart';
import 'package:sasa_play/models/data/video.dart';


class VideosAPI {
  List<Video> listVideos = <Video>[];

  VideosAPI() {
    load();
  }

  void load() async {
    listVideos = await getVideoList();
  }

  Future<List<Video>> getVideoList() async {

    var videoList = <Video>[];

    videoList = (data)
        .map((data) => Video.fromJson(data))
        .toList();

    return videoList;
  }

}
