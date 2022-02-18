echo ""
echo "[Note] Target OS version  >>> Ubuntu 20.04.x (focal)"
echo "[Note] Target ROS version >>> ROS2 Foxy Fitzroy"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[Set the Locale]"
sudo apt update -y && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

echo "[Add ROS2 Repository]"
sudo apt update -y && sudo apt install -y curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
#sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

echo "[Install ROS2 Foxy Fitzroy Desktop]"
sudo apt update -y && sudo apt install -y ros-foxy-desktop ros-foxy-rmw-fastrtps* ros-foxy-rmw-cyclonedds*
sudo apt update -y && sudo apt install -y build-essential cmake git libbullet-dev python3-colcon-common-extensions python3-flake8 python3-pip python3-pytest-cov python3-rosdep python3-setuptools python3-vcstool wget
python3 -m pip install -U argcomplete flake8-blind-except flake8-builtins flake8-class-newline flake8-comprehensions flake8-deprecated flake8-docstrings flake8-import-order flake8-quotes pytest-repeat pytest-rerunfailures pytest
sudo apt install --no-install-recommends -y libasio-dev libtinyxml2-dev libcunit1-dev

echo "[Set ROS2 Environment]"
sh -c "echo \"source /opt/ros/foxy/setup.bash\" >> ~/.bashrc"
sh -c "echo \"source /opt/ros/foxy/setup.zsh\" >> ~/.zshrc"

echo "[Install Turtlesim]"
sudo apt install ros-foxy-turtlesim -y

echo "[Install ros2bag]"
sudo apt install -y ros-foxy-ros2bag ros-foxy-rosbag2-transport ros-foxy-rosbag2-storage-default-plugins

echo "[Install Gazebo]"
sudo apt install -y ros-foxy-gazebo-ros-pkgs

echo "[Execute ROS2 Enviironment]"
source /opt/ros/foxy/setup.bash
