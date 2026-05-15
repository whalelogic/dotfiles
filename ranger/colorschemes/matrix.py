from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import default_colors, reverse, bold, normal, default

class matrix(ColorScheme):
    progress_bar_color = 46 # Pure Green

    def use(self, context):
        fg, bg, attr = default_colors
        bg = 232 # Pitch Black

        if context.reset:
            return default_colors

        elif context.in_browser:
            fg = 46 # Default Matrix Green
            if context.selected:
                attr = reverse
                fg = 82 # Brighter Lime when selected
            
            if context.directory:
                attr |= bold
                fg = 34 # Darker Forest Green for folders
            if context.link:
                fg = 118
            if context.image or context.video:
                fg = 22 # Very dark green for media

        elif context.in_titlebar:
            attr |= bold
            fg = 46
            if context.directory:
                fg = 82

        elif context.in_statusbar:
            if context.permissions:
                fg = 46 if context.good else 160
            if context.marked:
                attr |= bold | reverse
                fg = 46

        return fg, bg, attr
