import 'package:flutter/material.dart';
import 'historial.dart';

void main() {
  runApp(ExParcial());
}

class ExParcial extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Parcial',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ParcialFull(title: 'Conversor Oderman'),
    );
  }
}

class ParcialFull extends StatefulWidget {
  ParcialFull({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ParcialFullState createState() => _ParcialFullState();
}

class _ParcialFullState extends State<ParcialFull> {
  final inputController = TextEditingController();

  void buttonPressed(String buttonText, cant, double tarifa) {
    setState(() {
      double resultado;
      if (buttonText == 'USD(\$)') {
        tarifa = 3862.0;
        resultado = tarifa * cant;
      } else if (buttonText == 'Euro(€)') {
        tarifa = 4535.0;
        resultado = tarifa * cant;
      } else {
        tarifa = 36.64;
        resultado = tarifa * cant;
      }
    });
  }

  Widget buildButton(String buttonText, double tarifa) {
    return Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
              color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: () => buttonPressed(
          buttonText,
          inputController,
          tarifa,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Text(
              'Conversor de Monedas',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(65, 0, 0, 10),
                child: Text(
                  'Valor: ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Valor a Cambiar (Pesos Colombianos)',
                ),
                controller: inputController,
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            buildButton('USD (\$)', 3862.0),
            buildButton('EURO (\)', 4535.0),
            buildButton('YENES (\)', 36.64),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text('Moneda: '),
              ),
              Text(),
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text('Equivalencia: '),
              ),
              Text(),
            ],
          ),
          HistorialPage(),
        ],
      ),
    );
  }
}
