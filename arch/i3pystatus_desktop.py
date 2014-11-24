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

status.register("wireless",
        interface = "wlp5s0",
        format_up = " {essid}",)

#non 'hardware' related stuff below

status.register("alsa",
        format = " {volume}",
        card = 1,
        format_muted = " {volume}",)
        

status.register("mpd",
    format="[{status} {title}, {artist} ]",
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    },)

status.run()
