
import 'package:dexplateassessment/presentation/Dashboard/bottom_bar.dart';
import 'package:dexplateassessment/utils/constants.dart';
import 'package:dexplateassessment/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authentication/bloc/authentication_bloc.dart';
import 'features/database/home_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BlocNavigate(),
        title: Constants.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return const BottomNavigationHolder();
        } else {
          return const WelcomeView();
        }
      },
    );
  }
}
