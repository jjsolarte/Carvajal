part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class ProductsGetAllProductsEvent extends ProductsEvent{
  @override
  List<Object?> get props => [];
}

class ProductsAddProductsEvent extends ProductsEvent{
  const ProductsAddProductsEvent({required this.product});
  final Products? product;
  @override
  List<Object?> get props => [product];
}