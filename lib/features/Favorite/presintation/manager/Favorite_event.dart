part of 'Favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class GetAllFavorite extends FavoriteEvent{
  @override
  List<Object> get props => [];
}
class GetLast10Favorite extends FavoriteEvent{
  @override
  List<Object> get props => [];
}