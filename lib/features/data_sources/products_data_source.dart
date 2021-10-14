import 'package:carvajal/features/models/products.dart';
import 'package:carvajal/features/models/warehouses.dart';
import 'package:dio/dio.dart';

abstract class ProductsDataSource {
  Future<List<Products>> getAllProducts();

  Future<String> addProducts(Products products);
}

class ProductsDataSourceImpl implements ProductsDataSource {
  final Dio _dio = Dio();

  @override
  Future<List<Products>> getAllProducts() async {
    //-->> La siguiete línea de código debe ser reemplazada por un endpoint habilitado
    const path = '/products/get_carvajal_products';
    try {
      //final response = await _dio.get(path);
      //final data = response as List;

      //-->> La siguiete línea de código debe ser habilitada

      // return List<Products>.from(data.map((rawCC) => Products.fromJson(rawCC as Map<String, dynamic>)),);

      //-->> La siguiete línea de código debe ser eliminada

      return [
        Products(
          id: 001,
          name: 'Producto 1',
          description: 'Descrip Product 1',
          reference: 'Ref001',
          status: 'active',
          inventory: Inventory(
            unitQuality: 500,
            unitCost: 500,
            unit: '59',
            availableQuantity: 50,
            warehouse: [
              Warehouse(
                id: 1,
                name: 'Warehouse1',
                status: 'active',
              ),
              Warehouse(
                id: 2,
                name: 'Warehouse2',
                status: 'active',
              ),
            ]
          )
        ),
        Products(
          id: 002,
          name: 'Producto 2',
          description: 'Descrip Product 2',
          reference: 'Ref002',
          status: 'inactive',
          inventory: Inventory(
            unitQuality: 500,
            unitCost: 500,
            unit: '59',
            availableQuantity: 50,
            warehouse: [
              Warehouse(
                id: 1,
                name: 'Warehouse1',
                status: 'active',
              ),
              Warehouse(
                id: 2,
                name: 'Warehouse2',
                status: 'active',
              ),
            ]
          )
        ),
      ];
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> addProducts(Products? products) async{
    //-->> La siguiete línea de código debe ser reemplazada por un endpoint habilitado
    const path = '/products/add_carvajal_products';
    final body = {
      'product_id': products!.id,
      'reference_one': products.name,
      'reference_two': products.description,
    };

    try {
      final response = await _dio.post(path,data: body);
      final data = response.data as String;
      //-->> La siguiete línea de código debe ser habilitada
      // return data;

      //-->> La siguiete línea de código debe ser eliminada
      return 'Su petición está siendo procesada.';
    } catch (_) {
      rethrow;
    }
  }
}
