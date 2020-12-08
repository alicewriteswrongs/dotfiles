# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status, IntervalModule
from i3pystatus.weather import wunderground
from i3pystatus.weather import weathercom

status = Status(standalone = True)

status.register("clock",
        format = "%a:%m/%d %H:%M ",)

status.register("cpu_usage",
        format = "{usage:02}%")

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

status.register("pulseaudio",
        format = "{volume}",
        format_muted = "{volume}",)

class Brightness(IntervalModule):
    def run(self):
        result = subprocess.run(
            "xbacklight", stdout=subprocess.PIPE, encoding="utf-8"
        )

        self.output = {
            "full_text": result.stdout.strip().split(".")[0],
        }

status.register(Brightness)

# status.register(
#     'weather',
#     format='{condition} {current_temp}{temp_unit}[ Hi: {high_temp}][ Lo: {low_temp}][ {update_error}]',
#     colorize=True,
#     hints={'markup': 'pango'},
#     update_error='<span color="#ff0000">!</span>'
#     backend=weathercom.Weathercom(
#         location_code='a20fadf655606add2451379f9f725be9d7ff1fe5b4d5b76a689f228ab3fb1375',
#         units='imperial',
#     ),
# )


status.register(
    'weather',
    format='{condition} {current_temp}{temp_unit}[ {icon}][ Hi: {high_temp}][ Lo: {low_temp}][ {update_error}]',
    colorize=True,
    hints={'markup': 'pango'},
    update_error='<span color="#ff0000">!</span>',
    # log_level=logging.DEBUG,
    backend=weathercom.Weathercom(
        location_code='94107:4:US',
        units='imperial',
    ),
)

# status.register(
#     "spotify",
#     format = "{artist} - {title} {status}"
# )

status.run()
