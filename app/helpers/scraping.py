import os
import asyncio
import logging

from pyppeteer import launch
from pyppeteer.browser import Browser
from pyppeteer.page import Page

async def scraping():
  executive_settings = {
    "handleSIGINT": False,
    "handleSIGTERM": False,
    "handleSIGHUP": False,
    "logLevel": logging.DEBUG,
  }
  if os.getenv("PUPPETEER_EXECUTABLE_PATH"):
    executive_settings["executablePath"] = os.environ["PUPPETEER_EXECUTABLE_PATH"]
    executive_settings["args"] = ["--no-sandbox"]

  browser: Browser = await launch(executive_settings)
  try:
    page: Page = await browser.newPage()
    await page.goto("https://www.google.com/")
  finally:
    await browser.close()

  return "OK"
