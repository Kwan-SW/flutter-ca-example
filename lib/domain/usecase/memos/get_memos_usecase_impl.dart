import 'package:flutter_clean_archi/domain/entity/memo.dart';
import 'package:flutter_clean_archi/domain/repository/memo_repository.dart';
import 'get_memos_usecase.dart.dart';

class GetMemosUseCaseImpl implements GetMemosUseCase{
  final MemoRepository _memoRepository;
  GetMemosUseCaseImpl(this._memoRepository);
  @override
  Future<List<Memo>> execute() async {
    return await _memoRepository.getAll();
  }
}