package config

import (
	"fmt"
	"github.com/joho/godotenv"
	"log"
	"os"
)

func Init() {
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatalf("Error loading .env file")
	}
}

func GetDbConnString() string {
	var user, password, database = os.Getenv("DB_USER"), os.Getenv("DB_PASSWORD"), os.Getenv("DB_DATABASE")

	return fmt.Sprintf(
		"postgres://%s:%s@%s:%s/%s",
		user,
		password,
		"localhost",
		"5432",
		database,
	)
}
