import 'Device.dart';
import 'Mixins (Done).dart';

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