#Get the path of the script
script_path=$(dirname $(realpath $0))

#Copy the file to /usr/local/bin and change permissions to match the other files in that directory.

sudo cp $script_path/../mfc.sh /usr/local/bin/mfc
sudo chown root:root /usr/local/bin/mfc
sudo chmod a-rwx /usr/local/bin/mfc
sudo chmod a+rx /usr/local/bin/mfc
sudo chmod u+w /usr/local/bin/mfc
