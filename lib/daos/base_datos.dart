import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BaseDatos {

  static final BaseDatos _instancia = BaseDatos._inicializar();

  Database? _baseDatos;

  BaseDatos._inicializar();

  factory BaseDatos() {
    return _instancia;
  }

  Future<Database> obtenerBaseDatos() async {
    if (_baseDatos != null) return _baseDatos!;

    final String rutaDirectorioBDs = await getDatabasesPath();
    final String rutaArchivoBD = join(rutaDirectorioBDs, 'obligatorio_dart.sqlite');
    
    _baseDatos = await openDatabase(
      rutaArchivoBD,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE platos (
            id INTEGER NOT NULL PRIMAREY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            precio REAL NOT NULL,
            dias_disponible INTEGER NOT NULL,
          );
        ''');

        await db.execute('''
          CREATE TABLE clientes (
            cedula TEXT NOT NULL PRIMAREY KEY,
            nombre TEXT NOT NULL,
            direccion_entrega TEXT NOT NULL,
            telefono TEXT NOT NULL,
          );
        ''');

        await db.execute('''
          CREATE TABLE pedidos (
            id INTEGER NOT NULL PRIMAREY KEY AUTOINCREMENT,
            fecha_hora_realizacion TEXT NOT NULL,
            observaciones TEXT NOT NULL,
            estado TEXT NOT NULL,
            importe_total INTEGER NOT NULL,
            cedula TEXT NOT NULL PRIMAREY KEY,
            nombre TEXT NOT NULL,
            direccion_entrega TEXT NOT NULL,
            telefono TEXT NOT NULL,
          );
        ''');

        await db.execute('''
          CREATE TABLE lineaPedidos (
            idPlato INTEGER NOT NULL,
            idPedido INTEGER NOT NULL,
            cantidad INTEGER NOT NULL,
            PRIMARY KEY(idPlato, idPedido),
          );
        ''');
      },
      onOpen: (db) async {
        await db.execute('PRAGMA foreign_keys = ON;');
      },
    );

    return _baseDatos!;
  }

  Future<void> cerrarBaseDatos() async {
    await _baseDatos?.close();

    _baseDatos = null;
  }
}