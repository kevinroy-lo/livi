import 'package:flutter/material.dart';
import 'package:livi/home/bloc/area/bloc/area_code_bloc.dart';
import 'package:livi/home/bloc/history/bloc/history_bloc.dart';
import 'package:livi/home/bloc/login/bloc/login_bloc.dart';
import 'package:livi/routes.dart';
import 'package:livi/service/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.liviRepository});

  final LiviRepository liviRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: liviRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AreaCodeBloc>(
            create: (context) =>
                AreaCodeBloc(liviRepository: liviRepository, contxt: context)
                  ..add(AreaCodeStart()),
          ),
          BlocProvider<HistoryBloc>(
              create: (context) => HistoryBloc(
                  areaCodeBloc: BlocProvider.of<AreaCodeBloc>(context))),
          BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livi Bank',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: AppRouter.routes,
      initialRoute: AppRouter.initialRoute,
      onUnknownRoute: AppRouter.unknownRoute,
    );
  }
}
