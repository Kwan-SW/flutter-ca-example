import 'package:flutter_clean_archi/domain/entity/memo.dart';

abstract class GetMemosUseCase{
  Future<List<Memo>> execute();
}