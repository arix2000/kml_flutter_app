import 'package:flutter/material.dart';
import 'package:kml_flutter_app/features/work_history/data/work_model.dart';
import 'package:kml_flutter_app/core/extensions/context_ext.dart';
import 'package:kml_flutter_app/features/work_history/presentation/widgets/work_label_text.dart';

class WorkHistoryDetailsDialog extends StatelessWidget {
  final WorkModel work;

  const WorkHistoryDetailsDialog({Key key, this.work}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(10.0),
      contentPadding: EdgeInsets.all(15.0),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(35.0))),
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              WorkLabelText(context.getString('work_name')),
              SizedBox(height: 3),
              Text(
                work.workName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: context.primaryColor,
                ),
              ),
              SizedBox(height: 15),
              WorkLabelText(context.getString('work_description')),
              SizedBox(height: 3),
              Text(
                work.workDescription,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              WorkLabelText(context.getString('work_insert_date')),
              SizedBox(height: 3),
              Text(
                work.workDate,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              WorkLabelText(context.getString('work_execution_time')),
              SizedBox(height: 3),
              Text(
                work.executionTime,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ]),
      ),
    );
  }
}
