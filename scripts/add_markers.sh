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
roslaunch home_service_robot view_navigation.launch config_file:=add_markers ;" &
sleep 5

xterm -e "
$source_catkin
$export_model
roslaunch home_service_robot amcl_demo.launch;" &
sleep 10

xterm -hold -e "
$source_catkin
$export_model
rosrun add_markers add_markers_node;" &
sleep 5