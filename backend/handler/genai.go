package handler

import (
	"context"
	"github.com/gofiber/fiber/v2"
	"github.com/google/generative-ai-go/genai"
	"google.golang.org/api/option"
	"log"
	"os"
)

func GetRecyclingSuggestion(c *fiber.Ctx) error {

	prompt := "Cześć, posiadam przedmiot: długopis, który potrzebuje wyrzucić. Potrzębuje twojego wsparcia, dopasuj podany przedmiot do podanych" +
		"poniżej rodzajów recyklingu: 1. plastic and metal, 2. glass, 3. bio, 4. paper, 5. mixed, 6.electronics and batteries, 7.medicines and chemicals, 8.clothes, 9.other. " +
		"Dodatkowo, jeżeli dany przedmiot ma niestandardową procedurę podczas wyrzucania/recyklingu to możesz ją opisać"

	client, err := genai.NewClient(context.Background(), option.WithAPIKey(os.Getenv("GOOGLE_API_KEY")))
	if err != nil {
		log.Fatalf("failed to create google generative ai client: %v", err)
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "failed to create google generative ai client"})
	}

	defer client.Close()

	model := client.GenerativeModel("gemini-1.5-flash")

	resp, err := model.GenerateContent(context.Background(), genai.Text(prompt))
	if err != nil {
		log.Fatalf("failed to get response from generative ai: %v", err)
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "failed to get response from generative ai"})
	}

	return c.JSON(fiber.Map{"response": resp})
}
