json.extract! testresult, :id, :pid, :testdate, :test_result, :recovered, :created_at, :updated_at
json.url testresult_url(testresult, format: :json)
