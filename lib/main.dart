import 'package:carvajal/features/bloc/products_bloc.dart';
import 'package:carvajal/features/data/products_data_source.dart';
import 'package:carvajal/features/domain/repository/products_repository.dart';
import 'package:carvajal/ui/login/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductsRepository repository = ProductsRepositoryImpl(productsDataSource: ProductsDataSourceImpl());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context){
          return ProductsBloc(productsRepository: repository);
        }),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginUI(),
        ),
      ),
    );
  }
}