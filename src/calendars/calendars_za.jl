#####
# Type declarations
#####

abstract ZAFCalendar <: SingleFCalendar
immutable ZARFCalendar <: ZAFCalendar end
#####
# Methods
#####

function isnewyearsholiday(dt::TimeType, c::ZAFCalendar)
    (dayofyear(dt) == 1 && isnotsunday(dt) ||
    (dayofyear(dt) == 2 && dayofweek(dt) == Mon))
end

function ishumanrightsday(dt::TimeType, c::ZAFCalendar)
    (month(dt) == Mar && (day(dt) == 21 ||
    day(dt) == 22 && dayofweek(dt) == Mon))
end

function iseasterholiday(dt::TimeType, c::ZAFCalendar)
    iseaster(dt, Fri) || iseaster(dt, Mon)
end

function isfreedomday(dt::TimeType, c::ZAFCalendar)
  (month(dt) == Apr && (day(dt) == 27 ||
    day(dt) == 28 && dayofweek(dt) == Mon))
end

function isworkersday(dt::TimeType, c::ZAFCalendar)
  (month(dt) == May && (day(dt) == 1 ||
    day(dt) == 2 && dayofweek(dt) == Mon))
end

function isyouthday(dt::TimeType, c::ZAFCalendar)
  (month(dt) == Jun && (day(dt) == 16 ||
    day(dt) == 17 && dayofweek(dt) == Mon))
end

function isnationalwomansday(dt::TimeType, c::ZAFCalendar)
  (month(dt) == Aug && (day(dt) == 9 ||
    day(dt) == 10 && dayofweek(dt) == Mon))
end

function isheritageday(dt::TimeType, c::ZAFCalendar)
  (month(dt) == Sep && (day(dt) == 24 ||
    day(dt) == 25 && dayofweek(dt) == Mon))
end

function isdayofreconciliation(dt::TimeType, c::ZAFCalendar)
  (month(dt) == Dec && (day(dt) == 16 ||
    day(dt) == 17 && dayofweek(dt) == Mon))
end

function ischristmasdayholiday(dt::TimeType, c::ZAFCalendar)
    (month(dt) == Dec && (day(dt) == 25 ||
        # Mondayised accounting for Boxing day
        (day(dt) == 27 && dayofweek(dt) in [Mon, Tue])))
end

function isboxingdayholiday(dt::TimeType, c::ZAFCalendar)
    (month(dt) == Dec && (day(dt) == 26 ||
        # Mondayised accounting for Christmas day possibly being Mondayised
        (day(dt) == 28 && dayofweek(dt) in [Mon, Tue])))
end

function isgood(dt::TimeType, c::ZARFCalendar)
    # http://en.wikipedia.org/wiki/Public_holidays_in_South_Africa
    # http://www.saflii.org/za/legis/num_act/pha1994163/
   !(isweekend(dt) ||
     isnewyearsholiday(dt, c) ||
     ishumanrightsday(dt, c) ||
     iseasterholiday(dt, c) ||
     isfreedomday(dt,c) ||
     isworkersday(dt,c) ||
     isyouthday(dt,c) ||
     isnationalwomansday(dt,c) ||
     isheritageday(dt,c) ||
     isdayofreconciliation(dt,c) ||
     ischristmasdayholiday(dt, c) ||
     isboxingdayholiday(dt, c))
end

