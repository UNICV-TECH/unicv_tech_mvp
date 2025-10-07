import 'package:flutter/material.dart';
import 'ui/components/default_input.dart'; // NOVO: Importe seu componente

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // NOVO: Adicionei o tema do input aqui para manter o estilo
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Formulário e Contador'), // MODIFICADO: Título
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // NOVO: Chave para o formulário e controladores para os campos
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  int _counter = 0;

  // MODIFICADO: A função agora valida o formulário antes de incrementar
  void _validateAndIncrement() {
    // Verifica se todos os campos do formulário são válidos
    if (_formKey.currentState?.validate() ?? false) {
      // Se for válido, incrementa o contador
      setState(() {
        _counter++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formulário válido! Contador: $_counter')),
      );
    } else {
      // Se for inválido, mostra uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, corrija os erros.')),
      );
    }
  }

  // NOVO: É crucial liberar os controladores quando a tela for destruída
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // MODIFICADO: Usaremos um SingleChildScrollView para evitar overflow do teclado
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // NOVO: O widget Form gerencia o estado e a validação dos campos
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Preencha os dados para habilitar o contador:',
                ),
                const SizedBox(height: 24),

                // NOVO: Usando nosso componente reutilizável para o nome
                CustomInputField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O nome é obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // NOVO: Usando nosso componente reutilizável para o e-mail
                CustomInputField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O e-mail é obrigatório';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Insira um e-mail válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                const Text(
                  'O botão foi pressionado (quando válido) esta quantidade de vezes:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _validateAndIncrement, // MODIFICADO: Chama a nova função
        tooltip: 'Validar e Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}