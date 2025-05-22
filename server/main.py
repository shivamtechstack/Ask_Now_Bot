from fastapi import FastAPI

from pydantic_model.chat_body import ChatBody
from services.search_service import SearchService

app = FastAPI()

search_service = SearchService()

@app.post("/chat")
def chat_endpoint(body: ChatBody):
    search_results = search_service.web_search(body.query)
    print(search_results)
    return body.query


