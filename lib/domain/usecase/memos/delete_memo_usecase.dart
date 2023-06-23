import 'package:isar/isar.dart';

abstract class DeleteMemoUseCase {
  Future<bool> execute({required Id id});
}