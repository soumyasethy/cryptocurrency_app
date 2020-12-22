import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/io_client.dart';

class ApiService {
  IOClient client;

  ApiService() {
    // Make sure to replace <YOUR_LOCAL_IP> with
    // the external IP of your computer if you're using Android.
    // Note that we're using port 8888 which is Charles' default.
    // Create a HttpClient instance.
    HttpClient httpClient = HttpClient();
    if (!kReleaseMode) {
      String proxy = Platform.isAndroid ? '10.0.2.2:8888' : 'localhost:8888';

      // Hook into the findProxy callback to set
      // the client's proxy.
      httpClient.findProxy = (uri) {
        return "PROXY $proxy;";
      };

      // This is a workaround to allow Charles to receive
      // SSL payloads when your app is running on Android.
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => Platform.isAndroid);

      // Pass your newly instantiated HttpClient to http.IOClient.

    }
    client = IOClient(httpClient);
  }

  Future getRequest(String url) async {
    // Await the http get response, then decode the json-formatted response.
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return null;
    }
  }
}
