import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/model/report_model.dart';

class ReportProvider extends ChangeNotifier{
  List<ReportModel> _reportModel = [];

  List<ReportModel> get reportModelList{
    if(_reportModel.length>0)
      return _reportModel.toList();
    else
      return _reportModel;
  }

  getReports() async {
    try {
      final response = await http
          .get(Uri.parse('https://gorest.co.in/public/v1/users'));
      Future.delayed(Duration(seconds: 3));
      print('out');
      print(response.body);
      if (response.statusCode == 200) {
        _reportModel.clear();
        var returnData = jsonDecode(response.body);
        print('call');
        var temp=returnData['data'];
        print('temp');
        print(temp);
        _reportModel = (temp as List)
            .map((f) => ReportModel.fromJson(f))
            .toList();
        notifyListeners();
      }
    }catch (e) {}
  }


}