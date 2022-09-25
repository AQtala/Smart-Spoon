import 'package:flutter/material.dart';

import '../../../constants/theme_constants.dart';

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget(
      {Key? key, required this.width, required this.height})
      : super(key: key);
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: _ClipShadowShadowPainter(
        clipper: PaperClip(),
        shadow: Shadow(
          color: Theme.of(context).shadowColor,
          blurRadius: 5,
        ),
      ),
      child: ClipPath(
        clipper: PaperClip(),
        child: Container(
          margin: EdgeInsets.only(left: width * 0.8),
          width: width * 0.2,
          height: height * 0.08,
          child: ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                width * 0.2,
                height * 0.08,
              ),
              padding: EdgeInsets.only(top: height * 0.01),
            ),
            child: Icon(
              Icons.add,
              size: height * 0.05,
              color: COLOR_PRIMARY_DARK,
            ),
          ),
        ),
      ),
    );
  }
}

class PaperClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.88, 0);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // path.lineTo(size.width * 0.8, size.height * 0.04);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
