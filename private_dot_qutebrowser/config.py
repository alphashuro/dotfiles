config.set("tabs.position", "left")
# config.set("editor.command", ["/opt/homebrew/bin/kitty", "--single-instance", "nvim", "{file}", "+call cursor({line}, {column})"])
# config.set("editor.command", ["/opt/homebrew/bin/kitty", "--single-instance", "/opt/homebrew/bin/hx", "{file}:{line}:{column}"])
config.set("editor.command", ["/opt/homebrew/bin/alacritty", "-e", "/opt/homebrew/bin/hx", "{file}:{line}:{column}"])

config.set("url.searchengines", {"DEFAULT": "https://google.com/search?q={}" })

config.load_autoconfig(False)

