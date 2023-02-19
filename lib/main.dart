import 'package:flutter/material.dart';
import 'package:flutter_time/data/repositories/character_repository.dart';
import 'package:flutter_time/internal/application.dart';
import 'package:flutter_time/common/my_colors.dart';
import 'package:flutter_time/internal/dependency_injection/locator.dart';

void main() async {
  inject();
  runApp(
    MyColors(
      child: Application(),
    ),
  );
}
