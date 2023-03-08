import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:task/Core/classes/statusRequest.dart';
import '../functions/checkInternetConnection.dart';


class Crud {
  //a class has the post and delete funcation that i use in the all app
  Future<Either<StatusRequest, Map>> postData(
      String linkUrl, Map data,Map<String,String>myheaders ) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(linkUrl), body: data,
             headers: myheaders
             );
        print('=======================================');
        print(response.statusCode);
        print('=======================================');
        print(jsonDecode(response.body));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print('=======================================');
          print(responseBody);
          print('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFaliure);
        }
      } else {
        return const Left(StatusRequest.offlineFaliure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
      
    }
  }
  Future<Either<StatusRequest, Map>> deleteData(
      String linkUrl,Map<String,String>myheaders ) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.delete(Uri.parse(linkUrl), 
             headers: myheaders
             );
        print('=======================================');
        print(response.statusCode);
        print('=======================================');
        print(jsonDecode(response.body));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print('=======================================');
          print(responseBody);
          print('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFaliure);
        }
      } else {
        return const Left(StatusRequest.offlineFaliure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
      
    }
  }
}
