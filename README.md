# Project Title: Python Environment Bootstrapper
# Project Description
This project contains a Bash automation script (setup.sh) designed to quickly set up a
Python development environment.
The script automates common setup tasks such as creating a virtual environment, upgrading pip,
generating a .gitignore file, and installing required Python packages.
# Features
The script performs the following tasks automatically:
* Creates a Python virtual environment (.venv)
* Activates the virtual environment
* Upgrades pip
* Creates a .gitignore file
* Installs required packages (pandas and requests)
* Logs all terminal output into setup.log
* Displays color-coded terminal messages for:
 * Information
 * Success
 * Warning
 * Errors
# Technologies Used
* Bash Scripting
* Python Virtual Environment (venv)
* Linux Terminal Commands
## How to Execute the Script
* Step 1: Give Execute Permission
chmod +x setup.sh

* Step 2: Run the Script
./setup.sh
# 0utput
[INFO] Starting project setup...
[INFO] Valid virtual environment found. Activating...
[SUCCESS] Virtual environment activated
[INFO] Upgrading pip...
Requirement already satisfied: pip in ./.venv/lib/python3.12/site-packages (26.1.1)
[SUCCESS] pip upgraded successfully
[WARNING] .gitignore already exists. Skipping...
[INFO] Installing required packages...
Requirement already satisfied: pandas in ./.venv/lib/python3.12/site-packages (3.0.2)
Requirement already satisfied: requests in ./.venv/lib/python3.12/site-packages (2.33.1)
Requirement already satisfied: numpy>=1.26.0 in ./.venv/lib/python3.12/site-packages (from pandas) (2.4.4)
Requirement already satisfied: python-dateutil>=2.8.2 in ./.venv/lib/python3.12/site-packages (from pandas) (2.9.0.post0)
Requirement already satisfied: charset_normalizer<4,>=2 in ./.venv/lib/python3.12/site-packages (from requests) (3.4.7)
Requirement already satisfied: idna<4,>=2.5 in ./.venv/lib/python3.12/site-packages (from requests) (3.13)
Requirement already satisfied: urllib3<3,>=1.26 in ./.venv/lib/python3.12/site-packages (from requests) (2.6.3)
Requirement already satisfied: certifi>=2023.5.7 in ./.venv/lib/python3.12/site-packages (from requests) (2026.4.22)
Requirement already satisfied: six>=1.5 in ./.venv/lib/python3.12/site-packages (from python-dateutil>=2.8.2->pandas) (1.17.0)
[SUCCESS] Packages installed successfully
[SUCCESS] Project setup complete!
# Challenge Faced
During the setup process, I encountered multiple issues
while trying to install Python3 in Linux.The first issue was a broken dependency/package error
during the installation of Python3.
The installation could not continue because some required packages were missing or broken.
To solve this, I researched the error and used the following commands to repair the system packages:
sudo apt --fix-broken install
sudo apt update
sudo apt full-upgrade
After fixing the broken packages and updating the system,
I successfully installed Python3 and the virtual environment package.
Another challenge occurred when trying to activate the virtual environment.
The terminal showed that a virtual environment already existed or was already active,
which caused conflicts while running the script.
To resolve this issue, I removed the old or broken virtual environment directory and created a new one.
After recreating the environment, the script executed successfully.
I also encountered this error while testing the script:
[INFO] Starting project setup...
./setup.sh: line 30: setup_virtualenv: command not found
This happened because the setup_virtualenv() function was not properly defined before  calling in the script.
I fixed it by correctly defining the function and ensuring it appeared before the main() function.





