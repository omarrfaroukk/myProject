import 'Device.dart';

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
