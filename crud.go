package gdb

import "github.com/neo4j/neo4j-go-driver/v4/neo4j"

type Item struct {
	Id   int64
	Name string
}

func Connect(uri, username, password string) (neo4j.Driver, error) {
	driver, err := neo4j.NewDriver(uri, neo4j.BasicAuth(username, password, ""))
	if err != nil {
		panic(err)
	}
	return driver, nil
}
func Close(driver neo4j.Driver, tx neo4j.Transaction) {
	tx.Close()
	driver.Close()
}

func InsertItem(driver neo4j.Driver) (*Item, error) {
	session := driver.NewSession(neo4j.SessionConfig{})
	defer session.Close()
	result, err := session.WriteTransaction(createItemFn)
	if err != nil {
		return nil, err
	}
	return result.(*Item), nil
}

func createItemFn(tx neo4j.Transaction) (interface{}, error) {
	records, err := tx.Run(
		"CREATE (n:Item {id: $id, name: $name}) RETURN n.id, n.name", map[string]interface{}{
			"id":   1,
			"name": "Item 1",
		})
	if err != nil {
		return nil, err
	}
	record, err := records.Single()
	if err != nil {
		return nil, err
	}
	return &Item{
		Id:   record.Values[0].(int64),
		Name: record.Values[1].(string),
	}, nil
}
