public OnPlayerClickDynamicTextdraw(playerid, PlayerText:playertextid)
{
	//ox system start//
	if(playertextid == ox_pasive[playerid][1])
    {
		if(IsPlayerInRangeOfPoint(playerid, 3, 494.4636,1293.1964,10.0437))
		{
			new action[64];
			format(action, sizeof(action), "Ambil Minyak");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);			
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 498.3599,1296.6460,10.0437))
		{
			new action[64];
			format(action, sizeof(action), "Ambil Minyak");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 498.3147,1301.6930,10.0437))
		{
			new action[64];
			format(action, sizeof(action), "Ambil Minyak");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 570.088989,1219.789794,11.711267))
		{
			new action[64];
			format(action, sizeof(action), "Olah Minyak");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 354.502258,-2088.541748,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 361.865936,-2088.551513,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid,  ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 367.337066,-2088.360107,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 369.805786,-2088.505859,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 375.105041,-2088.289306,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 383.510070,-2088.362304,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 390.969543,-2088.627685,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 396.217071,-2088.449218,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 398.711486,-2088.480468,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 403.764190,-2088.797119,7.835937))
		{
			new action[64];
			format(action, sizeof(action), "Memancing");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 2351.77,-653.31,128.05)) //creategun
		{
			new action[64];
			format(action, sizeof(action), "Rakit Senjata");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -887.2399,-479.9101,826.8417))
		{
			new action[64];
			format(action, sizeof(action), "Ambil Box");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -893.2037,-490.6880,826.8417))
		{
			new action[64];
			format(action, sizeof(action), "Ambil Box");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -898.6295,-500.8337,826.8417))
		{
			new action[64];
			format(action, sizeof(action), "Ambil Box");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -927.1517,-486.4165,826.8417))
		{
			new action[64];
			format(action, sizeof(action), "Sortir Box");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -920.0016,-468.0568,826.8417))
		{
			new action[64];
			format(action, sizeof(action), "Mulai Kerja Box");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 34.4547,1365.0729,9.1719))
		{
			new action[64];
			format(action, sizeof(action), "Daur Ulang");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9240,1379.4988,9.1719))
		{
			new action[64];
			format(action, sizeof(action), "Daur Ulang");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9276,1351.1335,9.1719))
		{
			new action[64];
			format(action, sizeof(action), "Daur Ulang");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		if(IsPlayerInRangeOfPoint(playerid, 3, -2043.9037,-2327.0183,30.6250))
		{
			new action[64];
			format(action, sizeof(action), "Beli Chainsaw");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -2000.2443,-2453.1018,30.5975))
		{
			new action[64];
			format(action, sizeof(action), "Potong Kayu");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -2001.2886,-2465.2129,31.2360))
		{
			new action[64];
			format(action, sizeof(action), "Potong Kayu");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -1989.6028,-2464.2825,31.0153))
		{
			new action[64];
			format(action, sizeof(action), "Potong Kayu");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -1980.7644,-2486.7327,30.8771))
		{
			new action[64];
			format(action, sizeof(action), "Potong Kayu");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -1993.8621,-2494.8857,32.8715))
		{
			new action[64];
			format(action, sizeof(action), "Potong Kayu");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -2026.6808,-2480.3613,31.8755))
		{
			new action[64];
			format(action, sizeof(action), "Potong Kayu");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 1275.2433,-1551.5659,13.5769))
		{
			new action[64];
			format(action, sizeof(action), "Rob Bank");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 1985.1968,-2054.9270,13.5938))
		{
			new action[64];
			format(action, sizeof(action), "Rob Bank");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 1375.7587,-1893.4819,13.5901))
		{
			new action[64];
			format(action, sizeof(action), "Rob Bank");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2318.562744,-2070.840576,17.644752))//penjahit
		{
			new action[64];
			format(action, sizeof(action), "Loker Penjahit");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.573730,-2080.727783,17.692657))
		{
			new action[64];
			format(action, sizeof(action), "Buat Kain");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2321.482421,-2082.888671,17.652400))
		{
			new action[64];
			format(action, sizeof(action), "Buat Kain");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2317.667236,-2082.262939,17.694538))
		{
			new action[64];
			format(action, sizeof(action), "Buat Kain");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.653320,-2084.508544,17.652679))
		{
			new action[64];
			format(action, sizeof(action), "Buat Kain");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1925.521972,170.046707,37.281250))
		{
			new action[64];
			format(action, sizeof(action), "Ambil Wol");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2313.817382,-2075.185546,17.644004))
		{
			new action[64];
			format(action, sizeof(action), "Buat Baju");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1302.113769,-1876.048583,13.763982))
		{
			new action[64];
			format(action, sizeof(action), "Jual Pakaian");
			PlayerTextDrawSetString(playerid, ox_active[playerid][1], action);
		}
		PlayerTextDrawShow(playerid, ox_active[playerid][0]);
		PlayerTextDrawShow(playerid, ox_active[playerid][1]);
		SelectTextDraw(playerid, 0x00FFFFFF);
		return 1;
    }
	if(playertextid == ox_active[playerid][1])
    {
		PlayerTextDrawHide(playerid,ox_pasive[playerid][0]);
		PlayerTextDrawHide(playerid,ox_pasive[playerid][1]);
		PlayerTextDrawHide(playerid,ox_active[playerid][0]);
		PlayerTextDrawHide(playerid,ox_active[playerid][1]);
		if(IsPlayerInRangeOfPoint(playerid, 3, 494.4636,1293.1964,10.0437))
        {
        	callcmd::kerjaminyak1(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 498.3599,1296.6460,10.0437))
        {
        	callcmd::kerjaminyak2(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 498.3147,1301.6930,10.0437))
        {
        	callcmd::kerjaminyak2(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 570.088989,1219.789794,11.711267))
        {
        	callcmd::saringminyak(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 354.502258,-2088.541748,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 361.865936,-2088.551513,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 367.337066,-2088.360107,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 369.805786,-2088.505859,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 375.105041,-2088.289306,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 383.510070,-2088.362304,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 390.969543,-2088.627685,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 396.217071,-2088.449218,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 398.711486,-2088.480468,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 1, 403.764190,-2088.797119,7.835937))
		{
			callcmd::mancingnopaaal(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 2351.77,-653.31,128.05)) //creategun
		{
			callcmd::creategun(playerid, "");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -887.2399,-479.9101,826.8417))
        {
        	callcmd::ambilbox(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -893.2037,-490.6880,826.8417))
        {
        	callcmd::ambilbox(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -898.6295,-500.8337,826.8417))
        {
        	callcmd::ambilbox(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -927.1517,-486.4165,826.8417))
        {
        	callcmd::penyortiran(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -920.0016,-468.0568,826.8417))
        {
        	callcmd::mulaikerjabox1(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 34.4547,1365.0729,9.1719))
        {
        	callcmd::Daurulang(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9240,1379.4988,9.1719))
        {
        	callcmd::Daurulang(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9276,1351.1335,9.1719))
        {
        	callcmd::Daurulang(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -2043.9037,-2327.0183,30.6250))
        {
        	callcmd::buychainsaw(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -2000.2443,-2453.1018,30.5975))
        {
        	callcmd::tukangkayuzar(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -2001.2886,-2465.2129,31.2360))
        {
        	callcmd::tukangkayuzar(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -1989.6028,-2464.2825,31.0153))
        {
        	callcmd::tukangkayuzar(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -1980.7644,-2486.7327,30.8771))
        {
        	callcmd::tukangkayuzar(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -1993.8621,-2494.8857,32.8715))
        {
        	callcmd::tukangkayuzar(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -2026.6808,-2480.3613,31.8755))
        {
        	callcmd::tukangkayuzar(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 1275.2433,-1551.5659,13.5769))
        {
        	callcmd::robbank(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 1985.1968,-2054.9270,13.5938))
        {
        	callcmd::robbank(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 1375.7587,-1893.4819,13.5901))
        {
        	callcmd::robbank(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2318.562744,-2070.840576,17.644752))//penjahit
		{
		    if(pData[playerid][pJob] == 10)
			ShowPlayerDialog(playerid, DIALOG_LOCKERPENJAHIT, DIALOG_STYLE_LIST, "Greenwich - Locker Penjahit", "Work Clothes\nYour Clothes", "Enter", "Cancel");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.573730,-2080.727783,17.692657))
        {
        	callcmd::buatkain(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2321.482421,-2082.888671,17.652400))
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2317.667236,-2082.262939,17.694538))
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.653320,-2084.508544,17.652679))
        {
        	callcmd::buatkain(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1925.521972,170.046707,37.281250))
        {
        	callcmd::ambilwool(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2313.817382,-2075.185546,17.644004))
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1302.113769,-1876.048583,13.763982))
		{
            callcmd::jualpakaian(playerid, "");
        }
	}
	if(playertextid == bukakunci[playerid])
	{
		PlayerTextDrawHide(playerid, LenzTD[playerid][0]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][1]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][2]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][3]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][4]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][5]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][6]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][7]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][8]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][9]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][10]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][11]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][12]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][13]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][14]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][15]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][16]);
		PlayerTextDrawHide(playerid, jam[playerid]);
		PlayerTextDrawHide(playerid, tanggal[playerid]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][17]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][18]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][19]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][20]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][21]);
		PlayerTextDrawHide(playerid, LenzTD[playerid][22]);
		PlayerTextDrawHide(playerid, bukakunci[playerid]);

		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][0]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][1]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][2]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][3]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][4]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][5]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][6]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][7]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][8]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][9]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][10]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][11]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][12]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][13]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][14]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][15]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][16]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][17]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][18]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][19]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][20]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][21]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][22]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][23]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][24]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][25]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][26]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][27]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][28]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][29]);
		PlayerTextDrawShow(playerid, kliktutuphp[playerid]);
		PlayerTextDrawShow(playerid, sms[playerid]);
		PlayerTextDrawShow(playerid, telpon[playerid]);
		PlayerTextDrawShow(playerid, kontak[playerid]);
		PlayerTextDrawShow(playerid, gps[playerid]);
		PlayerTextDrawShow(playerid, twitter[playerid]);
		PlayerTextDrawShow(playerid, setting[playerid]);
		PlayerTextDrawShow(playerid, airdrop[playerid]);
		PlayerTextDrawShow(playerid, kamera[playerid]);
		PlayerTextDrawShow(playerid, gojek[playerid]);
		PlayerTextDrawShow(playerid, brimobile[playerid]);
		PlayerTextDrawShow(playerid, spotify[playerid]);
		PlayerTextDrawShow(playerid, apklainnya[playerid]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][30]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][31]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][32]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][33]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][34]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][35]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][36]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][37]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][38]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][39]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][40]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][41]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][42]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][43]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][44]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][45]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][46]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][47]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][48]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][49]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][50]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][51]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][52]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][53]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][54]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][55]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][56]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][57]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][58]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][59]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][60]);
		PlayerTextDrawShow(playerid, LenzMenuTD[playerid][61]);
	}
    if(playertextid == kliktutuphp[playerid])
	{
		hidehplenz(playerid);
		showhbelenz(playerid);
		RemovePlayerAttachedObject(playerid, 9);

		if(!IsPlayerInAnyVehicle(playerid) && !PlayerData[playerid][pInjured] && !PlayerData[playerid][pLoopAnim])
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			TogglePlayerControllable(playerid, 1);
		}    
		CancelSelectTextDraw(playerid);
	}
	if(playertextid == brimobile[playerid])
	{
		hidehplenz(playerid);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][0]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][1]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][2]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][3]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][4]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][5]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][6]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][7]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][8]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][9]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][10]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][11]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][12]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][13]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][14]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][15]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][16]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][17]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][18]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][19]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][20]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][21]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][22]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][23]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][24]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][25]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][26]);
		PlayerTextDrawShow(playerid, kembali[playerid]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][27]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][28]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][29]);
		PlayerTextDrawShow(playerid, norek[playerid]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][30]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][31]);
		PlayerTextDrawShow(playerid, saldobank[playerid]);
		PlayerTextDrawShow(playerid, invoice[playerid]);
		PlayerTextDrawShow(playerid, transfer[playerid]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][32]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][33]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][34]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][35]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][36]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][37]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][38]);
		PlayerTextDrawShow(playerid, LenzBankTD[playerid][39]);

		new AtmInfo[560];
	   	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
	   	PlayerTextDrawSetString(playerid, saldobank[playerid], AtmInfo);
	   	format(AtmInfo,1000,"%d", pData[playerid][pBankRek]);
	   	PlayerTextDrawSetString(playerid, norek[playerid], AtmInfo);
		SelectTextDraw(playerid, COLOR_BLUE);
	}
	if(playertextid == invoice[playerid])
	{
		callcmd::invoiceden(playerid);
	}
	if(playertextid == transfer[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_BANKREKENING, DIALOG_STYLE_INPUT, "Greenwich - Transfer", "Mohon masukan jumlah uang yang ingin di transfer:", "Transfer", "Batal");
	}
	if(playertextid == kembali[playerid])
	{
		hidehplenz(playerid);
		for(new i = 0; i < 40; i++)
        {
			PlayerTextDrawHide(playerid, LenzBankTD[playerid][i]);
	    }

		PlayerTextDrawHide(playerid, kembali[playerid]);
		PlayerTextDrawHide(playerid, norek[playerid]);
		PlayerTextDrawHide(playerid, saldobank[playerid]);
		PlayerTextDrawHide(playerid, invoice[playerid]);
		PlayerTextDrawHide(playerid, transfer[playerid]);

		CancelSelectTextDraw(playerid);
		RemovePlayerAttachedObject(playerid, 9);

		if(!IsPlayerInAnyVehicle(playerid) && !PlayerData[playerid][pInjured] && !PlayerData[playerid][pLoopAnim])
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			TogglePlayerControllable(playerid, 1);
		}    
		CancelSelectTextDraw(playerid);
		showhbelenz(playerid);
	}
	if(playertextid == gojek[playerid])
	{
		hidehplenz(playerid);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][0]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][1]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][2]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][3]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][4]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][5]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][6]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][7]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][8]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][9]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][10]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][11]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][12]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][13]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][14]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][15]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][16]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][17]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][18]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][19]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][20]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][21]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][22]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][23]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][24]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][25]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][26]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][27]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][28]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][29]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][30]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][31]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][32]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][33]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][34]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][35]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][36]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][37]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][38]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][39]);
		PlayerTextDrawShow(playerid, pay[playerid]);
		PlayerTextDrawShow(playerid, topup[playerid]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][40]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][41]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][42]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][43]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][44]);
		PlayerTextDrawShow(playerid, goride[playerid]);
		PlayerTextDrawShow(playerid, gocar[playerid]);
		PlayerTextDrawShow(playerid, gofood[playerid]);
		PlayerTextDrawShow(playerid, gosend[playerid]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][45]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][46]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][47]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][48]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][49]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][50]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][51]);
		PlayerTextDrawShow(playerid, LenzGojekTD[playerid][52]);
		PlayerTextDrawShow(playerid, tombolkembali[playerid]);
		new Gopay[560];
	   	format(Gopay,1000,"%s", FormatMoney(pData[playerid][pGopay]));
	   	PlayerTextDrawSetString(playerid, LenzGojekTD[playerid][36], Gopay);//tanda1
	    SelectTextDraw(playerid, COLOR_BLUE);
	}
	if(playertextid == pay[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_GOPAY, DIALOG_STYLE_INPUT, "GoJek App - GoPay", "Masukan jumlah uang yang ingin anda bayar", "Input", "Kembali");
	}
	if(playertextid == topup[playerid])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOTOPUP, DIALOG_STYLE_INPUT, "GoJek App - TopUp", "Masukan jumlah gopay yang ingin anda topup", "Input", "Kembali");
	}
	if(playertextid == goride[playerid])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOJEK, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoJek", "Hai, kamu akan memesan GoJek. Mau kemana hari ini?", "Pesan", "Kembali");
	}
	if(playertextid == gocar[playerid])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOCAR, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoCar", "Hai, kamu akan memesan GoCar. Mau kemana hari ini?", "Pesan", "Kembali");
	}
	if(playertextid == gofood[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_GOFOOD, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoFood", "Hai, kamu akan memesan GoFood. Mau makan apa hari ini?", "Pesan", "Kembali");
	}
	if(playertextid == gosend[playerid])
	{
	ErrorMsg(playerid, "Wilayah anda belum tersedia.!");
	}
	if(playertextid == tombolkembali[playerid])
	{
		hidehplenz(playerid);
	    for(new i = 0; i < 53; i++)
        {
			PlayerTextDrawHide(playerid, LenzGojekTD[playerid][i]);
	    }
		PlayerTextDrawHide(playerid, pay[playerid]);
		PlayerTextDrawHide(playerid, topup[playerid]);
		PlayerTextDrawHide(playerid, goride[playerid]);
		PlayerTextDrawHide(playerid, gocar[playerid]);
		PlayerTextDrawHide(playerid, gofood[playerid]);
		PlayerTextDrawHide(playerid, gosend[playerid]);
		PlayerTextDrawHide(playerid, tombolkembali[playerid]);
	    CancelSelectTextDraw(playerid);
		RemovePlayerAttachedObject(playerid, 9);

		if(!IsPlayerInAnyVehicle(playerid) && !PlayerData[playerid][pInjured] && !PlayerData[playerid][pLoopAnim])
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			TogglePlayerControllable(playerid, 1);
		}    
		CancelSelectTextDraw(playerid);
		showhbelenz(playerid);
	}
	if(playertextid == sms[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_PHONE_SENDSMS, DIALOG_STYLE_INPUT, "{007a1e}Greenwich {ffffff}- Sms", "Masukan nomor yang akan anda kirimkan:", "Kirim", "Kembali");
	}
	if(playertextid == telpon[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_PHONE_DIALUMBER, DIALOG_STYLE_INPUT, "Phone - Call", "Enter The Number :", "Input", "Back");
	}
	if(playertextid == kontak[playerid])
	{
		ShowContacts(playerid);
	}
	if(playertextid == gps[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "{007a1e}Greenwich {ffffff}- GPS", "Jobs Location\nPublic Location\nBussiness In City\nAtm Location\nBank Location\n"RED_E"(Delete Checkpoint)", "Enter", "Cancel");
	}
	if(playertextid == setting[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_TOGGLEPHONE, DIALOG_STYLE_LIST, "Greenwich - Settings", "About Phone\n Service", "Enter", "Back");
	}
	if(playertextid == twitter[playerid])
	{
		new string[555], notif[20];
		format(string, sizeof(string), "Tweet\nChangename Twitter({0099ff}%s{ffffff})\nNotification: %s", pData[playerid][pTwittername], notif);
		ShowPlayerDialog(playerid, DIALOG_TWITTER, DIALOG_STYLE_LIST, "Greenwich - Twitter", string, "Enter", "Close");
	}
	if(playertextid == apklainnya[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_WASSAP, DIALOG_STYLE_LIST, "Greenwich - WhatsApp", "Contact\nShareloc\nWhatsapp", "Enter", "Back");
	}
	if(playertextid == spotify[playerid])
	{
		ErrorMsg(playerid, "Segera Hadir.!");
	}
	if(playertextid == airdrop[playerid])
	{
		new str[500], count = 0,String[500];
		String="";
		foreach(new i : Player) if(IsPlayerConnected(i) && NearPlayer(playerid, i, 5) &&i!= playerid)
		{
			format(str, sizeof(str), "Kantong - %s (%d)\n", pData[i][pName], i);
			strcat(String, str);
			SetPlayerListitemValue(playerid, count++, i);
		}
		if(!count) ErrorMsg(playerid, "Tidak ada player lain didekat mu!");
		else ShowPlayerDialog(playerid, DIALOG_AIRDROP, DIALOG_STYLE_LIST, "Greenwich - AirDrop", String, "Pilih", "Tutup");
	}
	if(playertextid == kamera[playerid])
	{
		callcmd::selfie(playerid, "");
	}

	//KONTAK DI HP
	if(playertextid == DAFTARKONTAK[playerid])
	{
	    ShowContacts(playerid);
	}
	if(playertextid == TWEETAPP[playerid][0])
	{
		new string[555];
		format(string, sizeof(string), "Post Twitter\nUbah Twitter({0099ff}%s{ffffff})", pData[playerid][pTwittername]);
		ShowPlayerDialog(playerid, DIALOG_TWITTER, DIALOG_STYLE_LIST, "Greenwich - Twitter", string, "Pilih", "Tutup");
	}
    //FUEL SYSTEM DENTOT
    if(playertextid == PomTD[playerid][7])
    {
       	for(new i = 0; i < 26; i++)
		{
			PlayerTextDrawHide(playerid, PomTD[playerid][i]);
		}
		CancelSelectTextDraw(playerid);
		InfoMsg(playerid, "Terima kasih telah mengisi bahan bakar disini ><");
		KillTimer(pData[playerid][pFillTime]);
		pData[playerid][pInputFuel] = 0;
		pData[playerid][pFillStatus] = 0;
		pData[playerid][pFillPrice] = 0;
		pData[playerid][pFill] = -1;
	}
	if(playertextid == PomTD[playerid][6])
   	{
   	    if(pData[playerid][pInputFuel] == 0) return ErrorMsg(playerid, "Anda belum menginput jumlah yang akan ditarik");
   	    new gsid = pData[playerid][pFill];
   	    new vehicleid = GetPlayerVehicleID(playerid);
    	if(pData[playerid][pInputFuel] > GetVehicleFuel(vehicleid))
		return ErrorMsg(playerid, "Bahan bakar kendaraan tidak bisa lebih dari 100 liter.");
  		pData[playerid][pFillPrice] += pData[playerid][pInputFuel];
    	GStation_Refresh(gsid);
     	GivePlayerMoneyEx(playerid, -pData[playerid][pInputFuel]);
      	new fuels = GetVehicleFuel(vehicleid);
		SetVehicleFuel(vehicleid, fuels+pData[playerid][pInputFuel]);
  		gsData[pData[playerid][pFill]][gsStock] -= pData[playerid][pInputFuel];
	}
	if(playertextid == PomTD[playerid][18])
   	{
   	    ShowPlayerDialog(playerid, DIALOG_INPUTFUEL, DIALOG_STYLE_INPUT, "Greenwich - Gas Station", "Mohon masukan jumlah bensin yang ingin di isi:", "Input", "Batal");
	}
	//ATM SYSTEM
	if(playertextid == AtmTD[playerid][7])
	{
	    for(new i = 0; i < 76; i++)
		{
			PlayerTextDrawHide(playerid, AtmTD[playerid][i]);
		}
		CancelSelectTextDraw(playerid);
		pData[playerid][pInputMoney] = 0;
	}
	if(playertextid == AtmTD[playerid][43])//input tf
	{
	    ShowPlayerDialog(playerid, DIALOG_BANKREKENING, DIALOG_STYLE_INPUT, "Greenwich - Transfer", "Mohon masukan jumlah uang yang ingin di transfer:", "Input", "Batal");
	}
	if(playertextid == AtmTD[playerid][53])//tombol input withdepo
	{
	    ShowPlayerDialog(playerid, DIALOG_WITHDEPO, DIALOG_STYLE_INPUT, "Greenwich - FLEECA", "Mohon masukan jumlah uang yang ingin di input:", "Input", "Batal");
	}
	if(playertextid == AtmTD[playerid][58])//withdraw
	{
	    if(pData[playerid][pInputMoney] == 0) return ErrorMsg(playerid, "Anda belum menginput jumlah yang akan ditarik");
	    if(pData[playerid][pInputMoney] > pData[playerid][pBankMoney]) return ErrorMsg(playerid, "Anda tidak memiliki uang sebanyak itu di bank.");
		if(pData[playerid][pInputMoney] < 1) return ErrorMsg(playerid, "Angka yang anda masukan tidak valid!");
	    new query[128], lstr[512];
		pData[playerid][pBankMoney] = (pData[playerid][pBankMoney] - pData[playerid][pInputMoney]);
		GivePlayerMoneyEx(playerid, pData[playerid][pInputMoney]);
		mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET bmoney=%d,money=%d WHERE reg_id=%d", pData[playerid][pBankMoney], pData[playerid][pMoney], pData[playerid][pID]);
		mysql_tquery(g_SQL, query);
		format(lstr, sizeof(lstr), "Anda berhasil menarik uang sejumlah %s dari rekening anda.", FormatMoney(pData[playerid][pInputMoney]));
		SuccesMsg(playerid, lstr);
		new AtmInfo[500];
		format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
	 	PlayerTextDrawSetString(playerid, AtmTD[playerid][32], AtmInfo);
   		format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pMoney]));
   		PlayerTextDrawSetString(playerid, AtmTD[playerid][31], AtmInfo);
	}
	if(playertextid == AtmTD[playerid][62])//deposit
	{
	    if(pData[playerid][pInputMoney] == 0) return ErrorMsg(playerid, "Anda belum menginput jumlah yang akan disimpan");
	    if(pData[playerid][pInputMoney] > pData[playerid][pMoney]) return ErrorMsg(playerid, "Anda tidak memiliki uang sebanyak itu di dompet.");
		if(pData[playerid][pInputMoney] < 1) return ErrorMsg(playerid, "Angka yang anda masukan tidak valid!");
	    new query[128], lstr[512];
		pData[playerid][pBankMoney] = (pData[playerid][pBankMoney] + pData[playerid][pInputMoney]);
		GivePlayerMoneyEx(playerid, -pData[playerid][pInputMoney]);
		mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET bmoney=%d,money=%d WHERE reg_id=%d", pData[playerid][pBankMoney], pData[playerid][pMoney], pData[playerid][pID]);
		mysql_tquery(g_SQL, query);
		format(lstr, sizeof(lstr), "Anda berhasil menyimpan uang sejumlah %s kedalam rekening anda.", FormatMoney(pData[playerid][pInputMoney]));
		SuccesMsg(playerid, lstr);
		new AtmInfo[500];
		format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
	 	PlayerTextDrawSetString(playerid, AtmTD[playerid][32], AtmInfo);
   		format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pMoney]));
   		PlayerTextDrawSetString(playerid, AtmTD[playerid][31], AtmInfo);
	}
//PHONE SYSTEM
	if(playertextid == BRIMOBILE[playerid][40])
	{
	    for(new i = 0; i < 57; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneBaru[i]);
		}
		for(new i = 0; i < 45; i++)
		{
			PlayerTextDrawHide(playerid, BRIMOBILE[playerid][i]);
		}
	}
	if(playertextid == BRIMOBILE[playerid][20])
	{
		callcmd::invoiceden(playerid);
	}
	if(playertextid == BRIMOBILE[playerid][21])
	{
		ShowPlayerDialog(playerid, DIALOG_BANKREKENING, DIALOG_STYLE_INPUT, "Greenwich - Transfer", "Mohon masukan jumlah uang yang ingin di transfer:", "Transfer", "Batal");
	}
	if(playertextid == GojekAPP[playerid][24])
	{
		for(new i = 0; i < 57; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneBaru[i]);
		}
		for(new i = 0; i < 58; i++)
		{
			PlayerTextDrawHide(playerid, GojekAPP[playerid][i]);
		}
	}
	if(playertextid == GojekAPP[playerid][43])
	{
		InfoMsg(playerid, "pengembangan..");
	}
	if(playertextid == GojekAPP[playerid][38])
	{
		ShowPlayerDialog(playerid, DIALOG_GOPAY, DIALOG_STYLE_INPUT, "GoJek App - GoPay", "Masukan jumlah uang yang ingin anda bayar", "Input", "Kembali");
	}
	if(playertextid == GojekAPP[playerid][39])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOTOPUP, DIALOG_STYLE_INPUT, "GoJek App - TopUp", "Masukan jumlah gopay yang ingin anda topup", "Input", "Kembali");
	}
	if(playertextid == GojekAPP[playerid][40])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOJEK, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoJek", "Hai, kamu akan memesan GoJek. Mau kemana hari ini?", "Pesan", "Kembali");
	}
	if(playertextid == GojekAPP[playerid][41])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOCAR, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoCar", "Hai, kamu akan memesan GoCar. Mau kemana hari ini?", "Pesan", "Kembali");
	}
	if(playertextid == GojekAPP[playerid][42])
	{
		ShowPlayerDialog(playerid, DIALOG_GOFOOD, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoFood", "Hai, kamu akan memesan GoFood. Mau makan apa hari ini?", "Pesan", "Kembali");
	}
	//REGISTER
    if(playertextid == BuatKarakter[playerid][12])
	{
	    if(pData[playerid][pMasukinNama] == 0) return ErrorMsg(playerid, "Anda belum memasukkan nama karakter");
	    if(pData[playerid][pAge] == 0) return ErrorMsg(playerid, "Anda belum memasukkan tanggal lahir");
	    // if(pData[playerid][pTinggi] == 0) return ErrorMsg(playerid, "Anda belum memasukkan tinggi badan");
	    // if(pData[playerid][pBerat] == 0) return ErrorMsg(playerid, "Anda belum memasukkan berat badan");
	    if(pData[playerid][pMasukinKelamin] == 0) return ErrorMsg(playerid, "Anda belum memilih jenis kelamin");
	    if(pData[playerid][pAge] == 0) return ErrorMsg(playerid, "Anda belum memasukkan tanggal lahir");
	    {
		    SuccesMsg(playerid,"Registration Success! Thank Y telah bergabung dengan Greenwich Roleplay!");
		    for(new i = 0; i < 32; i++)
			{
				PlayerTextDrawHide(playerid, BuatKarakter[playerid][i]);
			}
			CancelSelectTextDraw(playerid);
		    if(pData[playerid][pGender] == 1)
		    {
		        pData[playerid][pSkin] = 147;
				SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 2823.21,-2440.34,12.08,85.07, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(playerid);
			}
			else
			{
			    pData[playerid][pSkin] = 93;
				SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 2823.21,-2440.34,12.08,85.07, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(playerid);
			}
		}
	}
	if(playertextid == BuatKarakter[playerid][20])
	{
	    PlayerTextDrawHide(playerid, BuatKarakter[playerid][20]);
	    PlayerTextDrawColor(playerid, BuatKarakter[playerid][20], COLOR_BLUE);
	    PlayerTextDrawShow(playerid, BuatKarakter[playerid][20]);
	    PlayerTextDrawHide(playerid, BuatKarakter[playerid][22]);
	    PlayerTextDrawColor(playerid, BuatKarakter[playerid][22], -1);
	    PlayerTextDrawShow(playerid, BuatKarakter[playerid][22]);
	    pData[playerid][pGender] = 1;
	    pData[playerid][pMasukinKelamin] = 1;
	}
	if(playertextid == BuatKarakter[playerid][22])
	{
	    PlayerTextDrawHide(playerid, BuatKarakter[playerid][20]);
	    PlayerTextDrawColor(playerid, BuatKarakter[playerid][20], -1);
	    PlayerTextDrawShow(playerid, BuatKarakter[playerid][20]);
	    PlayerTextDrawHide(playerid, BuatKarakter[playerid][22]);
	    PlayerTextDrawColor(playerid, BuatKarakter[playerid][22], COLOR_BLUE);
	    PlayerTextDrawShow(playerid, BuatKarakter[playerid][22]);
	    pData[playerid][pGender] = 2;
	    pData[playerid][pMasukinKelamin] = 1;
	}
	if(playertextid == BuatKarakter[playerid][24])
	{
	    ShowPlayerDialog(playerid, DIALOG_MAKE_CHAR, DIALOG_STYLE_INPUT, "Greenwich - {ffffff}Pembuatan Karakter", "Masukan nama baru untuk karakter anda\n\nContoh: Atsuko_Tadashi, Javier_Cooper.", "Oke", "Keluar");
	}
	if(playertextid == BuatKarakter[playerid][25])
	{
	    ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Greenwich - {ffffff}Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun): 15/04/1998", "Oke", "Batal");
	}
	if(playertextid == BuatKarakter[playerid][26])
	{
	    ShowPlayerDialog(playerid, DIALOG_TINGGI, DIALOG_STYLE_INPUT, "Greenwich - {ffffff}Tinggi Badan", "Masukan tinggi badan minimal 110 cm dan maksimal 200 cm", "Oke", "Batal");
	}
	if(playertextid == BuatKarakter[playerid][27])
	{
        ShowPlayerDialog(playerid, DIALOG_BERAT, DIALOG_STYLE_INPUT, "Greenwich - {ffffff}Berat Badan", "Masukan berat badan minimal 40 kg dan maksimal 150 kg", "Oke", "Batal");
	}
	//Taruh di OnPlayerClickTextDraw
	for(new i = 0; i < MAX_INVENTORY; i++)
	{
		if(playertextid == MODELTD[playerid][i])
		{
			if(InventoryData[playerid][i][invExists])
			{
			    MenuStore_UnselectRow(playerid);
				MenuStore_SelectRow(playerid, i);
			    new name[48];
            	strunpack(name, InventoryData[playerid][pData[playerid][pSelectItem]][invItem]);
			}
		}
	}
	if(playertextid == INVINFO[playerid][2])
	{
		new id = pData[playerid][pSelectItem];

		if(id == -1)
		{
		    ErrorMsg(playerid,"[Inventory] Tidak Ada Barang Di Slot Tersebut");
		}
		else
		{
		    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
			new string[64];
		    strunpack(string, InventoryData[playerid][id][invItem]);

		    if(!PlayerHasItem(playerid, string))
		    {
		   		ErrorMsg(playerid,"[Inventory] Kamu Tidak Memiliki Barang Tersebut");
                Inventory_Show(playerid);
			}
			else
			{
				CallLocalFunction("OnPlayerUseItem", "dds", playerid, id, string);
			}
		}
	}
	else if(playertextid == INVINFO[playerid][5])
	{
		Inventory_Close(playerid);
	}
	else if(playertextid == INVINFO[playerid][4])
	{
		new id = pData[playerid][pSelectItem];

		if(id == -1)
		{
		    ErrorMsg(playerid,"[Inventory] Tidak Ada Barang Di Slot Tersebut");
		}
		else
		{
		    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
			new string[64];
		    strunpack(string, InventoryData[playerid][id][invItem]);

		    if(!PlayerHasItem(playerid, string))
		    {
		   		ErrorMsg(playerid,"[Inventory] Kamu Tidak Memiliki Barang Tersebut");
                Inventory_Show(playerid);
			}
			else
			{
				CallLocalFunction("OnPlayerDropItem", "dds", playerid, id, string);
			}
		}
	}
	else if(playertextid == INVINFO[playerid][3])
    {
        new id = pData[playerid][pSelectItem], str[500], count = 0,String[500];
        String="";
        if(id == -1)
        {
            ErrorMsg(playerid,"[Inventory] Pilih Barang Terlebih Dahulu");
        }
        else
        {
			if (pData[playerid][pGiveAmount] < 1)
				return ErrorMsg(playerid,"[Inventory] Masukan Jumlah Terlebih Dahulu");

			foreach(new i : Player) if(IsPlayerConnected(i) && NearPlayer(playerid, i, 5) &&i!= playerid)
   			{
				format(str, sizeof(str), "Kantong - %s (%d)\n", pData[i][pName], i);
    			strcat(String, str);
       			SetPlayerListitemValue(playerid, count++, i);
          	}
            if(!count) ErrorMsg(playerid, "Tidak ada player lain didekat mu!");
            else ShowPlayerDialog(playerid, DIALOG_GIVE, DIALOG_STYLE_LIST, "Greenwich - Inventory", String, "Pilih", "Tutup");
        }
    }
   	else if(playertextid == INVINFO[playerid][1])
	{
		ShowPlayerDialog(playerid, DIALOG_AMOUNT, DIALOG_STYLE_INPUT, "Inventory - Jumlah", "Masukan Jumlah:", "Berikan", "Batal");
	}
    if(playertextid == IDCard[playerid][25])
    {
        for(new txd; txd < 26; txd++)
        {
            PlayerTextDrawHide(playerid, IDCard[playerid][txd]);
            CancelSelectTextDraw(playerid);
        }           
    }
    if(playertextid == LICCard[playerid][11])
    {
        for(new txd; txd < 26; txd++)
        {
            PlayerTextDrawHide(playerid, LICCard[playerid][txd]);
            CancelSelectTextDraw(playerid);
        }           
    }
    //===============================================================//
    return 1;
}

