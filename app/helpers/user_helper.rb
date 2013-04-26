module UserHelper
  
  def find_today_attendance 
    if @monthly_attendances.present?
      @today_attendance = @monthly_attendances.find{|daily| daily.date == Date.today} 
    end
  end
end
