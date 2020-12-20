import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:layout_demo/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  KeyboardVisibilityNotification _keyboardVisibility =
      KeyboardVisibilityNotification();
  int _keyboardSubscriberId;
  final ScrollController _scrollController = ScrollController();
  double _imgHeight;

  // You may adjust the values below to suit your image
  final double initialImgHeight = 300;
  final double imgReducedHeightFactorLandscape = 200;

  @override
  void initState() {
    super.initState();

    _imgHeight = initialImgHeight;

    _keyboardSubscriberId =
        _keyboardVisibility.addNewListener(onChange: (bool visible) {
      setState(() {
        _imgHeight = visible ? 0 : initialImgHeight;
      });
    });
  }

  @override
  void dispose() {
    _keyboardVisibility.removeListener(_keyboardSubscriberId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        backgroundColor: Colors.white70.withAlpha(220),
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: LayoutBuilder(
                builder: (context, constraints) => Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    color: Colors.grey,
                    child: Scrollbar(
                        isAlwaysShown: true,
                        controller: _scrollController,
                        child: ListView(
                          controller: _scrollController,
                          children: [
                            AnimatedSize(
                                duration: const Duration(milliseconds: 800),
                                vsync: this,
                                curve: Curves.ease,
                                child: Image.asset("imgs/mustang.jpg",
                                    fit: BoxFit.fitWidth,
                                    height: orientation == Orientation.portrait
                                        ? _imgHeight
                                        : _imgHeight -
                                            imgReducedHeightFactorLandscape)),
                            Container(
                                height: constraints.maxHeight, child: SignIn())
                          ],
                        ))))));
  }
}
