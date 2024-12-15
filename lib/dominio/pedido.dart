class Pedido {

  int? id;
  DateTime? fechaHoraRealizacion;
  String observaciones;
  String estado;
  int importeTotal;

  Pedido({this.id, this.fechaHoraRealizacion, required this.observaciones, required this.estado, required this.importeTotal});

  factory Pedido.fromMap(Map<String, Object?> mapa) {
    return Pedido(
      id: mapa['id'] as int?,
      fechaHoraRealizacion: DateTime.parse(mapa['fecha_hora_realizacion'] as String),
      observaciones: mapa['observaciones'] as String, 
      estado: mapa['estado'] as String,
      importeTotal: mapa['importe_total'] as int,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'fecha_hora_realizacion': fechaHoraRealizacion,
      'observaciones': observaciones,
      'estado': estado,
      'importe_total': importeTotal,
    };
  }

}