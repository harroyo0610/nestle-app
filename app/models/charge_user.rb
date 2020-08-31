class ChargeUser < ApplicationRecord
    mount_uploader :url, FileUploader
end
