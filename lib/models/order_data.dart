import 'dart:convert';

import 'package:flutter_pos_app/models/menu_item.dart';

class OrderData {
  final String kodeBeli;
  final DateTime tanggal;
  final String atasNama;
  final double totalHarga;
  final List<MenuItem> menus;

  OrderData({
    required this.kodeBeli,
    required this.tanggal,
    required this.atasNama,
    required this.totalHarga,
    required this.menus,
  });

  Map<String, dynamic> toMap() {
    return {
      'kodeBeli': kodeBeli,
      'tanggal': tanggal.toIso8601String(),
      'atasNama': atasNama,
      'totalHarga': totalHarga,
      'menus': menus.map((menu) => menu.toMap()).toList(),
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
