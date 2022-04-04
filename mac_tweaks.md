# mac tweaks
### Keys: 
* Key repeat instead of window: defaults write -g ApplePressAndHoldEnabled -bool true  .
* Replaced modifiers command and control (swapped) for razer external keyboard, done via macos settings 'edit modifiers' for specific external device.  Ctrl=Command[], Win=Ctrl^, Alt=Option&.
* *Update 28.10.2020*: trying to use mac way, applies to all bullets below. 07/12/2020 tried and didn't like. 
* home/end fix by creating a .dict file as said in https://apple.stackexchange.com/questions/16135/remap-home-and-end-to-beginning-and-end-of-line . 
* DROPPED:  Karabiner https://github.com/tekezo/Karabiner with `complex rules` enabled and imported from “PC-Style shortcuts”, while removing “Options(Alt)+tab to switch applications” so it won’t collide with AltTab app. Also from “Windows shortcuts on MacOS” imported (and prioritized) “Shift+End” and “Shift+Home”.
* To use hebrew but press Shift/Capslock to insert capitalized english letters, remove "Hebrew" from the input languages (by pressing `-`) and add new input language (by pressing `+`) and type in the search textbox `Hebrew - PC`. Solution credit: https://superuser.com/a/1256220. 
* Open the Fn modifier swap in keyboard settings by running the following and restarting:
	```
	sudo hidutil property --matching '{ "ProductID": 0x027e }' --set '{
	  "UserKeyMapping": [
	    {
	      "HIDKeyboardModifierMappingDst": 30064771300,
	      "HIDKeyboardModifierMappingSrc": 1095216660483
	    },
	    {
	      "HIDKeyboardModifierMappingDst": 30064771296,
	      "HIDKeyboardModifierMappingSrc": 280379760050179
	    }
	  ]
	}'
	```
### Window management:
* AltTab:
	* Installed https://github.com/lwouis/alt-tab-macos   good old alttab..  
	* Added com.cisco.Cisco-AnyConnect-Secure-Mobility-Client to blacklist (found by the value of CFBundleIdentifier key in /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app/Contents/Info.plist).
* Installed “rectangle” (new spectacle) to align windows. https://github.com/rxhanson/Rectangle   . Changed hotkey to Winkey+Arrow for left/right half attachment, Maximize and Restore. 
* Continue where you left off in chrome: exit by command+Q and not cached.
* To minimize all windows, press `Command+Options+H+M` or focus on non-finder window and press `Command+Options+MouseClickOnDesktopArea` . 
* Switch user while leaving current on: run from terminal  ` "/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend`
### Terminal:
* iTerm2
	* Install iterm2 instead of the default macos terminal. [IMPORTANT STEP for tmux].
	* In preference->profiles->keys-> choose “Natural typing”
	* Key remappings. To allow tmux prefix be cmd+b and vim window switch to be cmd+w (both instead of ctrl+b/w), and vim redo without iterm2 refresh. Done via iTerm2 perefences --> Keys --> Key Bindings --> + --> map by pressing the cmd+b and choosing to 'send hex' with the code. Hex codes taken from  https://phanderson.com/C/ascii.html .
		* map `cmd+w` to "0x17" 
		* map `cmd+b` to "0x02"
		* map `cmd+r` ro "0x12"
* [not sure this is needed for iterm2, done for "Terminal"] Terminal keys (via preferences): adding `home→ \033[H` (ESC[H) + `end→ \005` (WinKeyCrtrl+E) + `alt+backspace → \033\177`.
* ~/.zshrc : refer to https://github.com/sharpblade4/confs/blob/main/.zshrc
* DROPPED: Oh my zsh → (annoying tab appeared). Could be fixed with iterm2 though.
* ~/.vimrc : refer to https://github.com/sharpblade4/confs/blob/main/.vimrc
### AppleScripts:
* run by `osascript ~/Documents/keepAlive.scpt`
* DROPPED: KeepAlive (leaves mac on)
	```
	repeat
		tell application "System Events" to keystroke "0" using command down
		tell application "System Events" to keystroke "0" using command down
		delay 340
	end repeat
	```
   * instead, to keep mac on I'm using https://github.com/newmarcel/KeepingYouAwake
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
* Installed open-source calendar widget that will raise from menubar: https://www.mowglii.com/itsycal/ . Set the format to `E dd/MM/YYYY H:mm` and hidden icon+events.
* To change order of icons in menu-bar, press CMD and drag the icon. 

### Mouse:
* DROPPED: Try razer for mac to fix external mouse wheel → BROKE MAC.

### Display
* sync and control brightness of external monitor: https://github.com/MonitorControl/MonitorControl
