import 'package:carvajal/features/bloc/products_bloc.dart';
import 'package:carvajal/features/data_sources/products_data_source.dart';
import 'package:carvajal/features/models/user.dart';
import 'package:carvajal/features/repositories/products_repository.dart';
import 'package:carvajal/ui/login/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');

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
        child: const MaterialSettings(),
      ),
    );
  }
}

class MaterialSettings extends StatelessWidget {
  const MaterialSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginUI(),
    );
  }
}
