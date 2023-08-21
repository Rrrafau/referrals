# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/patient_records/:patient_record_id/logs', to: 'patient_logs#for_patient'
end
