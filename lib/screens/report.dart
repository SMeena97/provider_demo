import 'package:flutter/material.dart';
import 'package:my_app/model/report_model.dart';
import 'package:my_app/providers/report_provider.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget {
  const Report({Key key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    ReportProvider reportProvider =
    Provider.of<ReportProvider>(context);

    return Scaffold(
        body:Container(
            width:MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(vertical: 15),
              child: FutureBuilder(
                  future:(reportProvider.reportModelList.length==0)?reportProvider.getReports():null,
                  // async work
                  builder: (_, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child:CircularProgressIndicator()
                      );}
                       if (reportProvider.reportModelList.length > 0) {
                         return ListView.builder(
                           itemCount: reportProvider.reportModelList.length,
                           itemBuilder: (context,index){
                             ReportModel dModel = reportProvider.reportModelList[index];

                             return Container(child: Text(dModel.name??'meena'));
                           }
                         );
                    }else {
                         return Container(child:Text('no data'));
                       }}

            )
        ));
  }
}
