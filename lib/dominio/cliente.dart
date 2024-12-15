class Cliente {
  
  String cedula;
  String nombre;
  String direccionEntrega;
  String telefono;

  Cliente({required this.cedula, required this.nombre, required this.direccionEntrega, required this.telefono});

  factory Cliente.fromMap(Map<String, Object?> mapa) {
    return Cliente(
      cedula: mapa['cedula'] as String, 
      nombre: mapa['nombre'] as String, 
      direccionEntrega: mapa['direccion_entrega'] as String, 
      telefono: mapa['telefono'] as String,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'cedula': cedula,
      'nombre': nombre,
      'direccion_entrega': direccionEntrega,
      'telefono': telefono,
    };
  }
 
}
