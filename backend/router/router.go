package router

import (
	"eco-sort/backend/handler"
	"github.com/gofiber/fiber/v2"
)

func SetupRoutes(app *fiber.App) {
	productRouter := app.Group("/product")
	productRouter.Get("/", handler.GetAllProducts)
	productRouter.Get("/category/:id", handler.GetByCategoryId)
	productRouter.Get("/search/:name", handler.SearchProduct)

	genAiRouter := app.Group("/genai")
	genAiRouter.Post("/suggestion", handler.GetRecyclingSuggestion)
}
