What is suspend?



Suspend mode is a special low-power mode, often used on laptops, that preserves the contents of RAM while conserving power.

There are two main forms of suspend - suspend-to-RAM and suspend-to-disk (also known as "software suspend" or "hibernation"). Suspend-to-RAM uses more power, but is almost instant. Suspend-to-disk, on the other hand, uses no power (the system actually powers off), but takes longer to suspend/resume.







When you click on suspend, everything on your system goes into a low-power mode, except for memory which is placed in such a state that it will retain its contents. The peripheral bus lose power and devices attached to your client are also suspended. Typically, it should take around 1-3 seconds to enter suspend (or suspend-to-RAM) state.

On mobile clients, like laptops, you can enter a suspend state (or sleep) by simply closing the lid, or choosing suspend from the power menu options. To wake up the system from suspend, you simply have to open the lid.

On some models of laptops the lid switch does not enable a wake. In that case, you could hit any key or the power button to wake the system from suspend. On desktops you could hit the dedicated sleep key (if there is one) on the keyboard, or simply push the power button to wake up the system from the suspend state.



https://help.ubuntu.com/community/SuspendHowto

This page describes suspending in Ubuntu 4.10 ("Warty Warthog")

NOTE: For successful suspend to disk (hibernation), you need swap partition (or file, though I have not tested with swap file) bigger than is actual size of your memory. All your memory and also everything that was swapped at the time of hibernation must fit in swap, so at the size of swap should be 1.5x-2x bigger than size of your RAM. 



Introduction

Suspend mode is a special low-power mode, often used on laptops, that preserves the contents of RAM while conserving power.

There are two different standards for power management (which handles suspend in Linux), ACPI and APM. ACPI has more advanced features, but is only found on computers made in the last few years. APM is older, and somewhat more mature, but doesn't offer as many features as ACPI. It also isn't available on many new PCs.

Also, there are two main forms of suspend - suspend-to-RAM and suspend-to-disk (also known as "software suspend" or "hibernation"). Suspend-to-RAM uses more power, but is almost instant. Suspend-to-disk, on the other hand, uses no power (the system actually powers off), but takes longer to suspend/resume. This HOWTO will discuss all of these methods.

WARNING: This is not officially supported in Ubuntu Warty, and may cause system problems or data loss. Use with caution. 



Suspending to RAM (APM)

To enable APM on a system:

    1.edit your /etc/modules file and add apm to the list of modules.
    2.edit the defoptions line of your /boot/grub/menu.lst file so that it ends with acpi=off, and then sudo update-grub to update the GRUB configuration.
    3.Add the modules shpchp and pciehp to the end of the /etc/modprobe.d/blacklist file (they don't work w/APM).
    4.Finally, reboot the computer. If your system supports APM, everything should be set up. 

Close the laptop lid (if you have a laptop) or press the Sleep button to suspend to RAM.

Some systems may not work properly with this, and many new systems don't support APM at all. In this case, search for information on suspending your particular laptop in the wiki or elsewhere. Also, if APM doesn't work, try ACPI. Note that APM doesn't support all the power management features of many newer laptops, and also doesn't work with suspend-to-disk using the code in the kernel. 



ACPI

To suspend to disk, choose "Hibernate" from the GNOME logout menu. To suspend to RAM, edit

/etc/default/acpi-support

and uncomment the second line by deleting the # character, to read:

ACPI_SLEEP=true

Ubuntu 6.06

Dapper needs another step to enable suspend. Execute gconf-editor, and visit apps/gnome-powermanager and enable "can_suspend". You can enable/disable suspend and/or hibernation from there.

If you have an nVidia card, visit the NvidiaLaptopBinaryDriverSuspend wiki page.

For those running the fglrx driver, you need uncomment the line in /etc/default/fglrx, so it reads as

FGLRX_ACPI_SWITCH_POWERSTATES=true

The ipw2200 driver currently doesn't allow suspend. The easy workaround is to edit /etc/default/acpi-support, and add ipw2200 to the MODULES list, like so:

MODULES="ipw2200"



Event Processing

For a working suspend and hibernate support several pieces of software have to work together, which results in a highly integrated system that needs to be understood in case troubleshooting is necessary. The following description should help to explain the processing of events as of Ubuntu 6.06 LTS (Dapper).

    1.Press keyboard button (sleep, power)
    2.generation of events
        1.acpid
            1./etc/acpi/events/{sleepbtn,powerbtn}
            2./etc/acpi/sleep.sh or /etc/acpi/hibernate.sh
                1./etc/acpi/prepare.sh: includes /etc/acpi/suspend.d/*.sh
    
                2.triggers suspend in kernel by echo $SLEEP_MODE > /sys/power/state
                3./etc/acpi/resume.sh: includes /etc/acpi/resume.d/*.sh 
        b. hal event
            1.gnome-power-manager or klaptopd kicks in and looks up its policy
            2./usr/share/hal/scripts/hal-system-power-{suspend,hibernate}
    
                1.checks for avaiable handlerss: powersave, pmi, pm-hibernate, hibernate, direct /sys/power/state
                2./usr/sbin/pmi action {suspend,hibernate} force
    
                    1./etc/acpi/sleep.sh or /etc/acpi/hibernate.sh # following processing as described for the acpid case 

This should help to understand "What happens, when XX button is pressed?". In case something in the path is not working, this should help to adopt the scripts, add debugging and fix the problems. 





1.https://help.ubuntu.com/community/BinaryDriverHowto/Nvidia?action=show&redirect=NvidiaLaptopBinaryDriverSuspend#Suspend.2BAC8-Hibernation

关于nvidia 显卡在ubuntu上需要关注修改的地方。





2.Lxubuntu退出时的弹出界面如何实现，调用的底层是如何实现的？

/etc/xdg/lxsession/Lubuntu/desktop.conf



 17 quit_manager/command=lxsession-logout
 18 quit_manager/image=/usr/share/lubuntu/images/logout-banner.png
 19 quit_manager/layout=top



 经过实现图片资源和可执行程序如上。

man lxsession-logout

可以指定显示的提示语和图片资源。



lxsession-logout 是lxsession的一部分，在github上有

查看lxsession-logout使用的版本和源码，apt-get source lxsession-logout

apt-get install lxsession-logout 

lxsession-logout is already the newest version (0.5.2-0ubuntu3).



到github上下载0.5.2版本的源码，查看源码



dbus_systemd_Suspend->g_dbus_proxy_call_sync---->g_dbus_proxy_call_sync









