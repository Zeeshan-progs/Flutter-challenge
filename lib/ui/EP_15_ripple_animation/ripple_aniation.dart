import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/widget/light_app_bar.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({
    super.key,
  });

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

/// For animation we need ticker mixin
class _RippleAnimationState extends State<RippleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Color color = Colors.green.withOpacity(0.4);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBar(title: 'Custom ripple animation'),
      body: Center(
        child: CustomPaint(
          painter: _CustomPaint(_controller, color),
          child: SizedBox(
            height: 300,
            width: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    // color,
                    // for color shade we need second color
                    Color.lerp(color, Colors.red, 0.9)!
                  ]),
                ),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.4, end: 1.0).animate(
                    CurvedAnimation(
                        parent: _controller, curve: const _CustomCurve()),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Lets create custom curves

class _CustomCurve extends Curve {
  const _CustomCurve();
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.9;
    } else {
      return sin(t * pi);
    }
  }
}

/// lets make a custom paint for background to animate

class _CustomPaint extends CustomPainter {
  _CustomPaint(
    this._animation,
    this.color,
  ) : super(repaint: _animation);

  Color color;
  final Animation<double> _animation;
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);

    final _color = color.withOpacity(opacity);
    final size = rect.width / 2;
    final area = size * size;
    final radius = sqrt(area * value / 4);
    final Paint paint = Paint()..color = _color;
    canvas.drawCircle(rect.center, radius, paint);
  }
}
