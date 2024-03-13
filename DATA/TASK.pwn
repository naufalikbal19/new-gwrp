task onlineTimer[1000]()
{	
	//Date and Time Textdraw 
	//Date and Time Textdraw
	// new datestring[64];
	new hours,
	minutes,
	seconds,
	days,
	months,
	years;
	getdate(years, months, days);
 	gettime(hours, minutes, seconds);
	//Phone Time
	//format(datestring, sizeof datestring, "%s%d:%s%d", (hours < 10) ? ("0") : (""), hours, (minutes < 10) ? ("0") : (""), minutes);
	//TextDrawSetString(PhoneTD[13], datestring);
	up_seconds ++;
	if(up_seconds == 60)
	{
	    up_seconds = 0, up_minutes ++;
	    if(up_minutes == 60)
	    {
	        up_minutes = 0, up_hours ++;
	        if(up_hours == 24) up_hours = 0, up_days ++;
			new tstr[128], rand = RandomEx(0, 20);
			if(hours > 18)
			{
				SetWorldTime(0);
				WorldTime = 0;
			}
			else
			{
				SetWorldTime(hours);
				WorldTime = hours;
			}
			SetWeather(rand);
			WorldWeather = rand;

			new dateNow[20], timeNow[20];
			format(dateNow, sizeof(dateNow), "%02i/%02i/%02i", days, months, years);
			format(timeNow, sizeof(timeNow), "%02d:%02d", hours, minutes);

			new DCC_Embed:msgEmbed;
			msgEmbed = DCC_CreateEmbed();
			format(tstr, sizeof tstr, "[:timer:]: Server has been online for %s.", Uptime());
			DCC_AddEmbedField(msgEmbed, "Greenwich Uptime", tstr);
			format(tstr, sizeof tstr, "[:busts_in_silhouette:]: Citizen In City %s/%d.", number_format(Iter_Count(Player)), GetMaxPlayers());
			DCC_AddEmbedField(msgEmbed, "Greenwich Player", tstr);
			format(tstr, sizeof tstr, "[:calendar_spiral:]: Now date in server %s, And now time on the server %s.", dateNow, timeNow);
			DCC_AddEmbedField(msgEmbed, "Greenwich Saat Ini", tstr);
			DCC_SetEmbedColor(msgEmbed, 0x00ff00);
			DCC_SetEmbedFooter(msgEmbed, "Greenwich Server Status || #HijauBersamaGWRP");
			DCC_SendChannelEmbedMessage(g_Discord_Serverstatus, msgEmbed);

			// Sync Server
			mysql_tquery(g_SQL, "OPTIMIZE TABLE `bisnis`,`houses`,`toys`,`vehicle`");
			//SetTimer("changeWeather", 10000, false);
		}
	}
	return 1;
}


ptask PlayerDelay[1000](playerid)
{
	if(pData[playerid][IsLoggedIn] == false) return 0;
	NgecekCiter(playerid);
		//VIP Expired Checking
	if(pData[playerid][pVip] > 0)
	{
		if(pData[playerid][pVipTime] != 0 && pData[playerid][pVipTime] <= gettime())
		{
			Info(playerid, "Maaf, Level VIP player anda sudah habis! sekarang anda adalah player biasa!");
			pData[playerid][pVip] = 0;
			pData[playerid][pVipTime] = 0;
		}
	}
	/*if(pData[playerid][pSkck] > 0)
	{
		if(pData[playerid][pIDCardTime] != 0 && pData[playerid][pIDCardTime] <= gettime())
		{
			Info(playerid, "Masa berlaku Skck anda telah habis, silahkan perpanjang kembali!");
			pData[playerid][pSkck] = 0;
			pData[playerid][pIDCardTime] = 0;
		}
	}*/
		//ID Card Expired Checking
	if(pData[playerid][pIDCard] > 0)
	{
		if(pData[playerid][pIDCardTime] != 0 && pData[playerid][pIDCardTime] <= gettime())
		{
			Info(playerid, "Masa berlaku ID Card anda telah habis, silahkan perpanjang kembali!");
			pData[playerid][pIDCard] = 0;
			pData[playerid][pIDCardTime] = 0;
		}
	}

	if(pData[playerid][pExitJob] != 0 && pData[playerid][pExitJob] <= gettime())
	{
		Info(playerid, "Now you can exit from your current job!");
		pData[playerid][pExitJob] = 0;
	}
	if(pData[playerid][pDriveLic] > 0)
	{
		if(pData[playerid][pDriveLicTime] != 0 && pData[playerid][pDriveLicTime] <= gettime())
		{
			Info(playerid, "Masa berlaku Driving anda telah habis, silahkan perpanjang kembali!");
			pData[playerid][pDriveLic] = 0;
			pData[playerid][pDriveLicTime] = 0;
		}
	}
	if(pData[playerid][pWeaponLic] > 0)
	{
		if(pData[playerid][pWeaponLicTime] != 0 && pData[playerid][pWeaponLicTime] <= gettime())
		{
			Info(playerid, "Masa berlaku License Weapon anda telah habis, silahkan perpanjang kembali!");
			pData[playerid][pWeaponLic] = 0;
			pData[playerid][pWeaponLicTime] = 0;
		}
	}
		//Player JobTime Delay
	if(pData[playerid][pJobTime] > 0)
	{
		pData[playerid][pJobTime]--;
	}
	if(pData[playerid][pSideJobTime] > 0)
	{
		pData[playerid][pSideJobTime]--;
	}
	if(pData[playerid][pBusTime] > 0)
	{
		pData[playerid][pBusTime]--;
	}
	if(pData[playerid][pSparepartTime] > 0)
	{
		pData[playerid][pSparepartTime]--;
	}
	//Twitter Post
	if(pData[playerid][pTwitterPostCooldown] > 0)
	{
		pData[playerid][pTwitterPostCooldown]--;
	}
	//Twitter Changename
	if(pData[playerid][pTwitterNameCooldown] > 0)
	{
		pData[playerid][pTwitterNameCooldown]--;
	}

		// Duty Delay
	if(pData[playerid][pDutyHour] > 0)
	{
		pData[playerid][pDutyHour]--;
	}
		// Rob Delay
	if(pData[playerid][pRobTime] > 0)
	{
		pData[playerid][pRobTime]--;
	}
		// Get Loc timer
	if(pData[playerid][pSuspectTimer] > 0)
	{
		pData[playerid][pSuspectTimer]--;
	}
	if(pData[playerid][pDelayIklan] > 0)
	{
		pData[playerid][pDelayIklan]--;
	}
		//Warn Player Check
	if(pData[playerid][pWarn] >= 20)
	{
		new ban_time = gettime() + (5 * 86400), query[512], PlayerIP[16], giveplayer[24];
		GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
		GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
		pData[playerid][pWarn] = 0;
			//SetPlayerPosition(playerid, 227.46, 110.0, 999.02, 360.0000, 10);
		BanPlayerMSG(playerid, playerid, "20 Total Warning", true);
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Player %s(%d) telah otomatis dibanned permanent dari server. [Reason: 20 Total Warning]", giveplayer, playerid);

		mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', 'Server Ban', '20 Total Warning', %i, %d)", giveplayer, PlayerIP, gettime(), ban_time);
		mysql_tquery(g_SQL, query);
		KickEx(playerid);
	}
	return 1;
}
ptask playerTimer[1000](playerid)
{
	if(pData[playerid][IsLoggedIn] == true)
	{
		pData[playerid][pPaycheck] ++;
		pData[playerid][pSeconds] ++, pData[playerid][pCurrSeconds] ++;
		if(pData[playerid][pOnDuty] >= 1)
		{
			pData[playerid][pOnDutyTime]++;
		}
		if(pData[playerid][pSeconds] == 900)
		{
			new scoremath = ((pData[playerid][pLevel])*5);

			pData[playerid][pMinutes]++, pData[playerid][pCurrMinutes] ++;
			pData[playerid][pSeconds] = 0, pData[playerid][pCurrSeconds] = 0;
   			pData[playerid][pBankMoney] += 50;
		    InfoMsg(playerid, "Bank +$50 & EXP +1");
			pData[playerid][pHours] ++;
			pData[playerid][pLevelUp] += 1;
			pData[playerid][pMinutes] = 0;
			UpdatePlayerData(playerid);

			if(pData[playerid][pLevelUp] >= scoremath)
			{
				pData[playerid][pLevel] += 1;
				pData[playerid][pHours] ++;
				SetPlayerScore(playerid, pData[playerid][pLevel]);
			}
		}
	}
	if(pData[playerid][pCurrMinutes] == 60)
	{
		pData[playerid][pCurrMinutes] = 0;
		pData[playerid][pCurrHours] ++;
	}
	//ox sytem start//
	if(IsPlayerInRangeOfPoint(playerid, 3, 494.4636,1293.1964,10.0437))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 498.3599,1296.6460,10.0437))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 498.3147,1301.6930,10.0437))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 570.088989,1219.789794,11.711267))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 354.502258,-2088.541748,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 361.865936,-2088.551513,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 367.337066,-2088.360107,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 369.805786,-2088.505859,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 375.105041,-2088.289306,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 383.510070,-2088.362304,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 390.969543,-2088.627685,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 396.217071,-2088.449218,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 398.711486,-2088.480468,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1, 403.764190,-2088.797119,7.835937))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 2351.77,-653.31,128.05)) //creategun
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -887.2399,-479.9101,826.8417))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -893.2037,-490.6880,826.8417))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -898.6295,-500.8337,826.8417))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -927.1517,-486.4165,826.8417))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -920.0016,-468.0568,826.8417))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 34.4547,1365.0729,9.1719))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9240,1379.4988,9.1719))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9276,1351.1335,9.1719))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -2043.9037,-2327.0183,30.6250))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -2000.2443,-2453.1018,30.5975))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -2001.2886,-2465.2129,31.2360))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -1989.6028,-2464.2825,31.0153))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -1980.7644,-2486.7327,30.8771))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -1993.8621,-2494.8857,32.8715))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, -2026.6808,-2480.3613,31.8755))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 1275.2433,-1551.5659,13.5769))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 1985.1968,-2054.9270,13.5938))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3, 1375.7587,-1893.4819,13.5901))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2, 2318.562744,-2070.840576,17.644752))//penjahit
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2, 2321.482421,-2082.888671,17.652400))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2, 2317.667236,-2082.262939,17.694538))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.653320,-2084.508544,17.652679))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2, 1925.521972,170.046707,37.281250))
	{
		callcmd::oxs(playerid, "");
		
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2, 2313.817382,-2075.185546,17.644004))
	{
		callcmd::oxs(playerid, "");
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2, 1302.113769,-1876.048583,13.763982))
	{
		callcmd::oxs(playerid, "");
	}
	else 
	{
		PlayerTextDrawHide(playerid, ox_pasive[playerid][0]);
		PlayerTextDrawHide(playerid, ox_pasive[playerid][1]);
		PlayerTextDrawHide(playerid, ox_active[playerid][0]);
		PlayerTextDrawHide(playerid, ox_active[playerid][1]);
	}
	//ox system end//
	return 1;
}
