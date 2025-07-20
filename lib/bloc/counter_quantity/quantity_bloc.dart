import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce_app/bloc/counter_quantity/bloc_event.dart';

import 'bloc_state.dart';

class QuantityBloc extends Bloc<QuantityEvent,QuantityState>{
    QuantityBloc():super(QuantityState(count: 1)){
      on<IncreamentQantityEvent>((event, emit) => 
      emit(QuantityState(count: state.count+1)),);
      on<DecreamentQuantityEvent>((event, emit){
      if(state.count>1){
        emit(QuantityState(count: state.count-1));
      }
});

    }
}