import 'package:bloc/base/base_bloc.dart';
import 'package:bloc/home/repo/home_screen_repo.dart';
import 'package:bloc/home/state/get_user_state.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc extends BaseBloc {
  final getUserDetailState = BehaviorSubject<GetUserDetailState>();
  final HomeScreenRepo _homeScreenRepo = HomeScreenRepo();

  void getUserList() {
    getUserDetailState.add(GetUserDetailState.loading());

    subscription.add(
      _homeScreenRepo
          .getUserList()
          .map((event) => GetUserDetailState.completed(event))
          .startWith(GetUserDetailState.loading())
          .listen(
        (state) {
          if (state.isCompleted()) {
            if (state.data != null) {
              getUserDetailState.add(GetUserDetailState.completed(state.data!));
            }
          }
          getUserDetailState.add(state);
        },
      ),
    );
  }

  @override
  void dispose() {
    getUserDetailState.close();
    super.dispose();
  }
}
