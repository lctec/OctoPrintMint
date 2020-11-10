## FUENTE https://community.octoprint.org/t/setting-up-octoprint-on-a-raspberry-pi-running-raspbian/2337/


sudo apt update
sudo apt install python3-pip python-dev python-setuptools python3-virtualenv git libyaml-dev build-essential
sudo apt-get install v4l-utils    #dependencias para webcam stream

sudo mkdir /OctoPrint && cd /OctoPrint
virtualenv venv
source venv/bin/activate
sudo pip3 install pip --upgrade
pip install octoprint

##You may need to add the $USER to the dialout group and tty so that the user can access the serial ports:

sudo usermod -a -G tty $USER
sudo usermod -a -G dialout $USER


#### /OctoPrint/venv/bin/octoprint serve


######## Support restart/shutdown through OctoPrint's system menu

##In Settings > Commands, configure the following commands:

##    Restart OctoPrint: sudo service octoprint restart
##    Restart system: sudo shutdown -r now
##    Shutdown system: sudo shutdown -h now



###demonio
wget https://github.com/OctoPrint/OctoPrint/raw/master/scripts/octoprint.service && sudo mv octoprint.service /etc/systemd/system/octoprint.service
### editar /etc/systemd/system/octoprint.service

ExecStart=/home/pi/OctoPrint/venv/bin/octoprint (ruta del ejecutable)
## modificar usuario

sudo systemctl enable octoprint.service



####################  Requisitos para  octolapse Linux Mint 20  ####################################################
sudo apt install subversion libjpeg-turbo8-dev imagemagick ffmpeg libv4l-dev cmake
git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental
##export LD_LIBRARY_PATH=/Octoprint/mjpg-streamer/mjpg-streamer-experimental
export LD_LIBRARY_PATH=/Octoprint/mjpg-streamer/mjpg-streamer-experimental/plugins
make

############################3
sleep 5
cd /Octoprint/mjpg-streamer/mjpg-streamer-experimental/
mjpg_streamer -i "./input_uvc.so -d /dev/video0 -r 1920x1080" -o "./output_http.so"

127.0.0.1:8080/?action=stream


#####################EVITAR
rm /etc/apt/preferences.d/nosnap.pref sudo apt update
apt update

apt install snapd
snap install mjpg-streamer
apt-get install v4l-utils

