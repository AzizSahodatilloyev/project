import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:project/core/api/api.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/core/services/error_handler.dart';
import 'package:project/features/home/data/models/books_model.dart';

class BooksRepo {
  Future<Either<Failure, List<BooksModel>>> getBooks() async {
    try {
      final response = await http.get(
        Uri.parse(Api.books),
        headers: Api.getHeaders,
      );
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        return Right(data.map((e) => BooksModel.fromJson(e)).toList());
      } else {
        final data = jsonDecode(response.body);
        return Left(ServerFailue(message: parseDjangoError(data)));
      }
    } on SocketException catch (_) {
      return Left(
        ConnectionFailure(message: 'Failed to connect to the network'),
      );
    } catch (e) {
      return Left(UnexpectedFailure(message: "Please contact to devs: $e"));
    }
  }
}
