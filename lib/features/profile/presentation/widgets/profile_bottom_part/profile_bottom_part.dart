import 'package:flutter/material.dart';
import 'package:kml_flutter_app/core/Constants.dart';
import 'package:kml_flutter_app/core/utils/time_formatter.dart';
import 'package:kml_flutter_app/features/profile/data/models/ProfileModel.dart';
import 'package:kml_flutter_app/features/profile/presentation/widgets/profile_bottom_part/icon_title_text_row.dart';
import 'package:kml_flutter_app/core/extensions/context_ext.dart';

class ProfileBottomPart extends StatelessWidget {
  final ProfileModel profile;
  final TimeFormatter formatter = TimeFormatter();

  ProfileBottomPart({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          IconTitleTextRow(
              icon: Icons.date_range_rounded,
              title: context.getString('join_year'),
              text: profile.joinYear),
          Divider(height: 0),
          SizedBox(height: 13),
          Text(context.getString('work_time') + Constants.COLON,
              style: TextStyle(fontSize: 20)),
          SizedBox(height: 13),
          IconTitleTextRow(
              icon: Icons.access_time,
              title: context.getString('work_time_season'),
              text: formatter.toReadable(profile.timeOfWorkSeason)),
          IconTitleTextRow(
              icon: Icons.timer,
              title: context.getString('work_time_month'),
              text: formatter.toReadable(profile.timeOfWorkMonth)),
          Divider(height: 0),
          SizedBox(height: 13),
          Text(context.getString('sections') + Constants.COLON,
              style: TextStyle(fontSize: 20)),
          SizedBox(height: 13),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
                profile.sections,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
