package main

import (
	_ "embed"
	"fmt"
	"net/http"
)

//go:embed swagger/index.html
var swaggerUI []byte

//go:embed openapi.yml
var openAPISpec []byte

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "ok")
	})
	http.HandleFunc("/swagger", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/html")
		w.Write(swaggerUI)
	})
	http.HandleFunc("/swagger/openapi.yml", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/yaml")
		w.Write(openAPISpec)
	})

	fmt.Println("go server listening on :8080")
	http.ListenAndServe(":8080", nil)
}
