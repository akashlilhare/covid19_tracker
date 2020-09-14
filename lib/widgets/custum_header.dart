import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../constant.dart';


class CuMyHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  const CuMyHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<CuMyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blueGrey,
              Colors.white
              // Color(0xFF3383CD),
              // Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
              image: AssetImage("assets/images/virus.png"),alignment: AlignmentDirectional.centerStart
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    child: SvgPicture.asset(
                     'assets/icons/coronadr.svg',
                      width:200,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 50 - widget.offset / 2,
                    left: 130,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
