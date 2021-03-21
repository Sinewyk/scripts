### Install chocolatey
## Set-ExecutionPolicy AllSigned
## [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Output "Installing apps"

# Conf choco
Write-Output "Configure chocolatey for global confirmation"
choco feature enable -n allowGlobalConfirmation

# Apps
choco install firefox
choco install 7zip
choco install irfanview
choco install qbittorrent
choco install vlc
choco install wire
choco install calibre

# Gaming
choco install steam-client
choco install epicgameslauncher
choco install origin
choco install uplay

# Dev
choco install nodejs-lts
choco install vscode
choco install rustup.install

# Deconf choco
Write-Output "Remove chocolatey for global confirmation"
choco feature disable -n allowGlobalConfirmation


# Follow-up
rustup toolchain install stable-x86_64-pc-windows-msvc

Write-Output "Don't forget:"
Write-Output "vscode sync via shan.code-settings-sync and github gist"
Write-Output "firefox sync via sync"