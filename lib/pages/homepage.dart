import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:period_and_pregnancy_app/bloc/navigation_bloc.dart';
import 'package:period_and_pregnancy_app/pages/period_pages/period_page.dart';
import 'package:period_and_pregnancy_app/pages/pregnancy_pages/pregnancy_page.dart';
import 'package:period_and_pregnancy_app/reusable_widgets/home_screen_button.dart';
import 'package:period_and_pregnancy_app/reusable_widgets/navigator.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        // This bloc can now be accessed

        builder: (context) => NavigationBloc(),

        child: Menu(),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
          child: Row(
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
        BlocBuilder(
          bloc: _bloc,
          builder: (BuildContext context, NavigationState state) {
            if (state is NavigationInitial) {
              return mainview();
            } else if (state is SecondSate) {
              return NavigatorPushed(
                milliseconds: 100,
                navigateAfterSeconds: PeriodPage(),
              );
            } else if (state is ThirdSate) {
              return NavigatorPushed(
                milliseconds: 100,
                navigateAfterSeconds: Pregnancy(),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  Column mainview() {
    return Column(
      children: [
        SizedBox(
          height: 250,
        ),
        HomeScreenButton(
          changeValue: dispatchOne,
          text1: "Treack my period",
          text2: "Contraception and wellbeing",
        ),
        SizedBox(
          height: 30,
        ),
        HomeScreenButton(
          changeValue: dispatchTwo,
          text1: "Get pregnant",
          text2: "Learn about reproductive health",
        )
      ],
    );
  }

  void dispatchOne() {
    final weatherBloc = BlocProvider.of<NavigationBloc>(context);
    weatherBloc.dispatch(NavigationOne());
  }

  void dispatchTwo() {
    final weatherBloc = BlocProvider.of<NavigationBloc>(context);
    weatherBloc.dispatch(NavigationTwo());
  }
}
