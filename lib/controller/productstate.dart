import 'package:riverpod_sample/models/respproducts.dart';

class Productstate {
  final bool isloading;
  final String? errormsg;
  final List<Products> productlist;

  Productstate({
    required this.isloading,
    this.errormsg,
    required this.productlist,
  });
  Productstate copywith({
    bool? isloading,
    String? errormsg,
    List<Products>? productlist,
  }) {
    return Productstate(
      isloading: isloading ?? this.isloading,
      errormsg: errormsg ?? this.errormsg,
      productlist: productlist ?? this.productlist,
    );
  }
}
