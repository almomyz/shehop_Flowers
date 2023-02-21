import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:shehop_flowers/dataProviders/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:shehop_flowers/features/Categories/data/model/CategoriesMode.dart';
import 'package:shehop_flowers/features/Categories/data/repository/CategoriesRepository.dart';



part 'Categories_event.dart';
part 'Categories_state.dart';

class Categories_bloc extends Bloc<Categories_event, CategoriesState> {

  final CategoriesRepository repository;
  Categories_bloc({required this.repository})
      : assert(repository != null),
        super(CategoriesInitial());
  @override
  Stream<CategoriesState> mapEventToState(Categories_event event)async* {

    if(event is GetAllFavorite){
      yield CategoriesLoading();
      final failureOrData = await repository.getAllFavorite();
      yield* failureOrData.fold(
            (failure) async* {
          log('yield is error');
          yield CategoriesError(errorMessage: mapFailureToMessage(failure));
        },
            (data) async* {
          log('yield is loaded');
          yield CategoriesILoaded(CategoriesModel: data,);
        },
      );
    }



  }

}
