import '../../data/model/memo_model.dart';
import '../entity/memo.dart';

abstract class MemoItemFactory{
  List<Memo> itemFromList(List<MemoModel> memos);
}