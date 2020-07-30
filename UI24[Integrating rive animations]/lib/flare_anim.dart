import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SmartAnimation extends StatefulWidget {
  @override
  _SmartAnimationState createState() => _SmartAnimationState();
}

class _SmartAnimationState extends State<SmartAnimation> {
  bool isOpen=false;
  bool camTap=false;
  bool pulseTap=false;
  bool galleryTap=false;
  String test="None Selected";
  static const double finalHeight=295.0;
  static const double finalWidth=251.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: finalHeight,
          width: finalWidth,
          child: GestureDetector(
              onTapUp: (touchPosition) {

                var localPosition=(context.findRenderObject() as RenderBox).globalToLocal(touchPosition.globalPosition);

                var topHalfTouch=localPosition.dy < (finalHeight/2);
                var lefSideTouched=localPosition.dx < (finalWidth/3);
                var rightSideTouched=localPosition.dx > (finalWidth/3)*2;
                var middleTouched=!lefSideTouched && !rightSideTouched;

                setState(() {
                  isOpen=!isOpen;
                });

                if (lefSideTouched && topHalfTouch) {
                  print('TopLeft');
                  setState(() {
                    camTap=true;
                    test='Camera';
                  });
                } else if (middleTouched && topHalfTouch) {
                  print('TopMiddle');
                  setState(() {
                    pulseTap=true;
                    test='Pulse';
                  });
                } else if (rightSideTouched && topHalfTouch) {
                  print('TopRight');
                  setState(() {
                    galleryTap=true;
                    test='Gallery';
                  });
                } else {
                  if (!isOpen) {
                    print('Bottom Close');
                  } else {
                    print('Bottom Open');
                  }
                }
              },
              child: FlareActor('assets/btn_anim.flr',animation: isOpen?'activate':'deactivate',)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Text(test,style: TextStyle(color: Colors.white,fontSize: 35),),
        ),
      ],
    );
  }
}
