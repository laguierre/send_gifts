import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:send_gifts/data/data.dart';
import 'package:send_gifts/details_page/details_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late PageController _pageController;
  late SwiperController _swiperController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        upperBound: 0.09)
      ..addListener(() {
        setState(() {});
      });
    _pageController = PageController(initialPage: currentPage);
    _swiperController = SwiperController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          const CustomBackButton(),
          const SendGiftText(),
          Align(
            alignment: const Alignment(-0.75, 0),
            child: SmoothPageIndicator(
              axisDirection: Axis.vertical,
              controller: _pageController,
              effect: const ScrollingDotsEffect(
                fixedCenter: true,
                dotColor: Color(0xFFDEDDDE),
                radius: 20,
                activeDotColor: Color(0xFFE57C26)
              ),
              count: cardGift.length,
            )
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            right: -100.sp,
            child: Swiper(
              onIndexChanged: (index) {},
              layout: SwiperLayout.CUSTOM,
              customLayoutOption: CustomLayoutOption(
                  startIndex: -1, stateCount: 3)
                ..addRotate([30 / 180, 0.0, -30 / 180])
                ..addOpacity([0.4, 1, 0.8])
                ..addScale(
                    [0.8, 1 * (1 - _controller.value), 0.8], Alignment.center)
                ..addTranslate([
                  Offset(80.0.sp, -size.height * 0.45),
                  Offset(40.sp, 0),
                  Offset(60.0.sp, size.height * 0.52)
                ]),
              controller: _swiperController,
              itemHeight: size.height * 0.55,
              itemWidth: size.width * 0.7,
              itemCount: cardGift.length,
              index: cardGift.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      currentPage = index;
                      _controller.forward().whenCompleteOrCancel(() {
                        _controller.reverse().then((value) => Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: DetailsPage(index: currentPage),
                                  inheritTheme: true,
                                  ctx: context),
                            ));
                      });
                    },
                    child: GiftCard(index: index));
              },
            ),
          ),
          const PopularItemsText(),
        ],
      ),
    );
  }
}

