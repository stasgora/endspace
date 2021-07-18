import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:reloadable_bloc/reloadable_bloc.dart';

import '../services/connection_provider.dart';

abstract class CubitBase<State> extends ReloadableCubit<State> {
  @protected
  final connection = GetIt.I<ConnectionProvider>();

  @override
  RouteObserver routeObserver = GetIt.I<RouteObserver>();

  @protected
  final _callbacks = <String, void Function(dynamic)>{};

  CubitBase({
    required State initialState,
    required ModalRoute route,
  }) : super(route: route, initialState: initialState);

  void addCallbacks(Map<String, void Function(dynamic)> callbacks) {
    _callbacks.addAll(callbacks);
    callbacks.forEach(connection.subscribe);
  }

  @override
  void show(ReloadableReason reason) {
    super.show(reason);
    _callbacks.forEach(connection.subscribe);
  }

  @override
  void hide(ReloadableReason reason) {
    _callbacks.forEach(connection.unsubscribe);
  }

  @override
  Future reload(ReloadableReason reason) async {}
}
