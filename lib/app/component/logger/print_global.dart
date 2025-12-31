import 'dart:developer';

import 'package:flutter/foundation.dart';

void globalPrint(String? data){
  if(kDebugMode){
    log('-------------------------------------------------------------------');
    log('\n\n');
    log(data ?? '');
    log('\n\n');
    log('-------------------------------------------------------------------');
  }
}