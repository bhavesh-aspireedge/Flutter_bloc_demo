import 'package:bloc/base/base_mapper.dart';
import 'package:bloc/home/model/get_user_details_res.dart';
import 'package:bloc/home/model/user_details_ui_entity.dart';

class UserDataToUserEntityMapper
    extends BaseMapper<GetUserDetailsResponse, UserDetailsUIEntity> {
  @override
  UserDetailsUIEntity map(GetUserDetailsResponse t) {
    return UserDetailsUIEntity(
        name: t.name ?? '', id: t.id ?? 0, phone: t.phone ?? '');
  }
}
