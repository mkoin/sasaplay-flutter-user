import 'package:get_it/get_it.dart';
import 'package:sasa_play/models/feed_view_model.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<FeedViewModel>(FeedViewModel());
}