import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Function changeValue;

  const NextButton({
    Key key,
    this.changeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return RaisedButton(
      color: Color(0xff4B0082),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Container(
          width: width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
              ),
              Text(
                'Next',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      onPressed: changeValue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90.0),
      ),
    );
  }
}
