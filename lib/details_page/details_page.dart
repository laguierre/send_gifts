import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:send_gifts/data/data.dart';
import 'package:send_gifts/glassmorfism/glassmorfism.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.index});

  final int index;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  double scaleButtonCart = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: size.width * 0.05,
              right: 0,
              bottom: 0,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 30),
                  color: Colors.black,
                  child: Stack(
                    children: [
                      FadeInRight(
                          child: Align(
                              alignment: const Alignment(-1, -1),
                              child: Container(
                                  margin: const EdgeInsets.only(right: 30),
                                  padding: const EdgeInsets.all(30),
                                  width: double.infinity,
                                  height: size.height * 0.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(60)),
                                  child: Image.asset(
                                    cardGift[widget.index].urlPhoto,
                                    fit: BoxFit.contain,
                                  )))),
                      FadeInRight(
                          delay: const Duration(milliseconds: 400),
                          child: Align(
                              alignment: const Alignment(1, 0.1),
                              child: GlassMorphism(
                                  start: 0.6,
                                  end: 0.6,
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 45),
                                      height: size.height * 0.15,
                                      width: size.width * 0.75,
                                      child: RichText(
                                          text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${cardGift[widget.index].presentation}\n',
                                            style: TextStyle(
                                                fontSize: 30.0.sp,
                                                color: Colors.white),
                                          ),
                                          TextSpan(
                                              text:
                                                  cardGift[widget.index].title,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30.0.sp,
                                                fontWeight: FontWeight.bold,
                                              ))
                                        ],
                                      )))))),
                    ],
                  ))),
          Positioned(
              top: size.height * 0.53,
              left: size.width * 0.05 + 30,
              right: 30,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BounceInDown(
                      delay: const Duration(milliseconds: 700),
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur adipiscing elit tempor dignissim lacus quis aenean magna lobortis class molestie pellentesque venenatis, purus laoreet vel rhoncus sociosqu penatibus suspendisse sapien etiam bibendum sodales vehicula orci ornare curae dictumst litora.',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      )),
                  const SizedBox(height: 30),
                  FadeInRight(
                      delay: const Duration(milliseconds: 800),
                      child: GestureDetector(
                          onTap: () {
                            _controller.reset();
                            _controller.forward();
                          },
                          child: Transform.scale(
                              scale:
                                  0.4 * _controller.value * _controller.value -
                                      0.4 * _controller.value +
                                      1, //0.4x^2 - 0.4x + 1
                              origin: const Offset(0.5, 0.5),
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: size.height * 0.1,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xFFA39D93),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      Align(
                                        alignment: const Alignment(-0.65, 0),
                                        child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '\$${cardGift[widget.index].price} ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 28.0.sp,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )),
                                      ),
                                      Container(
                                        width: 80.sp,
                                        height: size.height * 0.1,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xFFE57C26),
                                        ),
                                        child: Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Colors.white,
                                            size: 35.sp),
                                      ),
                                    ],
                                  )))))
                ],
              )),
          Positioned(
              top: size.height * 0.9,
              left: 0,
              right: size.width * 0.75,
              bottom: 0,
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        bottomRight: Radius.circular(60)),
                    color: Colors.white,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ShakeX(
                          infinite: true,
                          duration: const Duration(milliseconds: 3000),
                          child: FadeInLeft(
                              child: const Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            size: 60,
                          ))))))
        ],
      ),
    );
  }
}
