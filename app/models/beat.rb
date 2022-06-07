class Beat < ApplicationRecord
  mount_uploader :audio, AudioUploader
end
