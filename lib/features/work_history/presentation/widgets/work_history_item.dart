import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kml_flutter_app/core/Globals.dart';
import 'package:kml_flutter_app/features/work_history/data/work_model.dart';

class WorkHistoryItem extends StatelessWidget {
  final WorkModel workData;
  final Function onClick;

  const WorkHistoryItem({Key key, this.workData, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(20)),
        height: 64,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(workData.workName,
                      maxLines: 1,
                      style: TextStyle(fontSize: 22),
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(width: 5),
                Text(
                  workData.workDate,
                  maxLines: 1,
                  style: TextStyle(fontSize: 22),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            Text(workData.executionTime)
          ],
        ),
      ),
    );
  }
}
