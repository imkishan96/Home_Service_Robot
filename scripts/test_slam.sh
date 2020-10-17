#!/bin/sh

# change the catkin_ws path if you have different path
source_catkin="source ~/catkin_ws/devel/setup.bash;"
#change the model if you wanna use another model
export_model="export TURTLEBOT3_MODEL=burger;"

xterm -e  "
$source_catkin 
$export_model
roslaunch home_service_robot turtlebot_world.launch" &
sleep 5

xterm -e "
$source_catkin
$export_model
roslaunch home_service_robot view_navigation.launch config_file:=test_slam;" &
sleep 5

xterm -e  "
$source_catkin 
$export_model
roslaunch home_service_robot gmapping_demo.launch" &
sleep 5

xterm -e  "
$source_catkin 
$export_model
roslaunch home_service_robot keyboard_teleop.launch" &
sleep 5
