#include <LiquidCrystal_I2C.h>
#include <Arduino.h>
LiquidCrystal_I2C lcd(0x27, 16, 2);
int dem_Menu = 0;
//////
int btn_warning = 13;
int btn_living = 12;
int btn_dinning = 11;
int btn_resRoom = 10;
int btn_GAC = 9;
//int btn_bed = 8;
int btn_Menu = 7;
//////
int led_waring = 6;
int led_living = 5;
int led_dinning = 4;
int led_resR = 3;
int led_GAC = 2;
int led_bed = 8;

bool led_state_waring = 0;
bool led_state_living = 0;
bool led_state_dinning = 0;
bool led_state_resR = 0;
bool led_state_GAC = 0;
bool led_state_bed = 0;

bool tt_warning = 0;
bool tt_living = 0;
bool tt_dining = 0;
bool tt_resR = 0;
bool tt_GAC = 0;
bool tt_Menu = 0;
//bool tt_bed = 0;
/////
bool mode_warning = false;
/////
unsigned long t_baoDong = 0;
////
int LM35 = A3;
////
String Char;
void setup() {
  lcd.init();
  lcd.backlight();
  //////
  pinMode(btn_warning, INPUT);
  pinMode(btn_dinning, INPUT);
  pinMode(btn_GAC, INPUT);
  pinMode(btn_resRoom, INPUT);
  pinMode(btn_living, INPUT);
  pinMode(btn_Menu, INPUT);
  // pinMode(btn_bed, INPUT);
  /////
  pinMode(led_waring, OUTPUT);
  pinMode(led_dinning, OUTPUT);
  pinMode(led_GAC, OUTPUT);
  pinMode(led_resR, OUTPUT);
  pinMode(led_living, OUTPUT);
  pinMode(led_bed, OUTPUT);
  ////
  Serial.begin(9600);
}

void loop() {
  while (Serial.available() > 0) {
    String receivedChar = Serial.readStringUntil('\n');
    // Serial.println(receivedChar);
    int vt = receivedChar.indexOf(":");
    if (vt != -1) {
      String key = receivedChar.substring(0, vt);
      String value = receivedChar.substring(vt + 1);
      key.trim();
      value.trim();
      //  Serial.println(key);
      //  Serial.println(value);

      bool boolvalue;
      boolvalue = value == ("1");
      if (key.equals("modewarning")) {
        if (mode_warning != boolvalue) {
          mode_warning = boolvalue;
          continue;
        }
        //   temp_mode_warning = boolvalue;
      }
      if (key.equals("warningledstate")) {
        if (led_state_waring != boolvalue) {
          led_state_waring = boolvalue;
          continue;
        }
        // temp_state_waring = boolvalue;
      }
      if (key.equals("livingledstate")) {
        if (led_state_living != boolvalue) {
          led_state_living = boolvalue;
          continue;
        }
        //temp_state_living = boolvalue;
      }
      if (key.equals("dinningledstate")) {
        if (led_state_dinning != boolvalue) {
          led_state_dinning = boolvalue;
          continue;
        }
        //temp_state_dinning = boolvalue;
      }
      if (key.equals("bedrledstate")) {
        if (led_state_bed != boolvalue) {
          led_state_bed = boolvalue;
          led_state_resR = boolvalue;
          continue;
        }
        //temp_state_bed = boolvalue;
      }
      if (key.equals("resrledstate")) {
        //temp_state_resR = boolvalue;
        if (led_state_resR != boolvalue) {
          led_state_resR = boolvalue;
          led_state_bed = boolvalue;

          continue;
        }
      }
      if (key.equals("gacledstate")) {
        if (led_state_GAC != boolvalue) {
          led_state_GAC = boolvalue;
          continue;
        }
        //temp_state_GAC = boolvalue;
      }
    }
  }
  lcd.setCursor(0, 0);
  lcd.print("Menu");
  bool readBD = digitalRead(btn_warning);
  bool readBEP = digitalRead(btn_dinning);
  bool readHOC = digitalRead(btn_resRoom);
  bool readGAC = digitalRead(btn_GAC);
  bool readKHACH = digitalRead(btn_living);
  bool readMenu = digitalRead(btn_Menu);
//  bool readNGU = digitalRead(btn_bed);


  //Phần đèn báo động
  if (readBD) {
    if (!tt_warning) {
      mode_warning = !mode_warning;
      Serial.println("modewarning:" + String(mode_warning));
    }
    tt_warning = readBD;
  } else {
    tt_warning = readBD;
  }

  if (mode_warning) {
    if (millis() - t_baoDong >= 300) {
      t_baoDong = millis();
      led_state_waring = !led_state_waring;
      Serial.println("warningledstate:" + String(led_state_waring));
    }
  } else {
    led_state_waring = 0;
    digitalWrite(led_waring, led_state_waring);
  }

  // Phần đèn bếp //
  if (readBEP) {
    if (!tt_dining) {
      led_state_dinning = !led_state_dinning;
      Serial.println("dinningledstate:" + String(led_state_dinning));
    }
    tt_dining = readBEP;
  } else {
    tt_dining = readBEP;
  }


  // Phần đèn KHÁCH //
  if (readKHACH) {
    if (!tt_living) {
      led_state_living = !led_state_living;
      Serial.println("livingledstate:" + String(led_state_living));
    }
    tt_living = readKHACH;
  } else {
    tt_living = readKHACH;
  }


  //Phần Đèn HỌC //
  if (readHOC) {
    if (!tt_resR) {
      led_state_resR = !led_state_resR;
      Serial.println("resrledstate:" + String(led_state_resR));
      led_state_bed = !led_state_bed;
      Serial.println("bedrledstate:" + String(led_state_bed));
    }
    tt_resR = readHOC;
  } else {
    tt_resR = readHOC;
  }


  // Phần đèn GÁC //
  if (readGAC) {
    if (!tt_GAC) {
      led_state_GAC = !led_state_GAC;
      Serial.println("gacledstate:" + String(led_state_GAC));
    }
    tt_GAC = readGAC;
  } else {
    tt_GAC = readGAC;
  }


  //Phần đèn NGỦ
  // if (readNGU) {
  //   if (!tt_bed) {
  //     led_state_bed = !led_state_bed;
  //     Serial.println("bedrledstate:" + String(led_state_bed));
  //   }
  //   tt_bed = readNGU;
  // } else {
  //   tt_bed = readNGU;
  // }

  //xử lý bật/tắt đèn
  digitalWrite(led_waring, led_state_waring);
  digitalWrite(led_living, led_state_living);
  digitalWrite(led_bed, led_state_bed);
  digitalWrite(led_dinning, led_state_dinning);
  digitalWrite(led_GAC, led_state_GAC);
  digitalWrite(led_resR, led_state_resR);

  //kiểm tra lại giá trị đèn nếu có thay đổi
  //Phần đèn Menu
  if (readMenu) {
    if (!tt_Menu) {
      lcd.clear();
      dem_Menu == 5 ? dem_Menu = 0 : dem_Menu++;
    }
    tt_Menu = readMenu;
  } else {
    tt_Menu = readMenu;
  }
  if (dem_Menu == 1) {
    lcd.setCursor(0, 0);
    lcd.print("Phong Khach: ");
    if (digitalRead(led_living) == HIGH) {
      lcd.setCursor(12, 0);
      lcd.print("ON ");
    } else {
      lcd.setCursor(12, 0);
      lcd.print("OFF");
      Serial.println("OFF");
    }
  }
  if (dem_Menu == 2) {
    lcd.setCursor(0, 0);
    lcd.print("Phong Bep:    ");
    if (digitalRead(led_dinning) == HIGH) {
      lcd.setCursor(10, 0);
      lcd.print("ON ");
    } else {
      lcd.setCursor(10, 0);
      lcd.print("OFF");
    }
  }
  if (dem_Menu == 3) {
    lcd.setCursor(0, 0);
    lcd.print("Phong Hoc:    ");
    if (digitalRead(led_resR) == HIGH) {
      lcd.setCursor(10, 0);
      lcd.print("ON ");
    } else {
      lcd.setCursor(10, 0);
      lcd.print("OFF");
    }
  }
  if (dem_Menu == 4) {
    lcd.setCursor(0, 0);
    lcd.print("Phong Gac:    ");
    if (digitalRead(led_GAC) == HIGH) {
      lcd.setCursor(10, 0);
      lcd.print("ON ");
    } else {
      lcd.setCursor(10, 0);
      lcd.print("OFF");
    }
  }
  // if (dem_Menu == 5) {
  //   lcd.setCursor(0, 0);
  //   lcd.print("Phong Ngu:    ");
  //   if (digitalRead(led_bed) == HIGH) {
  //     lcd.setCursor(10, 0);
  //     lcd.print("ON ");
  //   } else {
  //     lcd.setCursor(10, 0);
  //     lcd.print("OFF");
  //   }
  // }
}
