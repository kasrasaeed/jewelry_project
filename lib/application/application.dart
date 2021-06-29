import 'dart:async';

import '../domain/models/rings_model.dart';
import '../infstructure/data_source/rings_data_provider.dart';

class Application {
  static late List<RingsModel> ringModelsList;

  static Future<void> ringsFutureListToRingModelsList() async {
    List<dynamic> ringModelsJsonList =
        await RingsDataProvider.getRinsgFutureList();
    ringModelsList = ringModelsJsonList.map((ring) {
      return RingsModel.fromJson(ring);
    }).toList();
    print(ringModelsList);
  }
}
