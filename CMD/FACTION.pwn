//-----------[ Faction Commands ]------------
CMD:factionhelp(playerid)
{
	if(pData[playerid][pFaction] == 1)
	{
		new str[3500];
		strcat(str, ""BLUE_E"SAPD: /locker /or (/r)adio /od /d(epartement) (/gov)ernment (/m)egaphone /invite /uninvite /setrank\n");
		strcat(str, ""WHITE_E"SAPD: /sapdonline /(un)cuff /tazer /detain /arrest /release /flare /destroyflare /checkveh /takedl\n");
		strcat(str, ""BLUE_E"SAPD: /takemarijuana /spike /destroyspike /destroyallspike /tracephone /takegun\n");
		strcat(str, ""WHITE_E"NOTE: Lama waktu duty anda akan menjadi gaji anda pada saat paycheck!\n");
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""RED_E"SAPD", str, "Close", "");
	}
	else if(pData[playerid][pFaction] == 2)
	{
		new str[3500];
		strcat(str, ""LB_E"SAGS: /locker /or (/r)adio /od /d(epartement) (/gov)ernment (/m)egaphone /invite /uninvite /setrank\n");
		strcat(str, ""WHITE_E"SAGS: /sagsonline /(un)cuff /checkcitymoney\n");
		strcat(str, ""WHITE_E"NOTE: Lama waktu duty anda akan menjadi gaji anda pada saat paycheck!\n");
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""RED_E"SAGS", str, "Close", "");
	}
	else if(pData[playerid][pFaction] == 3)
	{
		new str[3500];
		strcat(str, ""PINK_E"SAMD: /locker /or (/r)adio /od /d(epartement) (/gov)ernment (/m)egaphone /invite /uninvite /setrank\n");
		strcat(str, ""WHITE_E"SAMD: /samdonline /loadinjured /dropinjured /ems /findems /healbone /rescue /salve /mix /treatment\n");
		strcat(str, ""WHITE_E"NOTE: Lama waktu duty anda akan menjadi gaji anda pada saat paycheck!\n");
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""RED_E"SAMD", str, "Close", "");
	}
	else if(pData[playerid][pFaction] == 4)
	{
		new str[3500];
		strcat(str, ""ORANGE_E"SANA: /locker /or (/r)adio /od /d(epartement) (/gov)ernment (/m)egaphone /invite /uninvite /setrank\n");
		strcat(str, ""WHITE_E"SANA: /sanaonline /broadcast /bc /live /inviteguest /removeguest\n");
		strcat(str, ""WHITE_E"NOTE: Lama waktu duty anda akan menjadi gaji anda pada saat paycheck!\n");
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""RED_E"SANEWS", str, "Close", "");
	}
	else if(pData[playerid][pFamily] != -1)
	{
		new str[3500];
		strcat(str, ""WHITE_E"Family: /fsafe /f(amily) /finvite /funinvite /fsetrank\n");
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""RED_E"Family", str, "Close", "");
	}
	else
	{
		ErrorMsg(playerid, "Anda tidak bergabung dalam faction/family manapun!");
	}
	return 1;
}

CMD:sitasim(playerid, params[])
{
    new otherid;
	if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/sitasim [playerid id/name]");

    if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu harus menjadi Police!");

    if(!IsPlayerConnected(otherid))
        return ErrorMsg(playerid, "Player belum masuk!");

    pData[otherid][pDriveLic] = 0;
	new lstr[500];
	format(lstr, sizeof(lstr), "Anda berhasil menyita sim ~y~%d!", pData[otherid][pName]);
    SuccesMsg(playerid, lstr);
    new str[500];
    format(str, sizeof(str), "Polisi ~y~%s ~w~telah menyita surat izin mengemudi milik anda.", ReturnName(playerid));
    InfoMsg(otherid, str);
	return 1;
}
CMD:givesim(playerid, params[]) 
{
	if(pData[playerid][pFaction] != 1)
        return Error(playerid, "You Not Police Department!");

    new jumlah, otherid;
	if(sscanf(params, "ud", otherid, jumlah))
        return SyntaxMsg(playerid, "/givesim [playerid id/name] <amount>");
		
    if(jumlah > 1)
		return ErrorMsg(playerid, "Max 1!");

    if(!IsPlayerConnected(otherid))
        return ErrorMsg(playerid, "Player Not Connected To Server!");

    pData[otherid][pDriveLic] = jumlah;
    new lstr[500];
	format(lstr, sizeof(lstr), "You Success to Give a Driver's License to ~y~%d!", pData[otherid][pName]);
    SuccesMsg(playerid, lstr);
    new str[500];
    format(str, sizeof(str), "Police %s has given you a driver's license.", ReturnName(playerid));
    InfoMsg(otherid, str);
	return 1;
}

CMD:pedagangonline(playerid, params[])
{
	if(pData[playerid][pFaction] != 5)
        return Error(playerid, "You must be a pedagang officer.");
	if(pData[playerid][pFactionRank] < 1)
		return Error(playerid, "You must be high rank!");

	new duty[16], lstr[1024];
	format(lstr, sizeof(lstr), "Name\tRank\tStatus\tDuty Time\n");
	foreach(new i: Player)
	{
		if(pData[i][pFaction] == 4)
		{
			switch(pData[i][pOnDuty])
			{
				case 0:
				{
					duty = "Off Duty";
				}
				case 1:
				{
					duty = ""BLUE_E"On Duty";
				}
			}
			format(lstr, sizeof(lstr), "%s%s(%d)\t%s(%d)\t%s\t%d detik", lstr, pData[i][pName], i, GetFactionRank(i), pData[i][pFactionRank], duty, pData[i][pOnDutyTime]);
			format(lstr, sizeof(lstr), "%s\n", lstr);
		}
	}
	format(lstr, sizeof(lstr), "%s\n", lstr);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "PEDAGANG Online", lstr, "Close", "");
	return 1;
}

CMD:menumasak(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.5, 524.6508,-1821.6819,6.6213)) return ErrorMsg(playerid, "Kamu harus di dapur!");
	if(pData[playerid][pLevel] < 2) return ErrorMsg(playerid, "level kamu harus 2!.");
	if(pData[playerid][pFaction] != 5)
        return ErrorMsg(playerid, "Anda harus menjadi seorang pedagang");

	new Dstring[512];
	format(Dstring, sizeof(Dstring), "Jenis (Jumlah)\tBahan\n", Dstring);
	format(Dstring, sizeof(Dstring), "{ffffff}%sAyam Goreng (10)\tAyam Fillet (5)\n", Dstring);
	format(Dstring, sizeof(Dstring), "{ffffff}%sEs Teh(10)\tMineral + Orange 5\n", Dstring);
	//format(Dstring, sizeof(Dstring), "{ffffff}%sFried Chiken(5)\tAyam Fillet + Tepung 5\n", Dstring);
	format(Dstring, sizeof(Dstring), "{ffffff}%sSteak Ayam(10)\tAyam Fillet (5) + Tepung (3)\n", Dstring);
	ShowPlayerDialog(playerid, DIALOG_MENUMASAK, DIALOG_STYLE_TABLIST_HEADERS, "{FF5000}Pedagang {ffffff}/{FF5000}/ {ffffff}Menu Masak", Dstring, "{27d23d}Enter", "{e31d1d}Cancel");
	return 1;
}
CMD:menuminum(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 2.5, 524.0871,-1817.6035,6.6213)) return ErrorMsg(playerid, "Kamu harus di kulkas!");
	if(pData[playerid][pLevel] < 2) return ErrorMsg(playerid, "level kamu harus 2!.");
	if(pData[playerid][pFaction] != 5)
        return ErrorMsg(playerid, "Anda harus menjadi seorang pedagang");

	new Dstring[512];
	format(Dstring, sizeof(Dstring), "Minuman (Jumlah)\n", Dstring);
	format(Dstring, sizeof(Dstring), "{ffffff}%sWater (5)\n", Dstring);
	format(Dstring, sizeof(Dstring), "{ffffff}%sCappucino (5)\n", Dstring);
	format(Dstring, sizeof(Dstring), "{ffffff}%sStarling (5)\n", Dstring);
	format(Dstring, sizeof(Dstring), "{ffffff}%sMilxMax(5)\n", Dstring);
	ShowPlayerDialog(playerid, DIALOG_MENUMINUM, DIALOG_STYLE_TABLIST_HEADERS, "{FF5000}Pedagang {ffffff}/{FF5000}/ {ffffff}Menu Minuman", Dstring, "{27d23d}Enter", "{e31d1d}Cancel");
	return 1;
}

CMD:gudangpedagang(playerid, params[])
{
	if(pData[playerid][pFaction] != 5)
        return Error(playerid, "You must be part of a Pedagang faction.");

    foreach(new pid : Pedagang)
	{
        if(IsPlayerInRangeOfPoint(playerid, 4.0, pdgDATA[pid][pdgPosX], pdgDATA[pid][pdgPosY], pdgDATA[pid][pdgPosZ]))
        {
            ShowPedagangMenu(playerid, pid);
        }
    }
    return 1;
}

ShowPedagangMenu(playerid, pid)
{
    pData[playerid][pdgMenuType] = 0;
    pData[playerid][pInPdg] = pid;

    new str[256], vstr[64];
    format(vstr, sizeof vstr,"{BABABA}Greenwich - {FFFFFF}Gudang Pedagang");
    format(str, sizeof str,"Item\tStok\nBeras\t(%d)\n{BABABA}Sambal\t{BABABA}(%d)\n{FFFFFF}Tepung\t(%d)\n{BABABA}Gula\t{BABABA}(%d)\n{FFFFFF}Ayam Fillet\t(%d)",
        pdgDATA[pid][pdgKentang],
        pdgDATA[pid][pdgMineral],
        pdgDATA[pid][pdgSnack],
        pdgDATA[pid][pdgChicken],
		pdgDATA[pid][pdgCocacola]);
    ShowPlayerDialog(playerid, PEDAGANG_MENU, DIALOG_STYLE_TABLIST_HEADERS, vstr, str, "Pilih", "Batal");

    return 1;
}

CMD:menu(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 2.0, 529.2660,-1819.7333,6.6213))
    {
        ShowPlayerDialog(playerid, DIALOG_MENU, DIALOG_STYLE_LIST, "Greenwich - Food Vendors Menu","Ayam Goreng\nSteak Ayam\nStarling\nCappucino\nMilxMax\nWater","Pilih","Batal");
	}
	return 1;
}

CMD:or(playerid, params[])
{
    new text[128];
    
    if(pData[playerid][pFaction] == 0)
        return Error(playerid, "You must in faction member to use this command");
            
    if(sscanf(params,"s[128]",text))
        return SyntaxMsg(playerid, "/or(OOC radio) [text]");

    if(strval(text) > 128)
        return Error(playerid,"Text too long.");

    if(pData[playerid][pFaction] == 1) {
        SendFactionMessage(1, COLOR_RADIO, "* (( %s: %s ))", pData[playerid][pName], text);
		//format(mstr, sizeof(mstr), "[<RADIO>]\n* %s *", text);
		//SetPlayerChatBubble(playerid, mstr, COLOR_RADIO, 10.0, 3000);
    }
    else if(pData[playerid][pFaction] == 2) {
        SendFactionMessage(2, COLOR_RADIO, "* (( %s: %s ))", pData[playerid][pName], text);
		//format(mstr, sizeof(mstr), "[<RADIO>]\n* %s *", text);
		//SetPlayerChatBubble(playerid, mstr, COLOR_RADIO, 10.0, 3000);
    }
    else if(pData[playerid][pFaction] == 3) {
        SendFactionMessage(3, COLOR_RADIO, "* (( %s: %s ))", pData[playerid][pName], text);
		//format(mstr, sizeof(mstr), "[<RADIO>]\n* %s *", text);
		//SetPlayerChatBubble(playerid, mstr, COLOR_RADIO, 10.0, 3000);
    }
    else if(pData[playerid][pFaction] == 4) {
        SendFactionMessage(4, COLOR_RADIO, "* (( %s: %s ))", pData[playerid][pName], text);
		//format(mstr, sizeof(mstr), "[<RADIO>]\n* %s *", text);
		//SetPlayerChatBubble(playerid, mstr, COLOR_RADIO, 10.0, 3000);
    }
    else
            return Error(playerid, "You are'nt in any faction");
    return 1;
}

CMD:r(playerid, params[])
{
    new text[128];
    new mstr[128];

    if(pData[playerid][pFaction] == 0)
        return Error(playerid, "You must in faction member to use this command");
            
    if(sscanf(params,"s[128]",text))
        return SyntaxMsg(playerid, "/r [faction radio] [text]");

    if(strval(text) > 128)
        return Error(playerid,"Text too long.");

    if(pData[playerid][pFaction] == 1) {
        SendFactionMessage(1, COLOR_RADIO, "* (( %s: %s ))", pData[playerid][pName], text);
		format(mstr, sizeof(mstr), "[RADIO]");
		SetPlayerChatBubble(playerid, mstr, COLOR_RADIO, 10.0, 3000);
    }
    else if(pData[playerid][pFaction] == 2) {
        SendFactionMessage(2, COLOR_RADIO, "* (( %s: %s ))", pData[playerid][pName], text);
		format(mstr, sizeof(mstr), "[RADIO]", text);
		SetPlayerChatBubble(playerid, mstr, COLOR_RADIO, 10.0, 3000);
    }
    else if(pData[playerid][pFaction] == 3) {
        SendFactionMessage(3, COLOR_RADIO, "* (( %s: %s ))", pData[playerid][pName], text);
		format(mstr, sizeof(mstr), "[RADIO]", text);
		SetPlayerChatBubble(playerid, mstr, COLOR_RADIO, 10.0, 3000);
    }
    else if(pData[playerid][pFaction] == 4) {
        SendFactionMessage(4, COLOR_RADIO, "* (( %s: %s ))", pData[playerid][pName], text);
		format(mstr, sizeof(mstr), "[RADIO]", text);
		SetPlayerChatBubble(playerid, mstr, COLOR_RADIO, 10.0, 3000);
    }
    else
            return Error(playerid, "You are'nt in any faction");
    return 1;
}

CMD:m(playerid, params[])
{
	new facname[16];
	if(pData[playerid][pFaction] <= 0)
		return Error(playerid, "You are not faction!");
		
	if(isnull(params)) return SyntaxMsg(playerid, "/m(egaphone) [text]");
	
	if(pData[playerid][pFaction] == 1)
	{
		facname = "SAPD";
	}
	else if(pData[playerid][pFaction] == 2)
	{
		facname = "SAGS";
	}
	else if(pData[playerid][pFaction] == 3)
	{
		facname = "SAMD";
	}
	else if(pData[playerid][pFaction] == 4)
	{
		facname = "SANA";
	}
	else
	{
		facname ="Unknown";
	}
	if(strlen(params) > 64) {
        SendNearbyMessage(playerid, 60.0, COLOR_YELLOW, "[%s Megaphone] %s says: %.64s", facname, ReturnName(playerid), params);
        SendNearbyMessage(playerid, 60.0, COLOR_YELLOW, "...%s", params[64]);
    }
    else {
        SendNearbyMessage(playerid, 60.0, COLOR_YELLOW, "[%s Megaphone] %s says: %s", facname, ReturnName(playerid), params);
    }
	return 1;
}

CMD:gov(playerid, params[])
{
	if(pData[playerid][pFaction] <= 0)
		return ErrorMsg(playerid, "Anda tidak tergabung dalam organisasi!");
 	if(isnull(params))
        return SyntaxMsg(playerid, "/gov [teks]");
	if(pData[playerid][pFaction] == 1)
	{
		new lstr[1024];
		format(lstr, sizeof(lstr), "GW Police Department || %s: {ffffff}%s", pData[playerid][pName], params);
		SendClientMessageToAll(COLOR_BLUE, lstr);
	}
	else if(pData[playerid][pFaction] == 2)
	{
		new lstr[1024];
		format(lstr, sizeof(lstr), "GW Government || %s: {ffffff}%s", pData[playerid][pName], params);
		SendClientMessageToAll(COLOR_LBLUE, lstr);
	}
	else if(pData[playerid][pFaction] == 3)
	{
		new lstr[1024];
		format(lstr, sizeof(lstr), "GW Medical Department || %s: {ffffff}%s", pData[playerid][pName], params);
		SendClientMessageToAll(COLOR_PINK2, lstr);
	}
	else if(pData[playerid][pFaction] == 4)
	{
		new lstr[1024];
		format(lstr, sizeof(lstr), "GW News Agency || %s: {ffffff}%s", pData[playerid][pName], params);
		SendClientMessageToAll(COLOR_ORANGE2, lstr);
	}
	else if(pData[playerid][pFaction] == 5)
	{
		new lstr[1024];
		format(lstr, sizeof(lstr), "GW Food Vendors || %s: {ffffff}%s", pData[playerid][pName], params);
		SendClientMessageToAll(COLOR_ORANGE2, lstr);
	}
	else if(pData[playerid][pFaction] == 6)
	{
		new lstr[1024];
		format(lstr, sizeof(lstr), "GwJEK || %s: {ffffff}%s", pData[playerid][pName], params);
		SendClientMessageToAll(COLOR_GREEN, lstr);
	}
	else if(pData[playerid][pFaction] == 7)
	{
		new lstr[1024];
		format(lstr, sizeof(lstr), "Greenwich Mechanic || %s: {ffffff}%s", pData[playerid][pName], params);
		SendClientMessageToAll(COLOR_LIME, lstr);
	}
	return 1;
}

CMD:setrank(playerid, params[])
{
	new rank, otherid;
	if(pData[playerid][pFactionLead] == 0)
		return Error(playerid, "You must faction leader!");

	if(pData[playerid][pFactionRank] < 12)
		return Error(playerid, "You must faction level 12 - 13!");
		
	if(sscanf(params, "ud", otherid, rank))
        return SyntaxMsg(playerid, "/setrank [playerid/PartOfName] [rank 1-12]");
		
	if(otherid == INVALID_PLAYER_ID)
		return Error(playerid, "Invalid ID.");
	
	if(otherid == playerid)
		return Error(playerid, "Invalid ID.");
	
	if(pData[otherid][pFaction] != pData[playerid][pFaction])
		return Error(playerid, "This player is not in your devision!");
	
	if(rank < 1 || rank > 13)
		return Error(playerid, "rank must 1 - 12 only");
	
	pData[otherid][pFactionRank] = rank;
	Servers(playerid, "You has set %s faction rank to level %d", pData[otherid][pName], rank);
	Servers(otherid, "%s has set your faction rank to level %d", pData[playerid][pName], rank);
	new str[150];
	format(str,sizeof(str),"[FACTION]: %s menyetel fraksi %s ke rank!", GetRPName(playerid), GetRPName(otherid), rank);
	LogServer("Faction", str);
	return 1;
}

CMD:uninvite(playerid, params[])
{
	if(pData[playerid][pFaction] <= 0)
		return Error(playerid, "You are not faction!");
		
	if(pData[playerid][pFactionRank] < 12)
		return Error(playerid, "You must faction level 12 - 13!");
	
	if(!pData[playerid][pOnDuty])
        return Error(playerid, "You must on duty!.");
	new otherid;
    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/uninvite [playerid/PartOfName]");
		
	if(!IsPlayerConnected(otherid))
		return Error(playerid, "Invalid ID.");
	
	if(otherid == playerid)
		return Error(playerid, "Invalid ID.");
	
	if(pData[otherid][pFactionRank] > pData[playerid][pFactionRank])
		return Error(playerid, "You cant kick him.");
		
	pData[otherid][pFactionRank] = 0;
	pData[otherid][pFaction] = 0;
	Servers(playerid, "Anda telah mengeluarkan %s dari faction.", pData[otherid][pName]);
	Servers(otherid, "%s telah mengkick anda dari faction.", pData[playerid][pName]);
	new str[150];
	format(str,sizeof(str),"[FACTION]: %s mengeluarkan %s dari fraksi!", GetRPName(playerid), GetRPName(otherid));
	LogServer("Faction", str);
	return 1;
}

CMD:invite(playerid, params[])
{
	if(pData[playerid][pFaction] <= 0)
		return Error(playerid, "You are not faction!");
		
	if(pData[playerid][pFactionRank] < 12)
		return Error(playerid, "You must faction level 12 - 13!");
	
	if(!pData[playerid][pOnDuty])
        return Error(playerid, "You must on duty!.");
	new otherid;
    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/invite [playerid/PartOfName]");
		
	if(!IsPlayerConnected(otherid))
		return Error(playerid, "Invalid ID.");
	
	if(otherid == playerid)
		return Error(playerid, "Invalid ID.");
	
	if(!NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "You must be near this player.");
	
	if(pData[otherid][pFamily] != -1)
		return Error(playerid, "Player tersebut sudah bergabung family");
		
	if(pData[otherid][pFaction] != 0)
		return Error(playerid, "Player tersebut sudah bergabung faction!");
		
	pData[otherid][pFacInvite] = pData[playerid][pFaction];
	pData[otherid][pFacOffer] = playerid;
	Servers(playerid, "Anda telah menginvite %s untuk menjadi faction.", pData[otherid][pName]);
	Servers(otherid, "%s telah menginvite anda untuk menjadi faction. Type: /accept faction or /deny faction!", pData[playerid][pName]);
	new str[150];
	format(str,sizeof(str),"[FACTION]: %s mengundang %s menjadi fraksi!", GetRPName(playerid), GetRPName(otherid));
	LogServer("Faction", str);
	return 1;
}

//SAPD Commands
CMD:sapdonline(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu harus menjadi police officer.");
	if(pData[playerid][pFactionRank] < 1)
		return Error(playerid, "Kamu harus memiliki peringkat tertinggi!");
		
	new duty[16], lstr[1024];
	format(lstr, sizeof(lstr), "Name\tRank\tStatus\tDuty Time\n");
	foreach(new i: Player)
	{
		if(pData[i][pFaction] == 1)
		{
			switch(pData[i][pOnDuty])
			{
				case 0:
				{
					duty = "Off Duty";
				}
				case 1:
				{
					duty = ""BLUE_E"On Duty";
				}
			}
			format(lstr, sizeof(lstr), "%s%s(%d)\t%s(%d)\t%s\t%d detik", lstr, pData[i][pName], i, GetFactionRank(i), pData[i][pFactionRank], duty, pData[i][pOnDutyTime]);
			format(lstr, sizeof(lstr), "%s\n", lstr);
		}
	}
	format(lstr, sizeof(lstr), "%s\n", lstr);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "SAPD Online", lstr, "Close", "");
	return 1;
}

CMD:flare(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu harus menjadi police officer.");
		
    new Float:x, Float:y, Float:z, Float:a;
    GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);
	
	if(IsValidDynamicObject(pData[playerid][pFlare]))
		DestroyDynamicObject(pData[playerid][pFlare]);
		
	pData[playerid][pFlare] = CreateDynamicObject(18728, x, y, z-2.8, 0, 0, a-90);
	Info(playerid, "Flare: request backup is actived! /destroyflare to delete flare.");
	SendFactionMessage(1, COLOR_RADIO, "[FLARE] "WHITE_E"Officer %s has request a backup in near (%s).", ReturnName(playerid), GetLocation(x, y, z));
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s deployed a flare on the ground.", ReturnName(playerid));
    return 1;
}

CMD:destroyflare(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu harus menjadi police officer.");
		
	if(IsValidDynamicObject(pData[playerid][pFlare]))
		DestroyDynamicObject(pData[playerid][pFlare]);
	Info(playerid, "Your flare is deleted.");
	return 1;
}

alias:detain("undetain")
CMD:detain(playerid, params[])
{
    new vehicleid = GetNearestVehicleToPlayer(playerid, 3.0, false), otherid;

    if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu harus menjadi police officer.");
	
    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/detain [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "That player is disconnected.");

    if(otherid == playerid)
        return Error(playerid, "You cannot detained yourself.");

    if(!NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "You must be near this player.");

    if(!pData[otherid][pCuffed])
        return Error(playerid, "The player is not cuffed at the moment.");

    if(vehicleid == INVALID_VEHICLE_ID)
        return Error(playerid, "You are not near any vehicle.");

    if(GetVehicleMaxSeats(vehicleid) < 2)
        return Error(playerid, "You can't detain that player in this vehicle.");

    if(IsPlayerInVehicle(otherid, vehicleid))
    {
        TogglePlayerControllable(otherid, 1);

        RemoveFromVehicle(otherid);
        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s opens the door and pulls %s out the vehicle.", ReturnName(playerid), ReturnName(otherid));
    }
    else
    {
        new seatid = GetAvailableSeat(vehicleid, 2);

        if(seatid == -1)
            return Error(playerid, "There are no more seats remaining.");

        new
            string[64];

        format(string, sizeof(string), "You've been ~r~detained~w~ by %s.", ReturnName(playerid));
        TogglePlayerControllable(otherid, 0);

        //StopDragging(otherid);
        PutPlayerInVehicle(otherid, vehicleid, seatid);

        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s opens the door and places %s into the vehicle.", ReturnName(playerid), ReturnName(otherid));
        InfoTD_MSG(otherid, 3500, string);
    }
    return 1;
}

CMD:release(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return ErrorMsg(playerid, "Kamu harus menjadi police officer.");
	
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1546.686035,1349.970825,1510.916015))
		return Error(playerid, "You must be near an arrest point.");

	new otherid;
	if(sscanf(params, "u", otherid))
	{
	    SyntaxMsg(playerid, "/release <ID/Name>");
	    return true;
	}

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player tersebut belum masuk!");
	
	if(otherid == playerid)
		return Error(playerid, "You cant release yourself!");

	if(pData[otherid][pArrest] == 0)
	    return Error(playerid, "The player isn't in arrest!");

	pData[otherid][pArrest] = 0;
	pData[otherid][pArrestTime] = 0;
	SetPlayerInterior(otherid, 0);
	SetPlayerVirtualWorld(otherid, 0);
	SetPlayerPositionEx(otherid, 1526.69, -2027.9445,-98.4950,35.1641, 2000);
	SetPlayerSpecialAction(otherid, SPECIAL_ACTION_NONE);

	SendClientMessageToAllEx(COLOR_PINK2, "PENJARA | %s {ffffff}telah membebaskan pemain %s dari penjara", ReturnName(playerid), ReturnName(otherid));
	new str[150];
	format(str,sizeof(str),"[FACTION]: %s membebaskan %s dari penjara!", GetRPName(playerid), GetRPName(otherid));
	LogServer("Faction", str);
	return true;
}


CMD:arrest(playerid, params[])
{
    static
        denda,
		cellid,
        times,
		otherid;

    if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu harus menjadi police officer.");
		
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, -2020.3353,-186.8508,39.7316))
		return Error(playerid, "You must be near an arrest point.");

    if(sscanf(params, "uddd", otherid, cellid, times, denda))
        return SyntaxMsg(playerid, "/arrest [playerid/PartOfName] [cell id] [minutes] [denda]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "The player is disconnected or not near you.");
		
	/*if(otherid == playerid)
		return Error(playerid, "You cant arrest yourself!");*/

    if(times < 1 || times > 120)
        return Error(playerid, "The specified time can't be below 1 or above 120.");
		
	if(cellid < 1 || cellid > 4)
        return Error(playerid, "The specified cell id can't be below 1 or above 4.");
		
	if(denda < 100 || denda > 20000)
        return Error(playerid, "The specified denda can't be below 100 or above 20,000.");

    /*if(!IsPlayerNearArrest(playerid))
        return Error(playerid, "You must be near an arrest point.");*/

	GivePlayerMoneyEx(otherid, -denda);
    pData[otherid][pArrest] = cellid;
    pData[otherid][pArrestTime] = times * 60;
	
	SetPlayerArrest(otherid, cellid);
    
 	SendClientMessageToAllEx(COLOR_GWRP, "GREENWICH FEDERAL | %s {ffffff}has been put in shell for %d month and pay tickets %s", ReturnName(otherid), times, FormatMoney(denda));
    new str[150];
	format(str,sizeof(str),"[FACTION]: %s mempenjarakan %s selama %d hari dan denda %s!", GetRPName(playerid), GetRPName(otherid), times, FormatMoney(denda));
	LogServer("Faction", str);
	return 1;
}

CMD:tracephone(playerid, params[])
{
	new no;
    if(pData[playerid][pFaction] != 1)
		return ErrorMsg(playerid, "You not SAPD");

	if (!IsPlayerInAnyVehicle(playerid))
	    return ErrorMsg(playerid, "You must be inside a vehicle.");

	if(sscanf(params, "d", no))
        return Usage(playerid, "/tracephone [no phone]");

	foreach(new id : Player)
	{
		if(pData[id][pPhone] == no)
		{
			if(pData[id][pPhoneStatus] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "kamu tidak dapat melacaknya karena Handphone tersangka dalam keadaan mati.");
			new Float:pz[3];
			GetPlayerPos(id, pz[0], pz[1], pz[2]);
			SetPlayerRaceCheckpoint(playerid, 2, pz[0], pz[1], pz[2], pz[0], pz[1], pz[2], 3);
			SendClientMessageEx(playerid, COLOR_ARWIN, "TRACE: "YELLOW_E"The target marker is on your radar.");
		}
	}
	return 1;
}

/*CMD:su(playerid, params[])
{
	new crime[64];
	if(sscanf(params, "us[64]", otherid, crime)) return SyntaxMsg(playerid, "(/su)spect [playerid] [crime discription]");

	if (pData[playerid][pFaction] == 1 || pData[playerid][pFaction] == 2)
	{
		if(IsPlayerConnected(otherid))
		{
			if(otherid != INVALID_PLAYER_ID)
			{
				if(otherid == playerid)
				{
					Error(playerid, COLOR_GREY, "Kamu tidak dapat mensuspek dirimu!");
					return 1;
				}
				if(pData[playerid][pFaction] > 0)
				{
					Error(playerid, COLOR_GREY, "Tidak dapat mensuspek fraksi!");
					return 1;
				}
				WantedPoints[otherid] += 1;
				pData[playerid][pSuspect] = 1;
				SetPlayerCriminal(otherid,playerid, crime);
				return 1;
			}
		}
		else
		{
			Error(playerid, "Invalid player specified.");
			return 1;
		}
	}
	else
	{
		Error(playerid, "   You are not a Cop/Gov!");
	}
	return 1;
}*/

CMD:takegun(playerid, params[])
{
   	if(pData[playerid][pFaction] != 1)
		return Error(playerid, "Kamu harus menjadi sapd officer.");
			
	new otherid;
    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/takegun [playerid/PartOfName]");

    if(!IsPlayerConnected(otherid))
        return ErrorMsg(playerid, "Player belum masuk!");

    ResetPlayerWeaponsEx(otherid);
    Servers(playerid, "You have reset %s's weapons.", pData[otherid][pName]);
    Servers(otherid, "sapd %s have reset your weapons.", pData[playerid][pName]);
    return 1;
}

CMD:tracksinyal(playerid, params[])
{
	if(pData[playerid][pFaction] != 3)
		return Error(playerid, "Kamu harus menjadi samd");

	new otherid;
	if(sscanf(params, "u", otherid))
	{
	    SyntaxMsg(playerid, "/tracksinyal <ID/Name>");
	    return true;
	}

	if(pData[playerid][pSuspectTimer] > 1)
		return Error(playerid, "Anad harus menunggu %d detik untuk melanjutkan GetLoc",pData[playerid][pSuspectTimer]);

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player tersebut belum masuk!");

	if(otherid == playerid)
		return Error(playerid, "You cant getloc yourself!");


    new zone[MAX_ZONE_NAME];
	GetPlayer3DZone(otherid, zone, sizeof(zone));
	new Float:sX, Float:sY, Float:sZ;
	GetPlayerPos(otherid, sX, sY, sZ);
	SetPlayerCheckpoint(playerid, sX, sY, sZ, 5.0);
	pData[playerid][pSuspectTimer] = 150;
	Info(playerid, "Target Nama : %s", pData[otherid][pName]);
	Info(playerid, "Lokasi : %s", zone);
	Info(playerid, "Nomer Telepon : %d", pData[otherid][pPhone]);
	return 1;
}

CMD:tilang(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
			return Error(playerid, "Kamu harus menjadi sapd officer.");
	
	new vehid, ticket;
	if(sscanf(params, "dd", vehid, ticket))
		return SyntaxMsg(playerid, "/tilang [vehid] [ammount] | /checkveh - for find vehid");
	
	if(vehid == INVALID_VEHICLE_ID || !IsValidVehicle(vehid))
		return Error(playerid, "Invalid id");
	
	if(ticket < 0 || ticket > 500)
		return Error(playerid, "Ammount max of ticket is $1 - $500!");
	
	new nearid = GetNearestVehicleToPlayer(playerid, 5.0, false);
	
	foreach(new ii : PVehicles)
	{
		if(vehid == pvData[ii][cVeh])
		{
			if(vehid == nearid)
			{
				if(pvData[ii][cTicket] >= 2000)
					return Error(playerid, "Kendaraan ini sudah mempunyai terlalu banyak ticket!");
					
				pvData[ii][cTicket] += ticket;
				new lstr[500];
				format(lstr, sizeof(lstr), "Anda telah menilang kendaraan %s(id: %d) dengan denda sejumlah "RED_E"%s", GetVehicleName(vehid), vehid, FormatMoney(ticket));
				SuccesMsg(playerid, lstr);
				new str[150];
				format(str,sizeof(str),"[FACTION]: %s menilang kendaraan %s(id: %d) dengan denda %s!", GetRPName(playerid), GetVehicleName(vehid), vehid, FormatMoney(ticket));
				LogServer("Faction", str);
				return 1;
			}
			else return Error(playerid, "Anda harus berada dekat dengan kendaraan tersebut!");
		}
	}
	return 1;
}

CMD:checkveh(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
		if(pData[playerid][pAdmin] < 1)
			return Error(playerid, "Kamu harus menjadi sapd officer.");
		
	static carid = -1;
	new vehicleid = GetNearestVehicleToPlayer(playerid, 3.0, false);

	if(vehicleid == INVALID_VEHICLE_ID || !IsValidVehicle(vehicleid))
		return Error(playerid, "You not in near any vehicles.");
	
	if((carid = Vehicle_Nearest(playerid)) != -1)
	{
		new query[128];
		mysql_format(g_SQL, query, sizeof(query), "SELECT username FROM players WHERE reg_id='%d'", pvData[carid][cOwner]);
		mysql_query(g_SQL, query);
		new rows = cache_num_rows();
		if(rows) 
		{
			new owner[32];
			cache_get_value_index(0, 0, owner);
			
			if(strcmp(pvData[carid][cPlate], "NoHave"))
			{
				Info(playerid, "ID: %d | Model: %s | Owner: %s | Plate: %s | Plate Time: %s", vehicleid, GetVehicleName(vehicleid), owner, pvData[carid][cPlate], ReturnTimelapse(gettime(), pvData[carid][cPlateTime]));
			}
			else
			{
				Info(playerid, "ID: %d | Model: %s | Owner: %s | Plate: None | Plate Time: None", vehicleid, GetVehicleName(vehicleid), owner);
			}
		}
		else
		{
			Error(playerid, "This vehicle no owned found!");
			return 1;
		}
	}
	else
	{
		Error(playerid, "You are not in near owned private vehicle.");
		return 1;
	}	
	return 1;
}


CMD:takemarijuana(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu harus menjadi sapd officer.");
	if(pData[playerid][pFactionRank] < 1)
		return Error(playerid, "You must be 1 rank level!");

	new otherid;
	if(sscanf(params, "u", otherid))
	{
	    SyntaxMsg(playerid, "/takemarijuana <ID/Name> | Melenyapkan Marijuana");
	    return true;
	}

	if(!IsPlayerConnected(otherid) || otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player tersebut belum masuk!");

 	if(!NearPlayer(playerid, otherid, 4.0))
        return Error(playerid, "The specified player is disconnected or not near you.");
		
	pData[otherid][pMarijuana] = 0;
	Info(playerid, "Anda telah mengambil semua marijuana milik %s.", ReturnName(otherid));
	Info(otherid, "Officer %s telah mengambil semua marijuana milik anda", ReturnName(playerid));
	return 1;
}

CMD:givebizlic(playerid, params[])
{

    if(pData[playerid][pFaction] != 2)
        return Error(playerid, "You must be part of a Goverments.");
	new to_player;
    if(sscanf(params, "u", to_player))
        return SyntaxMsg(playerid, "/givebizlic [playerid/PartOfName]");

    if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(pData[to_player][pBizLic] != 0) return Error(playerid, "Orang ini sudah mempunyai Licenses Business");
	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "Licenses Business %s", pData[to_player][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 14 hari!", pData[to_player][pName], pData[to_player][pAge], sext);
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	Info(to_player, "Anda mendapatkan surat	License Business dari departemen Goverments");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memberikan Surat Licenses Business Kepada %s", ReturnName(playerid), ReturnName(to_player));
	pData[to_player][pBizLic] = 1;
	pData[to_player][pBizLicTime] = gettime() +  (15 * 86400);
	Info(playerid, "Anda Telah Memberikan Surat Licenses Business kepada %s", ReturnName(to_player));

    return 1;
}

CMD:takedl(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu harus menjadi sapd officer.");
	if(pData[playerid][pFactionRank] < 2)
		return Error(playerid, "You must be 2 rank level!");

	new otherid;
	if(sscanf(params, "u", otherid))
	{
	    SyntaxMsg(playerid, "/takedl <ID/Name> | Tilang Driving License(SIM)");
	    return true;
	}

	if(!IsPlayerConnected(otherid) || otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player tersebut belum masuk!");

 	if(!NearPlayer(playerid, otherid, 4.0))
        return Error(playerid, "The specified player is disconnected or not near you.");
		
	pData[otherid][pDriveLic] = 0;
	pData[otherid][pDriveLicTime] = 0;
	Info(playerid, "Anda telah menilang Driving License milik %s.", ReturnName(otherid));
	Info(otherid, "Officer %s telah menilang Driving License milik anda", ReturnName(playerid));
	return 1;
}

//SAGS Commands
CMD:sagsonline(playerid, params[])
{
	if(pData[playerid][pFaction] != 2)
        return Error(playerid, "Kamu harus menjadi sags officer.");
	if(pData[playerid][pFactionRank] < 1)
		return Error(playerid, "Kamu harus memiliki peringkat tertinggi!");
		
	new duty[16], lstr[1024];
	format(lstr, sizeof(lstr), "Name\tRank\tStatus\tDuty Time\n");
	foreach(new i: Player)
	{
		if(pData[i][pFaction] == 2)
		{
			switch(pData[i][pOnDuty])
			{
				case 0:
				{
					duty = "Off Duty";
				}
				case 1:
				{
					duty = ""BLUE_E"On Duty";
				}
			}
			format(lstr, sizeof(lstr), "%s%s(%d)\t%s(%d)\t%s\t%d detik", lstr, pData[i][pName], i, GetFactionRank(i), pData[i][pFactionRank], duty, pData[i][pOnDutyTime]);
			format(lstr, sizeof(lstr), "%s\n", lstr);
		}
	}
	format(lstr, sizeof(lstr), "%s\n", lstr);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "SAGS Online", lstr, "Close", "");
	return 1;
}

CMD:checkcitymoney(playerid, params)
{
	if(pData[playerid][pFaction] != 2)
        return Error(playerid, "Kamu harus menjadi sags officer.");
	if(pData[playerid][pFactionRank] < 12)
		return Error(playerid, "Kamu harus memiliki peringkat tertinggi!");

	new lstr[300];
	format(lstr, sizeof(lstr), "City Money: {3BBD44}%s", FormatMoney(ServerMoney));
	ShowPlayerDialog(playerid, DIALOG_SERVERMONEY, DIALOG_STYLE_MSGBOX, "Great City Money", lstr, "Manage", "Close");
	return 1;
}

//SAMD Commands
CMD:loadinjured(playerid, params[])
{
    static
        seatid,
		otherid;

    if(pData[playerid][pFaction] != 3)
        return Error(playerid, "You must be part of a medical faction.");

    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/loadinjured [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 10.0))
        return Error(playerid, "Player tersebut tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "You can't load yourself into an ambulance.");

    if(!pData[otherid][pInjured])
        return Error(playerid, "That player is not injured.");
	
	if(!IsPlayerInAnyVehicle(playerid))
	{
	    Error(playerid, "You must be in a Ambulance to load patient!");
	    return true;
	}
		
	new i = GetPlayerVehicleID(playerid);
    if(GetVehicleModel(i) == 416)
    {
        seatid = GetAvailableSeat(i, 2);

        if(seatid == -1)
            return Error(playerid, "There is no room for the patient.");

        ClearAnimations(otherid);
        pData[otherid][pInjured] = 2;

        PutPlayerInVehicle(otherid, i, seatid);
        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s opens up the ambulance and loads %s on the stretcher.", ReturnName(playerid), ReturnName(otherid));

        TogglePlayerControllable(otherid, 0);
        SetPlayerHealth(otherid, 100.0);
        Info(otherid, "You're injured ~r~now you're on ambulance.");
        return 1;
    }
    else Error(playerid, "You must be in an ambulance.");
    return 1;
}

CMD:dropinjured(playerid, params[])
{

    if(pData[playerid][pFaction] != 3)
        return Error(playerid, "You must be part of a medical faction.");
	new otherid;
    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/dropinjured [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !IsPlayerInVehicle(playerid, GetPlayerVehicleID(playerid)))
        return Error(playerid, "Player tersebut tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "You can't deliver yourself to the hospital.");

    if(pData[otherid][pInjured] != 2)
        return Error(playerid, "That player is not injured.");

    if(IsPlayerInRangeOfPoint(playerid, 5.0, 1183.31, -1323.53, 13.57))
    {
		RemovePlayerFromVehicle(otherid);
		pData[otherid][pHospital] = 1;
		pData[otherid][pHospitalTime] = 0;
		pData[otherid][pInjured] = 1;
		ResetPlayerWeaponsEx(otherid);
        Info(playerid, "You have delivered %s to the hospital.", ReturnName(otherid));
        Info(otherid, "You have recovered at the nearest hospital by officer %s.", ReturnName(playerid));
    }
    else Error(playerid, "You must be near a hospital deliver location.");
    return 1;
}

CMD:samdonline(playerid, params[])
{
	if(pData[playerid][pFaction] != 3)
        return Error(playerid, "Kamu harus menjadi samd officer.");
	if(pData[playerid][pFactionRank] < 1)
		return Error(playerid, "Kamu harus memiliki peringkat tertinggi!");
		
	new duty[16], lstr[1024];
	format(lstr, sizeof(lstr), "Name\tRank\tStatus\tDuty Time\n");
	foreach(new i: Player)
	{
		if(pData[i][pFaction] == 3)
		{
			switch(pData[i][pOnDuty])
			{
				case 0:
				{
					duty = "Off Duty";
				}
				case 1:
				{
					duty = ""BLUE_E"On Duty";
				}
			}
			format(lstr, sizeof(lstr), "%s%s(%d)\t%s(%d)\t%s\t%d detik", lstr, pData[i][pName], i, GetFactionRank(i), pData[i][pFactionRank], duty, pData[i][pOnDutyTime]);
			format(lstr, sizeof(lstr), "%s\n", lstr);
		}
	}
	format(lstr, sizeof(lstr), "%s\n", lstr);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "SAMD Online", lstr, "Close", "");
	return 1;
}

CMD:ems(playerid, params[])
{
	if(pData[playerid][pFaction] != 3)
        return Error(playerid, "Kamu harus menjadi samd officer.");
	
	foreach(new ii : Player)
	{
		if(pData[ii][pInjured])
		{
			SendClientMessageEx(playerid, COLOR_PINK2, "EMS Player: "WHITE_E"%s(id: %d)", ReturnName(ii), ii);
		}
	}
	Info(playerid, "/findems [id] to search injured player!");
	return 1;
}

CMD:findems(playerid, params[])
{
	if(pData[playerid][pFaction] != 3)
        return Error(playerid, "Kamu harus menjadi samd officer.");
		
	new otherid;
	if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/findems [playerid/PartOfName]");
	
	if(!IsPlayerConnected(otherid)) return Error(playerid, "Player is not connected");
	
	if(otherid == playerid)
        return Error(playerid, "You can't find yourself.");
	
	if(!pData[otherid][pInjured]) return Error(playerid, "You can't find a player that's not injured.");
	
	new Float:x, Float:y, Float:z;
	GetPlayerPos(otherid, x, y, z);
	SetPlayerCheckpoint(playerid, x, y, x, 4.0);
	pData[playerid][pFindEms] = otherid;
	Info(otherid, "Medical Department %s on the way to your location. keep stay!", ReturnName(playerid));
	return 1;
}
CMD:rescue(playerid, params[])
{
	if(pData[playerid][pFaction] != 3)
        return Error(playerid, "Kamu harus menjadi samd officer.");
	
	new otherid;
	if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/rescue [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Player tersebut tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "You can't rescue yourself.");

    if(!pData[otherid][pInjured])
        return Error(playerid, "That player is not injured.");
	

	SetPlayerHealthEx(otherid, 50.0);
    pData[otherid][pInjured] = 0;
	pData[otherid][pHospital] = 0;
	pData[otherid][pSick] = 0;
	HideTdDeath(otherid);
    ClearAnimations(otherid);
	ApplyAnimation(otherid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
	
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s has rescuered %s with medkit tools.", ReturnName(playerid), ReturnName(otherid));
    Info(otherid, "Officer %s has rescue your character.", ReturnName(playerid));
	return 1;
}

CMD:sellobat(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1256.64, -1284.35, 1061.14)) return Error(playerid, "You're not near in sell places.");

	if(pData[playerid][pObat] < 1)
		return Error(playerid, "Anda tidak memiliki Obat");

	ObatMyr += 1;
	pData[playerid][pObat] -= 1;
	Servers(playerid, "Anda berhasil menjual 1 Obat anda!");
	Server_Save();
	return 1;
}

CMD:mix(playerid, params[])
{
	if(pData[playerid][pFaction] != 3)
        return Error(playerid, "Kamu harus menjadi samd officer.");

    if(IsPlayerInRangeOfPoint(playerid, 2.0, 1264.14, -1316.30, 1061.14))
    {
    	if(pData[playerid][pMedicine] < 4)
    		return Error(playerid, "Anda harus memiliki 4 Medicine & 1 Marijuana");

    	if(pData[playerid][pMarijuana] < 1)
    		return Error(playerid, "Anda harus memiliki 4 Medicine & 1 Marijuana");

    	TogglePlayerControllable(playerid, 0);
    	Info(playerid, "Anda sedang memproduksi obat!");
    	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
		pData[playerid][pProductingStatus] = 1;
    	pData[playerid][pProducting] = SetTimerEx("CreateObat", 1000, true, "id", playerid, 1);
    	PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Meracik");
    	PlayerTextDrawShow(playerid, ActiveTD[playerid]);
    	ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
	}
	return 1;
}

CMD:salve(playerid, params[])
{
	new Float:health;
	health = GetPlayerHealth(playerid, health);
	if(pData[playerid][pFaction] != 3)
        return Error(playerid, "Kamu harus menjadi medical officer.");
	
	new otherid;
	if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/salve [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Player tersebut tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "Kamu tidak bisa mensalve dirimu sendiri.");

    if(pData[otherid][pSick] == 0)
        return Error(playerid, "Player itu tidak sakit.");

	SetPlayerHealth(playerid, health+50);
	pData[otherid][pHunger] += 20;
	pData[otherid][pEnergy] += 20;
	pData[otherid][pSick] = 0;
	pData[otherid][pSickTime] = 0;
    ClearAnimations(otherid);
	ApplyAnimation(otherid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
	SetPlayerDrunkLevel(otherid, 0);
	
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s has given medicine to %s with the right hand.", ReturnName(playerid), ReturnName(otherid));
    Info(otherid, "Officer %s has resalve your sick character.", ReturnName(playerid));
	return 1;
}

CMD:healbone(playerid, params[])
{
	new Float:health;
	health = GetPlayerHealth(playerid, health);
	if(pData[playerid][pFaction] != 3)
        return Error(playerid, "Kamu harus menjadi samd officer.");

	new otherid;
	if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/healbone [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Player tersebut tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "Kamu tidak bisa memperbaiki kesehatan tulang dirimu sendiri.");

	SetPlayerHealth(playerid, health+50);
	pData[otherid][pHead] += 60;
	pData[otherid][pPerut] += 60;
	pData[otherid][pRHand] += 60;
	pData[otherid][pLHand] += 60;
	pData[otherid][pRFoot] += 60;
	pData[otherid][pLFoot] += 60;
	pData[otherid][pSickTime] = 0;
    ClearAnimations(otherid);
	SetPlayerDrunkLevel(otherid, 0);
	
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s has given medicine to %s with the right hand.", ReturnName(playerid), ReturnName(otherid));
    Info(otherid, "Officer %s has resalve your sick character.", ReturnName(playerid));
	return 1;
}

CMD:treatment(playerid, params[])
{
	new otherid;
	if(pData[playerid][pFaction] != 3)
        return Error(playerid, "Kamu harus menjadi samd officer.");
	
	if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/treatment [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Player tersebut tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "Kamu tidak bisa treatment dirimu sendiri.");

   	TogglePlayerControllable(playerid, 0);
	TogglePlayerControllable(otherid, 0);   
   	Info(playerid, "Kamu sedang mentreatment %s!", ReturnName(otherid));
	Info(otherid, "Kamu sedang ditreatment oleh medis, Mohon tenang!");
   	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	pData[playerid][pProductingStatus] = 1;
   	pData[playerid][pProducting] = SetTimerEx("TreatmentPlayer", 1000, true, "iid", playerid, otherid, 1);
   	PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Treatment...");
   	PlayerTextDrawShow(playerid, ActiveTD[playerid]);
   	ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
	return 1;
}

//SANEW Commands
CMD:sanaonline(playerid, params[])
{
	if(pData[playerid][pFaction] != 4)
        return Error(playerid, "Kamu harus menjadi sanew officer.");
	if(pData[playerid][pFactionRank] < 1)
		return Error(playerid, "Kamu harus memiliki peringkat tertinggi!");
		
	new duty[16], lstr[1024];
	format(lstr, sizeof(lstr), "Name\tRank\tStatus\tDuty Time\n");
	foreach(new i: Player)
	{
		if(pData[i][pFaction] == 4)
		{
			switch(pData[i][pOnDuty])
			{
				case 0:
				{
					duty = "Off Duty";
				}
				case 1:
				{
					duty = ""BLUE_E"On Duty";
				}
			}
			format(lstr, sizeof(lstr), "%s%s(%d)\t%s(%d)\t%s\t%d detik", lstr, pData[i][pName], i, GetFactionRank(i), pData[i][pFactionRank], duty, pData[i][pOnDutyTime]);
			format(lstr, sizeof(lstr), "%s\n", lstr);
		}
	}
	format(lstr, sizeof(lstr), "%s\n", lstr);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "SANA Online", lstr, "Close", "");
	return 1;
}

CMD:broadcast(playerid, params[])
{
    if(pData[playerid][pFaction] != 4)
        return Error(playerid, "You must be part of a news faction.");

    //if(!IsSANEWCar(GetPlayerVehicleID(playerid)) || !IsPlayerInRangeOfPoint(playerid, 5, 255.63, 1757.39, 701.09))
    //    return Error(playerid, "You must be inside a news van or chopper or in sanew studio.");

    if(!pData[playerid][pBroadcast])
    {
        pData[playerid][pBroadcast] = true;

        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s has started a news broadcast.", ReturnName(playerid));
        Servers(playerid, "You have started a news broadcast (use \"/bc [broadcast text]\" to broadcast).");
    }
    else
    {
        pData[playerid][pBroadcast] = false;

        foreach (new i : Player) if(pData[i][pNewsGuest] == playerid) 
		{
            pData[i][pNewsGuest] = INVALID_PLAYER_ID;
        }
        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s has stopped a news broadcast.", ReturnName(playerid));
        Servers(playerid, "You have stopped the news broadcast.");
    }
    return 1;
}


CMD:bc(playerid, params[])
{
    if(pData[playerid][pFaction] != 4)
        return Error(playerid, "You must be part of a news faction.");

    if(isnull(params))
        return SyntaxMsg(playerid, "/bc [broadcast text]");

    //if(!IsSANEWCar(GetPlayerVehicleID(playerid)) || !IsPlayerInRangeOfPoint(playerid, 5, 255.63, 1757.39, 701.09))
    //    return Error(playerid, "You must be inside a news van or chopper or in sanew studio.");

    if(!pData[playerid][pBroadcast])
        return Error(playerid, "You must be broadcasting to use this command.");

    if(strlen(params) > 64) {
        foreach (new i : Player) /*if(!pData[i][pDisableBC])*/ {
            SendClientMessageEx(i, COLOR_ORANGE, "[Greenwich NA] Reporter %s: %.64s", ReturnName(playerid), params);
            SendClientMessageEx(i, COLOR_ORANGE, "...%s", params[64]);
        }
    }
    else {
        foreach (new i : Player) /*if(!pData[i][pDisableBC])*/ {
            SendClientMessageEx(i, COLOR_ORANGE, "[Greenwich NA] Reporter %s: %s", ReturnName(playerid), params);
        }
    }
    return 1;
}

CMD:live(playerid, params[])
{
    static
        livechat[128];
        
    if(sscanf(params, "s[128]", livechat))
        return SyntaxMsg(playerid, "/live [live chat]");

    if(pData[playerid][pNewsGuest] == INVALID_PLAYER_ID)
        return Error(playerid, "You're now invite by sanew member to live!");

    /*if(!IsNewsVehicle(GetPlayerVehicleID(playerid)) || !IsPlayerInRangeOfPoint(playerid, 5, 255.63, 1757.39, 701.09))
        return Error(playerid, "You must in news chopper or in studio to live.");*/

    if(pData[pData[playerid][pNewsGuest]][pFaction] == 4)
    {
        foreach (new i : Player) /*if(!pData[i][pDisableBC])*/ {
            SendClientMessageEx(i, COLOR_LIGHTGREEN, "[SANA] Guest %s: %s", ReturnName(playerid), livechat);
        }
    }
    return 1;
}

CMD:inviteguest(playerid, params[])
{
    if(pData[playerid][pFaction] != 4)
        return Error(playerid, "You must be part of a news faction.");
		
	new otherid;
    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/inviteguest [playerid/PartOfName]");

    if(!pData[playerid][pBroadcast])
        return Error(playerid, "You must be broadcasting to use this command.");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Player tersebut tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "You can't add yourself as a guest.");

    if(pData[otherid][pNewsGuest] == playerid)
        return Error(playerid, "That player is already a guest of your broadcast.");

    if(pData[otherid][pNewsGuest] != INVALID_PLAYER_ID)
        return Error(playerid, "That player is already a guest of another broadcast.");

    pData[otherid][pNewsGuest] = playerid;

    Info(playerid, "You have added %s as a broadcast guest.", ReturnName(otherid));
    Info(otherid, "%s has added you as a broadcast guest ((/live to start broadcast)).", ReturnName(otherid));
    return 1;
}

CMD:removeguest(playerid, params[])
{

    if(pData[playerid][pFaction] != 4)
        return Error(playerid, "You must be part of a news faction.");
	new otherid;
    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/removeguest [playerid/PartOfName]");

    if(!pData[playerid][pBroadcast])
        return Error(playerid, "You must be broadcasting to use this command.");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "Player tersebut tidak berada didekat mu.");

    if(otherid == playerid)
        return Error(playerid, "You can't remove yourself as a guest.");

    if(pData[otherid][pNewsGuest] != playerid)
        return Error(playerid, "That player is not a guest of your broadcast.");

    pData[otherid][pNewsGuest] = INVALID_PLAYER_ID;

    Info(playerid, "You have removed %s from your broadcast.", ReturnName(otherid));
    Info(otherid, "%s has removed you from their broadcast.", ReturnName(otherid));
    return 1;
}

forward CreateObat(playerid);
public CreateObat(playerid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(pData[playerid][pProductingStatus] != 1) return 0;

	if(pData[playerid][pActivityTime] >= 100)
	{
		new bonus = RandomEx(80,100);
		GivePlayerMoneyEx(playerid, bonus);
		TogglePlayerControllable(playerid, 1);
		InfoTD_MSG(playerid, 8000, "Myricous Created!");
		KillTimer(pData[playerid][pProducting]);
		pData[playerid][pProductingStatus] = 0;
		pData[playerid][pActivityTime] = 0;
		pData[playerid][pObat] += 1;
		pData[playerid][pMedicine] -= 4;
		pData[playerid][pMarijuana] -= 1;
		HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
		PlayerTextDrawHide(playerid, ActiveTD[playerid]);
		pData[playerid][pEnergy] -= 3;
		ClearAnimations(playerid);
	}
	else if(pData[playerid][pActivityTime] < 100)
	{
		pData[playerid][pActivityTime] += 5;
		SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	}
	return 1;
}

forward DutyHour(playerid);
public DutyHour(playerid)
{
	if(pData[playerid][pOnDuty] < 1)
		return KillTimer(DutyTimer);

	pData[playerid][pDutyHour] += 1;
	if(pData[playerid][pDutyHour] == 3600)
	{
		if(pData[playerid][pFaction] == 1)
		{
			AddPlayerSalary(playerid, "Duty(SAPD)", 50);
			pData[playerid][pDutyHour] = 0;
			Servers(playerid, "Anda telah Duty selama 1 Jam dan Anda mendapatkan Pending Salary anda");
		}
		else if(pData[playerid][pFaction] == 2)
		{
			AddPlayerSalary(playerid, "Duty(SAGS)", 50);
			pData[playerid][pDutyHour] = 0;
			Servers(playerid, "Anda telah Duty selama 1 Jam dan Anda mendapatkan Pending Salary anda");
		}
		else if(pData[playerid][pFaction] == 3)
		{
			AddPlayerSalary(playerid, "Duty(SAMD)", 50);
			pData[playerid][pDutyHour] = 0;
			Servers(playerid, "Anda telah Duty selama 1 Jam dan Anda mendapatkan Pending Salary anda");
		}
		else if(pData[playerid][pFaction] == 4)
		{
			AddPlayerSalary(playerid, "Duty(SANEWS)", 50);
			pData[playerid][pDutyHour] = 0;
			Servers(playerid, "Anda telah Duty selama 1 Jam dan Anda mendapatkan Pending Salary anda");
		}
	}
	return 1;
}

forward TreatmentPlayer(playerid, otherid);
public TreatmentPlayer(playerid, otherid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(pData[playerid][pProductingStatus] != 1) return 0;

	if(pData[playerid][pActivityTime] >= 100)
	{
		TogglePlayerControllable(playerid, 1);
		TogglePlayerControllable(otherid, 1);
		SetPlayerHealthEx(otherid, 100);
		InfoTD_MSG(playerid, 8000, "Treatment Sucess!");
		InfoTD_MSG(otherid, 8000, "Treatment Sucess!");
		KillTimer(pData[playerid][pProducting]);
		pData[playerid][pProductingStatus] = 0;
		pData[playerid][pActivityTime] = 0;
		HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
		PlayerTextDrawHide(playerid, ActiveTD[playerid]);
		pData[playerid][pEnergy] -= 3;
		ClearAnimations(playerid);
	}
	else if(pData[playerid][pActivityTime] < 100)
	{
		pData[playerid][pActivityTime] += 5;
		SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	}
	return 1;
}
