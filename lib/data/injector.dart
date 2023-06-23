import 'package:flutter_clean_archi/domain/repository/memo_repository.dart';
import 'package:flutter_clean_archi/data/datasource/local/memo_isar.dart';
import 'package:flutter_clean_archi/data/datasource/local/memo_isar_impl.dart';
import 'package:flutter_clean_archi/data/repository/memo_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memosDatabaseProvider = Provider<MemoIsar>(
        (_) => MemoIsarImpl());

final memoRepositoryProvider = Provider<MemoRepository>(
        (ref) => MemoRepositoryImpl(
            ref.watch(memosDatabaseProvider)
        ));
