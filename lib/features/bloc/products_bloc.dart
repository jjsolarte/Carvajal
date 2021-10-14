import 'package:bloc/bloc.dart';
import 'package:carvajal/features/models/products.dart';
import 'package:carvajal/features/repositories/products_repository.dart';
import 'package:equatable/equatable.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.productsRepository}) : super(ProductsInitial());

  final ProductsRepository productsRepository;

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is ProductsGetAllProductsEvent) {
      yield* _mapGetAllProductsToState(event);
    }
    if(event is ProductsAddProductsEvent){
      yield* _mapAddProductsToState(event);
    }
  }

  Stream<ProductsState> _mapGetAllProductsToState(
      ProductsGetAllProductsEvent event) async* {
    yield const ProductsLoadingState(msj: 'Cargando');
    final types = await productsRepository.getAllProducts();
    yield* types.fold((l) async* {
      yield const ProductsFailureState(msj: 'Intente más tarde');
    }, (r) async* {
      yield ProductsGetProductsSuccessState(productsList: r);
    });
  }

  Stream<ProductsState> _mapAddProductsToState(
      ProductsAddProductsEvent event) async* {
    yield const ProductsLoadingState(msj: 'Cargando');
    final types = await productsRepository.addProducts(event.product!);
    yield* types.fold((l) async* {
      yield const ProductsFailureState(msj: 'Intente más tarde');
    }, (r) async* {
      yield ProductsAddProductsSuccessState(msj: r);
    });
  }

}
