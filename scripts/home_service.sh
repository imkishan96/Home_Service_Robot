#!/bin/sh

# change the catkin_ws path if you have different path
source_catkin="source ~/u_catkin_ws/devel/setup.bash;"

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
roslaunch home_service_robot view_navigation.launch config_file:=home_service;" &
sleep 5

xterm -T "AMCL" -geometry 70x6+0+1300 -e "
$source_catkin
$export_model
roslaunch home_service_robot amcl_demo.launch;" &
sleep 5

xterm -T "PICK_OBJECT" -geometry 80x9+800+1300 -e "
$source_catkin
$export_model
rosrun pick_objects pick_objects_node;" &
sleep 1

xterm -T "ADD_MARKER" -geometry 70x9+1700+1300 -e "
$source_catkin
$export_model
rosrun add_markers add_markers_node;" &
sleep 1