while true
local ip = "http://157.90.30.90/BankAPI/sendfunds/atm/" 
local atm_pass = "atmbeepboop"
local atm_id = 2
local json = require("json")
while not redstone.getInput("back") do os.sleep(0.1) end

local file = fs.open("disk/order.txt", "r")
local account_name = file.readAll()
file.close()

--grab chest contents
while turtle.suckUp() do end

--if diamonds add total otherwise spit out 
local total = 0
for i=1,15 do
    turtle.select(i)
    if turtle.compareTo(16) then
        total = total + turtle.getItemCount()
    else
        turtle.drop()
    end
end

--attempt to send money
local res = json.decode(http.post(ip..account_name.."/"..total.."/"..atm_id.."/"..atm_pass, ""):readAll())

--if it works then deposit diamonds
if res["value"] then
    turtle.turnRight()
    turtle.turnRight()
    for i=1,15 do
        turtle.select(i)
        turtle.drop()
    end
    turtle.turnLeft()
    turtle.turnLeft()
    
    --notification
    redstone.setOutput("right", true)
    os.sleep(1)
    redstone.setOutput("right", false)
    --money has been deposited
end
end
