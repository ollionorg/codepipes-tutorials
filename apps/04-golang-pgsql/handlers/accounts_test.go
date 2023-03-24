package handlers

import (
	_ "embed"
	"errors"
	"go-sql-demo/models"
	"net/http"
	"net/http/httptest"
	"testing"
)

type MockService struct{}

func (ms *MockService) Deposit(req *models.DepositRequest) (*models.MessageContainer, error) {
	return nil, nil
}

func (ms *MockService) WithDraw(req *models.WithdraRequest) (*models.MessageContainer, error) {
	return nil, nil
}

func (ms *MockService) CreateAccount(req *models.Account) (*models.Account, error) {
	return nil, nil
}

func (ms *MockService) GetAccount(req *models.Account) (*models.Account, error) {
	return nil, nil
}

func (ms *MockService) ListAccounts() ([]models.Account, error) {
	acc := models.Account{Name: "test"}
	acc.ID = 5
	accnts := []models.Account{acc}
	return accnts, nil
}

func (ms *MockService) GetAccountByID(ID uint) (*models.Account, error) {
	if ID == 13 {
		return nil, errors.New("mock error")
	}
	acc := &models.Account{Name: "test"}
	acc.ID = ID
	return acc, nil
}

func (ms *MockService) DeleteAccount(ID uint) error {
	return nil
}

func TestHomeHandler(t *testing.T) {
	s := &MockService{}
	SetBankService(s)
	acc := &models.Account{Name: "test"}
	acc.ID = 5
	SetDemoAccount(acc)
	type args struct {
		w http.ResponseWriter
		r *http.Request
	}
	tests := []struct {
		name string
		args args
		ID   uint
	}{
		{
			name: "success",
			args: args{
				r: httptest.NewRequest("POST", "http://example.com", nil),
				w: httptest.NewRecorder(),
			},
		},
		{
			name: "failure",
			args: args{
				r: httptest.NewRequest("POST", "http://example.com", nil),
				w: httptest.NewRecorder(),
			},
			ID: 13,
		},
	}
	for _, tt := range tests {
		if tt.ID > 0 {
			acc.ID = tt.ID
			SetDemoAccount(acc)
		}
		t.Run(tt.name, func(t *testing.T) {
			HomeHandler(tt.args.w, tt.args.r)
		})
	}
}

func TestWithdrawHandler(t *testing.T) {
	type args struct {
		w http.ResponseWriter
		r *http.Request
	}
	tests := []struct {
		name string
		args args
	}{
		{
			name: "success",
			args: args{
				r: httptest.NewRequest("POST", "http://example.com", nil),
				w: httptest.NewRecorder(),
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			WithdrawHandler(tt.args.w, tt.args.r)
		})
	}
}

func TestDepositHandler(t *testing.T) {
	type args struct {
		w http.ResponseWriter
		r *http.Request
	}
	tests := []struct {
		name string
		args args
	}{
		{
			name: "success",
			args: args{
				r: httptest.NewRequest("POST", "http://example.com", nil),
				w: httptest.NewRecorder(),
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			DepositHandler(tt.args.w, tt.args.r)
		})
	}
}

func TestWithdrawEventHandler(t *testing.T) {
	type args struct {
		w http.ResponseWriter
		r *http.Request
	}
	tests := []struct {
		name string
		args args
	}{
		{
			name: "failure - amount not present",
			args: args{
				r: httptest.NewRequest("POST", "http://example.com", nil),
				w: httptest.NewRecorder(),
			},
		},
		{
			name: "failure - amount not present",
			args: args{
				r: httptest.NewRequest("POST", "http://example.com", nil),
				w: httptest.NewRecorder(),
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			WithdrawEventHandler(tt.args.w, tt.args.r)
		})
	}
}
