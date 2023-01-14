# Building and debugging netcore apps in VS Code

VS Code is much more lightweight IDE compared to VS. 
It can be configured as IDE for many programming languages; for C# it works great with cross-platform .NET development (e.g. dotnet 7.0).
Unfortunately only core of VS Code is FOSS (Free and Open Source Software), full VS Code distribution is propriatary 😟 

## Configure VS Code

1. Install VS Code
2. In WSL, install dotnet, assuming ubuntu distro (at the time of writing this, dotnet 7.0 is not yet available on ubuntu repos, microsoft repo needs to be added):
 
```shell
wget https://packages.microsoft.com/config/ubuntu/22.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb 
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install -y dotnet-sdk-7.0
```

3. Install "Remote Development" extension
4. Run VS Code, hit F1 to run Command Palette, run "WSL:  New WSL Window" 
5. Install C# extension (C# for Visual Studio Code (powered by OmniSharp).)
6. Install ".NET Core Test Explorer" extension
7. Obviously, install Dracula Theme extension 😊
8. Open a directory in VS Code explorer
9. In Terminal:

```shell
dotnet new sln
dotnet new console -n Application -o Application
dotnet new nunit -n Application.Test -o Application.Test
dotnet new --list # to see what project types are supported

dotnet sln add **/*.csproj 

dotnet add Application.Test reference Application 

# install some nugets
dotnet add Application.Test package Moq --version 4.18.4

```

9. VS Code needs to add config required to run and debug the application (they will be added to `.vscode` directory). C# extension can do this - when C# project will be open, a prompt will show up ("Required assets to build and debug are missing..") - click yes.
10. All done, switch to "Run and Debug" (Ctrl-Shift-D), set some breakpoint, etc.
11. Open "Testing" perspective to run tests.



