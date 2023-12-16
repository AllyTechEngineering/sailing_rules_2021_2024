import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sailing_rules/models/signals_data_model.dart';

class SignalsRepository {
  Future<List<SignalsDataModel>> getSignalsData(String jsonFileName, String signalsName) async {
    try {
      debugPrint('in repo and this is the json file name: $jsonFileName');
      final String signalsDataResults = await rootBundle.loadString(jsonFileName);
      // debugPrint('in repo and this is the json raw file data: $signalsDataResults');
      final signalsDataResultsJson = await jsonDecode(signalsDataResults);
      // debugPrint('in repo and this is the json decoded file data: $signalsDataResultsJson');
      final signalsDataResultsList = List<SignalsDataModel>.of(
        signalsDataResultsJson[signalsName].map<SignalsDataModel>(
          (json) {
            return SignalsDataModel(
              title: json['Title'],
              image: json['Image'],
              description: json['Description'],
            );
          },
        ),
      );
      return signalsDataResultsList;
    } catch (e) {
      debugPrint('This is the error e: $e');
      rethrow;
    }
  }
}
