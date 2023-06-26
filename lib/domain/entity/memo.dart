import 'package:flutter_clean_archi/data/model/memo_model.dart';
import 'package:isar/isar.dart';

/// Memo entity.
class Memo{
  Id id;
  String title;
  String content;
  DateTime createdDate;
  Memo(this.id, this.title, this.content, this.createdDate);

  /// Generate new memo.
  factory Memo.newItem({String title = "Untitled", String content = ""}){
    return Memo(Isar.autoIncrement, title, content, DateTime.now());
  }
}