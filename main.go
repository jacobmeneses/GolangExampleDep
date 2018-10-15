package main

import "fmt"
import "os"
import "time"
import "github.com/jinzhu/gorm"
import _ "github.com/jinzhu/gorm/dialects/postgres"

type User struct {
 Id uint `gorm:"primary_key"`
 Name string
 Email string
 CreatedAt time.Time
 UpdatedAt time.Time
}

// set User's table name to be `users`
// this is not necessary for now because its the default behavior
func (User) TableName() string {
  return "users"
}

func main(){
  fmt.Println("Using go dep!")

  fmt.Println("Opening a database GORM")
  db, err := gorm.Open("postgres", "host=0.0.0.0 port=8810 user=postgres dbname=postgres password=example sslmode=disable")

  if err != nil {
    fmt.Println("gorm: error opening the database")
    fmt.Println(err)
    os.Exit(0)
  }

  var users []User

  fmt.Println("******* finding the first record of table")
  var user User
  db.First(&user)
  fmt.Println(user.Name, user.Email )

  fmt.Println("******* finding 10 records")
  db.Where("email like %?", "somegolangapi" ).Limit(10).Find(&users)
  for _, resultUser := range(users){
    fmt.Println(resultUser.Name, resultUser.Name, resultUser.Email)
  }
}


