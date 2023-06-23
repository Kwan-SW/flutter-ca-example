import 'package:flutter_clean_archi/domain/entity/memo.dart';
import 'package:flutter_clean_archi/data/model/memo_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class MemoIsar {
  Future<List<MemoModel>> allMemos();
  Future<MemoModel> addMemo({required MemoModel memo});
  Future<bool> deleteMemo({required Id memoId});
}