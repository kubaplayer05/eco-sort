package model

import (
	"context"
	"eco-sort/backend/repository"
	"errors"
	"fmt"
	"log"
	"os/exec"
	"time"
)

type Product struct {
	Id          uint64    `json:"id"`
	Name        string    `json:"name"`
	Description *string   `json:"description"`
	Category    string    `json:"category_name"`
	CategoryId  uint      `json:"category_id"`
	CreatedAt   time.Time `json:"created_at"`
}

func (Product) GetAll() ([]Product, error) {
	sql := "select pr.id, pr.name, pr.description ,rc.name, rc.id, pr.created_at from products pr join recycle_category rc on rc.id = pr.category_id"
	rows, err := repository.Conn.Query(context.Background(), sql)

	if err != nil {
		log.Printf("Query error: %v", err)
		return nil, err
	}

	var products []Product

	for rows.Next() {
		var product Product
		if err := rows.Scan(&product.Id, &product.Name, &product.Description, &product.Category, &product.CategoryId, &product.CreatedAt); err != nil {
			log.Printf("Scan error: %v", err)
			return nil, err
		}

		products = append(products, product)
	}

	return products, nil
}

func (Product) GetNewestProducts() ([]Product, error) {
	sql := "select pr.id, pr.name, pr.description, rc.name, rc.id, pr.created_at from products pr join recycle_category rc on rc.id = pr.category_id order by pr.created_at desc limit 100"
	rows, err := repository.Conn.Query(context.Background(), sql)

	if err != nil {
		log.Printf("Query error: %v", err)
		return nil, err
	}

	var products []Product

	for rows.Next() {
		var product Product
		if err := rows.Scan(&product.Id, &product.Name, &product.Description, &product.Category, &product.CategoryId, &product.CreatedAt); err != nil {
			log.Printf("Scan error: %v", err)
			return nil, err
		}

		products = append(products, product)
	}

	return products, nil
}

func (Product) GetByCategoryId(id string) ([]Product, error) {
	sql := fmt.Sprintf("select pr.id, pr.name, pr.description ,rc.name, rc.id, pr.created_at from products pr join recycle_category rc on rc.id = pr.category_id where rc.id = %s", id)
	rows, err := repository.Conn.Query(context.Background(), sql)

	if err != nil {
		log.Printf("Query error: %v", err)
		return nil, err
	}

	var products []Product

	for rows.Next() {
		var product Product
		if err := rows.Scan(&product.Id, &product.Name, &product.Description, &product.Category, &product.CategoryId, &product.CreatedAt); err != nil {
			log.Printf("Scan error: %v", err)
			return nil, err
		}

		products = append(products, product)
	}

	if products == nil {
		log.Printf("Wrong category id provided")
		return nil, fmt.Errorf("wrong category id provided")
	}

	return products, nil
}

func (Product) GetEmbeddingFromName(name string) (string, error) {
	cmd := exec.Command("sh", "-c", fmt.Sprintf("echo '%s' | ../scripts/.venv/bin/python ../scripts/generate_embedding.py", name))
	out, err := cmd.Output()

	if err != nil {
		log.Printf("Failed to get embedding: %v", err)
		return "", err
	}

	embedding := fmt.Sprintf("'%s'", out)

	return embedding, nil
}

func (Product) SearchWithEmbedding(embedding string) ([]Product, error) {
	sql := fmt.Sprintf("select pr.id, pr.name, pr.description ,rc.name  from products pr join recycle_category rc on rc.id = pr.category_id order by pr.embedding <=> %s limit 3", embedding)
	rows, err := repository.Conn.Query(context.Background(), sql)

	if err != nil {
		log.Printf("Query error: %v", err)
		return nil, err
	}

	defer rows.Close()

	var products []Product

	for rows.Next() {
		var product Product
		if err := rows.Scan(&product.Id, &product.Name, &product.Description, &product.Category); err != nil {
			return nil, err
		}

		products = append(products, product)
	}

	if err := rows.Err(); err != nil {
		log.Printf("Rows error: %v", err)
		return nil, err
	}

	return products, nil
}

func (Product) CreateFromSuggestion(suggestion RecycleSuggestion) error {

	if !suggestion.IsSafe {
		return errors.New("suggestion is not safe")
	}

	embedding, err := Product{}.GetEmbeddingFromName(suggestion.ProductName)

	if err != nil {
		log.Printf("Could not generate product embedding from product name")
		return err
	}

	sql := fmt.Sprintf("insert into products (name, category_id, description, embedding) values ('%s', %d, '%s', %s)", suggestion.ProductName, suggestion.CategoryId, suggestion.Description, embedding)
	commandTag, err := repository.Conn.Exec(context.Background(), sql)

	if err != nil {
		return err
	}

	if commandTag.RowsAffected() != 1 {
		return errors.New("no row affected")
	}

	return nil
}
