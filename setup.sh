#!/bin/sh

echo "Adding sparkle/bin to path..."
echo 'export PATH="$PATH:$HOME/sparkle/bin" # Add Sparkle to path for use' >> ../.bashrc
echo "Setup complete!"
echo "Please use sparkle -v to see if installation was successful."
echo "NOTICE: You may need to restart your shell for changes to take effect!"