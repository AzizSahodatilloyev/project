part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeError extends HomeState {
  final String error;
  const HomeError({required this.error});
}

class HomeSuccess extends HomeState {
  final List<BooksModel> books;
  const HomeSuccess({required this.books});
}
