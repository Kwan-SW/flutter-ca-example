import 'package:flutter_clean_archi/data/model/memo_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'memo_isar.dart';

class MemoIsarImpl implements MemoIsar{
  Isar? _isar;
  Future<Isar> get isar async {
    _isar ??= await initDB();
    return _isar!;
  }

  Future<Isar> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open([MemoModelSchema], directory: dir.path);
  }

  @override
  Future<MemoModel> addMemo({required MemoModel memo}) async {
    final conn = await isar;
    await conn.writeTxn(() async {
      await conn.memoModels.put(memo);
    });
    return memo;
  }

  @override
  Future<List<MemoModel>> allMemos() async {
    final conn = await isar;
    List<MemoModel> memos = [];
    await conn.txn(()async{
      memos = await conn.memoModels.where().findAll();
    });
    return memos;
  }

  @override
  Future<bool> deleteMemo({required Id memoId}) async {
    final conn = await isar;
    bool delete=false;
    await conn.writeTxn(()async{
      delete = await conn.memoModels.delete(memoId);
    });
    return delete;
  }
}