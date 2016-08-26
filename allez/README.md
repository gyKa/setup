# allez

## Hardware

* RaspberryPi 1 Model B

## OS preparation

Install latest version of Raspbian Jessie Lite.

After boot, login as "pi" and enter "raspberry" as a password. After successful login, type `raspi-config`.

Select following entries:

1) Expand Filesystem

3) Boot options > Console

4) Wait for Network at Boot > No

5) Internationalisation Options > Change Timezone > Europe > Vilnius

6) Enable Camera > No

9) Advanced Options > Hostname > Enter 'allez'

9) Advanced Options > Memory Split > 16

9) Advanced Options > Serial > No

Then select "Finish".

After reboot, change default account password.
