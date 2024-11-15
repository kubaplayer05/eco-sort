package handler

import (
	"eco-sort/backend/model"
	"github.com/gofiber/fiber/v2"
	"log"
)

type GetRecyclingSuggestionBody struct {
	ProductName string `json:"product_name"`
}

func GetRecyclingSuggestion(c *fiber.Ctx) error {
	var recycleSuggestion model.RecycleSuggestion
	var body GetRecyclingSuggestionBody

	if err := c.BodyParser(&body); err != nil {
		log.Printf("BodyParser error: %v", err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"error": "Failed to parse request body"})
	}

	resp, err := recycleSuggestion.GenerateRecycleSuggestion(body.ProductName)

	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": err})
	}

	recycleSuggestions, err := recycleSuggestion.ConvertRecycleSuggestionToJson(resp, body.ProductName)

	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": err})
	}

	for _, suggestion := range recycleSuggestions {
		err := model.Product{}.CreateFromSuggestion(suggestion)

		if err != nil {
			log.Printf("%s", err)
		}
	}

	return c.JSON(recycleSuggestions)
}
