import 'package:flutter_clean_archi/data/model/memo_model.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/create_memo_usecase.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/create_memo_usecase_impl.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/delete_memo_usecase.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/delete_memo_usecase_impl.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/get_memos_usecase.dart.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/get_memos_usecase_impl.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/update_memo_usecase.dart';
import 'package:flutter_clean_archi/domain/usecase/memos/update_memo_usecase_impl.dart';
import 'package:flutter_clean_archi/data/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createUseCaseProvider = Provider<CreateMemoUseCase>((ref)=>CreateMemoUseCaseImpl(ref.watch(memoRepositoryProvider)));
final getMemosUseCaseProvider = Provider<GetMemosUseCase>((ref)=>GetMemosUseCaseImpl(ref.watch(memoRepositoryProvider)));
final updateMemoUseCaseProvider = Provider<UpdateMemoUseCase>((ref)=>UpdateMemoUseCaseImpl(ref.watch(memoRepositoryProvider)));
final deleteMemoUseCaseProvider = Provider<DeleteMemoUseCase>((ref)=>DeleteMemoUseCaseImpl(ref.watch(memoRepositoryProvider)));