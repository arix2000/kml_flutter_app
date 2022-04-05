import 'package:kml_flutter_app/features/changepassword/domain/change_pass_entity.dart';

class ChangePassModel extends ChangePassEntity {
  final int loginId;
  final String oldPass;
  final String newPass;

  ChangePassModel(this.oldPass, this.newPass, this.loginId)
      : super(oldPass, newPass, loginId);

  Map toJson() =>
      {'oldPassword': oldPass, 'newPassword': newPass, 'loginId': loginId.toString()};
}
