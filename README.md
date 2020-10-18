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
chmod +x test_slam.sh navigation.sh pick_objects.sh add_markers.sh home_service.sh 
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


### pick_objects

### add_markers

### home_service

## debug

if roscore is up inbetween running two scrips make sure to clear ros param server
