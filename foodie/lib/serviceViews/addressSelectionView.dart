import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';

addressSelectionView(dynamic callback) {
  return KpostalView(
    useLocalServer: true,
    localPort: 1024,
    callback: (Kpostal result) {
      callback(result);
    },
  );
}