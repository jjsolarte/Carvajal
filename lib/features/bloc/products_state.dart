part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoadingState extends ProductsState{
  const ProductsLoadingState({this.msj});
  final String? msj;
  @override
  List<Object?> get props => [msj];
}
class ProductsFailureState extends ProductsState{
  const ProductsFailureState({required this.msj});
  final String msj;
  @override
  List<Object?> get props => [msj];
}
class ProductsGetProductsSuccessState extends ProductsState{
  const ProductsGetProductsSuccessState({required this.productsList});
  final List<Products> productsList;
  @override
  List<Object?> get props => [productsList];
}