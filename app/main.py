import os

from flask import Flask
from helpers.scraping import scraping

app = Flask(__name__)

@app.route("/get_data")
async def get_data():
  data = await scraping()
  return data

if __name__ == "__main__":
  app.run(debug=False, host='0.0.0.0', port=int(os.environ.get("PORT", 8080)), use_reloader=False, threaded=False)
