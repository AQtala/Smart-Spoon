import 'package:flutter/material.dart';

import '../../../controllers/ThemeController/theme_constants.dart';

class DeviceContainer extends StatelessWidget {
  const DeviceContainer({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: _ClipShadowShadowPainter(
          clipper: PaperClip(),
          shadow: const Shadow(color: COLOR_PRIMARY_SHADOW, blurRadius: 15)),
      child: ClipPath(
        clipper: PaperClip(),
        child: Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          height: height * 0.88,
          width: width,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
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
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.1, 0);
    path.lineTo(0, size.height * 0.04);
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
