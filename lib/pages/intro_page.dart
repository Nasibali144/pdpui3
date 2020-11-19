import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdpui3/pages/home_page.dart';
import 'package:pdpui3/utils/Strings.dart';

class IntroPage extends StatefulWidget {

  static final String id = 'intro_page';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentIndex = page;
              });
            },
            children: [
              makePage(
                image: 'assets/images/image_1.png',
                content: Strings.stepOneContent,
                title: Strings.stepOneTitle,
              ),

              makePage(
                image: 'assets/images/image_2.png',
                content: Strings.stepTwoContent,
                title: Strings.stepTwoTitle,
              ),

              makePage(
                image: 'assets/images/image_3.png',
                content: Strings.stepThreeContent,
                title: Strings.stepThreeTitle,
              ),
            ],
          ),


          Container(
            margin: EdgeInsets.only(bottom: 60),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),

          _skip(),
        ],
      ),
    );
  }

  Widget _skip() {
    if(_currentIndex == 2){
      return Container(
        margin: EdgeInsets.only(right: 20),
        height: 85,
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
          child: Text('Skip', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w400),),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget makePage({image, title, content}) {

    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),),
          SizedBox(height: 30,),
          Text(content, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.grey),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30: 6,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(3)
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];
    for(int i = 0; i < 3; i++){
      if(_currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
