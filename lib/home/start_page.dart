import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi/components/page_loading.dart';
import 'package:livi/home/bloc/area/bloc/area_code_bloc.dart';
import 'package:livi/home/bloc/login/bloc/login_bloc.dart';
import 'package:livi/home/home.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == FormzStatus.yes) {
          Navigator.of(context)
              .popAndPushNamed('/user', arguments: {'phone': state.username});
        } else {
          log('Login failed');
          const snackBar = SnackBar(
            content: Text('The test account is : 16675550312'),
          );
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(snackBar);
          ;
        }
      },
      child: BlocBuilder<AreaCodeBloc, AreaCodeState>(
          builder: (BuildContext context, AreaCodeState state) {
        if (state.status == AreaCodeStatus.loading) {
          return const PageLoading();
        }
        if (state.status == AreaCodeStatus.loaded) {
          return const MyHomePage();
        }
        if (state.status == AreaCodeStatus.error) {
          return const PageLoading();
        }
        return const Text('error');
      }),
    );
  }
}
