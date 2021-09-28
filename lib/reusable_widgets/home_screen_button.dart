import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenButton extends StatelessWidget {
  final double height;
  final TextInputType textInputType;
  final String text1;
  final String text2;
  final String lableTxt;
  final TextEditingController controller;
  final int maxLines;
  final int maxLength;
  final bool obscureText;
  final ValueChanged onChange;
  final Function changeValue;
  final ValueChanged<String> validator;
  final AutovalidateMode autovalidateMode;
  final EdgeInsets margin;
  final TextStyle style;
  const HomeScreenButton({
    Key key,
    this.text1,
    this.text2,
    this.obscureText,
    this.lableTxt,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.onChange,
    this.autovalidateMode,
    this.validator,
    this.margin,
    this.textInputType,
    this.changeValue,
    this.style,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: width * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: changeValue,
            child: Container(
              height: height * 0.16,
              width: width,
              color: Colors.pink.withOpacity(0.2),
              child: Stack(
                children: [
                  Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/right_arrow.svg',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  )),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            text1,
                            style: TextStyle(
                                fontSize: 27,
                                color: Colors.black,
                                fontWeight: FontWeight.w700
                                // shadows: <Shadow>[
                                //   Shadow(
                                //     offset: Offset(0.0, 0.0),
                                //     blurRadius: 3.0,
                                //     color: Color.fromARGB(255, 0, 0, 0),
                                //   ),
                                //   Shadow(
                                //     offset: Offset(0.0, 0.0),
                                //     blurRadius: 3.0,
                                //     color: Color.fromARGB(125, 0, 0, 255),
                                //   ),
                                // ],
                                ),
                          ),
                          Text(
                            text2,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700
                                // shadows: <Shadow>[
                                //   Shadow(
                                //     offset: Offset(0.0, 0.0),
                                //     blurRadius: 3.0,
                                //     color: Color.fromARGB(255, 0, 0, 0),
                                //   ),
                                //   Shadow(
                                //     offset: Offset(0.0, 0.0),
                                //     blurRadius: 3.0,
                                //     color: Color.fromARGB(125, 0, 0, 255),
                                //   ),
                                // ],
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
