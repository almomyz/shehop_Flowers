part of 'Categories_bloc.dart';

abstract class Categories_event extends Equatable {
  const Categories_event();
}

class GetAllFavorite extends Categories_event{
  @override
  List<Object> get props => [];
}
class GetLast10Favorite extends Categories_event{
  @override
  List<Object> get props => [];
}