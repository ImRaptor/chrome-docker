## Chrome on Docker

Run older versions of chrome in podman and connect to it with VNC

- Courtesy: https://medium.com/dot-debug/running-chrome-in-a-docker-container-a55e7f4da4a8


### Steps

- Download the required chrome version from slimjet -https://www.slimjet.com/chrome/google-chrome-old-version.php
- Edit Dockerfile as required
- Build image
```
sudo podman build -t chrome<version> --build-arg="PACKAGE_NAME=<deb file>" .
```
- Run image
```
sudo podman run -p 5900:5900 -e VNC_SERVER_PASSWORD=password --user apps --privileged chrome<version>
```

- View using a VNC viewer. for eg. `krdc` in ubuntu or Mobaxterm in Windows
```
sudo apt-get install krdc
```
