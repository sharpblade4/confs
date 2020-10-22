# mac tweaks
### Mouse:
* DROPPED: Try razer for mac to fix external mouse wheel → BROKE MAC.
### Keys:
* Key repeat instead of window: defaults write -g ApplePressAndHoldEnabled -bool true  .
* home/end fix by creating a .dict file as said in https://apple.stackexchange.com/questions/16135/remap-home-and-end-to-beginning-and-end-of-line
* Replaced modifiers command and control (swapped) for razer external keyboard, done via macos settings 'edit modifiers' for specific external device.  Ctrl=Command[], Win=Ctrl^, Alt=Option&.
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
	```
	zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
	autoload -Uz compinit && compinit
	bindkey "^[[A" history-beginning-search-backward
	bindkey "^[[B" history-beginning-search-forward
	alias l='ls -lG'
	bindkey "\033[5C" forward-word
	bindkey "\033[5D" backward-word
	bindkey "^[[3~" delete-char
	bindkey  "\033[H"   beginning-of-line
	bindkey  "\005"   end-of-line
	export PROMPT='%m %B%70<..<%~%b %(!.#.>) '
	alias python="python3"
	```
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
### KeepAlive (Leave mac on. AppleScript\nCommand:)
* ```
	repeat
		tell application "System Events" to keystroke "0" using command down
		tell application "System Events" to keystroke "0" using command dow
		delay 340
	end repeat
	```
* osascript ~/Documents/every14minUndoRedo.scpt