import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';

class ProductPageMobile extends StatelessWidget {
  const ProductPageMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return Container(
      padding: EdgeInsets.only(
          top: padding.top, left: padding.left + 10, right: padding.right + 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/product_background.jpg'),
        ),
      ),
      child: Center(
        child: Column(children: [
          Text(
            'PRODUCTS',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: kBlueColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          //ProductPageMobile()
          ProductCardMobile()
        ]),
      ),
    );
  }
}

class ProductCardMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 50,
      height: size.height / 3,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        border: Border.all(
          color: kWhiteColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/product_background.jpg'),
        ),
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: () {},
              color: kWhiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              child: Text(
                'RTU Notes App',
                style: TextStyle(
                  color: kBlueColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              elevation: 4,
              color: kBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                'Follow Link',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
    );
  }
}
