local ip = "127.0.0.1/BankAPI/admin/save/pass"
while true do
    if redstone.getInput("top") then
        http.post(ip,"")
        os.sleep(1)
    end 
    os.sleep(0.1)
end
