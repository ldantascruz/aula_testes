import 'package:flutter/material.dart';

import 'pages/register_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aula de Testes',
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}
