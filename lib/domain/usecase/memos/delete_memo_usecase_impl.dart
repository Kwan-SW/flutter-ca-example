import 'package:flutter_clean_archi/domain/repository/memo_repository.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/delete_memo_usecase.dart';
import 'package:isar/isar.dart';

class DeleteMemoUseCaseImpl implements DeleteMemoUseCase{
  final MemoRepository _memoRepository;
  DeleteMemoUseCaseImpl(this._memoRepository);

  @override
  Future<bool> execute({required Id id}) {
    return _memoRepository.deleteMemo(memoId: id);
  }

}