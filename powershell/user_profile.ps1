# icons for powershell terminal
# Install-Module -Name Terminal-Icons
Import-Module Terminal-Icons

# For Elevated Command
Import-Module gsudoModule

# history of the commands
# Install-Module -Name PSReadLine
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Vim Like KeyBinding for Next and Previous History Selection
# Using `Ctrl+j` for Next selection and `Ctrl+k` for Previous selection
# Remove following commands if you want to use just arrow key for navigation
Set-PSReadLineKeyHandler -Key Ctrl+j -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+k -Function HistorySearchBackward

# Alias
Set-Alias -Name "vim" -Value "nvim"
Set-Alias -Name "v" -Value "nvim"
Set-Alias -Name "g" -Value "git"
Set-Alias -Name ".." -Value "cd.."
Set-Alias -Name "lg" -Value "lazygit"

# Useful functions
function cd...  { Set-Location ..\.. }
function cd.... { Set-Location ..\..\.. }
function ll { Get-ChildItem -Path $pwd -File }

# Reload this config file
function reload-profile {
  & $profile
}

# very powerful function to kill processes by process name
function pkill($name) {
  Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

# function to grep the process by name
function pgrep($name) {
  Get-Process $name
}

####### Utilities ####### 

# function to create a new git repo
function giac($Branch = "master", $Message = "Initial Commit") {
    git init -b $Branch
    git add .
    git commit -am $Message
}
# function for quick git add, commit and push
# by just providing the Message
function gacp ($Message){
  git add .
  git commit -am $Message
  git push -u
}

# function to emulate linux `which` command
# this outputs the application path
function which ($Command) {
  Get-Command -Name $Command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Function to make a python project folder with
# given dir and env name
function pyProject ($Folder, $Name){
  mkdir $Folder
    cd $Folder
    python -m venv $Name
    cd $Name/Scripts
    .\Activate.ps1
    cd ..\..
}

# Function to create and Activate a python env with given env_name
function pyEnv ($Name){
  python -m venv $Name
  cd $Name/Scripts
  .\Activate.ps1
  cd ..\..
}

# Function to delete Item(s) and Directory(ies)
function delete ($Item){
  Remove-Item -Recurse -Force $Item
}

function time ($Command){
  $executionTime = Measure-Command { Invoke-Expression -Command $command }
  Write-Host "Execution Time: $($executionTime.TotalMilliseconds) milliseconds"
}

# install scoop-completion
#`scoop install scoop-completion`
# enable completion in current shell, use absolute path because PowerShell Core not respect $env:PSModulePath
Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"

cls # clear any output after loading the config

# install starship
# `scoop install starship`
# Invoke-Expression (&starship init powershell)


# Using Starship
Invoke-Expression (&starship init powershell)
