json.array! @challenges do |challenge|
  json.extract! challenge, :id, :title, :description, :start_date, :end_date, :value, :completed
end
