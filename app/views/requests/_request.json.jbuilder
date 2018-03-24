json.extract! request, :id, :problem_desc, :first_name, :last_name, :phone_number, :created_at, :updated_at
json.url request_url(request, format: :json)
