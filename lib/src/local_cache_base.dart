import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:wuchuheng_local_cache/src/local_cache_abstract.dart';

import 'errors/key_not_found_error.dart';

class LocalCache implements LocalCacheAbstract {
  final String path;

  LocalCache({this.path = ''});

  Future<String> get _path async {
    final directory = await getApplicationDocumentsDirectory();
    String path = this.path == '' ? '${directory.path}/localCache' : this.path;
    if (!await Directory(path).exists()) {
      await Directory(path).create(recursive: true);
    }
    return path;
  }

  @override
  Future<String> get({required String key}) async {
    if (!await has(key: key)) throw KeyNotFoundError();
    String path = await _path;
    String filePath = '$path/$key.json';

    return File(filePath).readAsStringSync();
  }

  @override
  Future<bool> has({required String key}) async {
    String path = await _path;
    String filePath = '$path/$key.json';
    return await File(filePath).exists();
  }

  @override
  Future<void> set({required String key, required String value}) async {
    String path = await _path;
    String filePath = '$path/$key.json';
    File file = File(filePath);
    await file.writeAsString(value);
  }

  @override
  Future<void> unset({required String key}) async {
    String path = await _path;
    String filePath = '$path/$key.json';
    File file = File(filePath);
    await file.delete();
  }
}
