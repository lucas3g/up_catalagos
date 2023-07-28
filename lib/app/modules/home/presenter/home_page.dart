import 'package:flutter/material.dart';
import 'package:up_catalagos/app/core_module/constants/constants.dart';
import 'package:up_catalagos/app/modules/home/presenter/widgets/my_drawer_widget.dart';
import 'package:up_catalagos/app/shared/components/my_elevated_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mercado Lavarda'),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: Scaffold.of(context).openDrawer,
            icon: const Icon(Icons.menu),
          );
        }),
      ),
      drawer: const MyDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: SizedBox(
          width: context.screenWidth,
          child: Column(
            children: [
              Row(
                children: [
                  MyElevatedButtonWidget(
                    width: 200,
                    label: const Text('Adicionar Imagem(s)'),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  MyElevatedButtonWidget(
                    width: 200,
                    label: const Text('Remover Todas Imagens'),
                    onPressed: () {},
                  ),
                ],
              ),
              Text(
                'Lista de Imagens',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              Expanded(
                  child: GridView.builder(
                itemCount: 30,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            'https://us-southeast-1.linodeobjects.com/storage/porecatu/media/uploads/produto/picanha_maturata_friboi_kg_05ad9981-a9eb-4440-b5b0-2dd0a41a2678.jpg',
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: context.myTheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
