import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/app_router.dart';
import 'package:myapp/entities/pais.dart';
import 'package:myapp/providers/Pais_Provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(paisProvider.notifier).getPaises();
  }

  @override
  Widget build(BuildContext context) {
    final List<Pais> paises = ref.watch(paisProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla home'),
      ),
      body: ListView.builder(
        itemCount: paises.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(paises[index].pais),
              subtitle: Text(paises[index].capital),
              leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(paises[index].bandera)),
              onTap: () {
                appRouter.push('/description/$index');
              },
            ),
          );
        },
      ),
    floatingActionButton: IconButton(onPressed: (){appRouter.push('/add/');}, icon: Icon(Icons.add)),
    );
  }
}
