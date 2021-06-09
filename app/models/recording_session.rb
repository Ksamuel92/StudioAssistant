class RecordingSession < ActiveRecord::Base
    #model associations
    belongs_to :user
    belongs_to :client

    def amount_of_money_per_day
        per_hour * hours_per_day
    end

    def days_to_work
        (budget)/(per_hour * hours_per_day).floor
    end

    def days_to_work_message
        if days_to_work == 1
        "#{days_to_work} day."
        else
        "#{days_to_work} days."
        end
    end
end