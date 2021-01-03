local atm_account = "atm"
local ip = "http://127.0.0.1/BankAPI/sendfunds/"
local json = require("json")

while true do
    while not redstone.getInput("back") do os.sleep(0.1) end
    
    local file = fs.open("disk/order.txt", "r")
    local args = textutils.unserialise(file.readAll())
    file.close()
    
    local res = false
    for i=1,4 do
        if args[i] == nil then res = true end
    end
    if not res then
        local resp = json.decode(http.post(ip..args[1].."/"..atm_account.."/"..args[2].."/"..args[3].."/"..args[4],""):readAll())
        if resp["value"] == 1 and tonumber(args[2]) then
            redstone.setOutput("right", true)
            os.sleep(tonumber(args[2])/2.5)
            redstone.setOutput("right", false)
        end
    end
    while redstone.getInput("back") do os.sleep(0.1) end
end
