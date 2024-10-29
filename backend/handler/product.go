package handler

import (
	"context"
	"eco-sort/backend/db"
	"eco-sort/backend/model"
	"github.com/gofiber/fiber/v2"
	"log"
)

func GetAllProducts(c *fiber.Ctx) error {
	sql := "select pr.id, pr.name, rc.name from products pr join recycle_category rc on rc.id = pr.category_id"
	rows, err := db.Conn.Query(context.Background(), sql)

	if err != nil {
		log.Printf("Query error: %v", err)
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "Failed to query all products"})
	}

	defer rows.Close()

	var products []model.Product

	for rows.Next() {
		var product model.Product
		if err := rows.Scan(&product.Id, &product.Name, &product.Category); err != nil {
			return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "failed to scan product"})
		}

		products = append(products, product)
	}

	if err := rows.Err(); err != nil {
		log.Printf("Rows error: %v", err)
	}

	return c.JSON(products)
}
