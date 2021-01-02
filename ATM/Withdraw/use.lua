while true do
print("enter account name")
local account_name = io.read()

print("enter amount")
local amount = io.read()

print("enter id")
local id = io.read()

print("enter pass")
local pass = io.read()

local all = {account_name, amount, id, pass}
local file = fs.open("disk/order.txt", "w")
file.write(textutils.serialise(all))
file.close()

term.clear()
term.setCursorPos(1,1)

redstone.setOutput("back", true)
os.sleep(1)
redstone.setOutput("back", false)
end