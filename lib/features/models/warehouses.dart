class Warehouse {
  Warehouse(
      {this.id,
      this.name,
      this.observations,
      this.address,
      this.status,
      this.isDefault,
      this.initialQuantity,
      this.availableQuantity,
      this.minQuantity,
      this.maxQuantity});

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        name: json['name'] as String?,
        id: json['id'] as int?,
        status: json['status'] as String?,
        address: json['address'] as String?,
        availableQuantity: json['availableQuantity'] as int?,
        initialQuantity: json['initialQuantity'] as double?,
        isDefault: json['isDefault'] as bool?,
        maxQuantity: json['maxQuantity'] as int?,
        minQuantity: json['minQuantity'] as int?,
        observations: json['observations'] as String?,
      );

  int? id;
  String? name;
  String? observations;
  String? address;
  String? status;
  bool? isDefault;
  double? initialQuantity;
  int? availableQuantity;
  int? minQuantity;
  int? maxQuantity;
}
