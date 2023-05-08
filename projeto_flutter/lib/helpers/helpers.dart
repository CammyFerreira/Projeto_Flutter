import 'package:flutter/material.dart';

class Helpers {
  static Widget getProductImage(String? productImage, double? height, double? width) {
    if (productImage != null && productImage != '') {
      return Image.network(
        productImage,
        height: height,
        width: width,
      );
    }
    return Image.asset('images/logo.png');
  }
}
