import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final Widget child;
  final double start;
  final double end;
  const GlassMorphism({
    Key? key,
    required this.child,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
            gradient: LinearGradient(
              colors: [
                Colors.grey.withOpacity(start),
                Colors.grey.withOpacity(end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            border: Border.all(
              width: 1.5,
              color: Colors.grey.withOpacity(0.1),
            )          ),
          child: child,
        )
      )
    );
  }
}
