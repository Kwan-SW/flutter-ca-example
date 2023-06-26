import 'package:flutter_clean_archi/data/model/memo_model.dart';
import 'package:isar/isar.dart';

abstract class MemoIsar {
  Future<List<MemoModel>> allMemos();
  Future<MemoModel> addMemo({required MemoModel memo});
  Future<bool> deleteMemo({required Id memoId});
}