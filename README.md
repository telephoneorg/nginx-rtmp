# Nginx-RTMP

## Usage

### Install
You will need to clone the following repo as such:
```bash
cd /opt
git clone https://github.com/sip-li/nginx-rtmp
cd nginx-rtmp
cp nginx-rtmp.service /etc/systemd/system/
```

### Configuration Files
In the /opt/nginx-rtmp/conf folder there will be two items:
* `nginx.conf`: this is the root `nginx.conf` file usually found in `/etc/nginx/nginx.conf`.  You shouldn't need to edit this!
* `conf.d`: this is mounted at: `/etc/nginx/conf.d/` in the container and at the end of the previous file it will include every file in this folder that ends in `.conf`.
    * `rtmp.conf`: This is the file that sets up the rtmp block and `application mypush`.


### Configuration of your push servers
* Edit `/opt/nginx-rtmp/conf/conf.d/rtmp.conf`: ex:
```bash
vim /opt/nginx-rtmp/conf/conf.d/rmtp.conf
```
* add your servers as such `push rtmp1.example.com:1934;` **don't forget the semicolon**
* If server is already started (if not don't worry about this): reload nginx's config file: `systemctl reload nginx-rtmp.service` **This will just reload configuration file and not interrupt service.**


### Start the genlb.service:
```bash
systemctl start nginx-rtmp
```

### If everything is working set it to auto start:
```bash
systemctl enable nginx-rtmp
```

## How to

### Get logs
```bash
# without follow
docker logs nginx-rtmp

# with follow
docker logs -f nginx-rtmp

# get logs for the systemd unit supervising the container
journalctl -f -u nginx-rtmp
```

### Test
```bash
# This just tests that the port is open, check the status too and logs for errors
nc -z localhost 1935 && echo 'WORKS!' || echo "DOESN'T WORK"
```

### Get status
```bash
systemctl status nginx-rtmp
```

### Reload Changes to config Files without downtime
```bash
systemctl reload nginx-rtmp
```

### Restart container
```bash
systemctl restart nginx-rtmp
```

### Stop container
```bash
systemctl stop nginx-rtmp
```

### Start container
```bash
systemctl start nginx-rtmp
```

### Disable from auto starting
```bash
systemctl disable nginx-rtmp
```
