import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Ce widget est la home page de mon application. Il est stateful,ce qui signifie
  // qu'il possède un objet State (défini ci-dessous) qui contient des champs 
  // affectant son apparence

  // Cette classe configure le State du widget. Elle stocke les valeurs (dans ce
  // cas, le title) fournies par le parent (dans ce cas, App widget) and
  // utilisées par la méthode de construction de State. Les champs dans une sous-classe de Widget
  // sont toujours marqués comme "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  double _fontSize = 30.0;
  Color _couleur = Colors.white;
  String _phrase = 'Clic avant l’explosion :';
  TextStyle _tS = const TextStyle(
    fontSize: 30.0
  );

  void _decrementCounter() {
    setState(() {
      // Cet appel à setState indique au framework Flutter qu'un changement s'est produit 
      // dans cet State, ce qui le pousse à relancer la méthode de construction ci-dessous
      // afin que l'affichage puisse refléter les valeurs mises à jour. Si nous avions modifié
      // _counter sans appeler setState(), la méthode de construction n'aurait pas été
      // appelée à nouveau, et donc rien ne semblerait se passer.
      if(_counter > 1){
        _counter--;
        _fontSize++;
        _tS = TextStyle(
            fontSize: _fontSize
        );
      }else{
        _counter = 0;
        _phrase = 'BOOM !';
        _tS = const TextStyle(
            fontSize: 60.0,
            color: Colors.red
        );  
        _couleur = Colors.yellow;    
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: _couleur,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center est un widget de mise en page. Il prend un seul enfant et le positionne
        // au milieu de son parent.
        child: Column(
          // Column est également un widget de mise en page. Il prend une liste d'enfants et
          // les arrange verticalement. Par défaut, il se taille lui-même pour s'adapter à ses
          // enfants horizontalement, et essaie d'être aussi haut que son parent.
          //
          // Column possède diverses propriétés pour contrôler sa taille et
          // la façon dont il positionne ses enfants. Ici, nous utilisons mainAxisAlignment pour
          // centrer verticalement les enfants ; l'axe principal ici est l'axe vertical
          // car les colonnes sont verticales (l'axe croisé serait
          // horizontal).
          //
          // ESSAYEZ CECI : Invoquez "debug painting" (choisissez l'action "Toggle Debug Paint"
          // dans l'IDE, ou appuyez sur "p" dans la console), pour voir le
          // fil de fer pour chaque widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _phrase,
              style: _tS,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.history),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
