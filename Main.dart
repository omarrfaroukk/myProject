import 'Device (Done) .dart';
import 'Doorlocks (Done).dart';
import 'Hub ( Done).dart';
import 'Light (Done).dart';
import 'Temperature_Controllers (Done).dart';

void main (){
  Hub myHub =Hub();
  Device BedroomLight = Light("Oven", true, true, 90,"White");
  TemperatureControllers myRemote = TemperatureControllers("AC Remote",true, 18,true);
  DoorLocks HomeLock = DoorLocks("Bedroom Lock",false, true);
  Device mediumLight = Light.on_Warm("Parents Light",false);
  HomeLock.switch_stat();
  HomeLock.device_Info();
  myHub.add_Device(BedroomLight);
  myHub.add_Device(myRemote);
  myHub.add_Device(HomeLock);
  myHub.show_details();
  myHub.switch_all_On();
  myHub.show_details();
  BedroomLight.device_Info();
  myRemote.name = "Fan remote";
  myRemote.change_temperature(15);
  myHub.show_details();
  myHub.add_Device(mediumLight);
  myHub.show_details();

}
