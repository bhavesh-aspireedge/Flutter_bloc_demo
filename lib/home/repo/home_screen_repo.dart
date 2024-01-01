import 'package:bloc/home/mapper/user_data_to_user_entity_mapper.dart';
import 'package:bloc/home/model/user_details_ui_entity.dart';
import 'package:bloc/home/source/home_screen_remote_source.dart';

class HomeScreenRepo {
  final HomeScreenRemoteSource _homeScreenRemoteSource =
      HomeScreenRemoteSource();
  final UserDataToUserEntityMapper userDataToUserEntityMapper =
      UserDataToUserEntityMapper();

  Stream<UserDetailsUIEntity> getUserList() {
    return _homeScreenRemoteSource
        .getUserList()
        .map((event) => userDataToUserEntityMapper.map(event));
  }
}
