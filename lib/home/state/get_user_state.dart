import 'package:bloc/base/base_ui_state.dart';
import 'package:bloc/home/model/user_details_ui_entity.dart';

class GetUserDetailState extends BaseUiState<UserDetailsUIEntity> {
  GetUserDetailState.loading() : super.loading();

  GetUserDetailState.completed(UserDetailsUIEntity data)
      : super.completed(data: data);

  GetUserDetailState.error(dynamic error) : super.error(error);
}
