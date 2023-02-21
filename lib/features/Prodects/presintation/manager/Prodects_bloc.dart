import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:shehop_flowers/dataProviders/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:shehop_flowers/features/Prodects/data/model/ProdectsMode.dart';
import 'package:shehop_flowers/features/Prodects/data/repository/ProdectsRepository.dart';



part 'Prodects_event.dart';
part 'Prodects_state.dart';

class Prodects_bloc extends Bloc<Prodects_event, ProdectsState> {

  final ProdectsRepository repository;
  Prodects_bloc({required this.repository})
      : assert(repository != null),
        super(ProdectsInitial());
  @override
  Stream<ProdectsState> mapEventToState(Prodects_event event)async* {

    if(event is GetAllFavorite){
      yield ProdectsLoading();
      final failureOrData = await repository.getAllFavorite();
      yield* failureOrData.fold(
            (failure) async* {
          log('yield is error');
          yield ProdectsError(errorMessage: mapFailureToMessage(failure));
        },
            (data) async* {
          log('yield is loaded');
          yield ProdectsILoaded(ProdectsModel: data,);
        },
      );
    }



  }

}
