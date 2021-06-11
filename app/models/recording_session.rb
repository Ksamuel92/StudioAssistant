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

    def start_date_in_correct_format
        Date.parse(start_date).strftime("%m/%d/%Y")
    end
    
    def end_date_in_correct_format
        Date.parse(end_date).strftime("%m/%d/%Y")
    end

    def is_session_today?
    Date.parse(start_date) == Date.today ? true : false
    end

    def format_budget
        Money.from_amount(budget, "USD").format
    end

    def format_rate
        Money.from_amount(per_hour, "USD").format
    end

    def format_amount_of_money_per_day
        Money.from_amount(amount_of_money_per_day, "USD").format
    end

end