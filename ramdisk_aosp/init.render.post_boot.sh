#!/system/bin/sh

BB=/sbin/busybox

############################
# Custom Kernel Settings for Render Kernel!!
#

############################s
# CPU-Boost Settings
#
echo 20 > /sys/module/cpu_boost/parameters/boost_ms
echo 1728000 > /sys/module/cpu_boost/parameters/sync_threshold
echo 1497600 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 500 > /sys/module/cpu_boost/parameters/input_boost_ms
echo 1 > /sys/module/cpu_boost/parameters/load_based_syncs
echo 1 > /sys/module/cpu_boost/parameters/wakeup_boost

############################
# MSM_Hotplug Settings
#
echo 2 > /sys/module/msm_hotplug/cpus_boosted
echo 500 > /sys/module/msm_hotplug/down_lock_duration
echo 2500 > /sys/module/msm_hotplug/boost_lock_duration
echo 200 5:100 50:50 350:200 > /sys/module/msm_hotplug/update_rates
echo 400 > /sys/module/msm_hotplug/fast_lane_load
echo 1 > /sys/module/msm_hotplug/max_cpus_online_susp

############################
# Script to launch frandom at boot by Ryuinferno @ XDA
#
chmod 644 /dev/frandom
chmod 644 /dev/erandom
mv /dev/random /dev/random.ori
mv /dev/urandom /dev/urandom.ori
ln /dev/frandom /dev/random
chmod 644 /dev/random
ln /dev/erandom /dev/urandom
chmod 644 /dev/urandom

############################
# CPUFreq and Governor Settings
#
# Bacon
echo bacon > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo bacon > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo bacon > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo bacon > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo 20000 1400000:40000 1700000:20000 > /sys/devices/system/cpu/cpufreq/bacon/above_hispeed_delay
echo 90 > /sys/devices/system/cpu/cpufreq/bacon/go_hispeed_load
echo 1497600 > /sys/devices/system/cpu/cpufreq/bacon/hispeed_freq
echo 1 > /sys/devices/system/cpu/cpufreq/bacon/io_is_busy
echo 85 1500000:90 1800000:70 > /sys/devices/system/cpu/cpufreq/bacon/target_loads
echo 40000 > /sys/devices/system/cpu/cpufreq/bacon/min_sample_time
echo 30000 > /sys/devices/system/cpu/cpufreq/bacon/timer_rate
echo 100000 > /sys/devices/system/cpu/cpufreq/bacon/max_freq_hysteresis
echo 30000 > /sys/devices/system/cpu/cpufreq/bacon/timer_slack

# Interactive
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo 20000 1400000:40000 1700000:20000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo 95 > /sys/devices/system/cpu/cpufreq/interactive/check_fast_target_loads
echo 50 1000000:66 > /sys/devices/system/cpu/cpufreq/interactive/check_fast_target_loads
echo 15000 > /sys/devices/system/cpu/cpufreq/interactive/check_fast_timer_rate
echo 2265600 > /sys/devices/system/cpu/cpufreq/interactive/freq_calc_thresh
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo 1497600 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
echo 40000 1700000:80000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 100000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
echo 1267200 > /sys/devices/system/cpu/cpufreq/interactive/sync_freq
echo 85 1500000:90 1800000:70 > /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo 30000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo -1 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 75 > /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_load
echo 1574400 > /sys/devices/system/cpu/cpufreq/interactive/up_threshold_any_cpu_freq

# Ondemand
echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo ondemand > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo ondemand > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo ondemand > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo 95 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
echo 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core
echo 3 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core
echo 960000 > /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq
echo 960000 > /sys/devices/system/cpu/cpufreq/ondemand/sync_freq
echo 80 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load

############################
# Set MAN-MAX Freq on boot
#
echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
echo 2265600 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 2265600 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo 2265600 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo 2265600 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq

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

############################
# Synapse Support
#

# Mount root as RW to apply tweaks and settings
$BB mount -t rootfs -o remount,rw rootfs;
$BB mount -o remount,rw /;

# Cleanup.
$BB rm -f /res/synapse/debug/*

# Make tmp folder
$BB mkdir /tmp;

# Give permissions to execute
$BB chown -R root:system /tmp/;
$BB chmod -R 777 /tmp/;
$BB chmod -R 777 /res/;
$BB chmod -R 6755 /res/synapse/files/*;
$BB chmod -R 6755 /system/xbin/*;
$BB chmod 6755 /sbin/*;
$BB echo "Boot initiated on $(date)" > /tmp/bootcheck;

ln -s /res/synapse/uci /sbin/uci
/sbin/uci

############################
# Trim /system, data, cache on boot!
#
$BB fstrim /system
$BB fstrim /data
$BB fstrim /cache
