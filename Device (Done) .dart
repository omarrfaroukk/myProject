

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
