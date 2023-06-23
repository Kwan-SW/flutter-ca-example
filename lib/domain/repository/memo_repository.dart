import 'package:isar/isar.dart';
import '../entity/memo.dart';

abstract class MemoRepository {
  Future<List<Memo>> getAll();
  Future<Memo> addMemo({required String title, required String content});
  Future<void> updateMemo({required Memo memo});
  Future<bool> deleteMemo({required Id memoId});
}
