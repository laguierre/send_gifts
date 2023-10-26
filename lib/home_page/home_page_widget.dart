import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:send_gifts/data/data.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.sp),
            bottomLeft: Radius.circular(60.sp)),
        color: Colors.primaries[index],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.primaries[index],
            Colors.primaries[index + 2]
          ], // Cambia los colores del degradado
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30.sp, top: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.sp),
            Row(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                        padding: EdgeInsets.all(5.sp),
                        margin: EdgeInsets.only(left: 41.sp),
                        height: 100.sp,
                        width: 100.sp,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black54,
                                Colors.primaries[index + 2]
                              ],
                            )),
                        child: Image.asset(
                          cardGift[index].urlPhoto,
                          fit: BoxFit.fill,
                        )),
                    Container(
                        alignment: Alignment.center,
                        height: 50.sp,
                        width: 50.sp,
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: 10.0,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ],
                ),
                SizedBox(width: 20.sp),
                Expanded(
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elitLorem ipsum dolor sit amet.',
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        )))
              ],
            ),
            const Spacer(),
            RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${cardGift[index].presentation}\n',
                      style: TextStyle(fontSize: 28.0.sp, color: Colors.white),
                    ),
                    TextSpan(
                        text: cardGift[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0.sp,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                )),
            const Spacer(),
            Container(
              height: 60.sp,
              padding: EdgeInsets.only(left: 15.sp),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.sp),
                    bottomLeft: Radius.circular(40.sp)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2), // Sombra con opacidad
                    blurRadius: 10.0, // Radio de desenfoque
                    offset: const Offset(0, 5), // Desplazamiento de la sombra
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.remove_red_eye_sharp,
                      color: Colors.white, size: 26.sp),
                  SizedBox(width: 5.sp),
                  Text(
                    '${cardGift[index].views}+ viewing',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.shopping_bag, color: Colors.white, size: 26.sp),
                  Expanded(
                    child: Text(
                      '${cardGift[index].price}k',
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.sp),
          ],
        )
      ),
    );
  }
}

class PopularItemsText extends StatelessWidget {
  const PopularItemsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: const Alignment(-0.9, 0.9),
        child: RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: '${cardGift.length}\n',
              style: const TextStyle(
                fontSize: 30.0,
                color: Color(0xFFA39D93),
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(
                text: 'Popular Items',
                style: TextStyle(
                  color: Color(0xFFA39D93),
                  fontSize: 30.0,
                ))
          ],
        )));
  }
}

class SendGiftText extends StatelessWidget {
  const SendGiftText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: const Alignment(-0.9, -0.5),
        child: RichText(
            text:  TextSpan(
          children: [
            TextSpan(
              text: 'Send\n',
              style: TextStyle(fontSize: 41.0.sp, color: Colors.black),
            ),
            TextSpan(
                text: 'GIFTS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 41.0.sp,
                  fontWeight: FontWeight.bold,
                ))
          ],
        )));
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: const Alignment(-0.9, -0.9),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xFFF0EEF0)),
          child: const Icon(
            Icons.chevron_left,
            size: 50,
          ),
        ));
  }
}
