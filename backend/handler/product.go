package handler

import (
	"eco-sort/backend/model"
	"fmt"
	"github.com/gofiber/fiber/v2"
)

func GetAllProducts(c *fiber.Ctx) error {
	var product model.Product

	products, err := product.GetAll()

	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": fmt.Sprintf("%s", err)})
	}

	return c.JSON(products)
}

func GetNewestProducts(c *fiber.Ctx) error {
	var product model.Product

	products, err := product.GetNewestProducts()

	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": fmt.Sprintf("%s", err)})
	}

	return c.JSON(products)
}

func GetByCategoryId(c *fiber.Ctx) error {
	var product model.Product
	id := c.Params("id")

	if id == "" {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"error": "Failed to get param string"})
	}

	products, err := product.GetByCategoryId(id)

	if err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"error": fmt.Sprintf("%s", err)})
	}

	return c.JSON(products)
}

func SearchProduct(c *fiber.Ctx) error {
	var product model.Product
	name := c.Params("name")

	if name == "" {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"error": "Failed to get param string"})
	}

	embedding, err := product.GetEmbeddingFromName(name)

	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": fmt.Sprintf("%s", err)})
	}

	products, err := product.SearchWithEmbedding(embedding)

	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": fmt.Sprintf("%s", err)})
	}

	return c.JSON(products)
}
