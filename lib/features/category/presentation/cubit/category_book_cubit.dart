import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/category/data/models/category_book_model.dart';
import 'package:project/features/category/data/repos/category_book_repo.dart';

part 'category_book_state.dart';

class CategoryBookCubit extends Cubit<CategoryBookState> {
  CategoryBookCubit() : super(const CategoryInit());

  Future<void> getBooks() async {
    emit(const CategoryLoading());
    final Either<Failure, List<CategoryBookModel>> result = await CategoryBookRepo()
        .getCategoryBooks();
    result.fold(
      (failure) => emit(CategoryError(error: failure.message)),
      (books) => emit(CategorySuccess(books: books)),
    );
  }
}
