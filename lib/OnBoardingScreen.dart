import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_page_1.dart';
import 'intro_page_2.dart';
import 'intro_page_3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //controller to keep track of which page we're on
  PageController _controller = PageController();

  //keep track if we are in the last page or not
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            PageView(

              controller: _controller,
              onPageChanged: (index){
                setState(() {
                  onLastPage = (index ==2);
                });
              },
              children: [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
            ),

            //dot indicators
            Container(
                alignment: Alignment(0,0.75),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //skip

                    GestureDetector(
                      onTap:(){
                        _controller.jumpToPage(2);

                      },
                      child: Text("Skip"),
                    ),
                    //dot indicators

                    SmoothPageIndicator(controller: _controller, count: 3),

                    onLastPage
                        ?
                    GestureDetector(
                      onTap: (){
                        _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn,);
                      },

                      child: Text("Done"),
                    )
                        :GestureDetector(
                      onTap: (){
                        _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn,);
                      },
                      child: Text("Next"),)


                    //next or done

                  ],
                ))
          ],


        )
    );
  }
}
