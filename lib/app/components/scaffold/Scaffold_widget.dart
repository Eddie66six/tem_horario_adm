import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey;
  ScaffoldWidget({Key key, this.body, this.scaffoldKey})
    : assert(body != null, "body is required"),
      assert(body != null, "scaffoldKey is required"),
    super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: body,
      ),
    );
  }
}