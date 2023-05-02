class Schedule < ApplicationRecord
    require 'active_support'
    require 'active_support/core_ext'    
    validates :title, presence: true
    validates :title, length: {maximum:20} 
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :content, length: {maximum:500}     
    validate :start_end_check
        def start_end_check
            if start_date.present? && end_date.present? && start_date > end_date
                errors.add(:end_date,"は開始日以降の日付を選択してください")
            end
        end      
end
