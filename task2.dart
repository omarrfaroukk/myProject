
abstract class Device{
    late String name;
    late bool powerState;

    Device(String n,bool ps){
      if (n.isEmpty){
        print("name cannot be empty");
      }else{
        name=n;
        powerState = ps;
      }
    }

    String device_Info(){
        return "name : $name , powerState : $powerState";
    }

}


//DEVICES

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

class DoorLocks extends Device with Wifi{
    late bool locked;

    DoorLocks(super.name,super.powerState,this.locked);

    void switch_stat(){
      locked=!locked;
    }

    @override
    String device_Info() {
        return "name : $name , powerState : $powerState, locked : $locked";
    }

}

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




//MIXINS

mixin Wifi{
    bool isConnected= false;
    String Connected(String SSID){
        isConnected = true;
        return "Wifi connected to SSID: $SSID";
    }
}

mixin Battery_Report{
    int? battery_level;

    void change_BL(int bl){
      if (bl >=0 && bl<=100){
        battery_level = bl;
      print("Battery Level Changed Succesfully");
      }else{
        print("Error, must be 0-100");
      }
      
    } 
    bool notSoLow(int bl){
      if (bl>20){
        return true;
      }
      return false;
    } 
}





//HUB ITSELF

class Hub{
  List<Device> myDevices = [];

  void add_Device(Device d){
    myDevices.add(d);
  }
  void switch_all_On(){
    for (int i = 0; i<myDevices.length;i++){
      myDevices[i].powerState = true;
    }
    print("ALL TURNED ON");
  }

  void switch_all_Off(){
    for (int i = 0; i<myDevices.length;i++){
      myDevices[i].powerState = false;
    }
    print("ALL TURNED OFF");
  }
  void show_details(){
    for (int i = 0; i<myDevices.length;i++){
      print(myDevices[i].device_Info());
      print(" || ");
    }

}
}


void main (){
    Device lamba = Light("MyLamp", true, true, 96,"White");
}


