part of 'Categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoading extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesILoaded extends CategoriesState {

  List<CategoriesMode> CategoriesModel;
  CategoriesILoaded({required this.CategoriesModel});

  @override
  List<Object> get props => [CategoriesModel];
}

class CategoriesError extends CategoriesState {
  String errorMessage;

  CategoriesError({required this.errorMessage});

  @override
  List<Object> get props => [];
}
