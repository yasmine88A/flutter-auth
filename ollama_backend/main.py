
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import httpx

app = FastAPI()

# Modèle IA utilisé
MODEL_NAME = "llama3.2"

# Adresse locale du serveur Ollama
OLLAMA_URL = "http://localhost:11434/api/chat"


# Structure de la question reçue depuis Flutter
class ChatRequest(BaseModel):
    question: str


# Vérifier que FastAPI fonctionne
@app.get("/")
def home():
    return {"message": "FastAPI fonctionne !"}


# Endpoint du chatbot
@app.post("/chat")
async def chat(request: ChatRequest):

    if not request.question.strip():
        raise HTTPException(
            status_code=400,
            detail="La question ne doit pas être vide"
        )

    payload = {
        "model": MODEL_NAME,
        "messages": [
            {
                "role": "user",
                "content": request.question
            }
        ],
        "stream": False
    }

    try:
        async with httpx.AsyncClient(timeout=120.0) as client:
            response = await client.post(
                OLLAMA_URL,
                json=payload
            )

        response.raise_for_status()

        data = response.json()
        answer = data["message"]["content"]

        return {"answer": answer}

    except httpx.HTTPError as e:
        raise HTTPException(
            status_code=502,
            detail=f"Erreur Ollama : {str(e)}"
        )

    except (KeyError, ValueError, TypeError):
        raise HTTPException(
            status_code=502,
            detail="Réponse Ollama invalide"
        )
