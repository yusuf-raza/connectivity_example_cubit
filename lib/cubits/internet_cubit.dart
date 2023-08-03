import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

/*In cubit there are no events, a cubit only has state and cubit*/

/*We could have also defined the states in a separate file, as we did in bloc example,
* since there was no  data in states, we can also use this approach with enums to define the states*/
enum InternetState { initialState, lostState, gainedState }

class InternetCubit extends Cubit<InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.initialState) {
    //we are only emitting states from out cubit
    //no events are added
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.gainedState);
      } else {
        emit(InternetState.lostState);
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
