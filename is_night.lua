--[[
%% autostart
%% properties
%% globals
--]]
 
while true do
local T = os.date("*t"); -- current time
local sunriseHour_full = fibaro:getValue(1,'sunriseHour') --Predefined string that contains sunrise HH:MM
fibaro:debug(sunriseHour_full) --debug
local sunrisehour = string.format("%02d",string.sub (sunriseHour_full, 1 , 2)) --Get the first two characters from sunrice HH:MM
local sunrisemin = string.format("%02d",string.sub(sunriseHour_full,4)) --Get everything from char and forward from sunrice HH:MM
local sunsetHour_full = fibaro:getValue(1,'sunsetHour') --Repeate the above for sunset
fibaro:debug(sunsetHour_full)
local sunsethour = string.format("%02d",string.sub (sunsetHour_full, 1 , 2))
local sunsetmin = string.format("%02d",string.sub(sunsetHour_full,4))
 
fibaro:debug(sunsetmin.." - "..string.format("%02d",T.min)) --debug, print sunset minute and current minute  
if ( string.format("%02d",T.hour) ==sunsethour and string.format("%02d",T.min) == sunsetmin ) --If sunset hour and min matches the current time...
then
    fibaro:setGlobal("night", "1"); --set the global "night" variable to true
    fibaro:debug("Kväller, tänder! "..T.hour..":"..T.min) -- more debug
end
if ( string.format("%02d",T.hour) ==sunrisehour and string.format("%02d",T.min) == sunrisemin ) --if sunrise hour and min matches the current time....
then
    fibaro:setGlobal("night", "0"); -- Sunrise, set the night variable to false.
    fibaro:debug("Morgon, inte natt! "..string.format("%02d",T.hour)..":"..string.format("%02d",T.min)) -- debug
end
  
fibaro:sleep(60*1000); --sleep for one minute
end
