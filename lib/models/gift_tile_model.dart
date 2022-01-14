import 'package:flutter/material.dart';

class GiftTileModel {
  String? imageNumber;
  Color? giftContainerColor;
  String? giftName;

  GiftTileModel({this.giftContainerColor, this.giftName, this.imageNumber});

  static List<GiftTileModel> redeemGifts = [
    GiftTileModel(
        giftContainerColor: Color(0xff8E97FD),
        giftName: 'Wireless Mouse',
        imageNumber: '1'),
    GiftTileModel(
        giftContainerColor: Color(0xffFA6E5A),
        giftName: 'Laptop Cooling Pad',
        imageNumber: '2'),
    GiftTileModel(
        giftContainerColor: Color(0xffF4A17C),
        giftName: 'Laptop Sleeve',
        imageNumber: '3'),
    GiftTileModel(
        giftContainerColor: Color(0xffFFCF86),
        giftName: 'Kaspersky Antivirus',
        imageNumber: '4'),
    GiftTileModel(
        giftContainerColor: Color(0xff6CB28E),
        giftName: 'Headphone',
        imageNumber: '5'),
    GiftTileModel(
        giftContainerColor: Color(0xff4E5567),
        giftName: 'Coffee Mug',
        imageNumber: '6'),
    GiftTileModel(
        giftContainerColor: Color(0xff808AFF),
        giftName: '32GB Pendrive',
        imageNumber: '7'),
    GiftTileModel(
        giftContainerColor: Color(0xffD9A5B5),
        giftName: 'Bluetooth Speaker',
        imageNumber: '8'),
  ];
}
