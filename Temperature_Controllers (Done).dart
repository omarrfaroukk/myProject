
import 'Device.dart';
import 'Mixins.dart';

class TemperatureControllers extends Device with Battery_Report{
    late int _temperature;
    late bool ecoFriendly;

    
    TemperatureControllers(super.name,super.powerState, int temp ,bool EF){
      ecoFriendly=EF;
      if (temp<100&&temp>-10){
        _temperature = temp;
      }
    }
    //SETTER AND GETTER FOR PRIVATE VALUE

    set set_temp(int tmp)=>(tmp >= -10 && tmp <= 100)? _temperature=tmp:throw Exception("Error") ;
    get get_temp=> _temperature;

    void change_temperature(int newtemp) {
        if (newtemp >= -10 && newtemp <= 100) {
          _temperature = newtemp;
        } else {
          throw Exception("Error: Temperature must be between -10 and 100");
        }
    }

    void switch_EcoFriendly(){
      ecoFriendly=!ecoFriendly;
    }

    @override
    String device_Info(){
        return "name : $name , powerState : $powerState, temperature: $_temperature, eco-friendly: $ecoFriendly";
    }

}
