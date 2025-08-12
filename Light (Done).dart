import 'Device.dart';
import 'Mixins (Done).dart';


class Light extends Device with Wifi,Battery_Report{
    late bool isOn;
    late int brightness;
    late String color;

    
    Light(super.name,super.powerState, bool working,int bright,String col){

      if(bright>=0&&bright<=100&&(col=="White"||col=="Yellow")){
        isOn = working;
        brightness=bright;
        color=col;
      }else{
        print("An error has occured");
      }

    }

    
    Light.on_Warm(super.name, super.powerState){
        isOn = true;
        brightness =60;
        color = "Yellowish White";
    }

    Light.off_White(super.name,super.powerState){
        isOn=false;
        brightness = 70;
        color = "white";
    }

    void switch_light(){
      isOn=!isOn;
    }

    @override
    String device_Info(){
        return "name : $name , powerState : $powerState , lights : $isOn , brightness : $brightness , color : $color";
    }

}