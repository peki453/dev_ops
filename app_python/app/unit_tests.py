# Unit tests

from index import app
from fastapi import FastAPI
from fastapi.testclient import TestClient

def test_read_items():
    with TestClient(app) as myclient:
        response = myclient.get("/time")
        assert response.status_code == 200

