-- comments in lua start with '--'
-- use lua 5.1 for running this code, install with apt-get install lua5.1
-- later versions of lua don't have as many third party libraries available

-- simple for loop
start = 1
stop  = 11
step  = 2
for variable = start, stop, step do

  if variable == 5 then
    print ("middle")
  else
    print (variable)
  end

end

print "---simple loop end---"
-- upvalue example
function counter (n)
  local i = n
  return function ()
           i = i + 1
           return i
         end
end

-- here we initialize the counter functions, note that they are separate
-- and retain their internal values after each run
firstcounter = counter(1)
secondcounter = counter(22)

print ( firstcounter() )
print ( firstcounter() )

print ( secondcounter() )
print ( secondcounter() )

print ( firstcounter() )

-- c or c++ can exchange information through stack and initialize variables for us
-- the following statement assigns "no value from c" to 'passedvalue' variable only
-- if it doesn't exist
print ("the following value from c program:")
passedvalue = passedvalue or "no value from c"
print ( passedvalue )

-- a nice cheatsheet can be found at http://lua-users.org/wiki/LuaShortReference
-- also ever trusty http://www.lua.org/manual/5.1/
-- and http://lua-users.org/wiki/TutorialDirectory
-- and http://lua-users.org/wiki/SampleCode
-- and http://pgl.yoyo.org/luai/i/_
