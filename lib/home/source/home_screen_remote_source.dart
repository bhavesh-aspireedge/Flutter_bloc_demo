import 'package:bloc/constants/api_constatnts.dart';
import 'package:bloc/home/model/get_user_details_res.dart';
import 'package:bloc/network/api_service.dart';

class HomeScreenRemoteSource {
  final ApiService _apiService = ApiService();

  Stream<GetUserDetailsResponse> getUserList() {
    return Stream.fromFuture(
            _apiService.get(APIConstants.user, queryParameters: {}))
        .map((event) => GetUserDetailsResponse.fromJson(event.data[0]));
  }
}
