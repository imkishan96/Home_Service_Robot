#!/bin/sh

# change the catkin_ws path if you have different path
source_catkin="source ~/catkin_ws/devel/setup.bash;"

script_dir=$(dirname $(realpath $0))
HSR_dir=$(dirname $script_dir)
launch_dir=$HSR_dir/launch

xterm -hold -e  "
$source_catkin 
export TURTLEBOT3_MODEL=burger; 
roslaunch $launch_dir/turtlebot_world.launch" &
sleep 5

xterm -e "
rosrun rviz rviz;"
sleep 5

xterm -hold -e  "
$source_catkin 
roslaunch $launch_dir/gmapping_demo.launch" &
sleep 5


