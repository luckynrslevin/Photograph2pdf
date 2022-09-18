# Filename: Dockerfile
FROM ubuntu:20.04

mkdir /home/Photograph2pdf

WORKDIR /home/Photograph2pdf

# Avoid configuration questions of e.g. CMake package
# Maybe there is a better option to set the configuration somehow ...
export DEBIAN_FRONTEND=noninteractive

apt install -yq git
apt install -yq vim
apt install -yq build-essential 
apt install -yq cmake
apt install -yq libopencv-dev
apt install -yq libboost-dev
apt install -yq libtesseract-dev
git clone https://github.com/cfanatic/cv-birdview
cd cv-birdview
sed -i.bu 's/OpenCV 4.1.0/OpenCV 4.2.0/' CMakeLists.txt
cmake CMakeLists.txt
make
