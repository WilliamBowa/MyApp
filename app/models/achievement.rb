class Achievement < ApplicationRecord
  enum privacy: [ :public_acces, :private_access, :personal_access ]
end
