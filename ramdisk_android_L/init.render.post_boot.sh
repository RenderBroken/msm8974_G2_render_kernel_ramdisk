#!/system/bin/sh

BB=/sbin/busybox

############################
# Custom Kernel Settings for Render Kernel!!
#

stop mpdecision

############################
# MSM_Hotplug Settings
#
echo 2 > /sys/module/msm_hotplug/cpus_boosted
echo 750 > /sys/module/msm_hotplug/down_lock_duration
echo 2500 > /sys/module/msm_hotplug/boost_lock_duration
echo 200 5:100 50:50 350:200 > /sys/module/msm_hotplug/update_rates
echo 400 > /sys/module/msm_hotplug/fast_lane_load
echo 1 > /sys/module/msm_hotplug/max_cpus_online_susp

############################
# MSM-Limiter Freq Tuning
#
echo 300000 > /sys/kernel/msm_limiter/suspend_min_freq_0
echo 300000 > /sys/kernel/msm_limiter/suspend_min_freq_1
echo 300000 > /sys/kernel/msm_limiter/suspend_min_freq_2
echo 300000 > /sys/kernel/msm_limiter/suspend_min_freq_3
echo 2265600 > /sys/kernel/msm_limiter/resume_max_freq_0
echo 2265600 > /sys/kernel/msm_limiter/resume_max_freq_1
echo 2265600 > /sys/kernel/msm_limiter/resume_max_freq_2
echo 2265600 > /sys/kernel/msm_limiter/resume_max_freq_3
echo 1267200 > /sys/kernel/msm_limiter/suspend_max_freq
echo interactive > /sys/kernel/msm_limiter/scaling_governor_0
echo interactive > /sys/kernel/msm_limiter/scaling_governor_1
echo interactive > /sys/kernel/msm_limiter/scaling_governor_2
echo interactive > /sys/kernel/msm_limiter/scaling_governor_3

############################
# Scheduler and Read Ahead
#
echo zen > /sys/block/mmcblk0/queue/scheduler
echo 2048 > /sys/block/mmcblk0/bdi/read_ahead_kb

############################
# GPU Governor
#
echo simple_ondemand > /sys/class/devfreq/fdb00000.qcom,kgsl-3d0/governor
echo 450000000 > /sys/devices/fdb00000.qcom,kgsl-3d0/devfreq/fdb00000.qcom,kgsl-3d0/max_freq

############################
# LMK Tweaks
#
echo 2560,4096,8192,16384,24576,32768 > /sys/module/lowmemorykiller/parameters/minfree
echo 32 > /sys/module/lowmemorykiller/parameters/cost

############################
# Tweak Background Writeout
#
echo 200 > /proc/sys/vm/dirty_expire_centisecs
echo 40 > /proc/sys/vm/dirty_ratio
echo 5 > /proc/sys/vm/dirty_background_ratio
echo 0 > /proc/sys/vm/swappiness

############################
# Dynamic FSync (Let User Decide)
#
echo 0 > /sys/kernel/dyn_fsync/Dyn_fsync_active

############################
# Test Debugging!!!
#
echo 0 > /sys/kernel/sched/gentle_fair_sleepers
echo 1 > /sys/module/msm_thermal/parameters/enabled

############################
# Power Effecient Workqueues (Enable for battery)
#
echo 1 > /sys/module/workqueue/parameters/power_efficient
echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps

############################
# Activate Simple_GPU_Algorithym
#
echo 1 > /sys/module/simple_gpu_algorithm/parameters/simple_gpu_activate

############################
# Synapse Support
#

# Mount root as RW to apply tweaks and settings
$BB mount -o remount,rw /;
$BB mount -o rw,remount /system

# Cleanup.
$BB rm -f /res/synapse/debug/* 

# Make tmp folder
$BB mkdir /tmp;

# Give permissions to execute
$BB chown -R root:system /tmp/;
$BB chmod -R 777 /tmp/;
$BB chmod -R 777 /res/;
$BB chmod -R 6755 /res/synapse/actions/;
$BB chmod -R 6755 /res/synapse/files/;
$BB chmod -R 6755 /sbin/;
$BB chmod -R 6755 /system/xbin/;
$BB echo "Boot initiated on $(date)" > /tmp/bootcheck;

ln -s /res/synapse/uci /sbin/uci
/sbin/uci
