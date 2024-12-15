class Plato {

  int? id;
  String nombre;
  // Object foto; //-????????????
  double precio;
  bool diasDisponible;

  Plato({this.id, required this.nombre, /*required this.foto,*/ required this.precio, required this.diasDisponible});

  factory Plato.fromMap(Map<String, Object?> mapa) {
    return Plato(
      id: mapa['id'] as int?,
      nombre: mapa['nombre'] as String, 
      // foto: mapa['foto'] as Object, //-????????????
      precio: mapa['precio'] as double, 
      diasDisponible: mapa['dias_disponible'] as int != 0,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      //'foto': foto, //-????????????
      'precio': precio,
      'dias_disponible': diasDisponible ? 1 : 0,
    };
  }
}