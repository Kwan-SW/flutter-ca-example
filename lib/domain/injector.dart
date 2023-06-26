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

/// Create memo usecase provider.
final createUseCaseProvider = Provider<CreateMemoUseCase>((ref)=>CreateMemoUseCaseImpl(ref.watch(memoRepositoryProvider)));
/// Read memo usecase provider.
final getMemosUseCaseProvider = Provider<GetMemosUseCase>((ref)=>GetMemosUseCaseImpl(ref.watch(memoRepositoryProvider)));
/// Update memo usecase provider
final updateMemoUseCaseProvider = Provider<UpdateMemoUseCase>((ref)=>UpdateMemoUseCaseImpl(ref.watch(memoRepositoryProvider)));
/// Delete memo usecase provider
final deleteMemoUseCaseProvider = Provider<DeleteMemoUseCase>((ref)=>DeleteMemoUseCaseImpl(ref.watch(memoRepositoryProvider)));