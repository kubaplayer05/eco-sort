package main

import (
	"eco-sort/backend/config"
	"eco-sort/backend/repository"
	"eco-sort/backend/router"
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"log"
)

func main() {
	config.Init()

	app := fiber.New()
	app.Use(cors.New())

	err := repository.Connect()
	if err != nil {
		log.Fatalf("failed to connect to repository: %v", err)
	}

	defer repository.Close()

	router.SetupRoutes(app)
	log.Fatal(app.Listen(":3000"))
}
