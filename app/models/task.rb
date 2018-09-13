class Task < ApplicationRecord
  validates content, presence:true, length: {maximum:200}
  validates status, precence:true, length: {maxmum:10}
end
