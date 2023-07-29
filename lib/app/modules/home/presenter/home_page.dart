import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:up_catalagos/app/core_module/constants/constants.dart';
import 'package:up_catalagos/app/core_module/services/theme_mode/theme_mode_controller.dart';
import 'package:up_catalagos/app/modules/home/presenter/widgets/my_drawer_widget.dart';
import 'package:up_catalagos/app/shared/components/my_circular_progress_widget.dart';
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
        title: const Text('UP Catálogos'),
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
        padding: const EdgeInsets.only(
          left: kPadding,
          right: kPadding,
          top: 10,
          bottom: kPadding,
        ),
        child: SizedBox(
          width: context.screenWidth,
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Empresa',
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 410,
                        decoration: BoxDecoration(
                          color: context.myTheme.onPrimary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButton(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(12),
                          isExpanded: true,
                          value: 'Mercado Lavarda',
                          items: [
                            'Mercado Lavarda',
                            'Mercado Lavarda 2',
                            'Mercado Larvada 3'
                          ]
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (v) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Row(
                    children: [
                      MyElevatedButtonWidget(
                        width: 200,
                        label: const Text('Replicar Imagem(s)'),
                        onPressed: () {},
                      ),
                    ],
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
              const SizedBox(height: 10),
              Expanded(
                  child: GridView.builder(
                itemCount: 14,
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
                        border: Border.all(
                          width: 5,
                          color: ThemeModeController.themeMode == ThemeMode.dark
                              ? context.myTheme.onPrimary
                              : context.myTheme.primary,
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://us-southeast-1.linodeobjects.com/storage/porecatu/media/uploads/produto/picanha_maturata_friboi_kg_05ad9981-a9eb-4440-b5b0-2dd0a41a2678.jpg',
                              placeholder: (context, url) {
                                return const MyCircularProgressWidget();
                              },
                            ),
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
                                  color: ThemeModeController.themeMode ==
                                          ThemeMode.dark
                                      ? context.myTheme.onPrimary
                                      : context.myTheme.primary,
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        width: context.screenWidth,
        height: 25,
        decoration: BoxDecoration(
          color: ThemeModeController.themeMode == ThemeMode.dark
              ? context.myTheme.onPrimary
              : context.myTheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Licença Ativa até: 01 de Novembro de 2023',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Versão 1.0.0',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
