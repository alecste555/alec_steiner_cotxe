enum TipoGasto {
  combustible,
  averia,
  seguro,
  equipamiento,
  otros,
}

class Gasto {
  String fecha;
  int kilometros;
  String concepto;
  double cantidad;
  TipoGasto tipo;

  Gasto({
    required this.fecha,
    required this.kilometros,
    required this.concepto,
    required this.cantidad,
    required this.tipo,
  });
}

class GastoController {
  List<Gasto> gastos = [];

  void agregarGasto(Gasto gasto) {
    gastos.add(gasto);
  }

  void editarGasto(int index, Gasto gasto) {
    if (index >= 0 && index < gastos.length) {
      gastos[index] = gasto;
    }
  }

  void eliminarGasto(int index) {
    if (index >= 0 && index < gastos.length) {
      gastos.removeAt(index);
    }
  }
}