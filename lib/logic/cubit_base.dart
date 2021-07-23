import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:reloadable_bloc/reloadable_bloc.dart';

import '../services/connection_provider.dart';

typedef Callback = void Function(dynamic);

abstract class CubitBase<State> extends ReloadableCubit<State> {
  @protected
  final connection = GetIt.I<ConnectionProvider>();
  final _navigator = GetIt.I<GlobalKey<NavigatorState>>();
  @protected
  NavigatorState? get navigator => _navigator.currentState;

  @override
  RouteObserver routeObserver = GetIt.I<RouteObserver>();

  static final _hooks = <Type, Map<String, Callback>>{};
  Map<String, Callback> get _callbacks => _hooks[runtimeType] ??= {};

  CubitBase({
    required State initialState,
    required ModalRoute route,
  }) : super(route: route, initialState: initialState);

  void addCallbacks(Map<String, Callback> callbacks) {
    _callbacks.addAll(callbacks..forEach(_addCallback));
  }

  void _addCallback(String key, Callback value) {
    if (_callbacks.containsKey(key))
      connection.unsubscribe(key, _callbacks[key]!);
    connection.subscribe(key, value);
  }

  @override
  void show(ReloadableReason reason) {
    super.show(reason);
    _callbacks.forEach(_addCallback);
  }

  @override
  void hide(ReloadableReason reason) {
    _callbacks.forEach(connection.unsubscribe);
  }

  @override
  Future reload(ReloadableReason reason) async {}
}
