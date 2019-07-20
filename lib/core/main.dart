import 'package:flutter/material.dart';
import 'package:flutter_redux_seed/core/init.dart';
import 'package:flutter_redux_seed/core/config.dart';

void main() {
  BuildConfig.setEnvironment(Environment.PROD);
  runApp(Init());
}