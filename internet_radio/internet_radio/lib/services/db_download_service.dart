import 'package:internet_radio/models/radio.dart';
import 'package:internet_radio/utils/db_service.dart';
import 'package:internet_radio/utils/web_service.dart';

import '../config.dart';

class DBDownloadService {
  static Future<bool> isLocalDBAvailable() async {
    await DB.init();
    List<Map<String, dynamic>> _results = await DB.query(RadioModel.table);
    return _results.length == 0 ? false : true;
  }

  static Future<RadioAPIModel> fetchAllRadios() async {
    final serviceResponse =
        await WebService().getData(Config.api_URL, new RadioAPIModel());
    return serviceResponse;
  }

  static Future<List<RadioModel>> fetchLocalDB() async {
    if (!await isLocalDBAvailable()) {
      // HTTP Call to fetch JSON Data
      RadioAPIModel radioAPIModel = await fetchAllRadios();

      //Check for data length
      if (radioAPIModel.data.length > 0) {
        //Init DB
        await DB.init();

        //ForEach api Data and Save in Local DB
        radioAPIModel.data.forEach((RadioModel radioModel) {
          DB.insert(RadioModel.table, radioModel);
        });
      }
    }

    List<Map<String, dynamic>> _results = await DB.query(RadioModel.table);

    List<RadioModel> radioModel = new List<RadioModel>();
    radioModel = _results.map((item) => RadioModel.fromMap(item)).toList();

    return radioModel;
  }
}
