package model

type Product struct {
	Id       uint64 `json:"id"`
	Name     string `json:"name"`
	Category string `json:"category_name"`
}
