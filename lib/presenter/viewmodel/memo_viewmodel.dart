import 'package:flutter_clean_archi/domain/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_clean_archi/domain/entity/memo.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/create_memo_usecase.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/delete_memo_usecase.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/get_memos_usecase.dart.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/update_memo_usecase.dart';
import 'package:isar/isar.dart';

final memoVMProvider =
    StateNotifierProvider<MemoViewModel, List<Memo>>((ref) {
  return MemoViewModel(
      ref.watch(getMemosUseCaseProvider),
      ref.watch(deleteMemoUseCaseProvider),
      ref.watch(createUseCaseProvider),
      ref.watch(updateMemoUseCaseProvider));
});

class MemoViewModel extends StateNotifier<List<Memo>> {
  final CreateMemoUseCase _createProvider;
  final UpdateMemoUseCase _updateProvider;
  final DeleteMemoUseCase _deleteProvider;
  final GetMemosUseCase _getAllProvider;
  MemoViewModel(this._getAllProvider, this._deleteProvider,
      this._createProvider, this._updateProvider)
      : super([]) {
    getAll();
  }

  Future<void> add({required String title, required String content}) async {
    // TODO: implement add
    Memo memoItem =
        await _createProvider.execute(title: title, content: content);
    state = [...state, memoItem];
  }

  Future<void> delete({required Id id}) async {
    // TODO: implement delete
    await _deleteProvider.execute(id: id);
    state = [
      for (final temp in state)
        if (temp.id != id) temp
    ];
  }

  Future<void> getAll() async {
    // TODO: implement getAll
    state = await _getAllProvider.execute();
  }

  Future<void> update({required Memo memoItem}) async {
    // TODO: implement update
    await _updateProvider.execute(memo: memoItem);
    state = [
      for (final temp in state)
        if (temp.id != memoItem.id) temp else memoItem
    ];
  }
}
