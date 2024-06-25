import 'package:hive/hive.dart';

class HiveOperations {
  static const String boxName = 'shopping';
  static Box<dynamic> getBox() {
  return Hive.box(boxName);
  }
  static List<dynamic> getData() {
  var box = getBox();
  return box.values.toList();
  }
  static Future<void> deleteItem(int index) async {
  var box = getBox();
  await box.deleteAt(index);
  }
}

