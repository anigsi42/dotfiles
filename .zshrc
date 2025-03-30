########################################
# 🧠 Ani's AI-Infused Smart Terminal   #
# buiDl.future mode: ON               #
########################################

# Time-based greeting
get_greeting() {
  HOUR=$(date +"%H")
  if [ $HOUR -lt 12 ]; then
    echo "🌞 Good morning, Ani. Let’s build the future."
  elif [ $HOUR -lt 18 ]; then
    echo "⚡ Good afternoon, Commander Ani. Code strong."
  elif [ $HOUR -lt 22 ]; then
    echo "🌙 Evening vibes. Let’s ship something cool."
  else
    echo "🦉 Midnight mode: engage the silence, Ani."
  fi
}

# Gradient banner
if command -v figlet > /dev/null && command -v lolcat > /dev/null; then
  figlet Ani | lolcat --spread=4 --speed=1.5
fi

get_greeting

# Random quote of the day
quotes=(
  "“The future is already here — it’s just not evenly distributed.” – William Gibson"
  "“Any sufficiently advanced technology is indistinguishable from magic.” – Arthur C. Clarke"
  "“We’re here to put a dent in the universe.” – Steve Jobs"
  "“I’m not a great programmer; I’m just a good programmer with great habits.” – Kent Beck"
  "“Stay hungry. Stay foolish.” – Steve Jobs"
)
quote_of_the_day() {
  RANDOM_INDEX=$((RANDOM % ${#quotes[@]}))
  echo "💬 ${quotes[$RANDOM_INDEX]}"
}
quote_of_the_day

# Live system info
show_system_info() {
  echo ""
  echo "🖥️  System Info:"
  echo "🔋 Battery: $(pmset -g batt | grep -Eo '\d+%')"
  echo "📡 Wi-Fi: $(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep SSID | awk -F ': ' '{print $2}' | tail -n 1)"
  echo "📅 Date: $(date '+%A, %B %d, %Y — %I:%M %p')"
}
show_system_info

# Git branch awareness
autoload -Uz vcs_info
precmd() { vcs_info }

# Allow prompt substitution
setopt prompt_subst

# Hacker prompt
PROMPT='%F{green}%n%f@%F{cyan}%m%f %F{white}%~%f${vcs_info_msg_0_} %F{green}❯%f '
RPROMPT='%F{gray}[%D{%H:%M}]%f'
zstyle ':vcs_info:git:*' formats ' %F{yellow} %b%f'

# AI-style command logging
log_command() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') | $USER@$(hostname) | $PWD | $1" >> ~/.ani_terminal.log
}
preexec() { log_command "$1" }

# Autosuggestions + Syntax Highlighting
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom command shortcuts
alias pushit='git add . && git commit -m "quick push" && git push'
alias ship='echo "🚀 Shipping in progress..." && npm run deploy'
alias revive='echo "🧼 Resetting dev environment..." && killall node && npm install'
