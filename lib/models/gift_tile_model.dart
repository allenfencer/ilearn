import 'package:flutter/material.dart';

class GiftTileModel {
  String? imageNumber;
  Color? giftContainerColor;
  String? giftName;
  int? price;

  GiftTileModel(
      {this.giftContainerColor, this.giftName, this.imageNumber, this.price});

  static List<GiftTileModel> redeemGifts = [
    GiftTileModel(
      giftContainerColor: Color(0xff23246C),
      giftName: 'Logitech Wireless Mouse',
      imageNumber: '1',
      price: 1500,
    ),
    GiftTileModel(
        giftContainerColor: Color(0xff55102D),
        giftName: 'Laptop Cooling Pad',
        price: 1000,
        imageNumber: '2'),
    GiftTileModel(
      giftContainerColor: Color(0xffF4A17C),
      giftName: ' Amazon Basics Laptop Sleeve',
      price: 800,
      imageNumber: '3',
    ),
    GiftTileModel(
        giftContainerColor: Color(0xffFFCF86),
        giftName: 'Kaspersky Antivirus',
        price: 1000,
        imageNumber: '4'),
    GiftTileModel(
        giftContainerColor: Color(0xff6CB28E),
        giftName: 'Headphone',
        price: 1000,
        imageNumber: '5'),
    GiftTileModel(
        giftContainerColor: Color(0xff4E5567),
        giftName: 'Coffee Mug',
        price: 1000,
        imageNumber: '6'),
    GiftTileModel(
        giftContainerColor: Color(0xff808AFF),
        giftName: '32GB Pendrive',
        price: 1000,
        imageNumber: '7'),
    GiftTileModel(
        giftContainerColor: Color(0xffD9A5B5),
        giftName: 'Bluetooth Speaker',
        price: 1000,
        imageNumber: '8'),
  ];
}
