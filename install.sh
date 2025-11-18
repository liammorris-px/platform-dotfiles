#!/bin/bash
# Main installer script for platform dotfiles

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

log_header() {
    echo -e "\n${PURPLE}$1${NC}"
    echo "=================================================="
}

# Main installation function
main() {
    # Get the directory where the install script is located
    SCRIPT_DIR="$(dirname "$(realpath "$0")")"
    cd "$SCRIPT_DIR"
    
    log_header "🚀 Starting platform dotfiles installation..."
    
    # Find all numbered scripts and sort them
    scripts=($(find scripts -name "[0-9][0-9]-*.sh" | sort))
    
    
    log_info "Found ${#scripts[@]} installation scripts:"
    for script in "${scripts[@]}"; do
        echo "  - $(basename "$script")"
    done
    
    # Ask for confirmation
    echo
    read -p "Do you want to proceed with the installation? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log_info "Installation cancelled."
        exit 0
    fi
    
    # Run each script
    failed_scripts=()
    for script in "${scripts[@]}"; do
        log_header "Running: $(basename "$script")"
        
        if bash "$script"; then
            log_success "$(basename "$script") completed successfully"
        else
            log_error "$(basename "$script") failed"
            failed_scripts+=("$script")
        fi
    done
    
    # Summary
    log_header "INSTALLATION SUMMARY"
    
    if [ ${#failed_scripts[@]} -gt 0 ]; then
        log_error "${#failed_scripts[@]} script(s) failed:"
        for script in "${failed_scripts[@]}"; do
            echo "  - $(basename "$script")"
        done
    else
        log_success "All scripts completed successfully!"
    fi
}

# Run the main function
main "$@"
