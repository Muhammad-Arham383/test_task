import 'package:flutter/material.dart';

class ProductContainerWidget extends StatelessWidget {
  final String imageSrc;
  final String productTitle;
  final String productPrice;
  final double productRating;
  const ProductContainerWidget(
      {super.key,
      required this.imageSrc,
      required this.productTitle,
      required this.productPrice,
      required this.productRating});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      height: height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            width: width * 0.6,
            height: height * 0.3,
            child: Image.network(
              imageSrc,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  productTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(
                width: width * 0.1,
              ),
              Expanded(
                child: Text(
                  "\$${productPrice}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              children: [
                Text(
                  'Rating: ${productRating.toString()}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
