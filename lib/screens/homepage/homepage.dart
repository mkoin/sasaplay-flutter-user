import 'package:flutter/material.dart';
import 'package:sasa_play/screens/homepage/plays_page.dart';
import 'package:sasa_play/utils/custom_themes_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  //Preserving the state of tabs
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: const <Widget>[
            Expanded(
              child: TabBarView(
                children: [
                  FeedsPage(),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
            TabBar(
              labelStyle: TextStyle(
                fontSize: 20.0,
                fontFamily: 'FjallaOne',
                color: kredPinkColor,
              ), //For Selected tab
              unselectedLabelStyle: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'FjallaOne',
                  color: Color(0x99FFFFFF)), //For Un-selected Tabs
              indicatorColor: kredPinkColor,
              isScrollable: true,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              // labelPadding: EdgeInsets.only(left: 18),
              tabs: [
                Tab(text: "Plays"),
                Tab(text: "LIVE"),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.only(top: 12, right: 17),
                  child: Icon(Icons.more_vert_rounded, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
