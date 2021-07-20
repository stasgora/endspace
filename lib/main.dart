import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'logic/dashboard_cubit.dart';
import 'logic/room_cubit.dart';
import 'logic/start_page_cubit.dart';
import 'model/room.dart';
import 'pages/game_dashboard.dart';
import 'pages/room_page.dart';
import 'pages/start_page.dart';
import 'services/connection_provider.dart';
import 'utils/ui/theme_config.dart';

void main() async {
  GetIt.I.registerSingleton(ConnectionProvider());
  GetIt.I.registerSingleton(GlobalKey<NavigatorState>());
  GetIt.I.registerSingleton(RouteObserver());

  runApp(SpaceGame());
}

class SpaceGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _loadAudio();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _initializeAndPlayAudio());
    return MaterialApp(
      title: 'End Space',
      theme: _createAppTheme(),
      themeMode: ThemeMode.light,
      initialRoute: '/start-page',
      routes: _createRoutes(),
      navigatorKey: GetIt.I<GlobalKey<NavigatorState>>(),
      navigatorObservers: [GetIt.I<RouteObserver<Route>>()],
    );
  }

  Map<String, WidgetBuilder> _createRoutes() {
    var getRoute = ModalRoute.of;
    getParams(BuildContext context) => getRoute(context)?.settings.arguments;
    return {
      '/start-page': (ctx) => withCubit(
            StartPage(),
            StartPageCubit(getRoute(ctx)!),
          ),
      '/room-page': (ctx) => withCubit(
            RoomPage(),
            RoomCubit(route: getRoute(ctx)!, room: getParams(ctx) as Room),
          ),
      '/game-dashboard': (ctx) => withCubit(
            GameDashboard(),
            DashboardCubit(
              route: getRoute(ctx)!,
              state: getParams(ctx) as DashboardState,
            ),
          ),
    };
  }

  Widget withCubit<CubitType extends Cubit>(Widget widget, CubitType cubit) {
    return BlocProvider<CubitType>(
      create: (context) => cubit,
      child: widget,
    );
  }

  ThemeData _createAppTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.mainColor,
      fontFamily: 'Lato',
      scaffoldBackgroundColor: AppColors.mainBackgroundColor,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 32.0,
          fontFamily: 'LuckiestGuy',
          color: AppColors.lightTextColor,
        ), // Scaffold/appbar headline
        headline2: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextColor,
        ), // Main headline before lists
        headline3: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
          color: AppColors.darkTextColor,
        ), //For headers inside list elements
        subtitle2: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.normal,
          color: AppColors.mediumTextColor,
        ), // Little subtitle for headline2
        bodyText1: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
          color: AppColors.lightTextColor,
        ), // Classic body text on light background
        bodyText2: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
          color: AppColors.darkTextColor,
        ), // Classic body text on color
        button: TextStyle(
          fontSize: 32.0,
          color: AppColors.lightTextColor,
          fontFamily: 'LuckiestGuy',
        ), // (Almost always white) button text
      ),
    );
  }

  Future<void> _loadAudio() async {
    await FlameAudio.audioCache.loadAll([
      'click.mp3',
      'back.mp3',
      'code_enter.mp3',
      'code_del.mp3',
      'start.mp3',
    ]);
    await FlameAudio.bgm.audioCache.loadAll(['menu.mp3']);
  }

  void _initializeAndPlayAudio() {
    FlameAudio.bgm.initialize();
    if (!FlameAudio.bgm.isPlaying) FlameAudio.bgm.play("menu.mp3");
  }
}
