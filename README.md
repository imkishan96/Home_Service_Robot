# Home_Service_Robot
Final udacity project

## clone
use `--recursive` option while clonning to get other external repositories
```
cd ~/catkin_ws/src
git clone --recursive https://github.com/imkishan96/Home_Service_Robot.git

```
## build

```
cd ..
catkin_make
```

## prepare
install xterminal if you don't have already
```
sudo apt-get install xterm
```
go to script dir & turn scripts into executable with `chmod +x`
```
roscd home_service_robot
cd ../scripts
chmod +x test_slam.sh navigation.sh pick_objects.sh add_markers.sh home_service.sh 
```

## debug

if roscore is up inbetween running two scrips make sure to clear ros param server
