import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/controller/product_controller.dart';

class Productspage extends ConsumerStatefulWidget {
  const Productspage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductspageState();
}

class _ProductspageState extends ConsumerState<Productspage> {
  @override
  void initState() {
    Future.microtask(() {
      ref.watch(productcontroller.notifier).fetchproducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(productcontroller);
    return Scaffold(
      body: state.isloading
          ? Center(child: CircularProgressIndicator())
          : state.errormsg != null
          ? Text("${state.errormsg}")
          : ListView.builder(
              shrinkWrap: true,
              itemCount: state.productlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${state.productlist[index].title}"),
                );
              },
            ),
    );
  }
}
