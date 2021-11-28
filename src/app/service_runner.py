#!/usr/bin/env python3

import schedule
import time
import main

def job():
    main.main()



def service_runner():
    job()

    schedule.every().day.at("00:01").do(job)

    while True:
        schedule.run_pending()
        time.sleep(1)


if __name__ == '__main__':
    service_runner()
