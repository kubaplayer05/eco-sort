package repository

import (
	"context"
	"github.com/google/generative-ai-go/genai"
	"google.golang.org/api/option"
	"log"
	"os"
)

func CreateGenAiClient() (*genai.Client, error) {
	client, err := genai.NewClient(context.Background(), option.WithAPIKey(os.Getenv("GOOGLE_API_KEY")))
	if err != nil {
		log.Printf("failed to create google generative ai client: %v", err)
	}

	return client, err
}
