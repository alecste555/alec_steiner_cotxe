import 'gasto_model.dart';

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
