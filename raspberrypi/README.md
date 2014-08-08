# Raspberry Pi

Install latest version of Raspbian OS.

When you start your Pi for the first time the raspi-config menu will appear.

Select following entries:

1) Expand Filesystem

3) Enable Boot to Desktop/Scratch > Console Text console, requiring login (default)

4) Internationalisation Options > Change Timezone > Europe > Vilnius

5) Enable Camera > Disable

8) Advanced Options > Memory Split > 16

Then select "Finish" and "Yes".

After reboot, change default account password, download `setup.sh` from this
directory and run `bash setup.sh`.