# README

## Convert to exe

### Windows

Open Powershell and type in the following command to convert to .exe

```powershell
    copy /b love.exe+pong.love pong.exe
```

### Linux/macOS

Open the Terminal and type in the following command to convert to .exe

```sh
    cat love.exe pong.love > pong.exe
```

## Run game

### With exe

If using a windows system, just double click the exe file. I've not tested it on windows so your results may vary, but it should work.

### With .love

Ensure that love is installed, go to https://www.love2d.org/ and follow the installation instructions.

#### Linux

Open the terminal and run

```sh
    love pong.love
```

and a window should open up

#### MacOS/Windows

I have not tested it on these platforms, refer to this webpage (https://www.love2d.org/wiki/Getting_Started), and follow the instructions for Mac and Windows.
