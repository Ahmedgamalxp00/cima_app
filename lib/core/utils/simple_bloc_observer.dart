import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onClose(BlocBase bloc) {
    log('closed $bloc');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log('opened $bloc');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }
}
