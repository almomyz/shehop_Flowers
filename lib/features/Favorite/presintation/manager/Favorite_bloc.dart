import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:shehop_flowers/dataProviders/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:shehop_flowers/features/Favorite/data/model/FavoriteMode.dart';
import 'package:shehop_flowers/features/Favorite/data/repository/FavoriteRepository.dart';



part 'Favorite_event.dart';
part 'Favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {

  final FavoriteRepository repository;
  FavoriteBloc({required this.repository})
      : assert(repository != null),
        super(FavoriteInitial());
  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event)async* {

    if(event is GetAllFavorite){
      yield FavoriteLoading();
      final failureOrData = await repository.getAllFavorite();
      yield* failureOrData.fold(
            (failure) async* {
          log('yield is error');
          yield FavoriteError(errorMessage: mapFailureToMessage(failure));
        },
            (data) async* {
          log('yield is loaded');
          yield FavoriteILoaded(favoriteModel: data,);
        },
      );
    }



  }

}
