import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'shared/models/todo_item.dart';

class BuilderWidget<T> extends StatefulWidget {
  final HomeController controller;
  final Widget Function(BuildContext context, List<ToDoItem> state) builder;

  const BuilderWidget({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  @override
  _BuilderWidgetState<T> createState() => _BuilderWidgetState<T>();
}

class _BuilderWidgetState<T> extends State<BuilderWidget<T>> {
  @override
  void initState() {
    widget.controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.controller.todoItemList);
  }
}
