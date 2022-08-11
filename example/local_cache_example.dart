import 'package:local_cache/local_cache.dart';

void main() async {
  LocalCache localCache = LocalCache();
  const String key = 'keyName';
  const String value = "valueData";
  await localCache.set(key: key, value: value);
  final result = await localCache.get(key: key);
  // print: "valueData"
  print(result);
  final hasData = await localCache.has(key: key);
  // print: true
  print(hasData);
  // delete local cache
  await localCache.unset(key: key);
}
