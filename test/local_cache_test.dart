import 'package:local_cache/src/local_cache_base.dart';

void main() async {
  LocalCache localCache = LocalCache();
  String key = 'keyName';
  String value = "valueData";
  await localCache.set(key: key, value: value);
  // expect(awesome.isAwesome, isTrue);
}
