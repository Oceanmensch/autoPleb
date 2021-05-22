


function CheckForSpendy(poggers,family)

  local aura = false
--   local mount = "Demon Armor"
  local mount = "Reawakened Phase-Hunter"
  local poggersText = "This Spendy is poggers"
  local unpoggersText = "This Spendy is Not poggers"
  local soundFile = "12867"
  aura = AuraUtil.FindAuraByName(mount, "target")
    if aura then
        if poggers then
            -- message(poggersText)
            PlaySound(soundFile)
            SendChatMessage("thinks %t's mount is poggers.", "EMOTE")
        end
        if not poggers then
            if family then
                PlaySound(soundFile)
                local message = "spits on %t and their mother, father, elders, pet fish, crypto daddy, step-dog, partner of unspecified gender, and their mount."
        
                SendChatMessage(message, "EMOTE")
                    -- print(familyMember)
                
            end
            if not family then
                SendChatMessage("spits on %t.", "EMOTE")
                -- DoEmote("spit")
                -- message(unpoggersText)
                PlaySound(soundFile)
            end
        end
      
    return aura
    end


end


local frame = CreateFrame("FRAME", "I4DFrame")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")  
frame:RegisterEvent("PLAYER_LOGIN")
local function eventHandler(self, event, ...)
    if event == "PLAYER_LOGIN" then 
        if poggers == nil then
            poggers = false
        
        end


        if family == nil then
            family = false
        
        end




        AutoPleb = {};
        AutoPleb.OptMenu = CreateFrame( "Frame", "AutoPlebPanel", UIParent );
        AutoPleb.OptMenu.name = "AutoPleb";
        
        
        InterfaceOptions_AddCategory(AutoPleb.OptMenu);
        
        
        local title = AutoPleb.OptMenu:CreateFontString("Title", "OVERLAY", "GameFontNormalLarge")
        title:SetPoint("TOPLEFT", "AutoPlebPanel", "TOPLEFT", 15, -15)
        title:SetText("AutoPleb Config")

        
        local button = CreateFrame("CheckButton", "Button", AutoPleb.OptMenu, "InterfaceOptionsCheckButtonTemplate")
        button:SetPoint("TOPLEFT", "Title", "BOTTOMLEFT", 0, -10)
        
        button.text = button:CreateFontString("AB_BuyInterface_MainFrame_ExactMatchCheck_Text", "OVERLAY", "GameFontNormal")
            button.text:SetWidth(80)
            button.text:SetPoint("CENTER", 50, 0)
            button.text:SetJustifyH("LEFT")
            button.text:SetText("Poggers")
        
        button:SetChecked(poggers)
       
        button:SetScript("OnClick", function(self) poggers = self:GetChecked() end)
        
        local button2 = CreateFrame("CheckButton", "Button", AutoPleb.OptMenu, "InterfaceOptionsCheckButtonTemplate")
        button2:SetPoint("TOPLEFT", "Title", "BOTTOMLEFT", 0, -40)
        
        
        button2.text = button2:CreateFontString("AB_BuyInterface_MainFrame_ExactMatchCheck_Text", "OVERLAY", "GameFontNormal")
        button2.text:SetWidth(100)
        button2.text:SetPoint("CENTER", 60, 0)
        button2.text:SetJustifyH("LEFT")
        button2.text:SetText("Family Mode")
        button2:SetChecked(family)
        button2:SetScript("OnClick", function(self)family = self:GetChecked() end)
        
 

    end
    if event == "PLAYER_TARGET_CHANGED" then
    CheckForSpendy(poggers,family)  
    end

  
end
frame:SetScript("OnEvent", eventHandler)



