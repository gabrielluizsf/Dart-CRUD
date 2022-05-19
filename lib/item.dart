import 'package:usersignup/main.dart';
class Item {
  String? id;
  String? name;
  String? description;
  DateTime? createdDate;
  DateTime? updatedDate;
  String? createdBy;
  String? updatedBy;

  Item();
  Item.init(this.id, this.name, this.description, this.createdDate, this.createdBy);

  @override
  bool operator ==(Object other) { 
    if(identical(this, other)) {
      return true;
    } else if (other is Item) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Item(' +
      'id=$id, ' +
      'name=$name, ' +
      'description=$description, ' +
      'createdDate=$createdDate, ' +
      'updatedDate=$updatedDate, ' +
      'createdBy=$createdBy, ' +
      'updatedBy=$updatedBy)';
  }

}