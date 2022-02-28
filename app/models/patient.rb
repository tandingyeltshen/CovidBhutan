class Patient < ApplicationRecord
    has_one_attached :profile
    validates_presence_of :p_cid, :p_phone, :p_name, :from_date, :profile
    validates :p_cid, length: {minimum: 10, maximum: 20}
    validates :p_phone, length: {is: 8}

end
