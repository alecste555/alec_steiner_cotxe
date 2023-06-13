import 'package:flutter/material.dart';
import 'gasto_controller.dart';

class GastoListPage extends StatelessWidget {
  final GastoController controller;

  GastoListPage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Gastos'),
      ),
      body: ListView.builder(
        itemCount: controller.gastos.length,
        itemBuilder: (context, index) {
          Gasto gasto = controller.gastos[index];
          return ListTile(
            title: Text(gasto.concepto),
            subtitle: Text('Fecha: ${gasto.fecha} - Kilómetros: ${gasto.kilometros}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                controller.eliminarGasto(index);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GastoEditPage(controller: controller, index: index),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GastoAddPage(controller: controller),
            ),
          );
        },
      ),
    );
  }
}

class GastoAddPage extends StatefulWidget {
  final GastoController controller;

  GastoAddPage({required this.controller});

  @override
  _GastoAddPageState createState() => _GastoAddPageState();
}

class _GastoAddPageState extends State<GastoAddPage> {
  TextEditingController fechaController = TextEditingController();
  TextEditingController kilometrosController = TextEditingController();
  TextEditingController conceptoController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  TipoGasto tipoValue = TipoGasto.combustible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Gasto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: fechaController,
              decoration: InputDecoration(labelText: 'Fecha'),
            ),
            TextFormField(
              controller: kilometrosController,
              decoration: InputDecoration(labelText: 'Kilómetros'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: conceptoController,
              decoration: InputDecoration(labelText: 'Concepto'),
            ),
            TextFormField(
              controller: cantidadController,
              decoration: InputDecoration(labelText: 'Cantidad'),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField<TipoGasto>(
              value: tipoValue,
              onChanged: (value) {
                setState(() {
                  tipoValue = value!;
                });
              },
              items: TipoGasto.values.map((tipo) {
                return DropdownMenuItem<TipoGasto>(
                  value: tipo,
                  child: Text(tipo.toString().split('.').last),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Guardar'),
              onPressed: () {
                Gasto gasto = Gasto(
                  fecha: fechaController.text,
                  kilometros: int.parse(kilometrosController.text),
                  concepto: conceptoController.text,
                  cantidad: double.parse(cantidadController.text),
                  tipo: tipoValue,
                );
                widget.controller.agregarGasto(gasto);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GastoEditPage extends StatefulWidget {
  final GastoController controller;
  final int index;

  GastoEditPage({required this.controller, required this.index});

  @override
  _GastoEditPageState createState() => _GastoEditPageState();
}

class _GastoEditPageState extends State<GastoEditPage> {
  TextEditingController fechaController = TextEditingController();
  TextEditingController kilometrosController = TextEditingController();
  TextEditingController conceptoController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  late TipoGasto tipoValue;

  @override
  void initState() {
    super.initState();
    Gasto gasto = widget.controller.gastos[widget.index];
    fechaController.text = gasto.fecha;
    kilometrosController.text = gasto.kilometros.toString();
    conceptoController.text = gasto.concepto;
    cantidadController.text = gasto.cantidad.toString();
    tipoValue = gasto.tipo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Gasto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: fechaController,
              decoration: InputDecoration(labelText: 'Fecha'),
            ),
            TextFormField(
              controller: kilometrosController,
              decoration: InputDecoration(labelText: 'Kilómetros'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: conceptoController,
              decoration: InputDecoration(labelText: 'Concepto'),
            ),
            TextFormField(
              controller: cantidadController,
              decoration: InputDecoration(labelText: 'Cantidad'),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField<TipoGasto>(
              value: tipoValue,
              onChanged: (value) {
                setState(() {
                  tipoValue = value!;
                });
              },
              items: TipoGasto.values.map((tipo) {
                return DropdownMenuItem<TipoGasto>(
                  value: tipo,
                  child: Text(tipo.toString().split('.').last),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Guardar'),
              onPressed: () {
                Gasto gasto = Gasto(
                  fecha: fechaController.text,
                  kilometros: int.parse(kilometrosController.text),
                  concepto: conceptoController.text,
                  cantidad: double.parse(cantidadController.text),
                  tipo: tipoValue,
                );
                widget.controller.editarGasto(widget.index, gasto);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
