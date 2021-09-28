import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:period_and_pregnancy_app/bloc/navigation_bloc.dart';
import 'package:period_and_pregnancy_app/pages/homepage.dart';
import 'package:period_and_pregnancy_app/pages/period_pages/period_result.dart';
import 'package:period_and_pregnancy_app/provider/period_provider.dart';
import 'package:period_and_pregnancy_app/reusable_widgets/navigator.dart';
import 'package:period_and_pregnancy_app/reusable_widgets/next_button.dart';
import 'package:provider/provider.dart';

class PeriodPage extends StatefulWidget {
  const PeriodPage({Key key}) : super(key: key);

  @override
  _PeriodPageState createState() => _PeriodPageState();
}

class _PeriodPageState extends State<PeriodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        // This bloc can now be accessed

        builder: (context) => NavigationBloc(),

        child: MainMenu(),
      ),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  void dispatchThird() {
    final weatherBloc = BlocProvider.of<NavigationBloc>(context);
    weatherBloc.dispatch(NavigationThree());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var _bloc = BlocProvider.of<NavigationBloc>(context);
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          child: BlocBuilder(
            bloc: _bloc,
            builder: (BuildContext context, NavigationState state) {
              if (state is NavigationInitial) {
                return mainView(height, width);
              } else if (state is ThirdSate) {
                return NavigatorPushed(
                  milliseconds: 100,
                  navigateAfterSeconds: PeriodResult(),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }

  Stack mainView(double height, double width) {
    return Stack(
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
                                      builder: (context) => Homepage(),
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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: width * 0.8,
                child: FittedBox(
                  child: Text(
                    "Chose the date of your last period",
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                    height: MediaQuery.of(context).copyWith().size.height / 3,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newdate) {
                        Provider.of<PeriodProvider>(context, listen: false)
                            .savePeriod(newdate);
                      },
                      use24hFormat: false,
                      maximumDate: new DateTime(DateTime.now().year,
                          DateTime.now().month, DateTime.now().day + 9),
                      minimumYear: 2010,
                      maximumYear: 2018,
                      minuteInterval: 1,
                      mode: CupertinoDatePickerMode.dateAndTime,
                    )),
              ),
              SizedBox(
                height: 100,
              ),
              NextButton(
                changeValue: () {
                  dispatchThird();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
