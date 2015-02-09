
#adb root and remount the device
device_root()
{
	adb wait-for-device
	adb root
	adb wait-for-device
	adb remount
	adb wait-for-device
	echo "adb root and remount ok!!!"
}


SENSORS_PATH="."
PUSH_PATH="system/bin"
BIN_NAME="test-sensorservice"

#push binary
push_bin()
{
#$1 the binary name
#$2 the binary path
#$3 the push path

	adb push $2/$1 $3
	adb shell "chmod 755 $3/$1"
}

se_log_motion_sensors()
{
	_motionSensors="acc mag gyro"

	rm resullt.log 2>/dev/null

	for _dev in $_motionSensors
	do
		echo "$_dev:" >> resullt.log
		adb shell "$BIN_NAME $_dve" >> result.log $
	        echo "$!" > temp.pid
		sleep 5
		kill -INT $(cat temp.pid) 2>/dev/null
		rm temp.pid
	done
}

# script start here
device_root
push_bin $BIN_NAME $SENSORS_PATH $PUSH_PATH
se_log_motion_sensors



