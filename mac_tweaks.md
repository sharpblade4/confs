# mac tweaks
### Mouse:
* DROPPED: Try razer for mac to fix external mouse wheel → BROKE MAC.
### Keys: 
* Key repeat instead of window: defaults write -g ApplePressAndHoldEnabled -bool true  .
* Replaced modifiers command and control (swapped) for razer external keyboard, done via macos settings 'edit modifiers' for specific external device.  Ctrl=Command[], Win=Ctrl^, Alt=Option&.
* *Update 28.10.2020*: trying to use mac way, applies to all bullets below. 
* home/end fix by creating a .dict file as said in https://apple.stackexchange.com/questions/16135/remap-home-and-end-to-beginning-and-end-of-line . 
* DROPPED:  Karabiner https://github.com/tekezo/Karabiner with `complex rules` enabled and imported from “PC-Style shortcuts”, while removing “Options(Alt)+tab to switch applications” so it won’t collide with AltTab app. Also from “Windows shortcuts on MacOS” imported (and prioritized) “Shift+End” and “Shift+Home”.
### Window management:
* AltTab:
	* Installed https://github.com/lwouis/alt-tab-macos   good old alttab..  
	* Added com.cisco.Cisco-AnyConnect-Secure-Mobility-Client to blacklist (found by the value of CFBundleIdentifier key in /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app/Contents/Info.plist).
* Installed “rectangle” (new spectacle) to align windows. https://github.com/rxhanson/Rectangle   . Changed hotkey to Winkey+Arrow for left/right half attachment, Maximize and Restore. 
* Continue where you left off in chrome: exit by command+Q and not cached.
### Terminal:
* Iterm2
	* Install iterm2 instead of the default macos terminal. [IMPORTANT STEP for tmux].
	* In preference->profiles->keys-> choose “Natural typing”
* [not sure this is needed for iterm2, done for "Terminal"] Terminal keys (via preferences): adding `home→ \033[H` (ESC[H) + `end→ \005` (WinKeyCrtrl+E) + `alt+backspace → \033\177`.
* ~/.zshrc
	* see https://github.com/sharpblade4/confs/blob/main/.zshrc
* DROPPED: Oh my zsh → (annoying tab appeared). Could be fixed with iterm2 though.
### Vimrc minimal:
```
syntax on
set expandtab
set number
set ignorecase
set smartcase
set hlsearch
```
### AppleScripts:
* run by `osascript ~/Documents/keepAlive.scpt`
* KeepAlive (leaves mac on)
	```
	repeat
		tell application "System Events" to keystroke "0" using command down
		tell application "System Events" to keystroke "0" using command down
		delay 340
	end repeat
	```
	
* HealthReminder
	```
	tell application "System Events" to activate
	repeat
		with timeout of 1800 seconds
			tell application "System Events" to display dialog "Get up from the chair and stretch" with icon note buttons {"Done!"}
		end timeout
		delay 1800
	end repeat
	```
### Widgets
*  installed open-source calendar widget that will raise from menubar: https://www.mowglii.com/itsycal/
