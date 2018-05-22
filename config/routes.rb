Rails.application.routes.draw do

  scope '/api' do

    namespace :users do
      post 'signup' => 'registrations#create'
      post 'signin' => 'sessions#create'
    end

    get 'all_users' => 'users#all_users'
    get 'all_appointments' => 'appointments#all_appointments'
    get 'all_doctors' => 'doctors#all_doctors'
    get 'all_centers' => 'centers#all_centers'
    get 'all_departments' => 'departments#all_departments'
    post 'booking_appointment' => 'booking_appointment#create'
    post 'show_department' => 'departments#show_department'
	post 'show_time_slot_doctor' => 'doctors#main_action_dialogflow'
  end

end
