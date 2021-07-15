import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kml_flutter_app/features/profile/data/models/ProfileModel.dart';
import 'package:kml_flutter_app/features/profile/presentation/profile/profile_bloc.dart';

class ProfileTopPart extends StatefulWidget {
  final state = ProfileTopPartState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }

  void setNameAndType(ProfileModel profile) {
    state.setNameAndType(profile);
  }
}

class ProfileTopPartState extends State<ProfileTopPart> {
  String nameHolder = "...";
  String typeHolder = "...";

  void setNameAndType(ProfileModel profile) {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      setState(() {
        nameHolder = profile.firstName + " " + profile.lastName;
        typeHolder = profile.type;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      padding: EdgeInsets.all(12),
      height: 155,
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("resources/super_squirrel.jpg"),
                  height: 85,
                  width: 85,
                ),
              ),
              SizedBox(height: 10),
              Text('$nameHolder'),
            ],
          ),
          Expanded(
            child: Text(
              '$typeHolder',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 26,
              ),
            ),
          )
        ],
      ),
    );
  }

  void getData() {
    BlocProvider.of<ProfileBloc>(context).add(FetchProfileEvent(getUserId()));
  }

  int getUserId() {
    return 9;
  }
}
