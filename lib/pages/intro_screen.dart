import 'package:flutter_appfull/utils/flutkart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfull/utils/my_navigator.dart';
import 'package:flutter_appfull/widgets/walkthrough.dart';
import 'package:flutter_tts/flutter_tts.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  final FlutterTts flutterTts = new FlutterTts();

  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  void initState() {
    _speak1();
    super.initState();
//    Timer(Duration(milliseconds: 3000), () => MyNavigator.goToIntro(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: Flutkart.wt1,
                  content: Flutkart.wc1,
                  imageIcon: Icons.mobile_screen_share,
                ),
                Walkthrough(
                  title: Flutkart.wt2,
                  content: Flutkart.wc2,
                  imageIcon: Icons.search,
                ),
                Walkthrough(
                  title: Flutkart.wt3,
                  content: Flutkart.wc3,
                  imageIcon: Icons.add_a_photo,
                ),
                Walkthrough(
                  title: Flutkart.wt4,
                  content: Flutkart.wc4,
                  imageIcon: Icons.verified_user,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
//                FlatButton(
//                  child: Text(lastPage ? "" : Flutkart.skip,
//                      style: TextStyle(
//                          color: Colors.black,
//                          fontWeight: FontWeight.bold,
//                          fontSize: 16.0)),
//                  onPressed: () =>
//                      lastPage ? null : MyNavigator.goToHome(context),
//                ),
//                FlatButton(
//                  child: Text(lastPage ? Flutkart.gotIt : Flutkart.next,
//                      style: TextStyle(
//                          color: Colors.black,
//                          fontWeight: FontWeight.bold,
//                          fontSize: 16.0)),
//                  onPressed: () => lastPage
//                      ? MyNavigator.goToHome(context)
//                      : controller.nextPage(
//                          duration: Duration(milliseconds: 300),
//                          curve: Curves.easeIn),
//                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _speak1() async {
    await flutterTts.speak(
        "The purpose of Vision is to provide you the help for reading easily !");
  }
}

//
