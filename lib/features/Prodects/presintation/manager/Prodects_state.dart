part of 'Prodects_bloc.dart';

abstract class ProdectsState extends Equatable {
  const ProdectsState();
}

class ProdectsInitial extends ProdectsState {
  @override
  List<Object> get props => [];
}

class ProdectsLoading extends ProdectsState {
  @override
  List<Object> get props => [];
}

class ProdectsILoaded extends ProdectsState {

  List<ProdectsMode> ProdectsModel;
  ProdectsILoaded({required this.ProdectsModel});

  @override
  List<Object> get props => [ProdectsModel];
}

class ProdectsError extends ProdectsState {
  String errorMessage;

  ProdectsError({required this.errorMessage});

  @override
  List<Object> get props => [];
}
