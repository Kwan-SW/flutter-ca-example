import 'package:flutter_clean_archi/domain/injector.dart';
import 'package:flutter_clean_archi/domain/entity/memo.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/create_memo_usecase.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/delete_memo_usecase.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/get_memos_usecase.dart.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/update_memo_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

/// memo viewmodel provider.
final memoVMProvider =
    StateNotifierProvider<MemoViewModel, List<Memo>>((ref) {
  return MemoViewModel(
      ref.watch(getMemosUseCaseProvider),
      ref.watch(deleteMemoUseCaseProvider),
      ref.watch(createUseCaseProvider),
      ref.watch(updateMemoUseCaseProvider));
});

/// Memo viewmodel.
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

  /// Add memo.
  Future<void> add({required String title, required String content}) async {
    // TODO: implement add
    Memo memoItem =
        await _createProvider.execute(title: title, content: content);
    state = [...state, memoItem];
  }

  /// Delete memo.
  Future<void> delete({required Id id}) async {
    await _deleteProvider.execute(id: id);
    state = [
      for (final temp in state)
        if (temp.id != id) temp
    ];
  }

  /// Read memos.
  Future<void> getAll() async {
    state = await _getAllProvider.execute();
  }

  /// Update memo.
  Future<void> update({required Memo memoItem}) async {
    await _updateProvider.execute(memo: memoItem);
    state = [
      for (final temp in state)
        if (temp.id != memoItem.id) temp else memoItem
    ];
  }
}
