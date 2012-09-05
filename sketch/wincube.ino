// let the win cube show how it wins

#include <Servo.h> 
#include <ros.h>
#include <learning_win/cmd_msg.h>

ros::NodeHandle nh;
 
Servo right_servo;  // create servo object to control a servo 
Servo left_servo;   // a maximum of eight servo objects can be created 
 
//1500 nominal calibrated 
int left_speed_base = 1496; 
int right_speed_base = 1482;

int right_speed = 0; // -100 to 100
int left_speed = 0;

void cmd_cb( const learning_win::cmd_msg& cm)
{
  right_speed = cm.right;
  left_speed = cm.left;
  
  //detach servos when not in use: no brakes, but no jitter
  if (right_speed == 0)
    right_servo.detach();
  else
    right_servo.attach(9);
    
  if (left_speed == 0)
    left_servo.detach();
  else
    left_servo.attach(10);
    
  right_servo.writeMicroseconds(right_speed_base + right_speed);
  left_servo.writeMicroseconds(left_speed_base + (left_speed * -1)); 

  digitalWrite(13, HIGH-digitalRead(13));  //toggle das blinkenlight
}

//This has to go at the toplevel, after the callback is defined, it seems!?
ros::Subscriber<learning_win::cmd_msg> sub("wincube/command", cmd_cb);

void setup() 
{   
  //right_servo.attach(9);  // attaches the servo on pin 9 to the servo object 
  //left_servo.attach(10);
  
  pinMode(11, OUTPUT); // buzzer
  pinMode(12, OUTPUT); // blinkenlights
  pinMode(13, OUTPUT);
  
  nh.initNode();
  nh.subscribe(sub);
}
 
void loop() 
{
  nh.spinOnce();
  delay(100);
}
