unsigned char Buff[250];  
unsigned char BuffIndex; 
#include<Servo.h>              //Servo library
Servo servo_test;        //initialize a servo object for the connected servo             
int angle = 0;   

void setup()
  {    
    Serial.begin(9600);    
    servo_test.attach(8);   
    Serial.println("AT+CMGF=1");    
    delay(300);    
    Serial.println("AT+CNMI=2,2,0,0,0");   
    memset(Buff, '\0', 250);// Initialize the string   
    BuffIndex=5; 
    servo_test.write(80); 
  }
void loop()
  {      
          if(Serial.available()>0)
          {             
            Buff[BuffIndex] = Serial.read();                        
            if( (Buff[BuffIndex-3] == 'F') && (Buff[BuffIndex-2] == 'E') && (Buff[BuffIndex-1] == 'E') && (Buff[BuffIndex] == 'D'))
              {    
                servo_test.write(180);
                delay(400);  
                servo_test.write(80);         
                sendMessage(); 
              }
                BuffIndex++;              
                if(BuffIndex>250)
                {                   
                  BuffIndex=5;              
                } 
          }}
          
void sendMessage()
{
                Serial.println("Sending Msg....");
                Serial.println("AT+CMGF=1");    //Sets the GSM Module in Text Mode
                delay(1000);  // Delay of 1000 milli seconds or 1 second
                Serial.println("AT+CMGS=\"+917990244772\"\r"); // Replace x with mobile number
                delay(1000);
                Serial.println("Feeding has been done");// The SMS text you want to send
                delay(100);
                Serial.println((char)26);// ASCII code of CTRL+Z
                delay(1000);
                
}

