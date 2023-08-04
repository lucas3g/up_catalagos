import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_catalagos/app/core_module/constants/constants.dart';
import 'package:up_catalagos/app/shared/components/my_elevated_button_widget.dart';
import 'package:up_catalagos/app/shared/components/my_input_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'UP Catálogos',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: context.screenWidth * .25,
              padding: const EdgeInsets.all(kPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.myTheme.onPrimary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Faça seu login aqui'),
                  const SizedBox(height: 10),
                  const MyInputWidget(label: 'CNPJ'),
                  const SizedBox(height: 10),
                  const MyInputWidget(label: 'Senha'),
                  const SizedBox(height: 10),
                  MyElevatedButtonWidget(
                    label: const Text('Entrar'),
                    onPressed: () {
                      Modular.to.navigate('/home/');
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Não tem uma conta ainda?'),
                      const SizedBox(width: 5),
                      TextButton(
                          onPressed: () {}, child: const Text('Clique aqui'))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
