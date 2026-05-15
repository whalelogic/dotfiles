from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import default_colors, reverse, bold, normal, default

class neon(ColorScheme):
    progress_bar_color = 39  # Electric Blue

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            
            if context.empty or context.error:
                fg = 160 # Neon Red
                bg = 232 # Deep Black
            if context.border:
                fg = 201 # Hot Pink
            if context.image:
                fg = 201 # Pink
            if context.video:
                fg = 93  # Purple
            if context.audio:
                fg = 45  # Cyan
            if context.document:
                fg = 15  # White
            if context.container:
                attr |= bold
                fg = 214 # Orange
            if context.directory:
                attr |= bold
                fg = 39  # Cyan-Blue
            elif context.executable and not \
                    any((context.media, context.container, context.fifo, context.socket)):
                attr |= bold
                fg = 82  # Lime Green
            if context.socket:
                fg = 201 # Pink
                attr |= bold
            if context.fifo or context.device:
                fg = 214 # Orange
                if context.device:
                    attr |= bold
            if context.link:
                fg = 226 if context.good else 160 # Yellow or Red
            
            if context.tag_marker and not context.selected:
                attr |= bold
                fg = 201

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = 160 if context.bad else 82
            elif context.directory:
                fg = 39
            elif context.tab:
                if context.good:
                    bg = 39
            elif context.link:
                fg = 45

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 82
                elif context.bad:
                    fg = 160
            if context.marked:
                attr |= bold | reverse
                fg = 214
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 160

        if context.text:
            if context.highlight:
                attr |= reverse

        return fg, bg, attr
