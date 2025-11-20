import 'package:flutter_riverpod/legacy.dart';

class CounterState extends StateNotifier<int> {
  late int count;
  CounterState() : super(0) {
    count = state;
  }

  void increment() {
    count++;
    state = count;
  }

  void decrement() {
    count--;
    state = count;
  }
}

final countprovider = StateNotifierProvider<CounterState, int>((ref) {
  return CounterState();
});
