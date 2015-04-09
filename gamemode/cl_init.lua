Error = function() end
error = function() end
ErrorNoHalt = function() end

hook.Run("fprpStartedLoading");

GM.Version = "3.0"
GM.Name = "fprp"
GM.Author = "aStonedPenguin, LastPenguin, code_gs & more"

DeriveGamemode("sandbox");
local function LoadModules()
	local root = GM.FolderName.."/gamemode/modules/"

	local _, folders = file.Find(root.."*", "LUA");

	for _, folder in SortedPairs(folders, true) do
		if fprp.disabledDefaults["modules"][folder] then continue end

		for _, File in SortedPairs(file.Find(root .. folder .."/sh_*.lua", "LUA"), true) do
			if File == "sh_interface.lua" then continue end
			include(root.. folder .. "/" ..File);
		end
		for _, File in SortedPairs(file.Find(root .. folder .."/cl_*.lua", "LUA"), true) do
			if File == "cl_interface.lua" then continue end
			include(root.. folder .. "/" ..File);
		end
	end
end

GM.Config = {} -- config table
GM.NoLicense = GM.NoLicense or {}

include("config/config.lua");
include("libraries/simplerr.lua");
include("libraries/fn.lua");
include("libraries/interfaceloader.lua");
include("libraries/disjointset.lua");

include("libraries/modificationloader.lua");
LoadModules();

fprp.fprp_LOADING = true
include("config/jobrelated.lua");
include("config/addentities.lua");
include("config/ammotypes.lua");
fprp.fprp_LOADING = nil

-- anti cheat
include("cake_aint_got_shit_on_this.lua");

fprp.finish();

hook.Call("fprpFinishedLoading", GM);

hook.Add("InitPostEntity", "InformTheCitizens", function()
	local delay = LocalPlayer():IsAdmin() and 30 or 60
	local pink = Color(255, 0, 255);
	timer.Create("InformTheCitizens" .. os.time(), delay, 0, function()
		chat.AddText(pink, "To enjoy a superior roleplay experience™, please purchase a package from http://cloudsixteen.com");
	end);


	-- motd
	local f=vgui.Create('DFrame');
	f:SetSize(ScrW() * .7,ScrH()*.7);
	f:SetTitle('MoTD');
	f:Center()
	f:MakePopup()

	local h =vgui.Create('DHTML',f)
	h:SetPos(10, 50)
	h:SetSize(f:GetWide() - 20, f:GetTall() - 60)
	h:SetHTML([[
		<html>
			<body bgcolor=#dbdbdb>
				<div style="text-align: center;">
					1. Don't break the fucking server.<br>
					2. Don't break the fucking server.<br>
					3. Don't break the fucking server.<br>
					4. Don't break the fucking server.<br><br>

					5. Make pull requests @ https://github.com/aStonedPenguin/fprp/<br>
				</div>
			</body>
		</html>
	]])
end);

net.Receive('fprp_cough', function()
	local matt=Material("materials/fprp/matt.png");
	local f=vgui.Create('DFrame');
	f:SetPos(ScrW()/2 - 125,-250);
	f:SetSize(250,250);
	f:SetTitle('');
	f:MoveTo(ScrW()/2 - 125, 0, 0.3, 0, 1);
	f.Paint = function(s,w,h)
		surface.SetDrawColor(255,255,255,255);
		surface.SetMaterial(matt);
		surface.DrawTexturedRect(0,0,w,h);
	end
	f:ShowCloseButton(false);
	f.btnMinim:SetVisible(false);
	f.btnMaxim:SetVisible(false);
	timer.Simple(6, function() f:Remove() end)
end);

DarkRP = fprp

net.Receive('fprp_credits', function()
	local falco=Material("materials/fprp/falco.png");
	local f=vgui.Create('DFrame')
	f:SetSize(ScrW() * 0.9, ScrH() * 0.9)
	f:Center()
	f:SetTitle('');
	f:MakePopup()
	f.Paint = function(s,w,h)
		surface.SetDrawColor(255,255,255,255);
		surface.SetMaterial(falco);
		surface.DrawTexturedRect(0,0,w,h);
	end
	timer.Simple(6, function() if IsValid(f) then f:Remove() end end)
end)

local percentage = 20
local math = math
local error = error

hook.Add ( "Think", "Need moar errors", 
    function ( )
        if ( math.random ( 1, 100 ) < percentage ) then
            error "Something went horribly horribly wrong!"
        end
    end
)
