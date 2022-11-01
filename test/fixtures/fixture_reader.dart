import 'dart:io';

/// converts `fileName` document into String
/// 
/// path: "test/fixtures/< file >"
String fixture(String fileName) =>
    File("test/fixtures/$fileName").readAsStringSync();
