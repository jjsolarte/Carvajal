import 'package:carvajal/core/constants/colors_app.dart';
import 'package:carvajal/features/bloc/products_bloc.dart';
import 'package:carvajal/ui/componets/custom_alerts.dart';
import 'package:carvajal/ui/out_products/widgets/drawer_menu.dart';
import 'package:carvajal/ui/out_products/widgets/item_product.dart';
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
      body: SingleChildScrollView(
        child: Padding(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomAlerts(context: context).showAddDialog();
        },
        backgroundColor: ColorsApp.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
