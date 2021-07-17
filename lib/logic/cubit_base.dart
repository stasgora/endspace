import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:reloadable_bloc/reloadable_bloc.dart';

abstract class CubitBase<State> extends ReloadableCubit<State> {
  @override
  RouteObserver routeObserver = GetIt.I<RouteObserver>();

  CubitBase({
    required State initialState,
    required ModalRoute route,
  }) : super(route: route, initialState: initialState);

  @override
  Future reload(ReloadableReason reason) async {}
}
