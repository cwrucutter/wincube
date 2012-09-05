//based on http://www.ros.org/wiki/joy/Tutorials/WritingTeleopNode

#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <wincube/cmd_msg.h>

class TeleopWinCube
{
public:
  TeleopWinCube();

private:
  void joyCallback(const sensor_msgs::Joy::ConstPtr& joy);
  
  ros::NodeHandle nh_;

  int leftaxis, rightaxis;

  ros::Publisher cmd_pub_;
  ros::Subscriber joy_sub_;
};


TeleopWinCube::TeleopWinCube():
  leftaxis(1), rightaxis(4)
{
  nh_.param("leftaxis",  leftaxis, leftaxis);
  nh_.param("rightaxis", rightaxis, rightaxis);

  cmd_pub_ = nh_.advertise<wincube::cmd_msg>("wincube/command", 1);

  joy_sub_ = nh_.subscribe<sensor_msgs::Joy>("throttled_joy", 10, &TeleopWinCube::joyCallback, this);
}

void TeleopWinCube::joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
{
  wincube::cmd_msg c;

  int scale = 100; //TODO: increase to 128

  ROS_INFO("Left: %d, Right: %d",(int)(scale*joy->axes[leftaxis]), (int)(scale*joy->axes[rightaxis]));

  c.left = (int)(scale*joy->axes[leftaxis]);
  c.right = (int)(scale*joy->axes[rightaxis]);
  cmd_pub_.publish(c);
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "teleop_wincube");
  TeleopWinCube teleoperatedBoxWineOnWheels;

  ros::spin();
}
