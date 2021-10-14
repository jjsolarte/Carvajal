import 'package:carvajal/features/models/warehouses.dart';

class Products {
  Products(
      {this.id,
      this.name,
      this.description,
      this.reference,
      this.status,
      this.inventory});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        reference: json['reference']?.toString(),
        description: json['description']?.toString(),
        name: json['name']?.toString(),
        id: json['id'] as int?,
        inventory: json['inventory']
            ? Inventory.fromJson(json['inventory'] as Map<String, dynamic>)
            : null,
        status: json['status']?.toString(),
      );

  int? id;
  String? name;
  String? description;
  String? reference;
  String? status;
  Inventory? inventory;
}

class Inventory {
  Inventory(
      {this.unit,
      this.availableQuantity,
      this.unitCost,
      this.unitQuality,
      this.warehouse});

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        availableQuantity: json['availableQuantity'] as int?,
        unit: json['unit']?.toString(),
        unitCost: json['unitCost'] as int?,
        unitQuality: json['unitQuality'] as int?,
        warehouse: json.containsKey('warehouse')
            ? List<Warehouse>.from(
                (json['subcategories'] as List).map(
                  (x) => Warehouse.fromJson(x as Map<String, dynamic>),
                ),
              )
            : [],
      );

  String? unit;
  int? availableQuantity;
  int? unitCost;
  int? unitQuality;
  List<Warehouse>? warehouse;
}
