import 'package:flutter_clean_archi/domain/repository/memo_repository.dart';
import "package:flutter_clean_archi/data/model/memo_model.dart";
import 'package:isar/isar.dart';
import '../../domain/entity/memo.dart';
import '../datasource/local/memo_isar.dart';

/// Implementation of memo repository.
class MemoRepositoryImpl implements MemoRepository {
  final MemoIsar memoIsar;
  MemoRepositoryImpl(this.memoIsar);

  @override
  /// Create memo.
  Future<Memo> addMemo({required String title, required String content}) async {
    // TODO: implement addMemo
    Memo memoItem = Memo.newItem(title: title,content: content);
    await memoIsar.addMemo(memo: MemoModel.fromEntity(memoItem));
    return memoItem;
  }

  @override
  /// Delete memo.
  Future<bool> deleteMemo({required Id memoId}) async {
    // TODO: implement deleteMemo
    return await memoIsar.deleteMemo(memoId: memoId);
  }

  @override
  /// Read memos.
  Future<List<Memo>> getAll() async {
    // TODO: implement getAll
    final memos = await memoIsar.allMemos();
    return memos;
  }

  @override
  /// Update memo.
  Future<void> updateMemo({required Memo memo}) async {
    await memoIsar.addMemo(memo: MemoModel.fromEntity(memo));
  }
}
