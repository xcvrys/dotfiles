function fish_greeting
    set_color cyan
    echo -e "⠀        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣄⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠋⠀⠹⣷⡀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠸⣿⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡇⠀⠀⠀⠀⣿⣠⣤⣤⣄⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣸⣧⠀⠀⠀⠀⣿⡏⠀⠈⣿⡆
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡾⠉⠉⠟⠀⠀⠀⠀⠉⠁⠀⠀⢹⡇
	⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣦⠀⠀⠀⢸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠇
	⣠⣄⠀⠀⠀⠀⠀⢀⣾⠁⢹⣧⠀⠀⢈⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠏⠀
	⣿⠛⢷⣤⣤⡴⠶⠾⠃⠀⠀⣿⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⠏⠀⠀
	⢻⡆⣀⡀⠀⠀⠀⠀⣀⣀⠀⣿⡟⠁⠀⠀⠀⠀⠀⢀⣠⣤⠶⠞⠋⠁⠀⠀⠀
	⠸⣿⡿⠟⣿⣄⡾⠟⡛⢓⣿⠋⠀⠀⠀⣀⣤⡶⠞⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠹⣷⣼⣁⣽⣧⣽⠿⠋⢁⣠⣴⠶⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⣠⡿⠛⠉⠁⠀⠀⠰⣯⣁⣠⠴⠛⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⢀⣾⠋⢀⣄⠀⠀⠀⣀⠀⢿⡷⠦⠴⠶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⢸⡏⢠⣿⢹⣧⠀⣾⠻⣧⠘⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠘⢷⠟⠁⢸⡏⠀⣿⠀⠻⣦⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⢸⡇⢸⡟⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠈⠙⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    set_color normal

    # System Info
    set_color yellow
    echo "System Information:"
    set_color normal

    # OS
    set_color blue
    echo -n "OS: "
    set_color green
    cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f2

    # Uptime
    set_color blue
    echo -n "Uptime: "
    set_color green
    uptime -p | sed 's/up //'

    # Memory
    set_color blue
    echo -n "Memory: "
    set_color green
    free -m | awk '/Mem:/ {printf "%.1f/%.1f GB\n", $3/1000, $2/1000}'

    # Shell Info
    set_color blue
    echo -n "Fish Version: "
    set_color green
    fish --version | string split ' ' -f3
    set_color blue

    # Colorful separator
    set_color cyan
    echo -e "\n$(string repeat -n 50 '─')"
    set_color normal
end
