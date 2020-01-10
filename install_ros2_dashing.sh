echo ""
echo "[Note] Target OS version  >>> Ubuntu 18.04.x (bionic)"
echo "[Note] Target ROS version >>> ROS2 Dashing Diademata"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[Set the Locale]"
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

echo "[Add ROS2 Repository]"
sudo apt update -y && sudo apt install curl gnupg2 lsb-release -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

echo "[Install ROS2 Dashing Desktop]"
sudo apt update -y
sudo apt install ros-dashing-desktop -y
source /opt/ros/dashing/setup.bash
sudo apt install python3-argcomplete -y

echo "[Set the ROS2 Environment]"
sh -c "echo \"source /opt/ros/dashing/setup.bash\" >> ~/.bashrc"

echo "[Install Turtlesim]"
sudo apt install ros-dashing-turtlesim -y
