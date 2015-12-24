from i3pystatus import Status

COLOR_RED = '$fa4934'
COLOR_GREEN = '#b8bb26'
COLOR_YELLOW = '#fabd2f'
COLOR_BLUE = '#83a598'
COLOR_PURPLE = '#d3869b'
COLOR_AQUA = '#8ec07c'
COLOR_ORANGE = '#fe8019'
COLOR_BLACK = '#665c54'
COLOR_GRAY = '#d5c4a1'
COLOR_WHITE = '#ebdbb2'

status = Status(standalone=True)

status.register('clock', format='%a, %d %b  %H:%M')

status.register('battery',
                format='{status}{percentage:.0f} ({remaining:%H:%M})',
                not_present_text='', critical_level_percentage=15,
                status={
                    'DPL': '',
                    'FULL': '',
                    'CHR': '',
                    'DIS': ''
                }, full_color=COLOR_GREEN, charging_color=COLOR_YELLOW,
                critical_color=COLOR_RED)

status.register('network', format_up='wired', format_down='',
                color_up=COLOR_GREEN, color_down=COLOR_RED, interface='enp1s0',
                dynamic_color=False, on_rightclick=None, on_upscroll=None,
                on_downscroll=None)

status.register('network', format_up='{essid} {quality}', format_down='',
                color_up=COLOR_GREEN, color_down=COLOR_RED, interface='wlp2s0',
                dynamic_color=False, on_rightclick=None, on_upscroll=None,
                on_downscroll=None)

status.register('mem', format='{used_mem:.0f} MiB', warn_percentage=50,
                alert_percentage=80, color=COLOR_GRAY, warn_color=COLOR_ORANGE,
                alert_color=COLOR_RED, round_size=0)

status.register('load', format='{avg1} {avg5} {avg15}', critical_limit=4,
                critical_color=COLOR_RED)

status.register('pulseaudio', format='{volume}', format_muted='{volume}',
                color_muted=COLOR_BLACK, color_unmuted=COLOR_GRAY)

status.register('mpd',
                format='{artist} - {title} {status}{song_elapsed}/{song_length}',
                status={
                    'pause': '',
                    'play': '',
                    'stop': ''
                }, hide_inactive=True)

status.run()
