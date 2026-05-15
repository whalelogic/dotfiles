from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import default_colors, reverse, bold, normal, default

class powerblue(ColorScheme):
    progress_bar_color = 33 # Azure Blue

    def use(self, context):
        fg, bg, attr = default_colors
        bg = 18 # Dark Blue Background

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
                fg = 255 # White text when selected
            else:
                attr = normal
                fg = 252 # Off-white/Light Gray for standard files

            if context.directory:
                attr |= bold
                fg = 81 # Bright Cyan/Sky Blue
            elif context.executable:
                fg = 118 # Keeping a hint of green for scripts
            if context.link:
                fg = 45 # Turquoise
            if context.container:
                fg = 141 # Light Purple/Blue mix

        elif context.in_titlebar:
            attr |= bold
            fg = 255
            bg = 21 # Slightly different blue for header
            if context.directory:
                fg = 81

        elif context.in_statusbar:
            bg = 21
            if context.permissions:
                fg = 81 if context.good else 160
            if context.marked:
                attr |= bold | reverse
                fg = 226 # Yellow accent for marked files

        return fg, bg, attr
