package model

import (
	"context"
	"eco-sort/backend/repository"
	"fmt"
	"github.com/google/generative-ai-go/genai"
	"log"
)

type RecycleSuggestion struct {
	ProductName string `json:"product_name"`
	Description string `json:"description"`
	CategoryId  int    `json:"category_id"`
}

func (RecycleSuggestion) GenerateRecycleSuggestion(name string) (*genai.GenerateContentResponse, error) {
	prompt := fmt.Sprintf("Cześć, posiadam przedmiot: %s, który potrzebuje wyrzucić. Potrzębuje twojego wsparcia, dopasuj podany przedmiot do podanych"+
		"poniżej rodzajów recyklingu: 1. plastic and metal, 2. glass, 3. bio, 4. paper, 5. mixed, 6.electronics and batteries, 7.medicines and chemicals, 8.clothes, 9.other. "+
		"Dodatkowo, jeżeli dany przedmiot ma niestandardową procedurę podczas wyrzucania/recyklingu to możesz ją opisać. "+
		"Poniżej masz przedstawiony schemat JSON do poprawnej zwracanej odpowiedzi:"+
		"{description: string (long text), category_id: number}", name)

	client, err := repository.CreateGenAiClient()

	if err != nil {
		log.Printf("Failed to create gen ai client: %v", err)
		return nil, err
	}

	defer func() {
		if closeErr := client.Close(); closeErr != nil {
			log.Printf("Failed to close gen ai client: %v", closeErr)
			if err == nil {
				err = closeErr
			}
		}
	}()

	model := client.GenerativeModel("gemini-1.5-flash")
	model.ResponseMIMEType = "application/json"

	resp, err := model.GenerateContent(context.Background(), genai.Text(prompt))

	if err != nil {
		log.Printf("failed to get response from generative ai: %v", err)
		return nil, err
	}

	return resp, nil
}
