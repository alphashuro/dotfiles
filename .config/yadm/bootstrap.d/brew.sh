if command -v brew >/dev/null 2>&1; then
	echo "Bootstraping brew"
	brew bundle install --file=~/Brewfile
fi
