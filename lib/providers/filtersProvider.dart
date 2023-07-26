import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FiltersProvider with ChangeNotifier {
  final List<String> _brands = [];
  final List<String> _condtion = [];
  final List<String> _storage = [];
  final List<String> _ram = [];

  List<String> get brands {
    return [..._brands];
  }

  List<String> get condition {
    return [..._condtion];
  }

  List<String> get storage {
    return [..._storage];
  }

  List<String> get ram {
    return [..._ram];
  }

  void fetchAndSetFilters() async {
    Uri url = Uri.parse(
        'https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=true');
    try {
      final response = await http.get(url);
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      var filters = extractedData['filters'] as Map<String, dynamic>;
      for (int i = 0; i < filters['make'].length; i++) {
        _brands.add(filters['make'][i]);
      }
      for (int i = 0; i < filters['condition'].length; i++) {
        _condtion.add(filters['condition'][i]);
      }
      for (int i = 0; i < filters['storage'].length; i++) {
        _storage.add(filters['storage'][i]);
      }
      for (int i = 0; i < filters['ram'].length; i++) {
        _ram.add(filters['ram'][i]);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
