# Python app

from fastapi import FastAPI, Request
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse
import datetime

app = FastAPI()
app.mount("/static", StaticFiles(directory = "static"), name = "static")
templates = Jinja2Templates(directory = "templates")
@app.get("/time", response_class = HTMLResponse)

async def read_item(request: Request):
    with open('tmp_time.txt', 'a') as fp:
		fp.write(str(datetime.datetime.now()) + '\n')
    return templates.TemplateResponse("current_time.html", {"request": request})

@app.get("/visits", response_class = HTMLResponse)
async def read_file(request: Request):
	return '\n'.join(open('tmp_time.txt', 'r').readlines())



