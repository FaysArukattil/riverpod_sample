import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/controller/count_controller.dart';

class Counterpage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var count = ref.watch(countprovider);
    return Scaffold(
      body: Center(child: Text("$count")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(countprovider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
