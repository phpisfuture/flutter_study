import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Banner, showSearch;


const double kHomeRefreshHeight = 180.0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var bannerHeight = MediaQuery
        .of(context)
        .size
        .width * 5 / 11;
    return Center(
      child: Text("首页"),
    );
  }
}