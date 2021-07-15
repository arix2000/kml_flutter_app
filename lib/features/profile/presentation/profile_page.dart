import 'package:flutter/material.dart';
import 'package:kml_flutter_app/core/dependency_injection.dart';
import 'package:kml_flutter_app/core/extensions/context_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:kml_flutter_app/features/maincontainer/main_container.dart';
import 'package:kml_flutter_app/features/profile/presentation/profile/profile_bloc.dart';
import 'package:kml_flutter_app/features/profile/presentation/widgets/profile_bottom_part/profile_bottom_part.dart';
import 'package:kml_flutter_app/features/profile/presentation/widgets/profile_top_part.dart';

class ProfilePage extends StatelessWidget {
  static final route = "ProfilePageRoute";
  final profileTopPart = ProfileTopPart();

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  bloc.BlocProvider<ProfileBloc> buildBody(BuildContext context) {
    return bloc.BlocProvider(
      create: (context) => sl<ProfileBloc>(),
      child: Scaffold(
        body: Center(
        child: Column(
          children: [
            profileTopPart,
            bloc.BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
              if (state is Loaded) {
                profileTopPart.setNameAndType(state.result);
                return ProfileBottomPart(profile: state.result);
              } else if (state is InitialProfileState) {
                _getData(context, MainContainer.loginId);
                return CircularProgressIndicator();
              } else if (state is Loading)
                return CircularProgressIndicator();
              else if (state is Error)
                return Text(context.getString('somethings_wrong'));
              else
                return Text(context.getString('somethings_wrong'));
            }),
          ],
        ),
      ),
      ),
    );
  }

  void _getData(BuildContext context, int userId) {
    bloc.BlocProvider.of<ProfileBloc>(context).add(FetchProfileEvent(userId));
  }
}
