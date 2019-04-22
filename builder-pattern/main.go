package main

import (
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		currentTime := time.Now()

		w.WriteHeader(http.StatusOK)
		fmt.Fprintf(w, "Current date and time: %s\n", currentTime.Format("2006-01-02 15:04:05"))
	})

	http.Handle("/", r)

	log.Fatal(http.ListenAndServe(":8080", nil))
}
