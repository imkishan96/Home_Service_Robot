# Home_Service_Robot
This repository containes launch files, shell scrips and external ros packages to perform mapping, localization, navigation & path-planning in gazebo simulation which collectively represents Home_Service_Robot project from Udacity ND: Robotics Software Engineer

tested with ros melodic on ubuntu 18.04

## Clone
use `--recursive` option while clonning to get other external repositories
```
cd ~/catkin_ws/src
git clone --recursive https://github.com/imkishan96/Home_Service_Robot.git

```
## Build

```
cd ..
catkin_make
source devel/setup.bash
```

## Prepare
install xterminal if you don't have already
```
sudo apt-get install xterm
```
go to scripts dir & turn scripts into executable with `chmod +x`
```
roscd home_service_robot
cd ../scripts
chmod +x test_slam.sh test_navigation.sh pick_objects.sh add_markers.sh home_service.sh 
```
## Scripts

### test_slam
This script will launch turtlebot3 in the gazebo environment along with gmapping node rviz and teleop keyboard. 
execute `test_slam.sh` shell script
```
roscd home_service_robot
cd ../scripts
./test_slam.sh
```
click on the last terminal to teleoperate the robot and map the world, move around slowly to get an accurate map. once satisfied export the map using map_server node. (it's not necessary to perform mapping, this map is already available in the map dir)
```
rosrun map_server map_saver -f map1
```
### test_navigation
This script will launch turtlebot3 in the gazebo world along with map_server, amcl, and move_base node. as a result, the robot can localize and navigate its self on the map generated from the test_slam script.
```
./test_navigation.sh
```
use 2D nav goal from rviz and send goal for the robot. 
### pick_objects
This script in addition to the test_navigation will launch the pick_objects node which will send multiple `2D NAV goal` locations to the navigation stack to simulate pick up and drop-off motion.
```
./pick_objects.sh
```
### add_markers
This script will publish markers on the rviz to simulate the virtual object being picked up from a location and dropped off after 5 sec to the dropoff zone
```
./add_markers.sh
```
### home_service
This final script will bring all together and simulate the robot picking up and droping off the virtual part while localizing and navigating through the world. 
```
./home_service.sh
```

## debug

if roscore is up inbetween running two scrips make sure to clear ros param server
