import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models.dart';

Widget product(ProductModel product){
  return Container(
    padding: EdgeInsets.all(4),
    margin: EdgeInsets.all(3),
    height: 240,
    width: 190,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey,width: 1)

    ),
    child: Stack(
      children: [
        Positioned(child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(product.photo),
                  fit: BoxFit.cover
              )
          ),
        ),),
        Positioned(
            top: 150,
            child: Text(product.name,style: TextStyle(fontSize: 16),)),
        Positioned(
          top: 165,
          child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(product.amount,style: TextStyle(fontSize: 16),)),
        ),
        Positioned(
          top: 200,
          child: Icon(Icons.info_outline,size: 28,),),
        Positioned(
          top: 200,
          right: 10,
          child: Text("${product.price}\$",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),),
      ],
    ),
  );
}