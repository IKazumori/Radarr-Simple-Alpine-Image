# Radarr Simple Alpine Image

This project aims to provide a lightweight [Radarr](https://github.com/Radarr/Radarr) image for containers. No complex systems, just an Alpine image with the latest release build from Radarr. All it needs is a volume for `/config`.

## Usage

Find the latest published tag in the [Packages](https://github.com/IKazumori/Radarr-Simple-Alpine-Image/pkgs/container/radarr) section.

```shell
podman run -v config:/config -p 7878:7878 ghcr.io/ikazumori/radarr:6.0.4.10291
```
