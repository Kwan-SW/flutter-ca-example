import 'package:flutter/material.dart';
import 'package:flutter_clean_archi/domain/entity/memo.dart';
import 'package:flutter_clean_archi/presenter/view/memo_modify.dart';
import 'package:flutter_clean_archi/presenter/viewmodel/memo_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

part '../component/memo_listview_builder.dart';

/// MemoList page for show all memo.
class MemoList extends ConsumerWidget {
  /// Page title.
  final String title;
  const MemoList({super.key, required this.title});
  /// Build method.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Memo> memos = ref.watch(memoVMProvider);
    return Scaffold(
        appBar: AppBar(
            title: Text(
          title,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        )),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          // When memos list isEmpty it's call emptyBuild instead of list of memo.
          child: (memos.isEmpty) ? emptyBuild() : memoListBuild(memos: memos),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to memoModify with new memo.
            ref.read(memoVMProvider.notifier).add(title: "Untitled", content: "content");
          },
          backgroundColor: Colors.lightBlue[200],
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ));
  }

  /// Show this when data is empty.
  Widget emptyBuild() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No information is available.",
              textAlign: TextAlign.center,
            )
          ],
        )
      ],
    );
  }
}
