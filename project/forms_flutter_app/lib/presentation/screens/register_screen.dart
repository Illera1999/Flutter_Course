import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de Usuario',
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Correo Electrónico',
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {},
            label: const Text('Crear Usuario'),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
