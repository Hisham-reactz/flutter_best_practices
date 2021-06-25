import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'observer.dart';

void main() {
  Bloc.observer = GlobalObserver();
  runApp(const FlutterApp());
}
