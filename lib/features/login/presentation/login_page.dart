import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kml_flutter_app/core/dependency_injection.dart';
import 'package:kml_flutter_app/core/extensions/context_ext.dart';
import 'package:kml_flutter_app/core/widgets/text_snack_bar.dart';
import 'package:kml_flutter_app/core/widgets/app_button.dart';
import 'package:kml_flutter_app/features/login/data/login_model.dart';
import 'package:kml_flutter_app/features/maincontainer/main_container.dart';
import 'bloc/login/login_bloc.dart';

final loginController = TextEditingController();
final passController = TextEditingController();

class LoginPage extends StatelessWidget {
  static final route = "LoginPageRoute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    return bloc.BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                      image: AssetImage("resources/kml_logo_horizontal.png"))),
              SizedBox(height: 15),
              LoginControls(),
              SizedBox(height: 15),
              bloc.BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is Empty) {
                  } else if (state is Loading) {
                    return CircularProgressIndicator();
                  } else if (state is Loaded) {
                    if (state.result.contains("true")) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        final loginIdString = state.result.characters
                            .characterAt(state.result.length - 2)
                            .string;

                        Navigator.pushNamed(context, MainContainer.route,
                            arguments: int.parse(loginIdString));
                      });
                    } else {
                      TextSnackBar(context)
                          .show(context.getString('wrong_password_or_login'));
                    }
                  } else if (state is Error) {
                    TextSnackBar(context)
                        .show(context.getString('no_internet_connection'));
                  } else if (state is CacheLoaded) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      loginController.text = state.loginModel.login;
                      passController.text = state.loginModel.password;
                    });
                  }
                  return SizedBox(height: 25);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginControls extends StatefulWidget {
  @override
  _LoginControlsState createState() => _LoginControlsState();
}

class _LoginControlsState extends State<LoginControls> {
  @override
  void initState() {
    super.initState();
    checkCacheData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: loginController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
              labelText: context.getString('e_mail'),
              prefixIcon: Icon(Icons.login_rounded)),
        ),
        SizedBox(height: 15),
        TextField(
          obscureText: true,
          controller: passController,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
              labelText: context.getString('password'),
              prefixIcon: Icon(Icons.password_rounded)),
        ),
        SizedBox(height: 15),
        AppButton(buttonText: context.getString('log_in'), onPressed: logIn),
      ],
    );
  }

  void logIn() {
    bloc.BlocProvider.of<LoginBloc>(context).add(SendLogDataEvent(
        LoginModel(loginController.text, passController.text)));
  }

  void checkCacheData() async {
    bloc.BlocProvider.of<LoginBloc>(context).add(GetLogDataEvent());
  }
}
