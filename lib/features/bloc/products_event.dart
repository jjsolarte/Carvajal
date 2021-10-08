part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class ProductsGetAllProductsEvent extends ProductsEvent{
  @override
  List<Object?> get props => [];
}