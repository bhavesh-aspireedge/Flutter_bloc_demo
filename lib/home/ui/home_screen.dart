import 'package:bloc/common_widgets/no_data_widget.dart';
import 'package:bloc/home/bloc/home_screen_bloc.dart';
import 'package:bloc/home/state/get_user_state.dart';
import 'package:bloc/home/widgets/user_data_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenBloc _homeScreenBloc;

  @override
  void initState() {
    super.initState();
    _homeScreenBloc = HomeScreenBloc();
    _homeScreenBloc.getUserList();
    _homeScreenBloc.getUserDetailState.listen((value) {
      /// Write some logic and update UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<GetUserDetailState>(
          stream: _homeScreenBloc.getUserDetailState,
          builder: (context, snapshot) {
            if (snapshot.data?.isLoading() ?? true) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data?.isCompleted() ?? false) {
              return UserDataWidget(
                name: snapshot.data?.data?.name ?? '',
                phone: snapshot.data?.data?.phone ?? '',
                id: snapshot.data?.data?.id ?? 0,
              );
            }

            return const NoDataWidget();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _homeScreenBloc.dispose();
    _homeScreenBloc.getUserDetailState.close();
    super.dispose();
  }
}
