local This = {}

local GRID_SIZE = 8
local HALF_GRID_SIZE = GRID_SIZE / 2

hs.grid.setGrid(GRID_SIZE .. 'x' .. GRID_SIZE)
hs.grid.setMargins({0, 0})
hs.window.animationDuration = 0

local screenPositions       = {}
screenPositions.left        = {
  x = 0, y = 0,
  w = HALF_GRID_SIZE, h = GRID_SIZE
}
screenPositions.right       = {
  x = HALF_GRID_SIZE, y = 0,
  w = HALF_GRID_SIZE, h = GRID_SIZE
}
screenPositions.largeLeft        = {
  x = 0, y = 0,
  w = GRID_SIZE/3*2, h = GRID_SIZE
}
screenPositions.largeRight       = {
  x = GRID_SIZE/3, y = 0,
  w = GRID_SIZE/3*2, h = GRID_SIZE
}
screenPositions.top         = {
  x = 0, y = 0,
  w = GRID_SIZE, h = HALF_GRID_SIZE
}
screenPositions.bottom      = {
  x = 0, y = HALF_GRID_SIZE,
  w = GRID_SIZE, h = HALF_GRID_SIZE
}
screenPositions.topLeft     = {
  x = 0, y = 0,
  w = HALF_GRID_SIZE, h = HALF_GRID_SIZE
}
screenPositions.topRight    = {
  x = HALF_GRID_SIZE, y = 0,
  w = HALF_GRID_SIZE, h = HALF_GRID_SIZE
}
screenPositions.bottomLeft  = {
  x = 0, y = HALF_GRID_SIZE,
  w = HALF_GRID_SIZE, h = HALF_GRID_SIZE
}
screenPositions.bottomRight = {
  x = HALF_GRID_SIZE, y = HALF_GRID_SIZE,
  w = HALF_GRID_SIZE, h = HALF_GRID_SIZE
}
screenPositions.middle = {
  x = HALF_GRID_SIZE/2, y = 0,
  w = HALF_GRID_SIZE, h = GRID_SIZE
}
screenPositions.maximized = {
  x = 0, y = 0,
  w = GRID_SIZE, h = GRID_SIZE
}
This.screenPositions = screenPositions

-- This function will move either the specified or the focuesd
-- window to the requested screen position
function This.moveWindowToPosition(cell, window)
  if window == nil then
    window = hs.window.focusedWindow()
  end
  if window then
    local screen = window:screen()
    hs.grid.set(window, cell, screen)
  end
end
-- This function will move either the specified or the focused
-- window to the center of the sreen and let it fill up the
-- entire screen.
function This.windowMaximize(factor, window)
   if window == nil then
      window = hs.window.focusedWindow()
   end
   if window then
      window:maximize()
   end
end
return This
