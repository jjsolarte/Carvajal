import 'package:carvajal/core/constants/colors_app.dart';
import 'package:carvajal/features/models/products.dart';
import 'package:carvajal/ui/componets/custom_alerts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({Key? key, required this.product}) : super(key: key);
  final Products product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        if (product.status == 'active') CustomAlerts(context: context).showMyDialog(product);
      },
      child: Container(
        width: size.width * 0.9,
        color: product.status == 'active' ? Colors.white : Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name!,
                    style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
                  ),
                  Text(
                    product.status!,
                    style: TextStyle(
                      color: product.status == 'active'
                          ? ColorsApp.blue
                          : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.reference!,
                    style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
                  ),
                  Text(
                    'Cantidad Disponible: ${product.inventory!.unit!}',
                    style: const TextStyle(
                      color: ColorsApp.blue,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 1,
                  width: size.width * 0.8,
                  color: ColorsApp.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}