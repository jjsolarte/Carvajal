import 'package:carvajal/core/constants/colors_app.dart';
import 'package:carvajal/features/bloc/products_bloc.dart';
import 'package:carvajal/ui/out_products/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OurProductsUI extends StatefulWidget {
  const OurProductsUI({Key? key}) : super(key: key);

  @override
  _OurProductsUIState createState() => _OurProductsUIState();
}

class _OurProductsUIState extends State<OurProductsUI> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context)
        .add(ProductsGetAllProductsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuestros Productos'),
        backgroundColor: ColorsApp.blue,
      ),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state){
          return Column(
            children: [
              Image.asset(
                'assets/images/carvajal.jpg',
                fit: BoxFit.fitWidth,
                width: size.width,
                height: size.width * 0.3,
              ),
              ItemProduct()
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsApp.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  const ItemProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nombre Producto',
                style: TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),Text(
                'Inactivo',
                style: TextStyle(color: ColorsApp.blue, fontSize: 16,),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ref:35464',
                style: TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),Text(
                'Cantidad Disponible: 20',
                style: TextStyle(color: ColorsApp.blue, fontSize: 16,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

