import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worky/home_bloc.dart';
import 'package:worky/main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppsColors.lightBlue,
        title: Text('Worky'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        "assets/images/avatar.svg",
                        height: 70,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Jhon',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Text(
                        'jhonvera@msn.com',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/material_bg_2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/help.svg",
                width: 25,
              ),
              title: Text('Ayuda'),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/services.svg",
                width: 25,
              ),
              title: Text('Mis Servicios'),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/location.svg",
                width: 25,
              ),
              title: Text('Mis Ubicaciones'),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/contacts.svg",
                width: 25,
              ),
              title: Text('Mis Contactos'),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/conditions.svg",
                width: 25,
              ),
              title: Text('Condiciones'),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/images/exit.svg",
                width: 25,
              ),
              title: Text('Salir'),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/images/search.svg",
                          width: 30,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  border: OutlineInputBorder()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
            ),
            Text(
              'Elige tu servicio',
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (BuildContext context, HomeState state) {
                  if (state is InitialHomeState) {
                    BlocProvider.of<HomeBloc>(context).add(InitHomeEvent());
                  }

                  if (state is DataHomeState) {
                    return GridView.builder(
                        itemCount: state.services.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) =>
                            AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              child: ScaleAnimation(
                                child: Stack(
                                  fit: StackFit.loose,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: CircleAvatar(
                                          radius: 60,
                                          backgroundColor: Colors.grey.shade700,
                                          child: CircleAvatar(
                                            radius: 59,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 55,
                                              backgroundColor:
                                                  AppsColors.lightBlue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 40,
                                        child: SizedBox.expand(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10),
                                            alignment: Alignment.centerLeft,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            child: Text(
                                              state.services[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ));
                  }
                  return Center(
                    child: SpinKitThreeBounce(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: index.isEven ? AppsColors.red : AppsColors.lightBlue,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
