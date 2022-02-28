Rails.application.routes.draw do
  get "unblock-user", to: "admin#unblockuser", as: "unblock_user"
  get "block-user", to: "admin#blockuser", as: "block_user"
  get "patient-detail", to: "admin#patientdetails", as: "patient_all_details"
  get "invitation-detail", to: "admin#inviteduser", as: "all_invited_user"
  get "delete-user", to: "admin#deluser", as: "remove_user"
  get "transfer/:id", to: "patients#transfer", as: "patient_transfer"
  post "transfer/:id", to: "patients#transferrequest"
  get "request-transfer", to: "patients#requesttransfer", as: "patient_transfer_request"
  get "request-transfer/:id", to: "patients#requesttransferupdate", as: "patient_transfer_update"
  get "requesttransfer/:id", to: "patients#requesttransfercancle", as: "patient_transfer_cancle"

  resources :testresults
  resources :patients
  resources :announcements
  devise_for :users, controllers: { sessions: 'user/sessions', registrations: 'user/registrations'}
  
  root "homepage#homepage"
  
  get "message", to: "dashboard#announcement", as: "message"
  get "dashboard", to: "dashboard#dashboard", as: "dashboard"
  get "admin", to: "admin#admin", as: "admin"
end
