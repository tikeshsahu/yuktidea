import 'package:yuktidea_assignment/config/dio_config.dart';
import 'package:yuktidea_assignment/utils/app_constants.dart';

class ApiRepository {
  ApiRepository._();

  static final instance = ApiRepository._();

  final _dio = DioConfig.instance.getInstance();

  Future<dynamic> getLoginCountries() async {
    try {
      final response = await _dio.get('${AppConstants.baseUri}/countries');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getTermsAndConditions() async {
    try {
      final response = await _dio.get('${AppConstants.baseUri}/terms-conditions');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCountries() async {
    try {
      final response = await _dio.get('${AppConstants.baseUri}/select/country');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> studentLogin(dynamic payload) async {
    try {
      final response = await _dio.post('${AppConstants.baseUri}/student/login', data: payload);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> counsellorLogin(dynamic payload) async {
    try {
      final response = await _dio.post('${AppConstants.baseUri}/counsellor/login', data: payload);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> verifyOtp(dynamic payload) async {
    try {
      final response = await _dio.post('${AppConstants.baseUri}/verify-otp', data: payload);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> resendOtp(dynamic payload) async {
    try {
      final response = await _dio.post('${AppConstants.baseUri}/resend-otp', data: payload);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateCountry(dynamic payload) async {
    try {
      final response = await _dio.post('${AppConstants.baseUri}/select/country', data: payload);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> logout() async {
    try {
      final response = await _dio.post('${AppConstants.baseUri}/logout');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteUser() async {
    try {
      final response = await _dio.post('${AppConstants.baseUri}/delete');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
