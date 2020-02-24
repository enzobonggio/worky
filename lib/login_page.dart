import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worky/home_bloc.dart';
import 'package:worky/home_page.dart';
import 'package:worky/login_bloc.dart';
import 'package:worky/main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppsColors.lightBlue,
        title: Text('Ingresar'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, state) {
          if (state is SuccessLoginState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => BlocProvider.value(
                          value: HomeBloc(),
                          child: HomePage(),
                        )),
                (_) => false);
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Text(
                'Cuál es tu número?',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.grey.shade600),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                'Te enviaremos un mensaje de texto para verificar tu telefono',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.grey.shade500),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (BuildContext context, LoginState state) {
                  if (state is InitialLoginState) {
                    return Container(
                      height: 60,
                      child: TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: 'Telefono',
                          labelStyle: TextStyle(color: AppsColors.red),
                          prefix: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/flag_ecuador.svg',
                                  width: 35,
                                  fit: BoxFit.fitWidth,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                ),
                                Text('+593-')
                              ],
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    );
                  }
                  return Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                AppsColors.red),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                          ),
                          Text(
                            'Verificación de código',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (BuildContext context, LoginState state) {
                  return Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: AppsColors.lightBlue,
                      onPressed: () => BlocProvider.of<LoginBloc>(context)
                          .add(PressLoginButton()),
                      child: Text(
                        state is InitialLoginState ? 'ENVIAR' : 'VERIFICAR',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
