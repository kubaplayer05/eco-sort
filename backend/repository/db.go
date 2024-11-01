package repository

import (
	"context"
	"eco-sort/backend/config"
	"github.com/jackc/pgx/v5"
	"log"
)

var Conn *pgx.Conn

func Connect() error {
	conn, err := pgx.Connect(context.Background(), config.GetDbConnString())
	if err != nil {
		log.Fatalf("Unable to connect to database: %v\n", err)
		return err
	}

	Conn = conn
	return nil
}

func Close() {
	if Conn != nil {
		err := Conn.Close(context.Background())
		if err != nil {
			log.Fatalf("Failed to close database connection: %v", err)
		}
	}
}
