# Dedicated

This setup is tested on Ubuntu 14.04.1 LTS (64-bit) only. Root access should be enabled.

Sometimes VPS has no configured locales, you can test it by executing `perl -e exit`.

If it outputs some warnings, you should generate locales by doing this

```sh
echo -e 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/default/locale
locale-gen en_US.UTF-8
```

Logout, login, and then command `perl -e exit` should output nothing.

## Installation

### Main part

```sh
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/root.sh`
chmod +x root.sh
bash root.sh
```

### User part

```sh
wget https://raw.githubusercontent.com/gyKa/setup/master/dedicated/user.sh`
chmod +x user.sh
bash user.sh
```

## Services

* ZNC
* WEB
