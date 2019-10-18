import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './post/scree_post.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final primarycolor = const Color(0xffD4D7DC);
final darkcolor = const Color(0xff27282A);
final Orangecolor = const Color(0xffFF642E);
final shadowcolor = const Color(0xffA0A0A0);



void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Orangecolor));
  runApp(
      MaterialApp(
    title: 'MUSIDE',
    theme: ThemeData(
      primaryColor: primarycolor,
      splashColor: Orangecolor,
    ),
    home: Musc(),
    debugShowCheckedModeBanner: false,
  ));
}

class Musc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Music_p();
  }
}


class Music_p extends State<Musc> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =  RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //Menu
      drawer: new Drawer(
        child: Container(
          color: primarycolor,
          child: Center(
            child: new ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 220.0, top: 30.0, bottom: 15.0),
                  child: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 35.0,
                      color: darkcolor,
                      onPressed: () =>
                          _scaffoldKey.currentState.openEndDrawer()),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Home
                    ButtonTheme(
                      splashColor: Orangecolor,
                      minWidth: 500.0,
                      height: 80.0,
                      child: FlatButton(
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "Home",
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: darkcolor,
                            fontFamily: 'Schylerl',
                          ),
                        ),
                      ),
                    ),
                    //Made for you
                    ButtonTheme(
                      splashColor: Orangecolor,
                      minWidth: 500.0,
                      height: 80.0,
                      child: FlatButton(
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "Made for you",
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: darkcolor,
                            fontFamily: 'Schylerl',
                          ),
                        ),
                      ),
                    ),
                    //Liked songs
                    ButtonTheme(
                      splashColor: Orangecolor,
                      minWidth: 500.0,
                      height: 80.0,
                      child: FlatButton(
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "Liked songs",
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: darkcolor,
                            fontFamily: 'Schylerl',
                          ),
                        ),
                      ),
                    ),
                    //PlayLists
                    ButtonTheme(
                      splashColor: Orangecolor,
                      minWidth: 500.0,
                      height: 80.0,
                      child: FlatButton(
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "PlayLists",
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: darkcolor,
                            fontFamily: 'Schylerl',
                          ),
                        ),
                      ),
                    ),
                    //Albums
                    ButtonTheme(
                      splashColor: Orangecolor,
                      minWidth: 500.0,
                      height: 80.0,
                      child: FlatButton(
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "Albums",
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: darkcolor,
                            fontFamily: 'Schylerl',
                          ),
                        ),
                      ),
                    ),
                    //Settings
                    ButtonTheme(
                      splashColor: Orangecolor,
                      minWidth: 500.0,
                      height: 80.0,
                      child: FlatButton(
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "Settings",
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: darkcolor,
                            fontFamily: 'Schylerl',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: primarycolor,
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 17.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: IconButton(
                            icon: Icon(Icons.menu),
                            iconSize: 33.0,
                            color: darkcolor,
                            onPressed: () =>
                                _scaffoldKey.currentState.openDrawer()),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: Text(
                          'MUSIDE',
                          style: new TextStyle(
                              fontFamily: 'Schylerl',
                              fontSize: 45.0,
                              color: darkcolor),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          // padding: EdgeInsets.only(right: 30.0),
                          icon: Icon(Icons.search),
                          iconSize: 33.0,
                          color: darkcolor,
                          onPressed: () {
                            //  Vibration.vibrate(pattern: [500, 100, 200, 100], intensities: [1, 255]);

                            showSearch(
                                context: context, delegate: DataSearch());
                          },
                        ),
                      ),
                    ],
                  ),
                  //Recently played
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5.0, left: 40.0),
                        child: Text(
                          'Recently played',
                          style: new TextStyle(
                              fontFamily: 'Schylerl',
                              fontSize: 30.0,
                              color: Orangecolor),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 220.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 40.0),
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                      ],
                    ),
                  ),
                  //New release for you
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5.0, left: 40.0),
                        child: Text(
                          'New release for you',
                          style: new TextStyle(
                              fontFamily: 'Schylerl',
                              fontSize: 30.0,
                              color: darkcolor),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 220.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 40.0),
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                      ],
                    ),
                  ),
                  //My music
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5.0, left: 40.0),
                        child: Text(
                          'My music',
                          style: new TextStyle(
                              fontFamily: 'Schylerl',
                              fontSize: 30.0,
                              color: darkcolor),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 220.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 40.0),
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                        Container(
                          height: 220.0,
                          width: 180.0,
                          child: screen_post(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final tracks = [
    "Overture",
    "Hallelujah",
    "Say You Won't Let Go",
    "There For You",
    "Radioactive",
    " This Is What You Came For",
    "Stay with me",
    "Sugar",
    "Bohemian Rhapsody",
    "Get Lucky",
    "Thrift Shop",
    "Video Games",
    "Let Her Go",
    "Bad Romance",
    "I'm Yours",
    "Wake Me Up",
    "Rumour Has It",
    "We Are Young",
    "Safe and Sound",
    "Midnight City",
    "Pompeii",
    "Dancing On My Own",
    "Shake It Out",
  ];
  final recenttracks = [
    "Say You Won't Let Go",
    "There For You",
    "Radioactive",
    " This Is What You Came For",
    "Stay with me",
    "Sugar",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestiontracks = query.isEmpty
        ? recenttracks
        : tracks.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.music_note),
        title: Text(suggestiontracks[index]),
      ),
      itemCount: suggestiontracks.length,
    );
  }
}
