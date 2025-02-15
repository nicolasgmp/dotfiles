local wezterm = require("wezterm")

return {
  -- Definir o programa inicial como o WSL
  default_prog = { "wsl.exe", "--cd", "/home/nicolas"  },

  -- Remover barra de título
  window_decorations = "RESIZE",
  
  mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Left"} },
		mods = "SHIFT",
		action = wezterm.action.StartWindowDrag,
	}
  },

  -- Definir opacidade
  -- window_background_opacity = 0.9,
  window_background_opacity = 0.9,
  win32_system_backdrop = 'Acrylic',
  
  -- window_background_image = "C:/Users/magri/Desktop/bGMnW6n.jpg",
  --window_background_image_halign = "Center",  -- Horizontal alinhamento da imagem
  --window_background_image_valign = "Center",  -- Vertical alinhamento da imagem
  -- window_background_image_opacity = 0.1,
  
  font = wezterm.font("JetBrainsMono Nerd Font"),
  -- Configurar fonte
  font_size = 13.5,

  -- Para Windows, melhorar a integração com WSL
  enable_wayland = false,  -- Se estiver usando WSL com Wayland
  
  colors = {
    foreground = "#ffffff",
    background = "#16181a",

    cursor_bg = "#ffffff",
    cursor_fg = "#16181a",
    cursor_border = "#ffffff",

    selection_fg = "#ffffff",
    selection_bg = "#3c4048",

    scrollbar_thumb = "#16181a",
    split = "#16181a",

    ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
  },
  
  enable_tab_bar = false,
  
  underline_position = -3,
  underline_thickness = 2,
}
