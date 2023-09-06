package main

import (
	"go-sql-demo/database"
	"go-sql-demo/handlers"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {

	database.ConnectDb()

	// initialize router
	r := setupRoutes()
	// handlers.SetupDemoAccount()
	log.Println("Server listening on port 3000...!!")
	log.Fatal(http.ListenAndServe(":3000", r))
}

func setupRoutes() *mux.Router {
	r := mux.NewRouter()
	r.Use(RecoveryMiddleware)
	r.HandleFunc("/", handlers.HomeHandler)
	r.HandleFunc("/manage", handlers.FundHandler).Methods(http.MethodPost)
	r.HandleFunc("/accounts", handlers.CreateAccountHandler).Methods(http.MethodPost)
	r.HandleFunc("/accounts", handlers.ListAccountsHandler).Methods(http.MethodGet)
	r.HandleFunc("/accounts/{id}", handlers.GetAccountHandler).Methods(http.MethodGet)
	r.HandleFunc("/accounts/{id}", handlers.DeleteAccountHandler).Methods(http.MethodDelete)
	http.Handle("/", r)
	return r
}

func RecoveryMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		defer func() {
			if err := recover(); err != nil {
				log.Printf("Panic: %v", err)
				http.Error(w, "Internal Server Error", http.StatusInternalServerError)
			}
		}()
		next.ServeHTTP(w, r)
	})
}
