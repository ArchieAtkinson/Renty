#!/usr/bin/env python3

import schedule
import time
import main

def job():
    main.main()

schedule.every().day.at("00:01").do(job)

while True:
    schedule.run_pending()
    time.sleep(1)