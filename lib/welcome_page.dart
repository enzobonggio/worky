import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worky/login_bloc.dart';
import 'package:worky/login_page.dart';
import 'package:worky/main.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        brightness: Brightness.light,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: 200,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Recuperar Contraseña',
                    style: TextStyle(
                        color: AppsColors.lightBlue, letterSpacing: 0),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: AppsColors.red,
                      onPressed: () {},
                      child: Text(
                        'REGISTRATE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: AppsColors.lightBlue,
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BlocProvider.value(
                                      value: LoginBloc(), child: LoginPage()))),
                      child: Text(
                        'INICIÁ SESIÓN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
