import 'package:carvajal/features/data/products_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:carvajal/features/domain/entities/failure.dart';
import 'package:carvajal/features/domain/entities/products.dart';

abstract class ProductsRepository{
  Future<Either<Failure, List<Products>>> getAllProducts();
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

}