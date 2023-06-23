import 'package:flutter_clean_archi/domain/repository/memo_repository.dart';
import "package:flutter_clean_archi/data/model/memo_model.dart";
import 'package:isar/isar.dart';
import '../../domain/entity/memo.dart';
import '../datasource/local/memo_isar.dart';

class MemoRepositoryImpl implements MemoRepository {
  final MemoIsar memoIsar;
  MemoRepositoryImpl(this.memoIsar);

  @override
  Future<Memo> addMemo({required String title, required String content}) async {
    // TODO: implement addMemo
    Memo memoItem = Memo.newItem(title: title,content: content);
    await memoIsar.addMemo(memo: MemoModel.fromEntity(memoItem));
    return memoItem;
  }

  @override
  Future<bool> deleteMemo({required Id memoId}) async {
    // TODO: implement deleteMemo
    return await memoIsar.deleteMemo(memoId: memoId);
  }

  @override
  Future<List<Memo>> getAll() async {
    // TODO: implement getAll
    final memos = await memoIsar.allMemos();
    return memos;
  }

  @override
  Future<void> updateMemo({required Memo memo}) async {
    await memoIsar.addMemo(memo: MemoModel.fromEntity(memo));
  }
}
