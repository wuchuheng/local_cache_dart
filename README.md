This is a local cache library.

## Features

- Local cache

## Getting started
start using the package.

## Usage

```dart 
import 'package:local_cache/src/local_cache_base.dart';

void main() async {
  LocalCache localCache = LocalCache();
  String key = 'keyName';
  String value = "valueData";
  await localCache.set(key: key, value: value);
  // expect(awesome.isAwesome, isTrue);
}
```
