import 'dart:developer';

import 'package:shehop_flowers/dataProviders/local_data_provider.dart';
import 'package:shehop_flowers/dataProviders/network/Network_info.dart';
import 'package:shehop_flowers/dataProviders/network/data_source_url.dart';
import 'package:shehop_flowers/dataProviders/remote_data_provider.dart';
import 'package:shehop_flowers/dataProviders/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:shehop_flowers/features/Favorite/data/model/FavoriteMode.dart';

import '../../../../dataProviders/error/failures.dart';



class ProdectsRepository extends Repository{
  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final LocalDataProvider localDataProvider; //get the data from the local cache
  final NetworkInfo networkInfo; //check if the device is connected to internet

  ProdectsRepository({
    required this.remoteDataProvider,
    required this.localDataProvider,
    required this.networkInfo,
  });


  Future<Either<Failure, dynamic>> getAllFavorite() async {
    return await sendRequest(

        checkConnection: networkInfo.isConnected,

        remoteFunction: () async {
          final remoteData = await remoteDataProvider.sendData(
              url: DataSourceURL.getAllTechers,
              retrievedDataType: FavoriteModel.init(),
              returnType:List,
              body: {}
          );

          localDataProvider.cacheData(key: 'CACHED_Favorite', data: remoteData);

          return remoteData;
        },

        getCacheDataFunction: () {
          return localDataProvider.getCachedData(
              key: 'CACHED_Favorite',
              retrievedDataType: FavoriteModel.init(),
              returnType: List
          );
        });
  }








}