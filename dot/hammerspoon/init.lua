-- Preferences

hs.autoLaunch(false)
hs.automaticallyCheckForUpdates(true)
hs.dockIcon(false)
hs.menuIcon(true)
hs.consoleOnTop(true)
hs.uploadCrashData(false)

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
  e = "Atom Nightly",
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

-- Multiple Monitors

function moveWindowToDisplay(d)
  return function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    win:moveToScreen(displays[d], false, true)
  end
end

hs.hotkey.bind(hyper, "1", moveWindowToDisplay(1))
hs.hotkey.bind(hyper, "2", moveWindowToDisplay(2))

function fullScreenToDisplay(d)
  return function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    win:setFullScreen(false)
    hs.timer.doAfter(.6, function()
      win:moveToScreen(displays[d], false, true)
    end)
    hs.timer.doAfter(.6, function()
      win:setFullScreen(true)
    end)
  end
end

hs.hotkey.bind(shift_hyper, "1", fullScreenToDisplay(1))
hs.hotkey.bind(shift_hyper, "2", fullScreenToDisplay(2))

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

hs.hotkey.bind(hyper, "/", function()
  wm.moveWindowToPosition(wm.screenPositions.middle)
end)
