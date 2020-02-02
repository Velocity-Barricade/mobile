import 'package:barricade/Values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {

  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }

}

class _CustomPainter extends BoxPainter {

  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    var indicatorHeight=22.0;
    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
//    final Rect rect = offset & configuration.size;
    final Rect rect = Offset(offset.dx+10, (configuration.size.height/2)-indicatorHeight/2) & Size(configuration.size.width-20, indicatorHeight);

    final Paint paint = Paint();
    paint.color = themeColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(150.0)), paint);
  }

}