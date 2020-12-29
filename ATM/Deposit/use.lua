while true do
print("enter account name")
local account_name = io.read()

local file = fs.open("disk/order.txt", "w")
file.write(account_name)
file.close()

print("put your deposit in the chest and press enter")
io.read()
term.clear()
term.setCursorPos(1,1)

redstone.setOutput("back", true)
os.sleep(1)
redstone.setOutput("back", false)
end
