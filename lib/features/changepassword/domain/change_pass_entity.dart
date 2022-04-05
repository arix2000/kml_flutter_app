
import 'package:equatable/equatable.dart';

class ChangePassEntity extends Equatable {
  final int loginId;
  final String oldPass;
  final String newPass;

  ChangePassEntity(this.oldPass, this.newPass, this.loginId);

  @override
  List<Object> get props => [oldPass, newPass];
}