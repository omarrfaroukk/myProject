
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


