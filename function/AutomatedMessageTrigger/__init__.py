import logging
import azure.functions as func

def main(mytimer: func.TimerRequest) -> None:
    logging.info("Automated message function executed.")