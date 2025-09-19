import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/home/data/models/books_model.dart';
import 'package:project/features/home/data/repos/books_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  Future<void> getBooks() async {
    emit(const HomeLoading());
    final Either<Failure, List<BooksModel>> result = await BooksRepo()
        .getBooks();
    result.fold(
      (failure) => emit(HomeError(error: failure.message)),
      (books) => emit(HomeSuccess(books: books)),
    );
  }
}
