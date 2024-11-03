import 'dart:convert';
import 'package:ecza_nobet/models/pharmacy_model/pharmacy_model.dart';
import 'package:http/http.dart' as http;

Future<Pharmacy> fetchPharmacies({required String city}) async {
  final String apiUrl =
      'https://api.collectapi.com/health/dutyPharmacy?il=$city';
  final response = await http.get(Uri.parse(apiUrl), headers: {
    'Content-Type': 'application/json',
    'Authorization': '',
  });

  if (response.statusCode == 200) {
    return Pharmacy.fromJson(json.decode(response.body));
  } else {
    throw Exception('Data could not be retrieved');
  }
}
