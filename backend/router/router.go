package router

import (
	"eco-sort/backend/handler"
	"github.com/gofiber/fiber/v2"
)

func SetupRoutes(app *fiber.App) {

	productRouter := app.Group("/product")
	productRouter.Get("/", handler.GetAllProducts)

	genaiRouter := app.Group("/genai")
	genaiRouter.Get("/suggestion", handler.GetRecyclingSuggestion)
}
