import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo Teste',
      debugShowCheckedModeBanner: false,  // Remover a tarja de debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 53, 226, 139)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Aplicativo Teste'),
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
  int _counter = 0;
  bool eSucesso = false; // Variável para controlar o sucesso

  void _incrementCounter() {
    setState(() {
      if (_counter < 100) {
        _counter++;
      }
      if (_counter == 100) {
        eSucesso = true; // Marca como sucesso quando o contador atinge 100
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            const Icon(Icons.app_registration), // Ícone à esquerda
            const SizedBox(width: 8), // Espaço entre o ícone e o título
            Text(widget.title), // Título "Aplicativo Teste"
          ],
        ),
      ),
      body: Row(
        children: [
          // Coluna esquerda com o quadrado verde e sombra
          Expanded(
            flex: 2, // O cubo verde ocupará 2 partes do layout
            child: Container(
              height: screenHeight, // Responsivo ao preencher toda a coluna da tela
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 52, 215, 131), // Cor de fundo verde
                borderRadius: BorderRadius.circular(6), // Bordas arredondadas
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(3, 3), // Efeito de sombra
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinha os ícones à esquerda
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.home, color: Colors.white, size: screenWidth * 0.08),
                      SizedBox(width: 10),
                      Text('Home', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    children: [
                      Icon(Icons.search, color: Colors.white, size: screenWidth * 0.08),
                      SizedBox(width: 10),
                      Text('Pesquisar', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.white, size: screenWidth * 0.08),
                      SizedBox(width: 10),
                      Text('Notificações', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    children: [
                      Icon(Icons.settings, color: Colors.white, size: screenWidth * 0.08),
                      SizedBox(width: 10),
                      Text('Ajustes', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3, // A coluna direita ocupará 3 partes do layout
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight, // Alinha a coluna à direita
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Clique no botão para aumentar a taxa de download:'),
                    Text('$_counter%', style: Theme.of(context).textTheme.headlineMedium),
                    if (eSucesso) ...[
                      const SizedBox(height: 20),
                      const Text(
                        'Sucesso!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Toda essa interface faz parte de um projeto teste realizado com Flutter. Projeto realizado por Vinicius O. F. Kociolek para a disciplina de Módulo 11, Desenvolvimento Web do Talento Tech.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.download_for_offline),
      ),
    );
  }
}
