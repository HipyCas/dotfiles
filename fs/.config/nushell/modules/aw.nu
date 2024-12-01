# Start the ActivityWatch server and watchers
export def start [
  --clean (-c) # Run `pueue clean` before starting ActivityWatch
] {
  if $clean {
    pueue clean
  }

  cd ($env.HOME | path join activitywatch)

  pueue add -g aw -i -l "Activity Watch Server" ./aw-server/aw-server
  pueue add -g aw -i -l "Activity Watch AFW Watcher" ./aw-watcher-afk/aw-watcher-afk
  pueue add -g aw -i -l "Activity Watch Window Watcher" ./aw-watcher-window/aw-watcher-window

  pueue start -g aw

  notify-send "ActivityWatch started"
}

# Stop all ActivityWatch tasks
export def kill [] {
  pueue kill -g aw
  pueue clean -g aw
}

# Show the logs for the currently running ActivityWatch tasks
export def logs [] {
  let ids = (pueue status -j | from json | get tasks | values | filter {|it| $it.group == "aw" } | get id) 
  $ids | each {|id| pueue log $id}
}
# Show the status of the currently running ActivityWatch tasks
export def status [] {
  pueue status -g aw
}
