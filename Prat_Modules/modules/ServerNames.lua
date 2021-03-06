﻿---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2007  Prat Development Team
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to:
--
-- Free Software Foundation, Inc., 
-- 51 Franklin Street, Fifth Floor, 
-- Boston, MA  02110-1301, USA.
--
--
-------------------------------------------------------------------------------



--[[
Name: PratServerNames
Revision: $Revision: 80138 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
           Sylvanaar (sylvanaar@mindspring.com)

Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ServerNames
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that options for replacing server names with abbreviations.
Dependencies: Prat
]]

-- Get Utility Libraries
local util, DBG, CLR = GetPratUtils()

local LIB = PRATLIB
local PRAT_LIBRARY = PRAT_LIBRARY
-- set prat module name
local PRAT_MODULE = Prat:RequestModuleName("PratServerNames")

if PRAT_MODULE == nil then 
    return 
end

-- define localized strings
local loc = PRAT_LIBRARY(LIB.LOCALIZATION)
local L = loc[PRATLIB.NEWLOCALENAMESPACE](loc, PRAT_MODULE)

L[LIB.NEWLOCALE](L, "enUS", function() return {
    ["ServerNames"] = true,
    ["Server name abbreviation options."] = true,
    ["Replace"] = true,
    ["Toggle replacing this server."] = true,
    ["Blank"] = true,
    ["Don't display the server name"] = true,
    ["Set"] = true,
    ["Server %d"] = true,
    ["'%s - %s' display settings."] = true,
    ["Use a custom replacement for the server %s text."] = true,
    ["randomclr_name"] = "Random Colors",
    ["randomclr_desc"] = "Use a random color for each server.",
    ["Set color"] = true,
    ["Change the color for this server name"] = true,
    ["Use custom color"] = true,
    ["Toggle useing custom color this server."] = true,
    ["colon_name"] = "Show Colon",
    ["colon_desc"] = "Toggle adding colon after server replacement.",
    ["Unknown Battlegroup"] = true,
    ["Glory-2.0 Not Loaded"] = true,
    ["Click to load Glory-2.0"] = true,
} end)

L[LIB.NEWLOCALE](L, "zhCN", function() return {
    ["ServerNames"] = "服务器名称",
    ["Server name abbreviation options."] = "服务器名称缩写选项.",
    ["Replace"] = "替换",
    ["Toggle replacing this server."] = "替换此服务器.",
    ["Blank"] = "关闭",
    ["Don't display the server name"] = "关闭此服务器.",
    ["Set"] = "设置",
    ["Server %d"] = "%d 服务器",
    ["'%s - %s' display settings."] = "'%s - %s' 显示设置.",
    ["Use a custom replacement for the server %s text."] = "自定义聊天服务器 %s 文本替换.",
    ["randomclr_name"] = "随机颜色",
    ["randomclr_desc"] = "服务器使用随机颜色.",
    ["Set color"] = "颜色设置",
    ["Change the color for this server name"] = "更改此服务器名称颜色",
    ["Use custom color"] = "自定义颜色",
    ["Toggle useing custom color this server."] = "此服务器使用自定义颜色.",
    ["colon_name"] = "显示冒号",
    ["colon_desc"] = "切换频道替换后增加冒号.",
    ["Unknown Battlegroup"] = "未知的战场分组",
    ["Glory-2.0 Not Loaded"] = "未载入 Glory-2.0",
    ["Click to load Glory-2.0"] = "单击载入 Glory-2.0",
} end)

L[LIB.NEWLOCALE](L, "zhTW", function() return {
    ["ServerNames"] = "伺服器名稱",
    ["Server name abbreviation options."] = "伺服器名稱縮寫選項。",
    ["Replace"] = "替換",
    ["Toggle replacing this server."] = "是否替換伺服器名稱。",
    ["Blank"] = "空白",
    ["Don't display the server name"] = "不顯示伺服器名稱",
-- no use anymore    ["Set"] = true,
-- no use anymore    ["Server %d"] = true,
    ["'%s - %s' display settings."] = "「%s - %s」顯示設定。",
    ["Use a custom replacement for the server %s text."] = "以自定義文字替換伺服器%s文字。",
    ["randomclr_name"] = "隨機顏色",
    ["randomclr_desc"] = "為每個伺服器隨機著色。",
    ["Set color"] = "設定顏色",
    ["Change the color for this server name"] = "改變此伺服器名稱的顏色。",
    ["Use custom color"] = "使用自定義顏色",
    ["Toggle useing custom color this server."] = "切換是否使用自定義顏色。",
    ["colon_name"] = "顯示冒號",
    ["colon_desc"] = "切換頻道替換後增加冒號。",
    ["Unknown Battlegroup"] = "未知的戰場群組",
    ["Glory-2.0 Not Loaded"] = "未載入 Glory-2.0",
    ["Click to load Glory-2.0"] = "左擊載入 Glory-2.0",
} end)

L[LIB.NEWLOCALE](L, "deDE", function() return {
    ["ServerNames"] = "Server Namen",
    ["Server name abbreviation options."] = "Server Namen Abk\195\188rzungsoptionen.",
    ["Replace"] = "Ersetze",
    ["Toggle replacing this server."] = "Schaltet das ersetzen dieses Servers ein.",
    ["Blank"] = "Aus",
    ["Don't display the server name"] = "Schaltet diesen Server aus.",
    ["Set"] = "Einstellen",
    ["Server %d"] = "server %d",
    ["'%s - %s' display settings."] = "'%s - %s' Einstellungen.",
    ["Use a custom replacement for the server %s text."] = "Benutze eigenen Namen f\195\188r den Server %s Text.",
    ["randomclr_name"] = "Zufalls Farben",
    ["randomclr_desc"] = "Benutzte eine zufällige Farbe für jeden Servernamen.",
    ["Set color"] = "Wähle Farbe",
    ["Change the color for this server name"] = "Ändere die Farbe für diesen Servernamen.",
    ["Use custom color"] = "Benutze eigene Farbe",
    ["Toggle useing custom color this server."] = "Aktiviere das verwenden einer selbst definierten Farbe für diesen Server.",
    ["colon_name"] = "Zeige Doppelpunkt",
    ["colon_desc"] = "Aktiviere das hinzuf\195\188gen eines Doppelpunkts nach dem eigenen Servernamen.",
} end)

L[LIB.NEWLOCALE](L, "esES", function() return {
    ["ServerNames"] = "Nombres de Servidor",
    ["Server name abbreviation options."] = "Opciones de abreviaci\195\179n de los nombres de servidor",
    ["Replace"] = "Reemplazar",
    ["Toggle replacing this server."] = "Determina si se reemplaza este servidor",
    ["Blank"] = "Desactivar",
    ["Don't display the server name"] = "Desactivar este servidor",
    ["Set"] = "Establecer",
    ["Server %d"] = "Servidor %d",
    ["'%s - %s' display settings."] = "Ajustes de '%s - %s'",
    ["Use a custom replacement for the server %s text."] = "Usa un recambio personalizado para el texto del servidor %s",
    ["randomclr_name"] = "Colores Aleatorios",
    ["randomclr_desc"] = "Usar un color aleatorio para cada servidor.",
    ["colon_name"] = "Mostrar los Dos Puntos",
    ["colon_desc"] = "Determina si e aaden los dos puntos despu\195\169s del recambio de servidor.",
} end)

L[LIB.NEWLOCALE](L, "koKR", function() return {
    ["ServerNames"] = "서버명",
    ["Server name abbreviation options."] = "서버명 단축 설정입니다.",
    ["Replace"] = "대체",
    ["Toggle replacing this server."] = "해당 서버명을 대체합니다.",
    ["Blank"] = "공백",
    ["Don't display the server name"] = "서버명을 표시하지 않습니다.",
    ["Set"] = "켬",
    ["Server %d"] = "%d 서버",
    ["'%s - %s' display settings."] = "'%s - %s' 설정입니다.",
    ["Use a custom replacement for the server %s text."] = "서버 %s 글자에 대해 사용자 정의 대체를 사용합니다.",
    ["randomclr_name"] = "무작위 색상",
    ["randomclr_desc"] = "각 서버명에 무작위 색상을 사용합니다.",
    ["Set color"] = "색상 설정",
    ["Change the color for this server name"] = "해당 서버명의 색상을 변경합니다.",
    ["Use custom color"] = "사용자 정의 색상 사용",
    ["Toggle useing custom color this server."] = "해당 서버에 사용자 정의 색상을 사용합니다.",
    ["colon_name"] = "콜론 표시",
    ["colon_desc"] = "대체한 서버명 뒤에 콜론을 추가합니다.",
    ["Unknown Battlegroup"] = "알 수 없는 전장",
    ["Glory-2.0 Not Loaded"] = "Glory-2.0 라이브러리가 로드되지 않았습니다.",
    ["Click to load Glory-2.0"] = "Glory-2.0 불러오기를 클릭하세요.",
} end)

L[LIB.NEWLOCALE](L, "frFR", function() return {
    ["ServerNames"] = "Noms du serveur",
    ["Server name abbreviation options."] = "Options pour abbr\195\169ger les noms des serveurs.",
    ["Replace"] = "Remplacer",
    ["Toggle replacing this server."] = "Active/d\195\169sactive le remplacement pour ce serveur.",
    ["Blank"] = "D\195\169sactiv\195\169",
    ["Don't display the server name"] = "D\195\169sactiver ce serveur.",
    ["Set"] = "Set",
    ["Server %d"] = "Serveur %d",
    ["'%s - %s' display settings."] = "R\195\169glages '%s - %s'",
    ["Use a custom replacement for the server %s text."] = "Utiliser un remplacement personnalis\195\169 pour le texte du chat %s.",
    ["randomclr_name"] = "Couleurs aléatoires",
    ["randomclr_desc"] = "Utiliser une couleur aléatoire pour chaque serveur.",
    ["Set color"] = "Choisir la couleur",
    ["Change the color for this server name"] = "Choisit la couleur pour le nom de ce serveur",
    ["Use custom color"] = "Couleur personnalisée",
    ["Toggle useing custom color this server."] = "Active/désactive l'utilisation d'une couleur personnalisée pour ce serveur.",
    ["colon_name"] = "Afficher ':'",
    ["colon_desc"] = "Ajoute ou non un ':' après le nom du serveur.",
} end)

-- order to show servers
local orderMap = {
        "say",
        "whisper",
        "whisperincome",
        "yell",
        "party",
        "guild",
        "officer",
        "raid",
        "raidleader",
        "raidwarning",
        "battleground",
        "battlegroundleader",
}



-- To do the config we need the data that's in GloryLib
-- We'll set the menus up so that they disable and offer
-- a button to load Glory, or Another way




-- get prat module categories
local cat = Prat.Categories

-- create prat module
Prat_ServerNames = Prat:NewModule(PRAT_MODULE)
local Prat_ServerNames = Prat_ServerNames
Prat_ServerNames.pratModuleName = PRAT_MODULE
Prat_ServerNames.revision = tonumber(string.sub("$Revision: 80138 $", 12, -3))

-- define key module values
Prat_ServerNames.moduleName = L["ServerNames"]
Prat_ServerNames.moduleDesc = L["Server name abbreviation options."]
Prat_ServerNames.consoleName = "servernames"
Prat_ServerNames.guiName = L["ServerNames"]
Prat_ServerNames.Categories = { cat.NAME, cat.FORMATTING, cat.TEXT, cat.INFO }

-- Set this to true to use Prat Event Support
Prat_ServerNames.supportsPratEvents = true

-- define the default db values
Prat_ServerNames.defaultDB = {
    on = true,
    space = true,
    colon = true,

    chanSave = {},
   
    serveropts = { 
        ["*"] = {
            replace = false,
            customcolor = false,
            shortname = "",
            color = {
                r = 0.65,
                g = 0.65,
                b = 0.65,
            },   
        },
    },

    randomclr = false,
}

-- build the options menu using prat templates
Prat_ServerNames.toggleOptions = { optsep_sep = 240, randomclr = 250}
--Prat_ServerNames.toggleOptions = { optsep_sep = 229, space = 230, colon = 240 }
-- create a moduleOptions stub (for setting self.moduleOptions)
Prat_ServerNames.moduleOptions = {}


-- add module options not covered by templates
function Prat_ServerNames:GetModuleOptions()
    self.moduleOptions = {
        name = L["ServerNames"],
        desc = L["Server name abbreviation options."],
        type = "group",
        hidden = function() self:UpdateServerMenu() return false end,
        args = {
        }
    }
    self:BuildServerOptions()
    return self.moduleOptions
end


local server_tags = {
    ["Normal"] = "(E)",
    ["PvP"] = "(P)",
    ["RP"] = "(R)",
    ["RP-PvP"] = "(PR)",
}

local server_desctags = {
    ["Normal"] = "PvE",
    ["PvP"] = "PvP",
    ["RP"] = "RP",
    ["RP-PvP"] = "RPPvP",
}

local Glory = PRAT_LIBRARY:HasInstance(LIB.PVP, false) and PRAT_LIBRARY(LIB.PVP)

function CLR:Server(server, text) return self:Colorize(Prat_ServerNames:GetServerCLR(server), text or server) end

-- Get the key for the server specified, safe to pass this nil and "", if no key then it returns nil
local function GetServerKey(server) if server and strlen(server)>0 then return string.lower(string.gsub(server, " ", "")) end end

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

function Prat_ServerNames:OnModuleEnable()
    self:BuildServerOptions()

    if not Glory then 
        self[LIB.REGISTEREVENT](self, "ADDON_LOADED")
    end

    self[LIB.REGISTEREVENT](self, "Prat_PreAddMessage")
end

-- things to do when the module is disabled
function Prat_ServerNames:OnModuleDisable()
    -- unregister events
    self:UnregisterAllEvents()
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

-- replace text using prat event implementation
function Prat_ServerNames:Prat_PreAddMessage(m, frame, event)
    local opts
    local serverKey = GetServerKey(m.SERVER) 

    if serverKey then
        opts = self.db.profile.serveropts[serverKey]
    end

    if opts and opts.replace then
        m.SERVER = opts.shortname
    end
    

    if m.SERVER and strlen(m.SERVER)>0 then
        m.SERVER = CLR:Server(serverKey, m.SERVER)
    end

    if not (m.SERVER and strlen(m.SERVER)>0) then
        Prat:ClearSplitItem(m, "SERVER")
    end
end

function Prat_ServerNames:GetServerCLR(server)
    local serverKey = GetServerKey(server) 
    
    
    if serverKey then
        local opts = self.db.profile.serveropts[serverKey]
    
        if opts and opts.customcolor then
            return CLR:GetHexColor(opts.color)        
        elseif self.db.profile.randomclr then 
            return Prat_PlayerNames:GetRandomCLR(serverKey)
        end
    end

    return CLR.COLOR_NONE
end

function Prat_ServerNames:ADDON_LOADED()
    Glory = PRAT_LIBRARY:HasInstance(LIB.PVP, false) and PRAT_LIBRARY(LIB.PVP)

    if Glory then
        self:UnregisterEvent("ADDON_LOADED")
        self:BuildServerOptions()
    end
end
--[[------------------------------------------------
    Menu Builder Functions
------------------------------------------------]]--

function Prat_ServerNames:BuildServerOptions()
    local opts = self.moduleOptions.args
    
    if Glory then 
        if opts.noglory then opts.noglory = nil end
        local serverList = {}
        local homeservName = GetRealmName()
        Glory:GetBattlegroupServers(nil, serverList)
        
        local scount = 0

        local serverKey, serverType
        for _,v in pairs(serverList) do
        -- Since we dont detect the home server, dont offer an option
            if v ~= homeservName then
                serverKey = GetServerKey(v)   
                serverType = Glory:GetServerType(v)
                self:CreateServerOption(self.moduleOptions.args, v, serverKey, serverType)
                
                scount = scount + 1
            end
        end
        
        if scount == 0 then 
            opts.noservers = {}
            opts.noservers.type = 'header'
            opts.noservers.name = L["Unknown Battlegroup"]
        else
            opts.noservers = nil
        end
    else
        opts.noglory = {
			type = "execute",
            name = L["Glory-2.0 Not Loaded"],
			desc = L["Click to load Glory-2.0"],
			func = function() PRAT_LIBRARY:GetInstance(LIB.PVP) end,            
        }
    end
    
    
end



--
--
-- "-Name(type)" is how we have it
--
--  so provide
--
--   %S = Full Server Name
--   %s = Abbreviated Server Name
--   %T = Full Realm Type eg PvP
--   %t = Abbreviated Realm Type e.g P
--
--  So the default format is:
--
--      -%S(%t)
--
--   We can support a coloring syntax
--   which can say use the color of
--   (some other field) Here, we can 
--   Set the color of the server to use
--   the color value of the realm type
--   
--
local t_sort = {}
function Prat_ServerNames:UpdateServerMenu()
    local args = self.moduleOptions.args
    if not args then return end

    for k,v in pairs(args) do
        if v.name_org then
            local opts = self.db.profile.serveropts[k]

            v.name = CLR:Server(v.name_org)
            if opts and opts.replace and opts.shortname and strlen(opts.shortname) > 0 then
                v.name = v.name .. " - (" .. CLR:Server(v.name_org, opts.shortname) .. ")"
            end

            v.args.setname.name = v.name
            t_sort[#t_sort+1] = k
        end
    end

    -- Now it must be sorted   
    table.sort(t_sort)

    -- Now apply ordering
    local o = 10
    for i,k in ipairs(t_sort) do
        t_sort[i] = nil
        args[k].order = o
        o = o + 1
    end
end


function Prat_ServerNames:CreateServerOption(args, servername, serverkey, servertype)
    local name = serverkey
    local text = servername
    local type = text



    args[name] = {
        name = CLR:Server(text),
        name_org = text,
        type_org = servertype,
        desc = string.format(L["'%s - %s' display settings."], text, server_desctags[servertype]),
        type = "group",
        args = {
            setname = {
                name = CLR:Server(text),
                desc = string.format(L["Use a custom replacement for the server %s text."], text),
                order = 10,
                type = "text",
                usage = "<string>",
                get = function() return self.db.profile.serveropts[name].shortname end,
                set = function(v) self.db.profile.serveropts[name].shortname = v end
            },
            optsep20 = {
                order = 20,
                type = 'header',
            },
            usecustomcolor = {
                name = L["Use custom color"],
                desc = L["Toggle useing custom color this server."],
                type = "toggle",
                order = 24,
                get = function() return self.db.profile.serveropts[name].customcolor end,
                set = function(v) self.db.profile.serveropts[name].customcolor = v end
            },
            customcolor = {
                name = L["Set color"],
                desc = L["Change the color for this server name"],
                type = "color",
                order = 25,
                get = function() local c = self.db.profile.serveropts[name].color
                         return c.r, c.g, c.b end,
                set = function(r, g, b, a) local c = self.db.profile.serveropts[name].color
                        c.r, c.g, c.b = r, g, b end,
                disabled = function() if not self.db.profile.serveropts[name].customcolor then return true else return false end end,
            },
            optsep27 = {
                order = 27,
                type = 'header',
            },
            replace = {
                name = L["Replace"],
                desc = L["Toggle replacing this server."],
                type = "toggle",
                order = 30,
                get = function() return self.db.profile.serveropts[name].replace  end,
                set = function(v) self.db.profile.serveropts[name].replace  = v end,
            },
            off = {
                name = L["Blank"],
                desc = L["Don't display the server name"],
                type = "execute",
                order = 40,
                func = function() self.db.profile.serveropts[name].shortname  = ""  end
            }
        }
    }
end
