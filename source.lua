--hazelN's Scripts, @XniperHub--

local mt = getrawmetatable(game)
local old = mt.__namecall
local protect = newcclosure or protect_function

if not protect then
	protect = function(f) return f end
end

setreadonly(mt, false)
mt.__namecall = protect(function(self, ...)
	local method = getnamecallmethod()
	if method == "InvokeServer" or method == "FireServer" then
		if self.Name:lower():find("kick") then
			return nil
		end
	elseif method:lower() == "Kick" then
		return nil
	end

	if method == "Kick" then
		wait(9e9)
		return
	end
	return old(self, ...)
end)
hookfunction(game:GetService("Players").LocalPlayer.Kick,protect(function() wait(9e9) end))

local InfStorage = false
_G.WalkSpeed = 16
_G.Items = {}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptedNomnom/XniperLibrary/main/Source.lua"))()

local main = Library:CreateWindow({
	Title = "Galaxyhub Isle"
})

local mainTab = main:CreateTab({
	name = "Main"
})

local miscTab = main:CreateTab({
	name = "Misc"
})

local tpTruth = mainTab:Button({
	name = "Teleport To Truth",

	callback = function()
		local PlaceId = 4529195149
		game:GetService("TeleportService"):Teleport(PlaceId, game:GetService("Players").LocalPlayer)
	end
})

local walkspeed = mainTab:Slider({
	name = "WalkSpeed",
	min = 0,
	max = 100,
	default = 16,

	callback = function(v)
		while wait(0.03) do
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
		end
	end
})

local masterHack = mainTab:Button({
	name = "Master Console Hack",

	callback = function()
		_G.Auto = true
		local u11 = require(game:GetService("ReplicatedStorage"):WaitForChild("PuzzleGenerator")).new({
			A = tick() / 2 - game.PlaceId
		});
		st = false
		nd = false
		didit = false
		local active = {
			A = false, 
			B = false, 
			C = false, 
			D = false, 
			E = false, 
			F = false
		}
		--for i, v in pairs(getconnections(game.Players.LocalPlayer.Character:WaitForChild("@H").OnClientEvent)) do
		-- v:Disable() 
		--end
		local Target1 = 0
		local Target2 = 0
		game.Players.LocalPlayer.Character:WaitForChild("@H").OnClientEvent:Connect(function(p23, p24, p25, p222, p26, p27)
			if _G.Auto then
				didit = false
				for ivv, vw in pairs(p25) do
					if ivv == 1 then
						Target1 = vw
					end
					if ivv == 2 then
						Target2 = vw
					end
				end
				for dd, vv in pairs(active) do
					vv = false 
				end
				for _, vvvv in pairs(p24) do
					active[vvvv] = true
				end
				while true do
					local u9 = {
						A = 0, 
						B = 0, 
						C = 0, 
						D = 0, 
						E = 0, 
						F = 0
					};
					if not didit then
						st = false
						nd = false
						for oooo, vvv in pairs(u9) do
							if active[oooo] then
								u9[oooo] = math.random(1, 10) - 1
							end
						end
						for v69, v70 in pairs(p23) do
							for iiiii, vvvvv in pairs(u9) do
								if active[iiiii] then
								end
							end
							if v69 == 1 then
								if u11.parseString(v70, u9) == tonumber(Target1) then
									st = true
									if not p23[2] then
										nd = true
									end
								end
							end
							if v69 == 2 then
								if u11.parseString(v70, u9) == tonumber(Target2) then
									nd = true
								end
							end
						end
						if st and nd then
							didit = true
						end
					end
					if didit then
						workspace:WaitForChild("Services"):WaitForChild("SubmitSolution"):FireServer(p26, u9, p27)
						break
					end
				end
			end
		end)
		game.Players.LocalPlayer.CharacterAdded:Connect(function()
			wait(2)
			local u11 = require(game:GetService("ReplicatedStorage"):WaitForChild("PuzzleGenerator")).new({
				A = tick() / 2 - game.PlaceId
			});
			st = false
			nd = false
			didit = false
			local active = {
				A = false, 
				B = false, 
				C = false, 
				D = false, 
				E = false, 
				F = false
			}
			--for i, v in pairs(getconnections(game.Players.LocalPlayer.Character:WaitForChild("@H").OnClientEvent)) do
			-- v:Disable() 
			--end
			local Target1 = 0
			local Target2 = 0
			game.Players.LocalPlayer.Character:WaitForChild("@H").OnClientEvent:Connect(function(p23, p24, p22221, p25, p26, p27)
				if _G.Auto then
					didit = false
					for ivv, vw in pairs(p25) do
						if ivv == 1 then
							Target1 = vw
						end
						if ivv == 2 then
							Target2 = vw
						end
					end
					for dd, vv in pairs(active) do
						vv = false 
					end
					for _, vvvv in pairs(p24) do
						active[vvvv] = true
					end
					while true do
						local u9 = {
							A = 0, 
							B = 0, 
							C = 0, 
							D = 0, 
							E = 0, 
							F = 0
						};
						if not didit then
							st = false
							nd = false
							for oooo, vvv in pairs(u9) do
								if active[oooo] then
									u9[oooo] = math.random(1, 10) - 1
								end
							end
							for v69, v70 in pairs(p23) do
								for iiiii, vvvvv in pairs(u9) do
									if active[iiiii] then
									end
								end
								if v69 == 1 then
									if u11.parseString(v70, u9) == tonumber(Target1) then
										st = true
										if not p23[2] then
											nd = true
										end
									end
								end
								if v69 == 2 then
									if u11.parseString(v70, u9) == tonumber(Target2) then
										nd = true
									end
								end
							end
							if st and nd then
								didit = true
							end
						end
						if didit then
							workspace:WaitForChild("Services"):WaitForChild("SubmitSolution"):FireServer(p26, u9, p27)
							break
						end
					end
				end
			end)
		end)
	end
})

local infStorage = mainTab:Button({
	name = "Infinite Storage",

	callback = function()
		game:GetService("UserInputService").InputBegan:Connect(function(key)
			if key.KeyCode == Enum.KeyCode.E then
				for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					v.Parent = game.Players.LocalPlayer.Character
				end
				wait(0.03)
				for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = game.Players.LocalPlayer.Backpack
					end
				end
			end
		end)
	end
})

local antideath = mainTab:Button({
	name = "Anti Oxygen Death",

	callback = function()
		game:GetService("RunService").RenderStepped:Connect(function()
			if game.Players.LocalPlayer.Character.Oxygen.Value <= 0 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			end
		end)
	end
})

local files = miscTab:Button({
	name = "Get All Files",

	callback = function()
		for i,v in pairs(game.Workspace.Map.Ignore.Files:GetDescendants()) do
			if v:IsA('ClickDetector') then
				fireclickdetector(v,1)
			end
		end
	end
})

ANTITPBYPASS = false

local blur = miscTab:Button({
	name = "Remove Underwater Blur",

	callback = function()
		game.Lighting.Blur.Enabled = false
	end
})

local dockDoor = miscTab:Button({
	name = "Open Docks Door",

	callback = function()
		fireclickdetector(game.Workspace.Map.Main.Gate.Buttons.Open.ClickDetector)
	end
})

local openGlass = miscTab:Button({
	name = "Open All GlassButton",

	callback = function()
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.Map.Main.TheGlassDoorPuzzle.GreenPlate.Base ,0)
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.Map.Main.TheGlassDoorPuzzle.BluePlate.Base ,0)
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.Map.Main.TheGlassDoorPuzzle.RedPlate.Base ,0)
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.Map.Main.TheGlassDoorPuzzle.WhitePlate.Base ,0)
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game.Workspace.Map.Main.TheGlassDoorPuzzle.YellowPlate.Base ,0)
	end
})

local removeTrees = miscTab:Button({
	name = "Remove all trees",

	callback = function()
		for i, Trees in pairs(game.Workspace.Map.Ignore.NoCollideTrees:GetDescendants()) do
			if Trees:IsA("Model") then
				Trees:Destroy()
			end
		end
	end
})

_G.Message = Instance.new("Color3Value")
_G.Message.Value = Color3.fromRGB(255,255,0)
_G.Message.Name = "Welcome To Galaxyhub Isle :)"
_G.Message.Parent = game.Players.LocalPlayer.Character["@Alerts"]

local msa = miscTab:Slider({
	name = "MaxSlopeAngle (easy climb)",
	min = 0,
	max = 100,
	default = 50,

	callback = function(v)
		while task.wait(.01) do
			game.Players.LocalPlayer.Character.Humanoid.MaxSlopeAngle = v
		end
	end
})

local colors = main:CreateTab({
	name = "Places"
})

local items = main:CreateTab({
	name = "Items"
})

for _, v in pairs(_G.Items) do
	items:Button({
		name = tostring(v),

		callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Ignore.Tools[v]:FindFirstChild("Handle").CFrame
			keypress(0x45)
			keyrelease(0x45)
		end
	})
end

local refreshTools = mainTab:Button({
	name = "Refresh Tools",
	
	callback = function()
		for _, v in pairs(_G.Items) do
			items:Button({
				name = tostring(v),

				callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Ignore.Tools:WaitForChild(v):FindFirstChild("Handle").CFrame
					keypress(0x45)
					keyrelease(0x45)
				end
			})
		end
	end
})

local tpExMenu = mainTab:Button({
	name = "Items-Menu",
	
	callback = function()

		local KryptonUILib = Instance.new("ScreenGui")
		local Scrolling = Instance.new("ScrollingFrame")
		local _73 = Instance.new("UIListLayout")
		local _8 = Instance.new("UIPadding")
		local a = Instance.new("Frame")
		local Amongus = Instance.new("TextBox")
		local _90 = Instance.new("UICorner")
		local Frame = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local Frame_2 = Instance.new("Frame")
		local TextButton = Instance.new("TextButton")
		local _1 = Instance.new("UICorner")
		local UIListLayout_2 = Instance.new("UIListLayout")

		--Properties:

		KryptonUILib.Name = "KryptonUILib"
		KryptonUILib.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		KryptonUILib.ResetOnSpawn = false

		Scrolling.Name = "Scrolling"
		Scrolling.Parent = KryptonUILib
		Scrolling.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Scrolling.BorderSizePixel = 0
		Scrolling.Position = UDim2.new(0, 511, 0, 219)
		Scrolling.Size = UDim2.new(0.347075045, -150, 0.520395577, -50)
		Scrolling.BottomImage = "rbxassetid://7445543667"
		Scrolling.CanvasSize = UDim2.new(0, 0, 0, 5000000)
		Scrolling.MidImage = "rbxassetid://7445543667"
		Scrolling.ScrollBarThickness = 5
		Scrolling.TopImage = "rbxassetid://7445543667"

		_73.Name = 'eafsxz'

		_73.SortOrder = Enum.SortOrder.LayoutOrder
		_73.Padding = UDim.new(0, 6)

		_8.Name = "  х  8   ݅           п  й             є    ѐ"
		_8.Parent = Scrolling
		_8.PaddingBottom = UDim.new(0, 15)
		_8.PaddingLeft = UDim.new(0, 10)
		_8.PaddingRight = UDim.new(0, 10)
		_8.PaddingTop = UDim.new(0, 15)

		a.Name = "a"
		a.Parent = Scrolling
		a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		a.BackgroundTransparency = 1.000
		a.Size = UDim2.new(1, 0, 1, 0)

		Amongus.Name = "Amongus"
		Amongus.Parent = a
		Amongus.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
		Amongus.Position = UDim2.new(0.0195694715, 0, 0.553738356, 0)
		Amongus.Size = UDim2.new(1, 0, 0, 30)
		Amongus.Font = Enum.Font.SourceSans
		Amongus.PlaceholderText = "Search for an Item"
		Amongus.Text = ""
		Amongus.TextColor3 = Color3.fromRGB(255, 255, 255)
		Amongus.TextSize = 18.000

		_90.Name = " Н г      Ь  ݅   9    0ѝ Н  ڜ              "
		_90.Parent = Amongus

		Frame.Parent = a
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.Size = UDim2.new(1, 0, 1, 0)

		UIListLayout.Parent = Frame
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		Frame_2.Parent = Frame
		Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_2.BackgroundTransparency = 1.000
		Frame_2.Size = UDim2.new(1, 0, 0, 7)

		TextButton.Parent = Frame
		TextButton.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
		TextButton.Size = UDim2.new(1, 0, 0, 40)
		TextButton.Visible = false
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = "Option"
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextSize = 17.000

		_1.Name = "?Нݔ  НڹІ ڝ   1       ݿ                  "
		_1.Parent = TextButton

		UIListLayout_2.Parent = a
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

		-- Scripts:

		local function YXVRPG_fake_script() -- a.LocalScript
			local script = Instance.new('LocalScript', a)

			local UserInputService = game:GetService("UserInputService")

			local gui = Scrolling

			local dragging
			local dragInput
			local dragStart
			local startPos

			local function update(input)
				local delta = input.Position - dragStart
				gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end

			gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)

			gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					update(input)
				end
			end)


			game.Workspace.Map.Ignore.Tools.ChildRemoved:Connect(function(Model)
				for i,v in pairs(script.Parent.Frame:GetChildren()) do
					if v:IsA('TextButton') and  v.Text == Model.Name then
						v:Destroy()
					end
				end
			end)

			game.Workspace.Map.Ignore.Tools.ChildAdded:Connect(function(Model)
				local TextButton = script.Parent.Frame.TextButton
				local CloneTextButton = TextButton:Clone()
				CloneTextButton.Parent = script.Parent.Frame
				CloneTextButton.Visible = true
				CloneTextButton.Text = Model.Name
				CloneTextButton.MouseButton1Click:Connect(function()
					Connectionerere = game.RunService.RenderStepped:Connect(function()
						if Model.Parent ~= nil and InfStorage == false   then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Model.Handle.CFrame

							local args = {
								[1] = "",
								[2] = Model.Name
							}

							workspace.Services.PickupTool:InvokeServer(unpack(args))
						else
							if Model.Parent ~= nil and InfStorage == true then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Model.Handle.CFrame
								local args = {
									[1] = "",
									[2] = Model.Name
								}

								workspace.Services.PickupTool:InvokeServer(unpack(args))

							end
						end
					end)
					wait(2)
					Connectionerere:Disconnect()
				end)
			end)

			for i,v in pairs(game.Workspace.Map.Ignore.Tools:GetChildren()) do
				local TextButton = script.Parent.Frame.TextButton
				local CloneTextButton = TextButton:Clone()
				CloneTextButton.Parent = script.Parent.Frame
				CloneTextButton.Visible = true
				CloneTextButton.Text = v.Name
				CloneTextButton.MouseButton1Click:Connect(function()
					Connectionerere = game.RunService.RenderStepped:Connect(function()
						if v.Parent ~= nil and InfStorage == false   then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame

							local args = {
								[1] = "",
								[2] = v.Name
							}

							workspace.Services.PickupTool:InvokeServer(unpack(args))
						else
							if v.Parent ~= nil and InfStorage == true then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
								local args = {
									[1] = "",
									[2] = v.Name
								}

								workspace.Services.PickupTool:InvokeServer(unpack(args))

							end
						end
					end)
					wait(2)
					Connectionerere:Disconnect()
				end)
			end

			local scroll = script.Parent.Parent.Parent.Scrolling
			local textBox = script.Parent.Amongus

			textBox.Changed:Connect(function()
				local text = textBox.Text:lower()
				if text ~= "" then
					local buttons = scroll:GetDescendants()
					for _, button in pairs(buttons) do
						if button:IsA("TextButton") then
							local buttonText = button.Text:lower()
							if string.find(buttonText, text) then
								button.Visible = true
							else
								button.Visible = false
							end
						end
					end
				else
					local buttons = scroll:GetDescendants()
					for _, button in pairs(buttons) do
						if button:IsA("TextButton") then
							button.Visible = true
						end
					end
				end
			end)
		end

		coroutine.wrap(YXVRPG_fake_script)()
	end
})

local itemEsp = miscTab:Button({
	name = "Item Esp",

	callback = function()
		if game.Players.LocalPlayer.Character:FindFirstChild("WisdomArtifact") == nil  then    
			local BoolValue = Instance.new("BoolValue")
			BoolValue.Value = true
			BoolValue.Name = "WisdomArtifact"
			BoolValue.Parent = game.Players.LocalPlayer.Character

		end

		game.Workspace.Threats.ChildAdded:Connect(function()
			if game.Players.LocalPlayer.Character:FindFirstChild("WisdomArtifact") then
				local BoolValue = Instance.new("BoolValue")
				BoolValue.Value = true
				BoolValue.Name = "WisdomArtifact"
				BoolValue.Parent = game.Players.LocalPlayer.Character
			end
		end)

		game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
			task.wait(1)
			if game.Players.LocalPlayer.Character:FindFirstChild("WisdomArtifact") == nil  then
				local BoolValue = Instance.new("BoolValue")
				BoolValue.Value = true
				BoolValue.Name = "WisdomArtifact"
				BoolValue.Parent = game.Players.LocalPlayer.Character
			end
		end)
	end
})

local cesp = miscTab:Button({
	name = "Collectible-Esp",

	callback = function()
		for _, v in pairs(workspace.Map.Ignore.Collectibles:GetChildren()) do
			if v:FindFirstChildWhichIsA("Part") or v:FindFirstChildWhichIsA("MeshPart") then
				local name = Drawing.new("Text")
				name.Color = Color3.new(255,255,255)

				name.Text = v.Name

				game:GetService("RunService").RenderStepped:Connect(function()
					local root, onscreen = workspace.CurrentCamera:WorldToViewportPoint((v:FindFirstChildWhichIsA("Part") or v:FindFirstChildWhichIsA("MeshPart")).Position)
					if onscreen then
						name.Position = Vector2.new(root.x,root.y)
						name.Text = v.Name.." ["..math.floor(((v:FindFirstChildWhichIsA("Part") or v:FindFirstChildWhichIsA("MeshPart")).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude).."]"
						name.Visible = true
					else
						name.Visible = false
					end
				end)
			end
		end
	end
})

local tptool = mainTab:Button({
	name = "Teleport Tool",

	callback = function()
		ms = game.Players.LocalPlayer:GetMouse()
		tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "Teleport Tool"
		tool.Activated:connect(function()
			local pos = ms.Hit+Vector3.new(0,2.5,0)
			pos = CFrame.new(pos.X,pos.Y,pos.Z)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		end)
		tool.Parent = game.Players.LocalPlayer.Backpack
	end
})

local mercEsp = miscTab:Button({
	name = "Mercenaries Esp",

	callback = function()
		for _, v in pairs(workspace.AIHunter:GetChildren()) do
			if v:IsA("Model") then
				if v:FindFirstChildWhichIsA("Tool") then
					local highlight = Instance.new("Highlight",v)
					highlight.OutlineTransparency = 0
					highlight.OutlineColor =Color3.fromRGB(255, 0, 0)
					highlight.FillColor = Color3.fromRGB(255, 0, 0)
				end
			end
		end

		workspace.AIHunter.ChildAdded:Connect(function(v)
			if v:IsA("Model") then
				if v:FindFirstChildWhichIsA("Tool") then
					local highlight = Instance.new("Highlight",v)
					highlight.OutlineTransparency = 0
					highlight.OutlineColor =Color3.fromRGB(255, 0, 0)
					highlight.FillColor = Color3.fromRGB(255, 0, 0)
				end
			end
		end)
	end
})

colors:Button({
	name = "Lair",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1799.64062, -52.465374, -607.492493, -0.0262645148, 2.28370478e-08, -0.999655008, 4.2563788e-09, 1, 2.2733099e-08, 0.999655008, -3.6578367e-09, -0.0262645148)
	end
})
colors:Button({
	name = "Lab",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1784.05627, -195.904465, -1422.70007, 0.979937732, 8.88492391e-09, 0.199303776, -3.04909342e-08, 1, 1.0533816e-07, -0.199303776, -1.09301801e-07, 0.979937732)
	end
})
colors:Button({
	name = "Hangar",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1622.63513, 21.0474262, -2333.18896, -0.91870904, 9.56422141e-08, -0.394935042, 8.09768466e-08, 1, 5.38013936e-08, 0.394935042, 1.74472348e-08, -0.91870904)
	end
})
colors:Button({
	name = "Ape City",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1253.43188, -53.8751831, -1009.703, -0.889894545, 8.09112866e-09, -0.456166297, 7.5369444e-09, 1, 3.0340741e-09, 0.456166297, -7.38094086e-10, -0.889894545)
	end
})
colors:Button({
	name = "Dome",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-831.062073, 299.745605, -1368.47229, 0.874602735, 8.04499312e-09, 0.484840274, -1.35881839e-08, 1, 7.91862753e-09, -0.484840274, -1.35137528e-08, 0.874602735)
	end
})
colors:Button({
	name = "Realm Mirror",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.Ignore.SpecialPickup.RealmMirror.CFrame
	end
})
colors:Button({
	name = "Peanut Box",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.Main.PeanutBox.Screen.CFrame
	end
})
colors:Button({
	name = "Spawn Ship",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
	end
})
colors:Button({
	name = "Docks",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2037.96265, 3.00008678, -1565.37878, 0.454565942, -4.16716865e-08, 0.890713096, 3.72862416e-08, 1, 2.77559984e-08, -0.890713096, 2.05944133e-08, 0.454565942)
	end
})
colors:Button({
	name = "Generator",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(512.474121, -6.85000229, -518.418091, 0.608929217, -4.87353224e-09, 0.793224573, 2.4331217e-09, 1, 4.27613278e-09, -0.793224573, -6.73850253e-10, 0.608929217)
	end
})
colors:Button({
	name = "Mantis Crash",

	callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		wait(2)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119.043137, -0.612449646, -493.201172, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	end
})

local playerTP = main:CreateTab({
	name = "Players"
})

local plrs = game.Players:GetChildren()
for i,e in pairs(plrs) do
	playerTP:Button({
		name = e.Name,

		callback = function() 
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.284088, 20.2382774, 31310.9336, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			wait(2)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace[e.Name].HumanoidRootPart.CFrame
		end
	})
end

for _, v in pairs(game.Workspace.Map.Ignore.Tools:GetChildren()) do
	if table.find(_G.Items,v.Name) then

	else
		table.insert(_G.Items,tostring(v.Name))
	end
end

workspace.Map.Ignore.Tools.ChildAdded:Connect(function(child)
	table.insert(_G.Items,child.Name)

		items:Button({
			name = tostring(child.Name),

			callback = function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Ignore.Tools:WaitForChild(child.Name):FindFirstChild("Handle").CFrame
				keypress(0x45)
				keyrelease(0x45)
			end
		})
end)

workspace.Map.Ignore.Tools.ChildRemoved:Connect(function(child)
	for _, v in pairs(_G.Items) do
		if tostring(v) == child.Name then
			table.remove(_G.Items, child)
		end
	end
end)
