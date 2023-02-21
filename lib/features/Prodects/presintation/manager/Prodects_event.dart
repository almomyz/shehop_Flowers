part of 'Prodects_bloc.dart';

abstract class Prodects_event extends Equatable {
  const Prodects_event();
}

class GetAllFavorite extends Prodects_event{
  @override
  List<Object> get props => [];
}
class GetLast10Favorite extends Prodects_event{
  @override
  List<Object> get props => [];
}