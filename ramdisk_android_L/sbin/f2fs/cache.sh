#!/sbin/busybox sh

BB=/sbin/busybox

CACHE=$($BB blkid /dev/block/platform/msm_sdcc.1/by-name/cache | $BB grep "f2fs" | $BB wc -l);

if [ ! -e /cache ]; then
	mkdir /cache;
	chown system:cache /cache;
	chmod 0770 /cache;
fi;

if [ "$CACHE" -eq "1" ]; then
	$BB mount -t f2fs /dev/block/platform/msm_sdcc.1/by-name/cache /cache -o nosuid,nodev;
else
	$BB mount -t ext4 /dev/block/platform/msm_sdcc.1/by-name/cache /cache -o noatime,nosuid,nodev,barrier=1,data=ordered,noauto_da_alloc,journal_async_commit,errors=panic wait,check
fi;

if [ ! -e /cache/lost+found ]; then
	mkdir /cache/lost+found;
	chmod 0770 /cachelost+found;
fi;