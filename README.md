# docker-wine-dotnet: docker-wine with DotNET in 32-bit and 64-bit

Wine's Microsoft dotnet needs to be installed one-by-one, so it's very time consuming.

Also, one may need both 32-bit and 64-bit wine prefix, causing the whole process takes more than an hour to finish.

This repo here offers you a preconfigured Wine docker (based on https://github.com/scottyhardy/docker-wine), which contains 32-bit and 64-bit prefix with dotnet installed both.

The image is also presetting docker-wine settings so that root user is used and Xvfb is automatically started


## Usage 

1. Download the docker image:
```
$ docker pull nyamisty/docker-wine-dotnet
```

2. Start it just like original docker-wine
```
$ docker run --rm -it nyamisty/docker-wine-dotnet bash
```

3. Specify 32-bit or 64-bit prefix:
- Use 32-bit wine, (32-bit prefix will be used if not specified)
    ```
    root@8a54cbc5468d:/# export WINEARCH=win32; export WINEPREFIX=$(realpath ~/.wine32)
    ```
- Use 64-bit wine
    ```
    root@8a54cbc5468d:/# export WINEARCH=win64; export WINEPREFIX=$(realpath ~/.wine64)
    ```

## Credit

This docker image is based on https://github.com/scottyhardy/docker-wine
