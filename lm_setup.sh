#!/bin/bash
# Copy world assets
cp -f worlds/*.world ../PX4/PX4-Autopilot/Tools/sitl_gazebo/worlds/
cp -af ./worlds/models/terrain3d/ ~/.gazebo/models
cp -af ./worlds/models/terrain2d/ ~/.gazebo/models

# Copy vehicle and sensor assets
cp -af models/. ../PX4/PX4-Autopilot/Tools/sitl_gazebo/models/
cp ./ROMFS/1043_iris_lmlidar ../PX4/PX4-Autopilot/ROMFS/px4fmu_common/init.d-posix/airframes/
cp ./ROMFS/1043_iris_lmlidar ../PX4/PX4-Autopilot/build/px4_sitl_default/etc/init.d-posix/airframes/

# Copy cmake file
cp -f cmake/sitl_target.cmake ../PX4/PX4-Autopilot/platforms/posix/cmake/sitl_target.cmake

# Copy other helpful files
cp scritps/set_home.sh ../PX4/PX4-Autopilot/
cp px4_param_defaults/iris_defaults ../PX4/PX4-Autopilot/build/px4_sitl_default/tmp/rootfs/

# Change to the PX4 directory
cd ../PX4/PX4-Autopilot/

# Build and check that everything worked
make px4_sitl list_vmd_make_targets | grep -o gazebo_iris_lmlidar__terrain2d
make px4_sitl list_vmd_make_targets | grep -o gazebo_iris_lmlidar__terrain3d