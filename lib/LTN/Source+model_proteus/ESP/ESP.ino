#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#include <ArduinoJson.h>
#include <SoftwareSerial.h>
#define WIFI_SSID "Tienn"
#define WIFI_PASSWORD "12345678"
#define FIREBASE_HOST "smarthomeapp-b0059-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "AIzaSyARHE1JjWDwqlTMo5rtaZjKH799-bDZgsc"
FirebaseData firebaseData;

//biến lưu tạm trạng thái
bool mode_warning = false;
bool warning_led_state = false;
bool living_led_state = false;
bool bedR_led_state = false;
bool resR_led_state = false;
bool Gac_led_state = false;
bool yard_led_state = false;
bool dinning_led_state = false;
///
String add_warning_mode = "mode_warning";
String add_warning_led = "warning_led_state";
String add_living_led_state = "room/0/devices/2/state";
String add_dinning_led_state = "room/1/devices/2/state";
String add_bedR_led_state = "room/2/devices/3/state";
String add_resR_led_state = "room/3/devices/2/state";
String add_gac_led_state = "room/5/devices/1/state";
String add_yard_led_state = "room/4/devices/2/state";

void setup() {
  Serial.begin(9600);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(600);
  }
  Serial.println();
  Serial.print("Connected: ");
  Serial.println(WiFi.localIP());


  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);
}

void loop() {
  //theo dõi chế độ báo động
  if (Firebase.getBool(firebaseData, add_warning_mode)) {
    bool warningState = firebaseData.boolData();
    if (mode_warning != warningState) {
      Serial.println("modewarning:" + String(warningState));
      mode_warning = warningState;
    }
  }

  //theo dõi led state warning
  if (Firebase.getBool(firebaseData, add_warning_led)) {
    bool warningLedState = firebaseData.boolData();
    if (warning_led_state != warningLedState) {
      Serial.println("warningledstate:" + String(warningLedState));
      warning_led_state = warningLedState;
    }
  }

  //theo dõi led state living
  if (Firebase.getBool(firebaseData, add_living_led_state)) {
    bool livingLedState = firebaseData.boolData();
    if (living_led_state != livingLedState) {
      Serial.println("livingledstate:" + String(livingLedState));
      living_led_state = livingLedState;
    }
  }

  //theo dõi led state dinning
  if (Firebase.getBool(firebaseData, add_dinning_led_state)) {
    bool dinningLedState = firebaseData.boolData();
    if (dinning_led_state != dinningLedState) {
      Serial.println("dinningledstate:" + String(dinningLedState));
      dinning_led_state = dinningLedState;
    }
  }
  //theo dõi led state bed
  if (Firebase.getBool(firebaseData, add_bedR_led_state)) {
    bool bedRLedState = firebaseData.boolData();
    if (bedR_led_state != bedRLedState) {
      Serial.println("bedrledstate:" + String(bedRLedState));
      bedR_led_state = bedRLedState;
    }
  }
  //theo dõi led state resroom
  if (Firebase.getBool(firebaseData, add_resR_led_state)) {
    bool resRLedState = firebaseData.boolData();
    if (resR_led_state != resRLedState) {
      Serial.println("resrledstate:" + String(resRLedState));
      resR_led_state = resRLedState;
    }
  }
  //theo dõi led state gác
  if (Firebase.getBool(firebaseData, add_gac_led_state)) {
    bool value = firebaseData.boolData();
    if (value != Gac_led_state) {
      Serial.println("gacledstate:" + String(value));
      Gac_led_state = value;
    }
  }
  //theo dõi led state Sân
  if (Firebase.getBool(firebaseData, add_yard_led_state)) {
    bool yardLedState = firebaseData.boolData();
    if (yard_led_state != yardLedState) {
      Serial.println("yardledstate:" + String(yardLedState));
      yard_led_state = yardLedState;
    }
  }

  //  delay(500);

  while (Serial.available() > 0) {
    String receivedChar = Serial.readStringUntil('\n');
    int vt = receivedChar.indexOf(":");
    if (vt != -1) {
      String key = receivedChar.substring(0, vt);
      String value = receivedChar.substring(vt + 1);
      key.trim();
      value.trim();
      bool boolvalue;
      boolvalue = value == "1";
      if (key.equals("modewarning")) {
        if (mode_warning != boolvalue) {
          mode_warning = boolvalue;
          Firebase.setBool(firebaseData, add_warning_mode, boolvalue);
          continue;
        }
      }
      if (key.equals("warningledstate")) {
        if (warning_led_state != boolvalue) {
          warning_led_state = boolvalue;
          Firebase.setBool(firebaseData, add_warning_led, boolvalue);
          continue;
        }
      }
      if (key.equals("livingledstate")) {
        if (living_led_state != boolvalue) {
          living_led_state = boolvalue;
          Firebase.setBool(firebaseData, add_living_led_state, boolvalue);
          continue;
        }
      }
      if (key.equals("dinningledstate")) {
        if (dinning_led_state != boolvalue) {
          dinning_led_state = boolvalue;
          Firebase.setBool(firebaseData, add_dinning_led_state, boolvalue);
          continue;
        }
      }
      if (key.equals("bedrledstate")) {
        if (bedR_led_state != boolvalue) {
          bedR_led_state = boolvalue;
          Firebase.setBool(firebaseData, add_bedR_led_state, boolvalue);
          continue;
        }
      }
      if (key.equals("resrledstate")) {
        if (resR_led_state != boolvalue) {
          resR_led_state = boolvalue;
          Firebase.setBool(firebaseData, add_resR_led_state, boolvalue);
          continue;
        }
      }
      if (key.equals("gacledstate")) {
        if (mode_warning != boolvalue) {
          Gac_led_state = boolvalue;
          Firebase.setBool(firebaseData, add_gac_led_state, boolvalue);
          continue;
        }
      }
    }
  }
}
