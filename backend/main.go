package main

import (
	"eco-sort/backend/config"
	"eco-sort/backend/db"
	"eco-sort/backend/router"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"log"
)

func main() {
	config.Init()

	app := fiber.New()
	app.Use(cors.New())

	err := db.Connect()
	if err != nil {
		log.Fatalf("failed to connect to db: %v", err)
	}

	defer db.Close()

	router.SetupRoutes(app)
	log.Fatal(app.Listen(":3000"))
}
