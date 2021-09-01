# Python app

from fastapi import FastAPI, Request
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse

app = FastAPI()
app.mount("/static", StaticFiles(directory = "static"), name = "static")
templates = Jinja2Templates(directory = "templates")
@app.get("/time", response_class = HTMLResponse)

async def read_item(request: Request):
    return templates.TemplateResponse("current_time.html", {"request": request})
