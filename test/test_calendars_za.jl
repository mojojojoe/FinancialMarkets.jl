zaholidays = [Date(2014, 1, 1), Date(2014, 3, 21),
    Date(2014, 4, 18), Date(2014, 4, 21), Date(2014, 4, 27), Date(2014, 4, 28),
    Date(2014, 5, 1), Date(2014, 6, 16), Date(2014, 8, 9), Date(2014, 9, 24),
    Date(2014, 12, 16), Date(2014, 12, 25), Date(2014, 12, 26)]
dt = Date(2014)
while year(dt) <= 2016
    @test !((dt in zaholidays || isweekend(dt)) $
            !isgood(dt, ZARFCalendar()))
    dt += Day(1)
end
