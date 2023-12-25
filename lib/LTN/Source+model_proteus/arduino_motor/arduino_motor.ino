#include <Stepper.h>

#include<LiquidCrystal_I2C.h>
#include<Servo.h>
const int steps = 2048;
Stepper mystepper = Stepper(steps,8,10,9,11);
Servo myservo;
////
int pot = A0;
LiquidCrystal_I2C lcd(0x27,16,2);
int mode = -1;
int btn1 = 13;
int btn2 = 12;
int btn3 = 7;
int btn4 = 6;
int btnMotor = 10;
int tt_Motor = false;
int tt_Quat = 0;
int ledSan = 3;
/////
/////
int tt1 = 0;
int tt2 = 0;
int tt3 = 0;
int tt4 = 0;
int mk1 = 0;
int mk2 = 0;
int mk3 = 0;
//////
int count1 = -1;
int count2 = -1;
int count3 = -1;
int pass1 = -1;
int pass2 = -1;
int pass3 = -1;
int NhapLai = 0;
int demSai = 0;
bool checkAn1 = true;
bool checkAn2 = true;
bool checkAn3 = true;
bool xacNhan = false;
bool checkNhapLai = true;
bool reset = false;
bool khoaHT = false;
bool dung = true;
bool start = false;// để ngăn read1 không đưa chương trình về mode 0 khi đang thay đổi password
unsigned long t_XacNhan = 0;
unsigned long t_batDau = 0;
unsigned long t_high = 0;
unsigned long t_high2 = 0;
unsigned long t_low = 0;
int ht = 0;
////
void setup() {
  mystepper.setSpeed(15);
  ///
  Serial.begin(9600);
  // Khai báo LCD
  lcd.init();
  lcd.backlight();
  // Khai báo Chân nút nhấn
  pinMode(btn1,INPUT);
  pinMode(btn2,INPUT);
  pinMode(btn3,INPUT);
  pinMode(btn4,INPUT);
  pinMode(ledSan,OUTPUT);
  pinMode(btnMotor,INPUT);
  myservo.attach(A1);
}

void loop() {
  bool readMotor = digitalRead(btnMotor);
  //////
  /////
  bool read4 = digitalRead(btn4);

  bool read1 = digitalRead(btn1);
  bool read2 = digitalRead(btn2);
  bool read3 = digitalRead(btn3);
  // Phần mở CLD nhập password
  if(start == false){
    if(read1 == HIGH){
    if(t_batDau == 0){
      t_batDau = millis();
    }
  }
  else{
    if(t_batDau != 0 && millis() - t_batDau >= 3000){
        mode = 0;
        t_batDau = 0;
    }
  }
  }

 switch(mode){
   case 0:{
     lcd.setCursor(0,0);
     lcd.print("Password:");
     if(checkAn1){
        lcd.setCursor(9,0);
        lcd.print("*");
     }
     if(checkAn2){
        lcd.setCursor(10,0);
        lcd.print("*");
     }
     if(checkAn3){
        lcd.setCursor(11,0);
        lcd.print("*");
     }
     
      if(read1 != tt1){
        if(tt1 == HIGH){
          checkAn1 = false;
          count1++;
          if(count1>9){
            count1 = 0;
          }
          lcd.setCursor(9,0);
          lcd.print(count1);
        }
        tt1 = read1;
      }
      if(read2 != tt2){
        if(tt2 == HIGH){
          checkAn2 = false;
          count2++;
          if(count2>9){
            count2 = 0;
          }
          lcd.setCursor(10,0);
          lcd.print(count2);
        }
        tt2 = read2;
      }
      if(read3 != tt3){
        if(tt3 == HIGH){
          checkAn3 = false;
          reset = true;
          dung = false;
          count3++;
          t_XacNhan = millis();
          if(count3>9){
            count3 = 0;
          }
          lcd.setCursor(11,0);
          lcd.print(count3);
        }
        tt3 = read3;
      }
      if(dung == false){
          if(t_XacNhan != 0 && reset == true && (millis() - t_XacNhan >= 2000)){
        t_XacNhan = millis();
        if(count1 == mk1 && count2 == mk2 && count3 == mk3){
          lcd.clear();
          mode = 1;
        }
        else{
          mode = 2;
          checkNhapLai = true;
          demSai++;
          if(demSai == 1){
            NhapLai = 10;
          }
          else if(demSai == 2){
            NhapLai = 15;
          }
          else if(demSai == 3){
            NhapLai = 20;
          }
          else if(demSai == 4){
            khoaHT = true;
          }
        }
      }
      }
     break;
   }
   case 1:{  
     lcd.setCursor(2,0);
     lcd.print("SUCCESSFULLY");
     //delay(1000);
     //lcd.clear();
     lcd.setCursor(0,0);
     lcd.print("");
      // Phần đèn sân
    int value = analogRead(pot);
    int vol = map(value,0,1023,0,255);
    analogWrite(ledSan,vol);
      // if(tt_Quat != readMotor){
      //   if(tt_Quat == HIGH){
      //     tt_Motor = !tt_Motor;
      //   }
      //     tt_Quat = readMotor;
      //   }
      //   if(tt_Motor){
      //     myservo.write(180);
      //   }else{
      //     myservo.write(0);
      //   }
      mystepper.step(8*steps);
      mystepper.setSpeed(0);
      // Phần thay đổi password
      if(read2 == HIGH){
        if(t_high == 0){
          t_high = millis();
        }
      }else{
        if(t_high!=0&&millis()-t_high>=3000){
          //dung = true;
          mode = 3;
          start = true;
        }
      }
      if(tt4 != read4){
        if(tt4 == HIGH){
          //lcd.clear();
          ht++;
        }
        tt4 = read4;
      }
        if(ht == 1){
    lcd.setCursor(0,0);
    lcd.print("Phong Khach:2 nut,2 den");
    lcd.setCursor(0,1);
    lcd.print("den sang, bao dong");
  }
  if(ht == 2){
    lcd.setCursor(0,0);
    lcd.print("Phong Hoc:2 nut,5 den");
    lcd.setCursor(0,1);
    lcd.print("3 den, 2 den bao dong");
  }
  if(ht == 3){
    lcd.setCursor(0,0);
    lcd.print("Phong Gac:2 nut,2 den");
    lcd.setCursor(0,1);
    lcd.print("1 den, 1 den bao dong");
  }
     break;
   }
   case 2:{
      if(khoaHT){
        lcd.clear();
        lcd.setCursor(4,0);
        lcd.print("WARNING");
        lcd.setCursor(0,1);
        lcd.print("He Thong Da Khoa");
        mode = -1;
      } else{
        if(checkNhapLai){
          lcd.setCursor(0,0);
          lcd.print("PASSWORD ERROR");
          lcd.setCursor(0,1);
          lcd.print("Nhap Lai Sau:");
          lcd.setCursor(13,1);
          lcd.print(NhapLai);
          if(NhapLai<=0){
            checkNhapLai = false;
          }
          if(NhapLai<10){
            lcd.setCursor(14,1);
            lcd.print(" ");
          }
          NhapLai--;
          delay(300);
          }
          else{
          lcd.setCursor(9,0);
          lcd.print("      ");
          lcd.setCursor(0,1);
          lcd.print("                ");
          tt1 = 0;
          tt2 = 0;
          tt3 = 0;
          count1 = -1;
          count2 = -1;
          count3 = -1;
          checkAn1 = true;
          checkAn2 = true;
          checkAn3 = true;
          reset = false;
          mode = 0;
          
        }
        break;
      }
    } 

    case 3:{
      lcd.setCursor(0,0);
      lcd.print("CHANGE PASSWORD");
      lcd.setCursor(0,1);
      lcd.print("NEW PASS:");

      if(read1 != tt1){
        if(tt1 == HIGH){
          start = true;
          pass1++;
          if(pass1>9){
            pass1 = 0;
          }
          lcd.setCursor(9,1);
          lcd.print(pass1);
        }
        tt1 = read1;
      }

      if(read3 != tt3){
        if(tt3 == HIGH){
          pass3++;
          dung = true;
          if(pass3>9){
            pass3 = 0;
          }
          lcd.setCursor(11,1);
          lcd.print(pass3);
        }
        tt3 = read3;
      }
      if(read2 == HIGH){
        if(t_high == 0){
          t_high = millis();
        }
        else if(t_low != 0 && t_high2 == 0){
          t_high2 = millis();
        }
      }
      else{
        if(t_high != 0 && t_high2 == 0 && millis() - t_high>= 3000){
          // Nhấn giữ
          mode = 3;
          t_high = 0;
          t_low = 0;
        }
        else if(t_high2 != 0 && millis()-t_high<=1000){
          // Nhấn double
          mk1 = pass1;
          mk2 = pass2;
          mk3 = pass3;
          // EEPROM.update(dc1,pass1);
          // EEPROM.update(dc2,pass2);
          // EEPROM.update(dc3,pass3);
          lcd.setCursor(0,0);
          lcd.print("CHANGE PASSWORD");
          lcd.setCursor(0,1);
          lcd.print("               ");
          lcd.setCursor(2,1);
          lcd.print("SUCCESSFULLY");
          delay(2000);
          lcd.clear();
          count1 = -1;
          count2 = -1;
          count3 = -1;
          checkAn1 = true;
          checkAn2 = true;
          checkAn3 = true;
          pass1 = -1;
          pass2 = -1;
          pass3 = -1;
          mode = 0;
          t_high = 0;
          t_high2 = 0;
          t_low = 0;
        }
        else{
          if(t_high != 0 && millis()-t_high > 1000){
            if(t_high2 != 0 && millis()-t_high2>=3000){
              // Nhấn giữ
              t_high = 0;
              t_high2 = 0;
              t_low = 0;
            }
            else{
              //Nhấn  
              pass2++;
              lcd.setCursor(10,1);
              lcd.print(pass2);
              if(pass2>9){
                pass2 = 0;
              }
              t_high = 0;
              t_high2 = 0;
              t_low = 0;
            }
          }else{
            if(t_high != 0){
              t_low = millis();
            }
          }
        }
      }
      break;
    }

  }

  // if(ht == 4){
  //   lcd.setCursor(0,0);
  //   lcd.print("Khu San:,2 den");
  //   lcd.setCursor(0,1);
  //   lcd.print("1 den, 1 den bao dong");
  // }
}



































