# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status, IntervalModule

status = Status(standalone = True)

status.register("clock",
        format = "%a:%m/%d %H:%M",)

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

status.run()
