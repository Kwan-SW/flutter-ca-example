import 'package:flutter_clean_archi/domain/entity/memo.dart';
import 'package:flutter_clean_archi/domain/repository/memo_repository.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/update_memo_usecase.dart';

class UpdateMemoUseCaseImpl implements UpdateMemoUseCase{
  final MemoRepository _memoRepository;
  UpdateMemoUseCaseImpl(this._memoRepository);
  @override
  Future<void> execute({required Memo memo}) {
    return _memoRepository.updateMemo(memo: memo);
  }

}