import 'package:flutter/material.dart';
import 'package:livi/app.dart';
import 'service/repository.dart';

void main() {
  runApp(MyApp(
    liviRepository: LiviRepository(),
  ));
}
