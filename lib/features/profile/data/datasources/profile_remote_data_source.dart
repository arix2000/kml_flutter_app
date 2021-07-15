
import 'package:kml_flutter_app/features/profile/data/models/ProfileModel.dart';

const PROFILE_ENDPOINT = "getDataAboutUser.php";

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> fetchProfile(int userId);
}