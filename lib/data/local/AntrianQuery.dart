class AntrianQuery{
  static const String TABLE_NAME = "antrian";
  static const String CREATE_TABLE =
      "CREATE TABLE IF NOT EXISTS $TABLE_NAME(nik TEXT PRIMARY KEY, "
      "name TEXT, tglPeriksa TEXT, poli TEXT)";
  static const String SELECT = "select * from $TABLE_NAME";
}