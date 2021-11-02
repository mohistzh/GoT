package gdb

import (
	"fmt"
	"testing"
)

func TestInsertItem(t *testing.T) {
	driver, err := Connect("bolt://localhost:7687", "neo4j", "12345678")
	if err != nil {
		panic(err)
	}
	result, err := InsertItem(driver)
	if err != nil {
		panic(err)
	}
	fmt.Println(result)
}

func TestReadItems(t *testing.T) {
	driver, err := Connect("bolt://localhost:7687", "neo4j", "GameOfThrones")
	if err != nil {
		panic(err)
	}
	result, err := ReadItems(driver)
	if err != nil {
		panic(err)
	}
	fmt.Println(result)
}
