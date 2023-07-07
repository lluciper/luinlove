import 'package:flutter/material.dart';

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({super.key});

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10000));
    final Animation<double> curve = CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutSine,
        reverseCurve: Curves.easeInOutSine);
    animation = Tween<double>(begin: 0, end: 0.5).animate(curve);
    animationController
      ..addListener(() {
        setState(() {});
      })
      ..repeat(reverse: true, period: const Duration(milliseconds: 10000));
  }

  @override
  Widget build(BuildContext context) {
    var width = -MediaQuery.of(context).size.width;
    return SizedBox(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Transform.translate(
            offset: Offset(animation.value * 4 * width, 0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                painter: WavePainter(
                  realSize: Size(-width * 15, 150),
                  colors: [
                    Colors.purple.withOpacity(0.2),
                    Colors.purple.withOpacity(0.5),
                  ],
                  pick: 30,
                  amount: 30,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(animation.value * 2 * width, 0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                painter: WavePainter(
                  realSize: Size(-width * 15, 150),
                  colors: [
                    Colors.red.withOpacity(0.2),
                    Colors.red.withOpacity(0.5),
                  ],
                  pick: 30,
                  amount: 30,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(animation.value * 3 * width, 0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                painter: WavePainter(
                  realSize: Size(-width * 15, 150),
                  colors: [
                    Colors.pink.withOpacity(0.2),
                    Colors.pink.withOpacity(0.5),
                  ],
                  pick: 30,
                  amount: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  WavePainter({
    required this.colors,
    this.amount = 4,
    this.pick = 30,
    this.realSize,
  });
  List<Color> colors;
  int amount;
  double pick;
  Size? realSize;
  @override
  void paint(Canvas canvas, Size size) {
    size = realSize ?? size;
    var paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors,
      ).createShader(Rect.fromPoints(
        Offset.zero,
        Offset(size.width, size.height),
      ));
    var ww = size.width / (amount * 2 - 1);
    var path = Path();
    var hh = true;

    // path.lineTo(0, 0);
    for (var i = 1; i <= (4 * amount - 2); i++) {
      if (i % 2 == 0) {
        path..lineTo(i * ww / 2, 0)
        ..lineTo(i * ww / 2, 0);
      } else {
        if (hh) {
          path.quadraticBezierTo(i * (ww / 2), pick, (i + 1) * ww / 2, 0);
          hh = false;
        } else {
          path.quadraticBezierTo(i * (ww / 2), -pick, (i + 1) * ww / 2, 0);
          hh = true;
        }
      }
    }
    path..lineTo(size.width, 0)
    ..lineTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
