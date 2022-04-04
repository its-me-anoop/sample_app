import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

import '../models/api_data_model.dart';
import '../models/data_model.dart';

ApiData apiDataFromJson(String str) => ApiData.fromJson(json.decode(str));

String apiDataToJson(ApiData data) => json.encode(data.toJson());

class ApiService {
  int page = 0; //Initial page number
  bool hasMore = false;
  List<Datum> finalDataList = [];
  //Fetch data from the API and save it in a List []
  Future<List<Datum>> finalList() async {
    //Do while loop to get the data until hasMore == false
    do {
      var response = await retry(
        () async {
          var request = await http
              .get(Uri.parse(
                  "https://us-central1-mynextbase-connect.cloudfunctions.net/sampleData?page=" +
                      page.toString()))
              .timeout(const Duration(seconds: 1));

          //If Status code == 500, throw an exception
          //Retry until there are no exceptions
          if (request.statusCode == 500) {
            throw TimeoutException("This is a timeout exception");
          }
          return request;
        },
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      //Update the list when data fetch from the API is successful
      if (response.statusCode == 200) {
        ApiData result = apiDataFromJson(response.body);
        for (var element in result.data) {
          finalDataList.add(element);
        }

        hasMore = result.hasMore;
        page++;
      }
    } while (hasMore == true);
    return finalDataList;
  }
}
