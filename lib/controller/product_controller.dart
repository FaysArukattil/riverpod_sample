import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_sample/controller/productstate.dart';
import 'package:riverpod_sample/services/apiservice.dart';

class ProductNotifier extends StateNotifier<Productstate> {
  ProductNotifier()
    : super(Productstate(errormsg: null, isloading: false, productlist: []));

  ApiService apiService = ApiService();

  Future<void> fetchproducts() async {
    state = state.copywith(isloading: true);

    try {
      var products = await apiService.fetchproducts();
      state = state.copywith(productlist: products, isloading: false);
    } catch (e) {
      state = state.copywith(errormsg: e.toString(), isloading: false);
    }
  }
}

final productcontroller = StateNotifierProvider<ProductNotifier, Productstate>((
  ref,
) {
  return ProductNotifier();
});
