package model

import (
	"context"
	"eco-sort/backend/repository"
	"fmt"
	"log"
	"os/exec"
)

type Product struct {
	Id          uint64  `json:"id"`
	Name        string  `json:"name"`
	Description *string `json:"description"`
	Category    string  `json:"category_name"`
}

func (Product) GetAll() ([]Product, error) {
	sql := "select pr.id, pr.name, pr.description ,rc.name from products pr join recycle_category rc on rc.id = pr.category_id"
	rows, err := repository.Conn.Query(context.Background(), sql)

	if err != nil {
		log.Printf("Query error: %v", err)
		return nil, err
	}

	var products []Product

	for rows.Next() {
		var product Product
		if err := rows.Scan(&product.Id, &product.Name, &product.Description, &product.Category); err != nil {
			log.Printf("Scan error: %v", err)
			return nil, err
		}

		products = append(products, product)
	}

	return products, nil
}

func (Product) GetByCategoryId(id string) ([]Product, error) {
	sql := fmt.Sprintf("select pr.id, pr.name, pr.description ,rc.name from products pr join recycle_category rc on rc.id = pr.category_id where rc.id = %s", id)
	rows, err := repository.Conn.Query(context.Background(), sql)

	if err != nil {
		log.Printf("Query error: %v", err)
		return nil, err
	}

	var products []Product

	for rows.Next() {
		var product Product
		if err := rows.Scan(&product.Id, &product.Name, &product.Description, &product.Category); err != nil {
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
