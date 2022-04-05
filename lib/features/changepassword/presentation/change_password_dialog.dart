import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kml_flutter_app/core/Constants.dart';
import 'package:kml_flutter_app/core/dependency_injection.dart';
import 'package:kml_flutter_app/core/extensions/context_ext.dart';
import 'package:kml_flutter_app/core/widgets/app_button.dart';
import 'package:kml_flutter_app/features/changepassword/presentation/change_pass/change_pass_bloc.dart';

final oldPassController = TextEditingController();
final newPassController = TextEditingController();

class ChangePasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChangePassBloc>(),
      child: AlertDialog(
        insetPadding: EdgeInsets.all(10.0),
        contentPadding: EdgeInsets.all(15.0),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35.0))),
        title: Text(
          context.getString('change_password'),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: context.accentColor,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        content: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.getString('enter_old_pass'),
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 5.0),
              TextField(
                obscureText: true,
                controller: oldPassController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                context.getString('enter_new_pass'),
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 5.0),
              TextField(
                obscureText: true,
                controller: newPassController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                ),
              ),
              SizedBox(height: 20.0),
              ChangePassDialogBottomPart()
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePassDialogBottomPart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChangePassDialogBottomPartState();
}

class _ChangePassDialogBottomPartState
    extends State<ChangePassDialogBottomPart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            buttonText: context.getString('cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        BlocBuilder<ChangePassBloc, ChangePassState>(
          builder: (context, state) {
            if (state is Loading) {
              return Row(children: [
                SizedBox(width: 7),
                CircularProgressIndicator(),
                SizedBox(width: 7)
              ]);
            } else if (state is ValidationFailed) {//FIXME toasts are showed multiple times
              Fluttertoast.showToast(msg: context.getString('empty_pools'));
            } else if (state is PassChangeFailed) {
              Fluttertoast.showToast(msg: context.getString('wrong_old_password'));
            } else if (state is Loaded) {
              Fluttertoast.showToast(msg: context.getString('password_has_been_changed'));
              newPassController.text = Constants.EMPTY_STRING;
              oldPassController.text = Constants.EMPTY_STRING;
              Navigator.pop(context);
            }
            return SizedBox(width: 50.0);
          },
        ),
        Expanded(
          child: AppButton(
            buttonText: context.getString('change_password'),
            textColor: Colors.lightGreen,
            onPressed: _changePass,
          ),
        )
      ],
    );
  }

  void _changePass() {
    final oldPass = oldPassController.text;
    final newPass = newPassController.text;

    if (oldPass.isEmpty || newPass.isEmpty)
      BlocProvider.of<ChangePassBloc>(context).add(ValidationFailedEvent());
    else
      BlocProvider.of<ChangePassBloc>(context)
          .add(ChangePassClickedEvent(oldPass, newPass));
  }
}
