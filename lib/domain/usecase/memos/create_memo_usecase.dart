

import '../../entity/memo.dart';

abstract class CreateMemoUseCase {
  Future<Memo> execute({
    required String title,
    required String content,
    });
}