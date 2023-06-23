import 'package:flutter/material.dart';
import 'package:flutter_clean_archi/presenter/viewmodel/memo_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../domain/entity/memo.dart';

/// State provider of Memo content (TextFormField).
final contentInputStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

/// State provider of Memo title (TextFormField).
final titleInputStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

/// Form GlobalKey.
final formKeyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

/// MemoModify page for edit memo.
class MemoModify extends ConsumerWidget {
  const MemoModify({super.key, required this.memo});
  final Memo memo;
  /// Build Widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Show Memo Title at Appbar.
          Text(
            memo.title.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      )),
      body: Form(
        key: ref.watch(formKeyProvider),
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Memo Title item.
                titleInput(ref),
                // Memo Content item.
                contentInput(),
              ],
            )),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Build data and send to update Method.
          Memo memoChanges = memo
            ..title = ref.read(titleInputStateProvider).text
            ..content = ref.read(contentInputStateProvider).text;
          ref.read(memoVMProvider.notifier).update(memoItem:memoChanges);

          // Back to Memo list.
          Navigator.pop(context);
        },
        backgroundColor: Colors.lightBlue[200],
        shape: const CircleBorder(),
        child: const Icon(Icons.drive_file_rename_outline_outlined),
      ),
    );
  }

  /// Title Input Widget for changing Memo title.
  Widget titleInput(WidgetRef ref) {
    final titleInputProvider = ref.watch(titleInputStateProvider);
    titleInputProvider.text = memo.title;
    return Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          controller: titleInputProvider,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              hintText: "メモタイトル...",
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black))),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }

  /// Content Input Widget for changing Memo content.
  Widget contentInput() {
    // Use Consumer Widget for access provider.
    return Consumer(builder: ((context, ref, _) {
      final contentInputProvider = ref.watch(contentInputStateProvider);
      contentInputProvider.text = memo.content;
      return Expanded(
          child: TextFormField(
        controller: contentInputProvider,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        expands: true,
        obscureText: false,
        decoration: const InputDecoration(
          hintText: "メモ内容...",
          filled: true,
          // Grey Color.
          fillColor: Color(0xFFFBFBFB),
        ),
      ));
    }));
  }
}
