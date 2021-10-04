[ [ GitHub ] ](https://github.com/peterberweiler/docker-s6-overlay-installer)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[ [ DockerHub ] ](https://hub.docker.com/r/peterberweiler/s6-overlay-installer)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[ [ s6-overlay GitHub ] ](https://github.com/just-containers/s6-overlay)

# s6-overlay-installer

This docker image provides an easy way to copy the platform specific installer for s6-overlay into your image.
```Dockerfile
COPY --from=peterberweiler/s6-overlay-installer:latest /installer /tmp/s6-overlay-installer
RUN chmod +x /tmp/s6-overlay-installer && /tmp/s6-overlay-installer /
```

&nbsp;

# ⚠ This is still untested on most architectures ⚠

**✔ Tested**: `amd64`, `arm/v7`

**❌ Untested**: `arm64`, `ppc64le`, `arm/v6`, `riscv64`, `mips64le`, `mips64`, `s390x`, `386`

&nbsp;

# Example Usage

```Dockerfile
FROM nginx

COPY --from=peterberweiler/s6-overlay-installer:latest /installer /tmp/s6-overlay-installer
RUN chmod +x /tmp/s6-overlay-installer && /tmp/s6-overlay-installer /

RUN mv /docker-entrypoint.sh /etc/cont-init.d/nginx-setup.sh
ENTRYPOINT ["/init"]
CMD ["nginx", "-g", "daemon off;"]
```

## Available Tags
`latest`, `v2.2.0.3`