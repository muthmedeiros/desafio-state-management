import 'shared/models/todo_item.dart';

class HomeController {
  final _toDoItemList = <ToDoItem>[];
  final _doneItemList = <ToDoItem>[];
  var _selectedIndex = 0;
  final _listens = <Function(List<ToDoItem> state)>[];

  List<ToDoItem> get todoItemList => _toDoItemList;

  List<ToDoItem> get doneItemList => _doneItemList;

  int get selectedIndex => _selectedIndex;

  // ignore: avoid_setters_without_getters
  set setSelectedIndex(int value) {
    _selectedIndex = value;
    _update();
  }

  int get toDoItemListLenght => _toDoItemList.length;

  int get doneItemListLenght => _doneItemList.length;

  void onAddItem(String itemTitle) {
    _toDoItemList.add(ToDoItem(title: itemTitle));
    _update();
  }

  void onRemoveToDoItem(ToDoItem item) {
    _toDoItemList.remove(item);
    _update();
  }

  void onResetItem(ToDoItem item) {
    _doneItemList.remove(item);

    _toDoItemList.add(
      ToDoItem(
        title: item.title,
      ),
    );
    _update();
  }

  void onRemoveDoneItem(ToDoItem item) {
    _doneItemList.remove(item);
    _update();
  }

  void onCompleteItem(ToDoItem item) {
    _toDoItemList.remove(item);

    _doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
    _update();
  }

  void _update() {
    for (var i = 0; i < _listens.length; i++) {
      _listens[i](_toDoItemList);
    }
  }

  void listen(void Function(List<ToDoItem> state) onUpdate) {
    _listens.add(onUpdate);
  }
}
