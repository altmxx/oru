import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  final List<Product> _mobiles = [];

  List<Product> get mobiles {
    return [..._mobiles];
  }

  String convertToYYYYMMDD(String date) {
    List<String> dateParts = date.split('/');
    String day = dateParts[0].padLeft(2, '0');
    String month = dateParts[1].padLeft(2, '0');
    String year = dateParts[2];
    return year + month + day;
  }

  Future<void> fetchAndSetProducts() async {
    Uri url = Uri.parse(
        'https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=1&limit=10');
    try {
      final response = await http.get(url);
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      for (int i = 0; i < extractedData['listings'].length; i++) {
        NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

        extractedData['listings'][i]['listingDate'] =
            convertToYYYYMMDD(extractedData['listings'][i]['listingDate']);

        DateTime listingDate =
            DateTime.parse(extractedData['listings'][i]['listingDate']);

        String formattedDate = DateFormat.MMMMd().format(listingDate);

        extractedData['listings'][i]['listingNumPrice'] =
            myFormat.format(extractedData['listings'][i]['listingNumPrice']);

        extractedData['listings'][i]['listingDate'] = formattedDate;

        _mobiles.add(Product.fromJson(extractedData['listings'][i]));
      }
      // log(1.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
