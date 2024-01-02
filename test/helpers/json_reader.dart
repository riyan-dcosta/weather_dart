import 'dart:io';

String readJson(String fileName) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/test/$fileName').readAsStringSync();
}
