import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';
import '../core/either.dart';
import '../core/failure.dart';
import '../core/local_source.dart';
import '../core/network_info.dart';

class ApiRepository {
  final Dio dio;
  final NetworkInfo networkInfo;
  final LocalSource localSource;

  ApiRepository(this.networkInfo, this.dio, this.localSource);

  //send otp
  Future<Either<Failure, void>> sendOtp({required String phoneNumber}) async {
    if (await networkInfo.isConnected) {
      try {
        await dio.post(
          '${AppConstants.baseUrl}/get-otp',
          data: {
            'phone': phoneNumber,
          },
        );
        return const Right(null);
      } catch (e) {
        if (e is DioException) {
          return Left(
            ServerFailure(
              message: '${e.message}',
              statusCode: e.response?.statusCode ?? 0,
            ),
          );
        }
        return const Left(ServerFailure(message: 'Something went wrong'));
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }

  //add product to basket
  Future<Either<Failure, void>> addProductToBasket(
      {required String productId, required int quantity}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    if(token==null){
      return const Left(NoTokenFailure());
    }

    if (await networkInfo.isConnected) {
      try {
        await dio.post('https://ulab-market-backend.onrender.com/api/basket',
            options: Options(
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              },
            ),
            data: {"product_id": productId, "quantity": quantity});
        return const Right(null);
      } catch (e) {
        if (e is DioException) {
          return Left(
            ServerFailure(
              message: '${e.message}',
              statusCode: e.response?.statusCode ?? 0,
            ),
          );
        }
        return const Left(ServerFailure(message: 'Something went wrong'));
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }
}
