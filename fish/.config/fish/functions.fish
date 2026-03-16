function killprocess --description 'Kill selected process'
  set -l pid (ps aux | fzf -m --header-lines=1 | awk '{print $2}')

  if test -n "$pid"
    echo "Killing processes: $pid"
    kill -9 $pid
  end
end

function killport --description 'Select a port to kill, by pid, port, or command line'

  # Function to get the command line for a given PID
  function get_command -a pid
    ps -p $pid | awk 'NR>1 {for (i=4; i<=NF; i++) {printf "%s ", $i}; print ""}'
  end

  # Find listening processes, get commands, and format output
  lsof -iTCP -sTCP:LISTEN -P | awk '{print $2, $9}' | uniq | tail -n +2 | \
    while read -l pid port
      set -l command (get_command $pid)
      set -l port (string pad -w 8 (string replace 'localhost' '' $port))
      set -l pid (string pad --right -w 6 $pid)
      echo -e "$pid $port $command"  | column
    end | \

    # Pipe the output to fzf for selection. Grab pid and show pstree
    fzf --exact --tac --preview 'pstree -p (echo {} | awk "{print $2}")' --preview-window=down,30% --header "Select a process to kill (PID Command Port):" | \

    # Kill the selected process
    awk '{print $1}' | xargs -r kill -9
end
