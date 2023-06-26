import 'package:flutter_clean_archi/domain/repository/memo_repository.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/create_memo_usecase.dart';
import '../../entity/memo.dart';

/// UseCase of create memo.
class CreateMemoUseCaseImpl implements CreateMemoUseCase{
  final MemoRepository _memoRepository;
  CreateMemoUseCaseImpl(this._memoRepository);
  @override
  Future<Memo> execute({required String title, required String content}){
    // TODO: implement execute
    return _memoRepository.addMemo(title: title, content: content);
  }

}