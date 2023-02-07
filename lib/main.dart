import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:stream/app/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:stream/app/data/repositories_implementation/connectivity_repository_impl.dart';
import 'package:stream/app/domain/repositories/authentication_repository.dart';
import 'package:stream/app/domain/repositories/connectivity_repository.dart';
import 'package:stream/app/my_app.dart';

void main() {
  runApp(Injector(
      connectivityRepository: ConnectivityRepositoryImpl(Connectivity()),
      authenticationRepository: AuthenticationRepositoryImpl(),
      child: const MyApp()));
}

class Injector extends InheritedWidget {
  const Injector(
      {super.key,
      required super.child,
      required this.connectivityRepository,
      required this.authenticationRepository});

  final ConnectivityRepository connectivityRepository;
  final AuthenticationRepository authenticationRepository;

  @override
  bool updateShouldNotify(_) => false;

  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, "Injector could not be found");
    return injector!;
  }
}
