import 'package:flutter/material.dart';
import 'package:period_and_pregnancy_app/pages/period_pages/period_page.dart';
import 'package:period_and_pregnancy_app/provider/period_provider.dart';
import 'package:provider/provider.dart';

class PeriodResult extends StatefulWidget {
  const PeriodResult({Key key}) : super(key: key);

  @override
  _PeriodResultState createState() => _PeriodResultState();
}

class _PeriodResultState extends State<PeriodResult> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Material(
                    elevation: 0,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                      300,
                    )),
                    color: Colors.pink.withOpacity(0.2),
                    child: Container(
                      height: height * 0.24,
                      width: 200,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: height,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Material(
                      elevation: 0,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                        300,
                      )),
                      color: Colors.pink.withOpacity(0.2),
                      child: Container(
                        height: height * 0.24,
                        width: 200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(360),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: FlatButton(
                                  shape: Border.all(
                                    width: 1,
                                    color: Colors.transparent,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PeriodPage(),
                                      ),
                                    );
                                  },
                                  child: Visibility(
                                    visible: false,
                                    child: Container(
                                      height: 0.0,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: height,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(
                        300,
                      )),
                      color: Colors.pink.withOpacity(0.2),
                      child: Container(
                        height: height * 0.5,
                        width: width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: FittedBox(
                                child: Text(
                                  "Your next period will be on ",
                                  style: TextStyle(
                                      fontSize: 27,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            Consumer<PeriodProvider>(
                                builder: (context, periodProvider, _) {
                              return Center(
                                child: FittedBox(
                                  child: Text(
                                    periodProvider.periodDate.year.toString() +
                                        "/" +
                                        periodProvider.periodDate.month
                                            .toString() +
                                        "/" +
                                        (periodProvider.periodDate.day)
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
