#======================Dock settings =================
defaults write com.apple.dock "orientation" -string "right" # Set dock to the left
defaults write com.apple.dock "show-recents" -bool false # Do not display recent apps in the Dock
defaults write com.apple.dock "autohide" -bool false # Always display the dock (default)
defaults write com.apple.dock "mineffect" -string "genie" # Genie effect for minimizing windows (default)

#======================Screencapture settings =================
mkdir -p $HOME/Desktop/Screenshots # Create "Screenshots" folder on the desktop and set it as the default location 
defaults write com.apple.screencapture "location" $HOME/Desktop/Screenshots  
defaults write com.apple.screencapture "show-thumbnail" -bool true # Display the thumbnail after taking a screenshot (default)
defaults write com.apple.screencapture "include-date" -bool true # Don't include date in the screenshot file name

#======================Finder settings =================
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true # Show filename extensions 
defaults write com.apple.finder "ShowPathbar" -bool true # Show path bar in the bottom of the Finder windows
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv" # Set the default view style for folders without custom setting to list view
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" # Set the default search scope when performing a search in Finder to the current folder
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool false # Save to disk (not to iCloud) by default

#======================Trackpad settings =================
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int 1
defaults write com.apple.AppleMultitouchTrackpad "DragLock" -bool false
defaults write com.apple.AppleMultitouchTrackpad "Dragging" -bool false
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool false

#======================Mission Control settings =================
defaults write com.apple.dock "mru-spaces" -bool false # Do not rearrange spaces based on most recent use
defaults write com.apple.dock "expose-group-apps" -bool false # Do not group windows by application (default)

#======================Text Edit settings =================
defaults write com.apple.TextEdit "RichText" -bool false # Set default document format as plain text (.txt)