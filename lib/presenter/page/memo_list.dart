import 'package:flutter/material.dart';
import 'package:flutter_clean_archi/presenter/page/memo_modify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_clean_archi/domain/entity/memo.dart';
import 'package:intl/intl.dart';
import '../viewmodel/memo_viewmodel.dart';

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
            //memoModifyNavigate(context, MemoItem.newItem());
            ref.read(memoVMProvider.notifier).add(title: "Untitled", content: "content");
          //  Navigator.push(context, MaterialPageRoute(builder: (context)=> const RickApi()));
          },
          backgroundColor: Colors.lightBlue[200],
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ));
  }

  /// Build all data list! for show in memoList page.
  Widget memoListBuild({required List<Memo> memos}) {
    return Consumer(builder: (context, ref, _) {
      //List<Memo> memos = ref.watch(memosProvider).memos;
      return ListView.builder(
          itemCount: memos.length,
          itemBuilder: (context, index) {
            // Use Dismissible widget for swipe to delete
            return Container(
                margin: const EdgeInsets.all(10),
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  // Do delete data when confirmDismiss return true.
                  onDismissed: (direction) => ref.read(memoVMProvider.notifier).delete(id: memos[index].id),
                  confirmDismiss: (direction) async {
                    return await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        // Show Dialog when swipe card
                        return AlertDialog(
                          title: const Text('このメモを削除しますか?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Yes'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  // Decoration of Dismissible
                  background: const ColoredBox(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  ),
                  // Card of Memo data
                  child: listCard(memos: memos, index: index),
                ));
          });
    });
  }

  /// List Item that show memo title and created date.
  Widget listCard({required List<Memo> memos, required int index}) {
    // Use consumer widget for access provider.
    return Consumer(builder: (context, ref, _) {
      // Memo Item.
      return Card(
        color: const Color(0xFFF5F5F5),
        elevation: 0,
        child: ListTile(
          title: Text(
            // Memo title.
            memos[index].title.toString(),
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            // Memo Created date by using intl package.
            DateFormat('yyyy/MM/dd').format(memos[index].createdDate),
            style: const TextStyle(fontSize: 15),
          ),
          onTap: () {
            // Navigate to memoModify page with memo data.
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> MemoModify(memo: memos[index]))
            );
          //  memoModifyNavigate(context, memos[index]);
          },
        ),
      );
    });
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
