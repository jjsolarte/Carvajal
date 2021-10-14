import 'package:carvajal/features/data_sources/products_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:carvajal/features/models/failure.dart';
import 'package:carvajal/features/models/products.dart';

abstract class ProductsRepository{
  Future<Either<Failure, List<Products>>> getAllProducts();
  Future<Either<Failure, String>> addProducts(Products products);
}

class ProductsRepositoryImpl implements ProductsRepository{
  ProductsRepositoryImpl({required this.productsDataSource});

  final ProductsDataSource productsDataSource;
  @override
  Future<Either<Failure, List<Products>>> getAllProducts() async{
    try {
      final res = await productsDataSource.getAllProducts();
      return right(res);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addProducts(Products products) async{
    try {
      final res = await productsDataSource.addProducts(products);
      return right(res);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

}