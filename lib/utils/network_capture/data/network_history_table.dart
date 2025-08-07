import 'dart:convert';
import 'package:dio/dio.dart';

class NetworkHistoryTable {
  String? method;
  String? url;
  Map<String, dynamic>? requestHeaders;
  String? params;
  int? startTime;
  Map<String, dynamic>? responseHeaders;
  String? response;
  int? endTime;
  int? statusCode;
  String? reasonPhrase;
  int? contentLength;

  NetworkHistoryTable({
    this.method,
    this.url,
    this.params,
    this.requestHeaders,
    this.startTime,
    this.responseHeaders,
    this.response,
  });

  Map<String, String> transformHeaders(Headers? headers) {
    final Map<String, String> map = {};
    headers?.forEach((name, values) {
      map[name] = values.first;
    });
    return map;
  }

  Map<String, Object?> toMap() {
    return {
      'method': method ?? '',
      'url': url ?? '',
      'params': params ?? '',
      'requestHeaders': jsonEncode(requestHeaders),
      'startTime': startTime ?? 0,
      'responseHeaders': jsonEncode(responseHeaders),
      'response': response ?? '',
      'endTime': endTime ?? 0,
      'statusCode': statusCode ?? 0,
      'reasonPhrase': reasonPhrase ?? '',
      'contentLength': contentLength ?? 0,
    };
  }

  NetworkHistoryTable.fromMap(Map<String, Object?> map) {
    method = map['method'].toString();
    url = map['url'].toString();
    params = map['params'].toString();
    requestHeaders = jsonDecode(map['requestHeaders'].toString());
    startTime = int.parse(map['startTime']?.toString() ?? '0');
    responseHeaders = jsonDecode(map['responseHeaders'].toString());
    response = map['response'].toString();
    reasonPhrase = map['reasonPhrase'].toString();
    endTime = int.parse(map['endTime']?.toString() ?? '0');
    statusCode = int.parse(map['statusCode']?.toString() ?? '0');
    contentLength = int.parse(map['contentLength']?.toString() ?? '0');
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }

  int get cost => (endTime ?? 0) - (startTime ?? 0);

  String get origin => Uri.parse(url ?? '').origin;

  String get path => Uri.parse(url ?? '').path;

  String get pathParams {
    final uri = Uri.parse(url ?? '');
    final contact = uri.query.isEmpty ? '' : '?';
    return uri.path + contact + uri.query;
  }
}
