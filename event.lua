while true do
  for i,v in pairs({os.pullEvent()}) do
    print(v)
  end
  print("---")
end
