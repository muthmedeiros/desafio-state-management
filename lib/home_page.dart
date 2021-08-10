import 'package:flutter/material.dart';

import 'builder_widget.dart';
import 'home_controller.dart';
import 'screens/done_screen.dart';
import 'screens/task_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final _pageViewController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BuilderWidget(
      controller: controller,
      builder: (context, state) => Scaffold(
        body: PageView(
          controller: _pageViewController,
          children: <Widget>[
            TaskScreen(
              itemList: controller.todoItemList,
              onAddItem: controller.onAddItem,
              onCompleteItem: controller.onCompleteItem,
              onRemoveItem: controller.onRemoveToDoItem,
            ),
            DoneScreen(
              itemList: controller.doneItemList,
              onRemoveItem: controller.onRemoveDoneItem,
              onResetItem: controller.onResetItem,
            ),
          ],
          onPageChanged: (index) {
            controller.setSelectedIndex = index;
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (index) {
            controller.setSelectedIndex = index;

            _pageViewController.animateToPage(
              controller.selectedIndex,
              duration: Duration(milliseconds: 350),
              curve: Curves.easeOut,
            );
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outline_blank),
              label: 'Pendentes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: 'Concluídas',
            ),
          ],
        ),
      ),
    );
  }
}
