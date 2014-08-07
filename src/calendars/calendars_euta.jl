#####
# Type declarations
#####

abstract EUFCalendar <: FinCalendar
immutable EUTAFCalendar <: EUFCalendar end

#####
# Methods
#####

function isnewyearsholiday(dt::TimeType, c::EUFCalendar)
    isnewyearsholiday(dt)
end
function iseasterholiday(dt::TimeType, c::EUFCalendar)
    iseasterholiday(dt, [Fri, Mon]) && year(dt) >= 2000
end
function islabourdayholiday(dt::TimeType, c::EUTAFCalendar)
    day(dt) == 1 && month(dt) == May && year(dt) >= 2000
end
function ischristmasdayholiday(dt::TimeType, c::EUFCalendar)
    day(dt) in [25, 26] && month(dt) == Dec
end
function istargetclosed(dt::TimeType, c::EUTAFCalendar)
    day(dt) == 31 && month(dt) == 12 && year(dt) in [1999, 2001]
end
function isgoodday(dt::TimeType, c::EUTAFCalendar)
    # EUR holiday calendar
    # http://www.ecb.europa.eu/home/html/holidays.en.html
    # Closing days (1999):
    # http://www.ecb.europa.eu/press/pr/date/1998/html/pr980903.en.html
    # Closing days (2000):
    # http://www.ecb.europa.eu/press/pr/date/1999/html/pr990715_1.en.html
    # Closing days (2001):
    # http://www.ecb.europa.eu/press/pr/date/2000/html/pr000525_2.en.html
    # Other slosing days:
    # http://www.ecb.europa.eu/press/pr/date/2000/html/pr001214_4.en.html
    year(dt) <= 1998 && error("TARGET only existed after 1998.")
    !(isweekend(dt) || isnewyearsholiday(dt, c) ||
        iseasterholiday(dt, c) || ischristmasdayholiday(dt, c) ||
        islabourdayholiday(dt, c) || istargetclosed(dt, c))
end
