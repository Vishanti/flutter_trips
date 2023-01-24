import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_trips/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'Place/ui/screens/home_trips.dart';
import 'Place/ui/screens/search_trips.dart';
import 'User/ui/screens/profile_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  const PlatziTripsCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.indigo)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.indigo)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.indigo)),
        ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
            case 2:
              return CupertinoTabView(builder: (BuildContext context) {
                return BlocProvider<UserBloc>(
                  bloc: UserBloc(),
                  child: const ProfileTrips(),
                );
              });
            default:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
          }
        },
      ),
    );
  }
}
