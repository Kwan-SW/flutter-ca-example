import 'package:flutter_clean_archi/domain/entity/memo.dart';

abstract class UpdateMemoUseCase {
  Future<void> execute({required Memo memo});
}