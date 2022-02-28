json.extract! patient, :id, :created_by, :p_cid, :p_phone, :p_name, :from_date, :to_date, :transfer_date, :transfer_from, :transfer_to, :created_at, :updated_at
json.url patient_url(patient, format: :json)
