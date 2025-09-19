part of 'category_book_cubit.dart';

abstract class CategoryBookState {
  const CategoryBookState();
}

class CategoryInit extends CategoryBookState {
  const CategoryInit();
}

class CategoryLoading extends CategoryBookState {
  const CategoryLoading();
}

class CategoryError extends CategoryBookState {
  final String error;
  const CategoryError({required this.error});
}

class CategorySuccess extends CategoryBookState {
  final List<CategoryBookModel> books;
  const CategorySuccess({required this.books});
}
