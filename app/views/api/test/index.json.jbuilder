json.set! :tests do
    json.array! @tests do |test|
      json.extract! test, :id, :name, :is_done, :created_at, :updated_at
    end
end
