local status_ok, shade = pcall(require, "shade")
if not status_ok then
	return
end

shade.setup({
  overlay_opacity = 50,
  opacity_step = 5,
  keys = {
    brightness_up    = '<A-Up>',
    brightness_down  = '<A-Down>',
    toggle           = '<A-s>',
  }
})
