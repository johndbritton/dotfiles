-- Preferences

hs.autoLaunch(false)
hs.automaticallyCheckForUpdates(true)
hs.dockIcon(false)
hs.menuIcon(true)
hs.consoleOnTop(true)
hs.uploadCrashData(false)
hs.screen.strictScreenInDirection = true

-- System Wake Watcher

function caffeinateCallback(eventType)
  if eventType == hs.caffeinate.watcher.screensDidWake then
    hs.execute("office display spain", true)
  end
end

caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
caffeinateWatcher:start()

-- Key Combos

hyper = {"⌘", "⌃", "⌥"}
shift_hyper = {"⇧", "⌘", "⌃", "⌥"}

-- Reload
hs.hotkey.bind(hyper, "escape", function()
  hs.reload()
end)

-- Restart
hs.hotkey.bind(hyper, "`", function()
  hs.relaunch()
end)

-- Global Applications

appKeys = {
  b = "Safari",
  c = "Fantastical",
  e = "Visual Studio Code",
  f = "Finder",
  t = "Terminal",
  s = "Slack",
  x = "Spotify"
}

for key, app in pairs(appKeys)
do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end

-- Dotfiles

hs.hotkey.bind(hyper, "d", function()
  hs.execute("dotfiles edit", true)
end)

-- Bluetooth

hs.hotkey.bind(hyper, "h", function()
  hs.execute("bluetooth connect airpods", true)
end)
hs.hotkey.bind(shift_hyper, "h", function()
  hs.execute("bluetooth disconnect airpods", true)
end)

hs.hotkey.bind(hyper, "u", function()
  hs.execute("bluetooth connect jdb-air", true)
end)
hs.hotkey.bind(shift_hyper, "u", function()
  hs.execute("bluetooth disconnect jdb-air", true)
end)

-- Speakers

hs.hotkey.bind(hyper, "a", function()
  hs.execute("audio-out headphones", true)
end)

hs.hotkey.bind(hyper, "z", function()
  hs.execute("audio-out speakers", true)
end)

-- Home Assistant

hs.hotkey.bind(hyper, "l", function()
  hs.execute("home-assistant toggle study-light", true)
end)

hs.hotkey.bind(hyper, "k", function()
  hs.execute("home-assistant toggle study-key-lights", true)
end)

-- Multiple Monitors

function moveWindowToDisplay(display)
  return function()
    if(display() == nil)
    then
      return
    end

    local win = hs.window.focusedWindow()
    if(win:isFullScreen())
    then
      win:setFullScreen(false)
      hs.timer.doAfter(.6, function()
        win:moveToScreen(display(), false, true)
        win:setFullScreen(true)
      end)
    else
      win:moveToScreen(display(), false, true)
    end
  end
end

function destinationScreen(direction)
  return function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()

    if(direction == "north")
    then
      return screen:toNorth()
    elseif(direction == "south")
    then
      return screen:toSouth()
    elseif(direction == "east")
    then
      return screen:toEast()
    elseif(direction == "west")
    then
      return screen:toWest()
    end

    return nil
  end
end

hs.hotkey.bind(shift_hyper, "up", moveWindowToDisplay(destinationScreen("north")))
hs.hotkey.bind(shift_hyper, "down", moveWindowToDisplay(destinationScreen("south")))
hs.hotkey.bind(shift_hyper, "left", moveWindowToDisplay(destinationScreen("west")))
hs.hotkey.bind(shift_hyper, "right", moveWindowToDisplay(destinationScreen("east")))

-- Full Screen

function toggleFullScreen()
  return function()
    local win = hs.window.focusedWindow()
    if(win:isFullScreen())
    then
      win:setFullScreen(false)
    else
      win:setFullScreen(true)
    end
  end
end

hs.hotkey.bind(shift_hyper, "m", toggleFullScreen())

-- Window Management

local wm = require('window-management')

hs.hotkey.bind(hyper, "m", function()
  wm.moveWindowToPosition(wm.screenPositions.maximized)
end)

hs.hotkey.bind(hyper, "up", function()
  wm.moveWindowToPosition(wm.screenPositions.top)
end)
hs.hotkey.bind(hyper, "down", function()
  wm.moveWindowToPosition(wm.screenPositions.bottom)
end)
hs.hotkey.bind(hyper, "left", function()
  wm.moveWindowToPosition(wm.screenPositions.left)
end)
hs.hotkey.bind(hyper, "right", function()
  wm.moveWindowToPosition(wm.screenPositions.right)
end)

hs.hotkey.bind(hyper, ",", function()
  wm.moveWindowToPosition(wm.screenPositions.largeLeft)
end)
hs.hotkey.bind(hyper, ".", function()
  wm.moveWindowToPosition(wm.screenPositions.largeRight)
end)

hs.hotkey.bind(hyper, "[", function()
  wm.moveWindowToPosition(wm.screenPositions.topLeft)
end)
hs.hotkey.bind(hyper, "]", function()
  wm.moveWindowToPosition(wm.screenPositions.topRight)
end)
hs.hotkey.bind(hyper, ";", function()
  wm.moveWindowToPosition(wm.screenPositions.bottomLeft)
end)
hs.hotkey.bind(hyper, "'", function()
  wm.moveWindowToPosition(wm.screenPositions.bottomRight)
end)

hs.hotkey.bind(shift_hyper, "o", function()
  wm.moveWindowToPosition(wm.screenPositions.topLeftOne)
end)
hs.hotkey.bind(shift_hyper, "p", function()
  wm.moveWindowToPosition(wm.screenPositions.topLeftTwo)
end)
hs.hotkey.bind(shift_hyper, "[", function()
  wm.moveWindowToPosition(wm.screenPositions.topRightOne)
end)
hs.hotkey.bind(shift_hyper, "]", function()
  wm.moveWindowToPosition(wm.screenPositions.topRightTwo)
end)
hs.hotkey.bind(shift_hyper, "k", function()
  wm.moveWindowToPosition(wm.screenPositions.bottomLeftOne)
end)
hs.hotkey.bind(shift_hyper, "l", function()
  wm.moveWindowToPosition(wm.screenPositions.bottomLeftTwo)
end)
hs.hotkey.bind(shift_hyper, ";", function()
  wm.moveWindowToPosition(wm.screenPositions.bottomRightOne)
end)
hs.hotkey.bind(shift_hyper, "'", function()
  wm.moveWindowToPosition(wm.screenPositions.bottomRightTwo)
end)

hs.hotkey.bind(hyper, "/", function()
  wm.moveWindowToPosition(wm.screenPositions.middle)
end)

-- Hold cmd + q to quit
cmdQDelay = 2

cmdQTimer = nil
cmdQAlert = nil

function cmdQCleanup()
  hs.alert.closeSpecific(cmdQAlert)
  cmdQTimer = nil
  cmdQAlert = nil
end

function stopCmdQ()
  if cmdQTimer then
    cmdQTimer:stop()
    cmdQCleanup()
    hs.alert("quit canceled",0.5)
  end
end

function startCmdQ()
  local app = hs.application.frontmostApplication()
  cmdQTimer = hs.timer.doAfter(cmdQDelay, function() app:kill(); cmdQCleanup() end)
  cmdQAlert = hs.alert("hold to quit " .. app:name(), true)
end

cmdQ = hs.hotkey.bind({"cmd"},"q",startCmdQ,stopCmdQ)
