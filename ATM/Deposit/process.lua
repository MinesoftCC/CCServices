while true do
    local ip = "http://127.0.0.1/BankAPI/sendfunds/atm/"
    local atm_pass = "atmpass123"
    local atm_id = 2
    local json = require("json")
    while not redstone.getInput("back") do
        os.sleep(0.1)
    end

    local file = fs.open("disk/order.txt", "r")
    local account_name = file.readAll()
    file.close()

    --grab chest contents
    while turtle.suckUp() do
    end

    --if diamonds add total otherwise spit out
    local total = 0
    for i = 1, 15 do
        turtle.select(i)
        if turtle.compareTo(16) then
            total = total + turtle.getItemCount()
        else
            turtle.drop()
        end
    end

    --attempt to send money
    if total ~= 0 then
        local res =
            json.decode(http.post(ip .. account_name .. "/" .. total .. "/" .. atm_id .. "/" .. atm_pass, ""):readAll())

        --if it works then deposit diamonds
        if res["value"] == 1 then
            --money has been deposited
            turtle.turnRight()
            turtle.turnRight()
            for i = 1, 15 do
                turtle.select(i)
                turtle.dropDown()
            end
            turtle.turnLeft()
            turtle.turnLeft()

            --notification
            redstone.setOutput("right", true)
            os.sleep(1)
            redstone.setOutput("right", false)
        else
            for i = 1, 15 do
                turtle.select(i)
                turtle.drop()
            end
        end
    end
end
