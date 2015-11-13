# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone = True)

#'hardware' related statuses

status.register("clock",
        format = "%a:%m/%d %I:%M",)

status.register("cpu_usage")

status.register("mem",
        format = "{used_mem}G",
        divisor = 1073741824,)

status.register("temp",
        format = "{temp:.0f}C",)

status.register("battery",
        #format = "{status}/{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
        format = "{status}{percentage: .0f}%",
        alert = True,
        alert_percentage = 10,
        status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "",
    },)

# status.register("wireless",
#         interface = "wlp3s0",
#         format_up = " {essid}",)

#non 'hardware' related stuff below

status.register("pulseaudio",
        format = " {volume}",
        format_muted = " {volume}",)

status.register("Spotify",
        format = "[{status} {title}, {artist}]"
        )

# status.register("mpd",
#     format="[{status} {title}, {artist} ]",
#     status={
#         "pause": "▷",
#         "play": "▶",
#         "stop": "◾",
#     },)

status.run()
