import 'package:flutter/material.dart';

class TaskModel {
  String title;
  String? subTitle;
  bool isDone;
  DateTime creatAt;
  TaskModel({
    required this.title,
    this.subTitle,
    this.isDone = false,
    required this.creatAt
  });
}
