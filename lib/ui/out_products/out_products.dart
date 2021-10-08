import 'package:carvajal/core/constants/colors_app.dart';
import 'package:carvajal/features/bloc/products_bloc.dart';
import 'package:carvajal/features/domain/entities/products.dart';
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
    BlocProvider.of<ProductsBloc>(context).add(ProductsGetAllProductsEvent());
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
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is ProductsInitial) {
            BlocProvider.of<ProductsBloc>(context)
                .add(ProductsGetAllProductsEvent());
          } else if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: ColorsApp.blue),
            );
          } else if (state is ProductsFailureState) {
            return Center(child: Text(state.msj));
          } else if (state is ProductsGetProductsSuccessState) {
            return SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/carvajal.jpg',
                    fit: BoxFit.fitWidth,
                    width: size.width,
                    height: size.width * 0.3,
                  ),
                  SizedBox(
                    height: size.height * 0.6,
                    width: size.width * 0.9,
                    child: ListView.builder(
                        itemCount: state.productsList.length,
                        itemBuilder: (context, index) {
                          return ItemProduct(
                            product: state.productsList[index],
                          );
                        }),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: ColorsApp.blue),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        backgroundColor: ColorsApp.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  const ItemProduct({Key? key, required this.product}) : super(key: key);
  final Products product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        if (product.status == 'active') _showMyDialog(context, product);
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

Future<void> _showMyDialog(BuildContext context, Products _products) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Detalles del Producto'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                _products.id!.toString(),
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
              Text(
                _products.name!,
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
              Text(
                _products.reference!,
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
              Text(
                _products.inventory!.unit!,
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
              Text(
                _products.inventory!.warehouse!.first.name!,
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _showAddDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Agregar un Producto'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'id',
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
              Text(
                'name',
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
              Text(
                'Ref',
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
              Text(
                'Valor unidad',
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
              Text(
                'Bodega',
                style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Agregar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
