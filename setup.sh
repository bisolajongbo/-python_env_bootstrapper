#!/bin/bash

set -e  # stop script error
# colours
GREEN='\033[0;32m' # Success
YELLOW='\033[1;33m' # Warning
RED='\033[0;31m' # Error
NC='\033[0m' # No color

#function
log_info() {
    echo -e "${BLUE}[INFO] $1${NC}"
}

log_success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

log_error() {
    echo -e "${RED}[ERROR] $1${NC}"
}

#Enable Log file

LOG_FILE="setup.log"
exec > >(tee -a $LOG_FILE) 2>&1

#Setup  Virtual Env

# setup_virtualenv() {
   # if [ -d ".venv" ]; then
       # log_info "Virtual environment already exists. Activating..."
   # else
       # log_info "Creating virtual environment..."
       # python3 -m venv .venv
      #  log_success "Virtual environment created"
   # fi

    # Activate environment
   # source .venv/bin/activate
   # log_success "Virtual environment activated"
#}

setup_virtualenv() {
    if [ -f ".venv/bin/activate" ]; then
        log_info "Valid virtual environment found. Activating..."
    else
        log_warning "No valid virtual environment found. Creating a new one..."

        rm -rf .venv  # remove broken one (safe cleanup)
        python3 -m venv .venv

        log_success "Virtual environment created"
    fi

    source .venv/bin/activate
    log_success "Virtual environment activated"
}

#upgrade pip
upgrade_pip() {
    log_info "Upgrading pip..."
    pip install --upgrade pip
    log_success "pip upgraded successfully"
}

#.gitignore
create_gitignore() {
    if [ -f ".gitignore" ]; then
        log_warning ".gitignore already exists. Skipping..."
    else
        log_info "Creating .gitignore..."

        cat <<EOL > .gitignore
.venv/
__pycache__/
*.pyc
.env
.DS_Store
EOL

        log_success ".gitignore created"
    fi
}

#Install Packages
install_packages() {
    log_info "Installing required packages..."
    pip install pandas requests
    log_success "Packages installed successfully"
}



main() {
    log_info "Starting project setup..."

    setup_virtualenv
    upgrade_pip
    create_gitignore
    install_packages
  log_success "Project setup complete!"
}

main
