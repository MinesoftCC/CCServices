local json = require("json")
local ip = "http://127.0.0.1/BankAPI"
local l_monitor = peripheral.wrap("left")
local r_monitor = peripheral.wrap("right")

while true do
l_monitor.clear()
local temp
local users = json.decode(http.get(ip.."/uranked"):readAll())
for i=1,#users do
    l_monitor.setCursorPos(1,i)
    l_monitor.write(users[i]["name"])
    l_monitor.setCursorPos(19-#tostring(users[i]["balance"]), i)
    l_monitor.write(users[i]["balance"])
end
local accounts = json.decode(http.get(ip.."/aranked"):readAll())
r_monitor.clear()
for i=1,#accounts do
    r_monitor.setCursorPos(1,i)
    r_monitor.write(accounts[i]["name"])
    r_monitor.setCursorPos(19-#tostring(accounts[i]["balance"]), i)
    r_monitor.write(accounts[i]["balance"])
end
os.sleep(1)
end

