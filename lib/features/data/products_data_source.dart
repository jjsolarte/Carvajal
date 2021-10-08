import 'package:carvajal/features/domain/entities/products.dart';
import 'package:carvajal/features/domain/entities/warehouses.dart';
import 'package:dio/dio.dart';

abstract class ProductsDataSource {
  Future<List<Products>> getAllProducts();
}

class ProductsDataSourceImpl implements ProductsDataSource {
  final Dio _dio = Dio();

  @override
  Future<List<Products>> getAllProducts() async {
    //-->> La siguiete línea de código debe ser reemplazada por un endpoint habilitado
    const path = '/products/get_carvajal_products';
    try {
      final response = await _dio.get(path);
      final data = response as List;

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
}
