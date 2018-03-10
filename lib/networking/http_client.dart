import 'dart:io';
import 'dart:async';
import 'package:http/http.dart';

import './Config.dart';

class HttpClient {
  HttpClient({
    Client client,
    this.baseUrl = 'https://api.themoviedb.org/3',
  }) : this.client = client ?? new Client();

  final String baseUrl;
  final Client client;

  Future get(String path, [Map<String, String> params]) {
    String url = "${this.baseUrl}$path";
    String parametrizedUrl = _addParamsToUrl(url, params);

    return this.client.get(parametrizedUrl, headers: this._defaultHeaders());
  }

  String _addParamsToUrl(String url, [Map<String, String> params]) {
    var result = this._addAuthParamsToUrl(url);
    
    if (params != null) {
      for(var i = 0; i < params.length; i++) {
        final key = params.keys.elementAt(i);
        final value = params.values.elementAt(i);
        result = result + "$key=$value";

        if (i != params.length - 1) {
          result = result + "&";
        }
      }
    }

    return result;
  }

  String _addAuthParamsToUrl(String url) {
    final apiKey = Config.movieDbApiKey;

    return url + "?api_key=$apiKey";
  }

  Map<String, String> _defaultHeaders() {
    return {
      HttpHeaders.ACCEPT: 'application/json',
    };
  }
}

final httpClient = new HttpClient();
