#!/bin/sh

# change the catkin_ws path if you have different path
source_catkin="source ~/catkin_ws/devel/setup.bash;"
#change the model if you wanna use another model
export_model="export TURTLEBOT3_MODEL=burger;"

script_dir=$(dirname $(realpath $0))
HSR_dir=$(dirname $script_dir)
launch_dir=$HSR_dir/launch

xterm -e  "
$source_catkin 
$export_model
roslaunch home_service_robot turtlebot_world.launch" &
sleep 5

xterm -e "
$source_catkin
$export_model
roslaunch home_service_robot view_navigation.launch;" &
sleep 5

xterm -e "
$source_catkin
$export_model
roslaunch home_service_robot amcl_demo.launch;" &
sleep 5