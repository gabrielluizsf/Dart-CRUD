import 'package:usersignup/item.dart';
import 'package:path/path.dart';
import 'dart:io';

List<Item> items=items;

main(List<String> arguments) {
  print('[Main] Started..');
  var optionFilepath =
      join(dirname(Platform.script.toFilePath()), '..', 'lib', 'Options.txt');
  final file = new File(optionFilepath);
  String options = file.readAsStringSync();

  // Initialize item
  items = getItems();

  bool isExit = false;

  while (!isExit) {
    // 1. Display option
    print(options);

    // 2. Key in option
    String? selectedOption = stdin.readLineSync();

    switch (selectedOption) {
      case '1':
        create();
        break;
      case '2':
        update();
        break;
      case '3':
        read();
        break;
      case '4':
        delete();
        break;
      case '-1':
        isExit = true;
        break;
      default:
        print("Invalid option " + selectedOption.toString());
    }
  }

  print('[Main] End..');
}

List<Item> getItems() {
  List<Item> items = new List.empty();
  items.add(new Item.init(
      'ID1', 'Item 1', 'This is item 1', new DateTime.now(), 'SYSTEM'));
  items.add(new Item.init(
      'ID2', 'Item 2', 'This is item 2', new DateTime.now(), 'SYSTEM'));
  items.add(new Item.init(
      'ID3', 'Item 3', 'This is item 3', new DateTime.now(), 'SYSTEM'));
  return items;
}

void create() {
  print('[Main] Create Start');

  Item newItem = new Item();

  while (true) {
    stdout.write("ID : ");
    String? id = stdin.readLineSync();
    newItem.id = id.toString();

    if (!items.contains(newItem)) {
      break;
    }
    print('Item with ID $id already exist. Try again.');
  }

  stdout.write("Name : ");
  String? name = stdin.readLineSync();
  stdout.write("Description : ");
  String? description = stdin.readLineSync();

  newItem.name = name.toString();
  newItem.description = description.toString();

  print("Successfully create new item " + newItem.toString());
  newItem.createdDate = new DateTime.now();
  newItem.createdBy = 'CURRENT_USER';

  items.add(newItem);
  print('[Main] Create End');
}

void read() {
  print('[Main] Read Start');

  if (items != null) {
    for (Item item in items) {
      print(item);
    }
  }
  print('[Main] Read End');
}

void update() {
  print('[Main] Update Start');
  stdout.write("Enter Item ID to update : ");
  Item selectedItem = new Item();
  String? id = stdin.readLineSync();
  selectedItem.id = id.toString();

  if (!items.contains(selectedItem)) {
    print('Item with ID $id does not exist.');
  } else {
    selectedItem = items.singleWhere((item) => item.id == selectedItem.id);

    stdout.write("Name : ");
    String? name = stdin.readLineSync();
    stdout.write("Description : ");
    String? description = stdin.readLineSync();

    selectedItem.name = name.toString();
    selectedItem.description = description.toString();
    selectedItem.updatedBy = 'CURRENT_USER';
    selectedItem.updatedDate = DateTime.now();

    print('Successfully updated $id');
  }

  print('[Main] Update End');
}

void delete() {
  print('[Main] Delete Start');
  stdout.write("Enter Item ID to delete : ");
  Item selectedItem = new Item();
  String? id = stdin.readLineSync();
  selectedItem.id = id.toString();

  if (!items.contains(selectedItem)) {
    print('Item with ID $id does not exist.');
  } else {
    items.remove(selectedItem);
    print('Successfully deleted $id');
  }

  print('[Main] Delete End');
}