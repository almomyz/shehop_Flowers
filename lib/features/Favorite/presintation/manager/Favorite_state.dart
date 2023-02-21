part of 'Favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteLoading extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteILoaded extends FavoriteState {

  List<FavoriteModel> favoriteModel;
  FavoriteILoaded({required this.favoriteModel});

  @override
  List<Object> get props => [FavoriteModel];
}

class FavoriteError extends FavoriteState {
  String errorMessage;

  FavoriteError({required this.errorMessage});

  @override
  List<Object> get props => [];
}
