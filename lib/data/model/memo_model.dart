import 'package:flutter_clean_archi/domain/entity/memo.dart';
import 'package:isar/isar.dart';
part 'memo_model.g.dart';
@Collection()
class MemoModel extends Memo{
  MemoModel(super.id, super.title, super.content, super.createdDate);
  factory MemoModel.fromEntity(Memo memo){
    return MemoModel(
        memo.id,
        memo.title,
        memo.content,
        memo.createdDate
    );
  }
}