if command -v redis-server &> /dev/null; then
    echo "Redis server is already installed."
else
    echo "Updating package lists..."
    sudo apt-get update

    echo "Adding the universe repository..."
    sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"

    echo "Updating package lists again..."
    sudo apt-get update

    echo "Installing Redis server..."
    sudo apt-get install -y redis-server

    echo "Setup complete."
fi

if [ -d "/workspace/development/frappe-bench" ]; then
    echo "Frappe-bench directory already exists."
else
    echo "Setup Bench"
    bench init --frappe-branch version-15 frappe-bench
fi


