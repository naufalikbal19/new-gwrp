#include <a_samp>
#include <strlib>
#pragma warning disable 219
#pragma tabsize 0
#undef MAX_PLAYERS
#define MAX_PLAYERS 500
#include <crashdetect>
#include <gvar>
#include <a_mysql>
#include <a_actor>
#include <a_zones>
#include <progress2>
#include <Pawn.CMD>
#include <mSelection.inc>
#include <FiTimestamp>
#define ENABLE_3D_TRYG_YSI_SUPPORT
#include <3DTryg>
#include <streamer>
#include <EVF2>
#include <YSI\y_timers>
#include <YSI\y_ini>
#include <sscanf2>
#include <yom_buttons>
#include <geoiplite>
#include <garageblock>
#include <tp>
#include <compat>
#define DCMD_PREFIX '!'
#include <discord-connector>
#include <discord-cmd>
#include <fixobject>
//#include <GPS>
#define MAX_AUCTIONS    10
//-----[ Modular ]-----
#include "DATA\DEFINE.pwn"
#define VELOCITY_MULT	(3.0)
#define VELOCITY_NORM	(1.0)
#define HEIGHT_GAIN		(0.5)
//#include "DATA\GPS.pwn"
//BAJU SYSTEM
new fly[MAX_PLAYERS];
new usefly[MAX_PLAYERS];
new delaykargo;
new robmobil;
new Text3D:teksrob[MAX_PLAYERS];
new bool:delaydealer;
new cskin[MAX_PLAYERS];
new rusa;
new value;
new DCC_Channel:g_cekpin;
static const PedMan[] =
{
  1, 2, 3, 4, 5, 6, 7, 14, 15, 16, 17, 24, 25, 28, 29, 30, 35, 36, 46, 57, 66, 72, 78, 79, 82, 83, 84, 94, 95, 100, 101,  127, 128, 132, 133,
	134, 135, 136, 142, 159, 160, 161, 182, 183, 185, 189, 200, 202, 206, 210, 212, 213, 220, 221, 222, 223, 229, 234, 235, 236, 239, 240, 249, 250, 258, 259, 261, 262, 292, 293,
	294, 296, 297, 299
};
static const Kendaraan[] =
{
	401, 404, 405, 481, 509, 462, 586, 461, 521, 468, 400, 412, 419, 426, 436, 466, 467, 474, 475, 421, 492, 489, 405, 445, 579, 507, 534, 536, 558, 565, 567, 576
};
static const PedMale[] =
{
    9, 10, 11, 12, 13, 31, 38, 39, 40, 53, 54, 56, 65, 75, 77, 88, 89, 90, 91, 92, 129, 130, 131, 138, 140, 148, 151, 152, 157, 190, 193, 194, 195, 196,
	197, 198, 199, 201, 207, 215, 216, 219, 226, 231, 232, 237, 238, 243, 244, 245,
	246, 256, 257
};

//=================================================
new bool:explosive[MAX_PLAYERS char] = {false,...};
// new Text:gspeedo[4];
// new Text:speedo_dot[21];
// new Text:speedo_number[12];
// new WaktuMolotov[MAX_PLAYERS];
new PakaiSenjata[MAX_PLAYERS];
#include <sampvoice>
//#define MAX_RADIOS 999
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };
// new SV_GSTREAM:gstream = SV_NULL;
new SV_GSTREAM:StreamTelpon[MAX_PLAYERS] = { SV_NULL, ... };
// new SV_GSTREAM:StreamFreq[MAX_RADIOS] = SV_NULL;
// new IDStream[MAX_PLAYERS];
//pep em
new JamFivEm;
new DetikFivEm;
new JamTelpon[MAX_PLAYERS];
new DetikTelpon[MAX_PLAYERS];
////////////////
// new rentalbike;
new asuransi;
new garasisamd;
new garasipedagang;
// new rentalpelabuhan;
new kendaraansapd;
new gudangkota;
new menumasak;
new menuminum;
new menupedagang;
// new sppelabuhan;
//=======[ ATM FIVEM]=======
new atm1;
new atm2;
new bank;
new bank1;
new bank2;
new atm3;
new atm4;
//========[ MANCING CP ]========
new mancing1;
new mancing2;
new mancing3;
new mancing4;
new mancing5;
new mancing6;
new mancing7;
new mancing8;
new mancing9;
new mancing10;
//======[ JOB BY DENTOT ]========
new Sopirbus;
new tukangayam;
new petani;
new tukangtebang;
new penambangminyak;
new penjahit;
new pemerah;
new penambang;
new Recycler;
//=======[ JOB PEMERAH DENTOT ]=========
new PemerahCP;
new Trucker;
new Disnaker;
new Healing;

//jualbotol
new PenjualanBarang;
// new JualBotol;
//pernikahan
new pernikahan;

//================================
new
    JOB[MAX_PLAYERS], inJOB[MAX_PLAYERS], Car_Job[MAX_PLAYERS], timer_Car[MAX_PLAYERS], stresstimer[MAX_PLAYERS], KeluarKerja[MAX_PLAYERS],
    Seconds_timer[MAX_PLAYERS], Hunter_Deer[MAX_PLAYERS], Meeters_BTWDeer[MAX_PLAYERS], TimerKeluar[MAX_PLAYERS],
    Meeters[MAX_PLAYERS], Deer[MAX_PLAYERS], Deep_Deer[MAX_PLAYERS], Meeter_Kill[MAX_PLAYERS],
    Shoot_Deer[MAX_PLAYERS];

//han
new STATUS_BOT2;

static warnings[MAX_PLAYERS char] = {0,...};
new Text3D:TagKeluar[MAX_PLAYERS];
new DCC_Channel:g_Discord_CHENH4X;

//-----[ Quiz ]-----
new quiz,
	answers[256],
	answermade,
	qprs;

//-----[ Twitter ]-----
new tweet[60];

//-----[ New HamZyy ]----
//rob
new DCC_Channel:chLogsRobbank;
//New GMX
new CurGMX;
//Enum GMX
forward DoGMX();
//


//-----[ Rob ]-----
new RobMember = 0;

//-----[ Event ]-----
new EventCreated = 0, 
	EventStarted = 0, 
	EventPrize = 500;
new Float: RedX, 
	Float: RedY, 
	Float: RedZ, 
	EventInt, 
	EventWorld;
new Float: BlueX, 
	Float: BlueY, 
	Float: BlueZ;
new EventHP = 100,
	EventArmour = 0,
	EventLocked = 0;
new EventWeapon1, 
	EventWeapon2, 
	EventWeapon3, 
	EventWeapon4, 
	EventWeapon5;
new BlueTeam = 0, 
	RedTeam = 0;
new MaxRedTeam = 5, 
	MaxBlueTeam = 5;
new IsAtEvent[MAX_PLAYERS];


new AntiBHOP[MAX_PLAYERS];

// new InRob[MAX_PLAYERS];
//-----[ Discord Connector ]-----
new pemainic;
new upt = 0;
new govdikota;
new emsdikota;
new polisidikota;
new bengkeldikota;
new gojekdikota;
new reporterdikota;
new pedagangdikota;
//-----[ Selfie System ]-----
new takingselfie[MAX_PLAYERS];
new Float:Degree[MAX_PLAYERS];
const Float: Radius = 1.4; //do not edit this
const Float: Speed  = 1.25; //do not edit this
const Float: Height = 1.0; // do not edit this
new Float:lX[MAX_PLAYERS];
new Float:lY[MAX_PLAYERS];
new Float:lZ[MAX_PLAYERS];
//=========[ TIMER ]============//
// new olahh[MAX_PLAYERS];
new ayamjob[MAX_PLAYERS];
//=========[ DISCORD ]============//
new DCC_Channel:g_Discord_Serverstatus;

enum
{
	//JOBBALKOTi
	DIALOG_GPS_PETANI,
	DIALOG_DISNAKER,
	DIALOG_LINGGIS,
	DIALOG_PEMERINTAH,
    DIALOG_GPS_KAYU,
	DIALOG_GARASIPD,
	DIALOG_AIRDROP,
	DIALOG_GPS_ATM,
	DIALOG_INVOICE,
	DIALOG_INVOICE2,
	DIALOG_INVOICE3,
	DIALOG_GPS_BANK,
	DIALOG_GUDANGBARU,
	DIALOG_GPS_REYCYCLER,
	DIALOG_GARASIMD,
	DIALOG_GARASIPEDAGANG,
	DIALOG_INPUTFUEL,
	DIALOG_WITHDEPO,
	DIALOG_KARGO,
	DIALOG_LOCKERAYAM,
	DIALOG_WALLPAPER,
	DIALOG_TOREPORTS,
	DIALOG_NANAMBIBIT,
	DIALOG_INSURANCE,
	DIALOG_ASURANSI,
	DIALOG_BELIBIBIT,
	DIALOG_PROSESTANI,
	DIALOG_ACCREPORTS,
	DIALOG_ONDUTY,
	DIALOG_MULAIBOX,
	DIALOG_LOCKERPEMERAH,
	DIALOG_DOKUMEN,
	DIALOG_LOCKERPENJAHIT,
	DIALOG_GOJEK,
	DIALOG_SKS,
	DIALOG_SKS1,
	DIALOG_GOPAY,
	DIALOG_VOICE, 
	DIALOG_LOCKERMINYAK,
	DIALOG_GOTOPUP,
	DIALOG_GOFOOD,
	DIALOG_GOCAR,
	DIALOG_GPS_BUS,
	DIALOG_GPSPENJAHIT,
	DIALOG_VRM,
	DIALOG_LOCKERPENAMBANG,
	DIALOG_TINGGI,
	DIALOG_BERAT,
	DIALOG_AYAMFILL,
	DIALOG_REPORTS,
	//dialog radial menu DENTOT
	DIALOG_RADIAL,
	DIALOG_FRAKSI,
	DIALOG_TREATMENT,
	DIALOG_GELEDAH,
	DIALOG_REVIVE,
	DIALOG_BORGOL,
	DIALOG_WT,
	DIALOG_UNBORGOL,
	DIALOG_PERIKSA,
	DIALOG_BANDARA,
    DIALOG_WASSAP,
	DIALOG_HOLIMARKET,
	DIALOG_ELIST,
	DIALOG_RADIO,
	DIALOG_GPSSPAREPART,
	DIALOG_LOCKERGOJEK,
	//modshop
	DIALOG_GIVE,
	DIALOG_AMOUNT,
	DIALOG_MODSHOP,
	DIALOG_MAKE_CHAR,
	DIALOG_CHARLIST,
	DIALOG_VERIFYCODE,
	DIALOG_UNUSED,
    DIALOG_LOGIN,
    DIALOG_REGISTER,
    DIALOG_AGE,
	DIALOG_GENDER,
	DIALOG_EMAIL,
	DIALOG_PASSWORD,
	DIALOG_STATS,
	DIALOG_SETTINGS,
	DIALOG_HBEMODE,
	DIALOG_CHANGEAGE,
	DIALOG_GOLDSHOP,
	// MODSHOP
	DIALOG_MODMENU,
	DIALOG_MODTOY,
	DIALOG_MODTBUY,
	DIALOG_MODTEDIT,
	DIALOG_MODTPOSX,
	DIALOG_MODTPOSY,
	DIALOG_MODTPOSZ,
	DIALOG_MODTPOSRX,
	DIALOG_MODTPOSRY,
	DIALOG_MODTPOSRZ,
	DIALOG_MODTSELECTPOS,
	DIALOG_MODTSETVALUE,
	DIALOG_MODTSETCOLOUR,
	DIALOG_MODTSETPOS,
	DIALOG_MODTACCEPT,
	DIALOG_GOLDNAME,
	DIALOG_SELL_BISNISS,
	DIALOG_SELL_BISNIS,
	DIALOG_MY_BISNIS,
	DIALOG_MENU,
	DIALOG_MENUMASAK,
	DIALOG_LOCKERPEDAGANG,
	DIALOG_LOCKFAMS,
	DIALOG_GPS_KARGO,
	DIALOG_MENUMINUM,
	DIALOG_GUDANGPEDAGANG,
	DIALOG_SIMPAN,
	DIALOG_SIMPANUANG,
	DIALOG_TAKEMONEY,
	DIALOG_TAKE,
	DIALOG_WEAPONPEDAGANG,
	DIALOG_MMENU,
	BISNIS_MENU,
	BISNIS_INFO,
	BISNIS_NAME,
	BISNIS_VAULT,
	BISNIS_WITHDRAW,
	BISNIS_DEPOSIT,
	BISNIS_BUYPROD,
	BISNIS_EDITPROD,
	BISNIS_PRICESET,
	DIALOG_SELL_HOUSES,
	DIALOG_SELL_HOUSE,
	DIALOG_MY_HOUSES,
	DIALOG_MY_SG,
	DIALOG_SG_MENU,
	DIALOG_SETNAME,
	DIALOG_MAT,
	DIALOG_COM,
	DIALOG_UANG,
	DIALOG_COM2,
	DIALOG_MAT2,
	DIALOG_AMBILUANG,
	DIALOG_DEPOUANG,
	HOUSE_INFO,
	HOUSE_STORAGE,
	HOUSE_WEAPONS,
	HOUSE_MONEY,
	HOUSE_REALMONEY,
	HOUSE_WITHDRAW_REALMONEY,
	HOUSE_DEPOSIT_REALMONEY,
	HOUSE_REDMONEY,
	HOUSE_WITHDRAW_REDMONEY,
	HOUSE_DEPOSIT_REDMONEY,
	HOUSE_FOODDRINK,
	HOUSE_FOOD,
	HOUSE_FOOD_DEPOSIT,
	HOUSE_FOOD_WITHDRAW,
	HOUSE_DRINK,
	HOUSE_DRINK_DEPOSIT,
	HOUSE_DRINK_WITHDRAW,
	HOUSE_DRUGS,
	HOUSE_MEDICINE,
	HOUSE_MEDICINE_DEPOSIT,
	HOUSE_MEDICINE_WITHDRAW,
	HOUSE_MEDKIT,
	HOUSE_MEDKIT_DEPOSIT,
	HOUSE_MEDKIT_WITHDRAW,
	HOUSE_BANDAGE,
	HOUSE_BANDAGE_DEPOSIT,
	HOUSE_BANDAGE_WITHDRAW,
	HOUSE_OTHER,
	HOUSE_SEED,
	HOUSE_SEED_DEPOSIT,
	HOUSE_SEED_WITHDRAW,
	HOUSE_MATERIAL,
	HOUSE_MATERIAL_DEPOSIT,
	HOUSE_MATERIAL_WITHDRAW,
	HOUSE_COMPONENT,
	HOUSE_COMPONENT_DEPOSIT,
	HOUSE_COMPONENT_WITHDRAW,
	HOUSE_MARIJUANA,
	HOUSE_MARIJUANA_DEPOSIT,
	HOUSE_MARIJUANA_WITHDRAW,
	DIALOG_TRACK,
	DIALOG_TRACK_PH,
	DIALOG_INFO_BIS,
	DIALOG_INFO_HOUSE,
	DIALOG_FINDVEH,
	DIALOG_TRACKVEH,
	DIALOG_TRACKVEH2,
	DIALOG_TRACKPARKEDVEH,
	DIALOG_GOTOVEH,
	DIALOG_GETVEH,
	DIALOG_DELETEVEH,
	DIALOG_BUYPV,
	DIALOG_BUYVIPPV,
	DIALOG_BUYPLATE,
	DIALOG_LOCKVEH,
	DIALOG_BUYPVCP,
	DIALOG_BUYPVCP_BIKES,
	DIALOG_BUYPVCP_CARS,
	DIALOG_BUYPVCP_UCARS,
	DIALOG_BUYPVCP_JOBCARS,
	DIALOG_BUYPVCP_VIPCARS,
	DIALOG_BUYPVCP_CONFIRM,
	DIALOG_BUYPVCP_VIPCONFIRM,
	DIALOG_RENT_JOBCARS,
	DIALOG_RENT_JOBCARSCONFIRM,
	DIALOG_SKINFAM,
	DIALOG_RENT_BOAT,
	DIALOG_RENT_BOATCONFIRM,
	DIALOG_RENT_BIKE,
	DIALOG_RENT_BIKECONFIRM,
	DIALOG_GARKOT,
	DIALOG_GUDANG,
	DIALOG_MY_VEHICLE,
	DIALOG_TOY,
	DIALOG_TOYEDIT,
	DIALOG_TOYEDIT_ANDROID,
	DIALOG_TOYPOSISI,
	DIALOG_TOYPOSISIBUY,
	DIALOG_TOYBUY,
	DIALOG_TOYVIP,
	DIALOG_TOYPOSX,
	DIALOG_TOYPOSY,
	DIALOG_TOYPOSZ,
	DIALOG_TOYPOSRX,
	DIALOG_TOYPOSRY,
	DIALOG_TOYPOSRZ,
	DIALOG_TOYPOSSX,
	DIALOG_TOYPOSSY,
	DIALOG_TOYPOSSZ,
	//ingame map
	DIALOG_MTEDIT,
	DIALOG_EDIT,
	DIALOG_X,
	DIALOG_Y,
	DIALOG_Z,
	DIALOG_RX,
	DIALOG_RY,
	DIALOG_RZ,
	DIALOG_MTC,
	DIALOG_COORD,
	DIALOG_MTX,
	DIALOG_MTY,
	DIALOG_MTZ,
	DIALOG_MTRX,
	DIALOG_MTRY,
	DIALOG_MTRZ,
	DIALOG_HELP,
	DIALOG_GPS,
	DIALOG_JOB,
	DIALOG_KAYU,
	DIALOG_GPS_MINYAK,
	DIALOG_GPS_SUSU,
	DIALOG_GPS_PENAMBANG,
	DIALOG_GPS_JOB,
	DIALOG_GPS_PUBLIC,
	DIALOG_GPS_PROPERTIES,
	DIALOG_GPS_GENERAL,
	DIALOG_GPS_MISSION,
	DIALOG_GPS_AYAM,
	DIALOG_TRACKBUSINESS,
	DIALOG_ELECTRONIC_TRACK,
	DIALOG_PAYBILL,
	DIALOG_PAY,
	DIALOG_EDITBONE,
	FAMILY_SAFE,
	FAMILY_STORAGE,
	FAMILY_WEAPONS,
	FAMILY_MARIJUANA,
	FAMILY_WITHDRAWMARIJUANA,
	FAMILY_DEPOSITMARIJUANA,
	FAMILY_COMPONENT,
	FAMILY_WITHDRAWCOMPONENT,
	FAMILY_DEPOSITCOMPONENT,
	FAMILY_MATERIAL,
	FAMILY_WITHDRAWMATERIAL,
	FAMILY_DEPOSITMATERIAL,
	FAMILY_MONEY,
	FAMILY_WITHDRAWMONEY,
	FAMILY_DEPOSITMONEY,
	FAMILY_INFO,
	DIALOG_SERVERMONEY,
	DIALOG_SERVERMONEY_STORAGE,
	DIALOG_SERVERMONEY_WITHDRAW,
	DIALOG_SERVERMONEY_DEPOSIT,
	DIALOG_SERVERMONEY_REASON,
	DIALOG_LOCKERSAPD,
	DIALOG_WEAPONSAPD,
	DIALOG_LOCKERSAGS,
	DIALOG_WEAPONSAGS,
	DIALOG_LOCKERSAMD,
	DIALOG_WEAPONSAMD,
	DIALOG_DRUGSSAMD,
	DIALOG_LOCKERSANEW,
	DIALOG_WEAPONSANEW,
	DIALOG_LOCKERVIP,
	DIALOG_SERVICE,
	DIALOG_SERVICE_COLOR,
	DIALOG_SERVICE_COLOR2,
	DIALOG_SERVICE_PAINTJOB,
	DIALOG_SERVICE_WHEELS,
	DIALOG_SERVICE_SPOILER,
	DIALOG_SERVICE_HOODS,
	DIALOG_SERVICE_VENTS,
	DIALOG_SERVICE_LIGHTS,
	DIALOG_SERVICE_EXHAUSTS,
	DIALOG_SERVICE_FRONT_BUMPERS,
	DIALOG_SERVICE_REAR_BUMPERS,
	DIALOG_SERVICE_ROOFS,
	DIALOG_SERVICE_SIDE_SKIRTS,
	DIALOG_SERVICE_BULLBARS,
	DIALOG_SERVICE_NEON,
	DIALOG_MENU_TRUCKER,
	DIALOG_SHIPMENTS,
	DIALOG_SHIPMENTS_VENDING,
	DIALOG_HAULING,
	DIALOG_RESTOCK,
	DIALOG_RESTOCK_VENDING,
	DIALOG_ARMS_GUN,
	DIALOG_PLANT,
	DIALOG_EDIT_PRICE,
	DIALOG_EDIT_PRICE1,
	DIALOG_EDIT_PRICE2,
	DIALOG_EDIT_PRICE3,
	DIALOG_EDIT_PRICE4,
	DIALOG_OFFER,
	DIALOG_MATERIAL,
	DIALOG_COMPONENT,
	DIALOG_DRUGS,
	DIALOG_FOOD,
	DIALOG_FOOD_BUY,
	DIALOG_SEED_BUY,
	DIALOG_PRODUCT,
	DIALOG_GASOIL,
	DIALOG_APOTEK,
	DIALOG_ATM,
	DIALOG_TRACKATM,
	DIALOG_ATMDEPOSIT,
	DIALOG_ATMWITHDRAW,
	DIALOG_BSHOP,
	DIALOG_BANK,
	DIALOG_BANKDEPOSIT,
	DIALOG_BANKWITHDRAW,
	DIALOG_BANKREKENING,
	DIALOG_BANKTRANSFER,
	DIALOG_BANKCONFIRM,
	DIALOG_BANKSUKSES,
	DIALOG_PHONE,
	DIALOG_TWITTER,
	DIALOG_TWITTERPOST,
	DIALOG_TWITTERNAME,
	DIALOG_PHONE_ADDCONTACT,
	DIALOG_PHONE_CONTACT,
	DIALOG_PHONE_NEWCONTACT,
	DIALOG_SHARELOC,
	DIALOG_PHONE_INFOCONTACT,
	DIALOG_PHONE_SENDSMS,
	DIALOG_PHONE_TEXTSMS,
	DIALOG_PHONE_DIALUMBER,
	DIALOG_TOGGLEPHONE,
	DIALOG_TOGGLE,
	DIALOG_IBANK,
	DIALOG_AYAM,
	DIALOG_ASKS,
	DIALOG_SALARY,
	DIALOG_PAYCHECK,
	DIALOG_BUS,
	DIALOG_RUTE_BUS,
	DIALOG_HEALTH,
	DIALOG_OBAT,
	DIALOG_ISIKUOTA,
	DIALOG_DOWNLOAD,
	DIALOG_KUOTA,
	DIALOG_STUCK,
	DIALOG_TDM,
	DIALOG_PICKUPVEH,
	DIALOG_TRACKPARK,
	DIALOG_MY_WS,
	DIALOG_TRACKWS,
	WS_MENU,
	WS_SETNAME,
	WS_SETOWNER,
	WS_SETEMPLOYE,
	WS_SETEMPLOYEE,
	WS_SETOWNERCONFIRM,
	WS_SETMEMBER,
	WS_SETMEMBERE,
	WS_MONEY,
	WS_WITHDRAWMONEY,
	WS_DEPOSITMONEY,
	WS_COMPONENT,
	WS_COMPONENT2,
	WS_MATERIAL,
	WS_MATERIAL2,
	DIALOG_ACTORANIM,
	DIALOG_MY_VENDING,
	DIALOG_VENDING_INFO,
	DIALOG_VENDING_BUYPROD,
	DIALOG_VENDING_MANAGE,
	DIALOG_VENDING_NAME,
	DIALOG_VENDING_VAULT,
	DIALOG_VENDING_WITHDRAW,
	DIALOG_VENDING_DEPOSIT,
	DIALOG_VENDING_EDITPROD,
	DIALOG_VENDING_PRICESET,
	DIALOG_VENDING_RESTOCK,
	DIALOG_MYVEH_INFO,
	DIALOG_SPAWN_1,
	DIALOG_MYVEH,
	DIALOG_MYVEH1,
	DIALOG_FAMILY_INTERIOR,
	DIALOG_FACTIONN,
	DIALOG_LAPORANPD,
	DIALOG_SPAREPART,
	DIALOG_BUYPARTS,
	DIALOG_BUYPARTS_DONE,
	VEHICLE_STORAGE,
	VEHICLE_WEAPON,
	VEHICLE_MONEY,
	VEHICLE_REALMONEY,
	VEHICLE_REALMONEY_WITHDRAW,
	VEHICLE_REALMONEY_DEPOSIT,
	VEHICLE_REDMONEY,
	VEHICLE_REDMONEY_WITHDRAW,
	VEHICLE_REDMONEY_DEPOSIT,
	VEHICLE_DRUGS,
	VEHICLE_MEDICINE,
	VEHICLE_MEDICINE_WITHDRAW,
	VEHICLE_MEDICINE_DEPOSIT,
	VEHICLE_MEDKIT,
	VEHICLE_MEDKIT_WITHDRAW,
	VEHICLE_MEDKIT_DEPOSIT,
	VEHICLE_BANDAGE,
	VEHICLE_BANDAGE_WITHDRAW,
	VEHICLE_BANDAGE_DEPOSIT,
	VEHICLE_OTHER,
	VEHICLE_SEED,
	VEHICLE_SEED_WITHDRAW,
	VEHICLE_SEED_DEPOSIT,
	VEHICLE_MATERIAL,
	VEHICLE_MATERIAL_WITHDRAW,
	VEHICLE_MATERIAL_DEPOSIT,
	VEHICLE_COMPONENT,
	VEHICLE_COMPONENT_WITHDRAW,
	VEHICLE_COMPONENT_DEPOSIT,
	VEHICLE_MARIJUANA,
	VEHICLE_MARIJUANA_WITHDRAW,
	VEHICLE_MARIJUANA_DEPOSIT,
	DIALOG_NONRPNAME,
	//CONTAINER
	DIALOG_CONTAINER,
	//bb
	DIALOG_BOOMBOX,
	DIALOG_BOOMBOX1,
	//dealership
	DIALOG_FIND_DEALER,
	DIALOG_BUYDEALERCARS_CONFIRM_M,
	DIALOG_BUYJOBCARSVEHICLE,
	DIALOG_ACLAIM,
	DIALOG_BUYDEALERCARS_CONFIRM,
	DIALOG_BUYTRUCKVEHICLE,
	DIALOG_BUYMOTORCYCLEVEHICLE,
	DIALOG_BUYUCARSVEHICLE,
	DIALOG_BUYCARSVEHICLE,
	DIALOG_DEALER_MANAGE,
	DIALOG_DEALER_VAULT,
	DIALOG_DEALER_WITHDRAW,
	DIALOG_PRISONMENU,
	DIALOG_DEALER_DEPOSIT,
	DIALOG_DEALER_NAME,
	DIALOG_DEALER_RESTOCK,
	DIALOG_TAKEFOOD,
	DIALOG_TDC,
	DIALOG_TDC_PLACE,
	//PEDAGANG
	PEDAGANG_MENU,
	PDG_KENTANG,
	PDG_MINERAL,
	PDG_SNACK,
	PDG_CHICKEN,
	PDG_COCACOLA,
	PDG_JERUK,
	PDG_BURGER,
	PDG_PIZZA,
	PDG_AYAM_FILET,
	//
	PDG_KENTANG1,
	PDG_MINERAL1,
	PDG_SNACK1,
	PDG_CHICKEN1,
	PDG_COCACOLA1,
	PDG_JERUK1,
	PDG_BURGER1,
	PDG_PIZZA1,
	PDG_AYAM_FILET1,
	DIALOG_SPAWNLENZ,
	//---[ DIALOG OWN FARM ]---
	FARM_STORAGE,
	FARM_INFO,
	FARM_POTATO,
	FARM_WHEAT,
	FARM_ORANGE,
	FARM_MONEY,
	FARM_DEPOSITPOTATO,
	FARM_WITHDRAWPOTATO,
	FARM_DEPOSITWHEAT,
	FARM_WITHDRAWWHEAT,
	FARM_DEPOSITORANGE,
	FARM_WITHDRAWORANGE,
	FARM_DEPOSITMONEY,
	FARM_WITHDRAWMONEY,
}

//-----[ Download System ]-----
new download[MAX_PLAYERS];

//-----[ Count System ]-----
new Count = -1;
new countTimer;
new showCD[MAX_PLAYERS];
new CountText[5][5] =
{
	"~r~1",
	"~g~2",
	"~y~3",
	"~g~4",
	"~b~5"
};

//-----[ Rob System ]-----
new robmoney;

//-----[ Server Uptime ]-----
new up_days,
	up_hours,
	up_minutes,
	up_seconds,
	WorldTime = 24,
	WorldWeather = 10;

//idskin
new SpawnMale = mS_INVALID_LISTID,
	SpawnFemale = mS_INVALID_LISTID,
	MaleSkins = mS_INVALID_LISTID,
	FemaleSkins = mS_INVALID_LISTID,
	VIPMaleSkins = mS_INVALID_LISTID,
	VIPFemaleSkins = mS_INVALID_LISTID,
	SAPDMale = mS_INVALID_LISTID,
	SAPDFemale = mS_INVALID_LISTID,
	SAPDWar = mS_INVALID_LISTID,
	SAGSMale = mS_INVALID_LISTID,
	SAGSFemale = mS_INVALID_LISTID,
	SAMDMale = mS_INVALID_LISTID,
	SAMDFemale = mS_INVALID_LISTID,
	SANEWMale = mS_INVALID_LISTID,
	SANEWFemale = mS_INVALID_LISTID,
	toyslist = mS_INVALID_LISTID,
	viptoyslist = mS_INVALID_LISTID,
	vtoylist = mS_INVALID_LISTID,
	PDGSkinMale = mS_INVALID_LISTID,
	PDGSkinFemale = mS_INVALID_LISTID,
	TransFender = mS_INVALID_LISTID,
	Waa = mS_INVALID_LISTID,
	LoCo = mS_INVALID_LISTID;

//AFK SYSTEM DENTOT
new afk_check[MAX_PLAYERS];
new afk_tick[MAX_PLAYERS];
new afk_time[MAX_PLAYERS];
//-----[ Faction Vehicle ]-----	
#define VEHICLE_RESPAWN 7200

//-----[ Showroom Checkpoint ]-----	
new ShowRoomCP;
new pintupolis1;
new cbugwarn[MAX_PLAYERS];
new pintupolis2;
new DutyTimer;
// new MalingKendaraan;
new pintugerak1;
new pintugerak2;

//-----[ MySQL Connect ]-----	
new MySQL: g_SQL;

new TogOOC = 1;

new bool:DialogHauling[7];
new bool:DialogSaya[MAX_PLAYERS][7];
// new TrailerContainer[MAX_VEHICLES];

//-----[ Player Data ]-----	
enum E_PLAYERS
{
	pID,
	pUCP[22],
	pExtraChar,
	pChar,
	pName[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	bool:pAhide,
	pIP[16],
	pTrackDealer,
	pVerifyCode,
	pPassword[65],
	pInputPassword[65],
	pSalt[17],
	pEmail[40],
	pBotol,
	pAdmin,
	pHelper,
	pClikmap,
	pPancingan,
	pUmpan,
	pLevel,
	pLevelUp,
	pVip,
	pVipTime,
	pGold,
	pSteak,
	pRegDate[50],
	pLastLogin[50],
	pDutyBox,
	pRokok,
	pBox,
	pKaret,
	pDapatBox,
	pSks,
	pMoney,
	pRedMoney,
	Text3D:pMaskLabel,
	pBankMoney,
	pInputMoney,
	pInputFuel,
	pKayu,
	pToggleBank,
	pLinggis,
	pBankRek,
	pPhone,
	pgivektp,
	pPhoneCredit,
	pContact,
	pPhoneBook,
	pDeathTime,
	pSMS,
	pCall,
	pCallTime,
	pWT,
	pHours,
	pMinutes,
	pSeconds,
	pPaycheck,
	pSkin,
	pFacSkin,
	pJobSkin,
	pGender,
	pDelaypernikahan,
	pDelayminyak,
	pAge[50],
	pDutyJob,
	pGetPARKID,
	pInDoor,
	pdelaymancing,
	pInHouse,
	pTogName,
	pInBiz,
	pInVending,
	pInFamily,
	Float: pPosX,
	Float: pPosY,
	Float: pPosZ,
	Float: pPosA,
	Float:pPos[4],
	pInt,
	pWorld,
	Float:pHealth,
    Float:pArmour,
    pVest,
	pHunger,
	pEnergy,
	pBladder,
	pBladderTime,
	pKencing,
	pKencingTime,
	pHungerTime,
	pEnergyTime,
	pSick,
	pSickTime,
	pHospital,
	Text3D:pBensinLabel,
	pHospitalTime,
	pInjured,
	Text3D: pInjuredLabel,
	pOnDuty,
	pOnDutyTime,
	pFaction,
	pFactionRank,
	pObatStress,
	pPerban,
	pFactionLead,
	pTazer,
	pBroadcast,
	pNewsGuest,
	pFamily,
	pFamilyRank,
	pJail,
	pJailTime,
	pArrest,
	pArrestTime,
	pWarn,
	pJob,
	pJob2,
	pJobTime,
	pExitJob,
	pMedicine,
	pMedkit,
	pMask,
	pHelmet,
	pCig,
	pMineral,
	pPizza,
	pBurger,
	pChiken,
	pCola,
	//makanan di market
	pSnack,
	pKebab,
	pCappucino,
	pRoti,
	pWallpaper,
	pStarling,
	pSprunk,
	pMilxMax,
	//-----------------
	pGas,
	pBandage,
	pGopay,
	pGPS,
	pGpsActive,
	pMaterial,
	pComponent,
	pFood,
	pSeed,
	//MANCING
	pPenyu,
	pMakarel,
	pNemo,
 	pBlueFish,
	//PETANI
	pPadi,
	pCabai,
	pJagung,
	pTebu,
	pPadiOlahan,
	pCabaiOlahan,
	pJagungOlahan,
	pTebuOlahan,
	pBeras,
	pSambal,
	pGula,
	pTepung,
	//
	pPotato,
	pWheat,
	pOrange,
	pPrice1,
	pPrice2,
	pPrice3,
	Text3D:AdminTag,
	pPrice4,
	pMarijuana,
	pKanabis,
	pPlant,
	pPlantTime,
	pInSt,
	pFishTool,
	pInstallDweb,
	pMenuTypeStorage,
	pIns,
	pWorm,
	pFish,
	//AFK
	Float:pAFKPos[6],
	pAFK,
	pAFKTime,
	//bus
	Kontol,
	Memek,
	pInFish,
	//pSkck,
	//pSkckTime,
	pIDCard,
	pIDCardTime,
	pDriveLic,
	pDriveLicTime,
	pDriveLicApp,
	pBoatLic,
	pBoatLicTime,
	pWeaponLic,
	pWeaponLicTime,
	pBizLic,
	pBizLicTime,
	pBpjs,
	pBpjsTime,
	pFlyLic,
	pFlyLicTime,
	pGuns[13],
    pAmmo[13],
	pWeapon,
	//Not Save
	Cache:Cache_ID,
	bool: IsLoggedIn,
	LoginAttempts,
	LoginTimer,
	pSpawned,
	pSpawnList,
	pAdminDuty,
	pFreezeTimer,
	pFreeze,
	pMaskID,
	pMaskOn,
	pSPY,
	pTogPM,
	pTogLog,
	pTogAds,
	pTogWT,
	pBuluAyam,
	Text3D:pAdoTag,
	Text3D:pBTag,
	bool:pBActive,
	bool:pAdoActive,
	pFlare,
	bool:pFlareActive,
	sampahsaya,
	//=======[ PEMERAS SUSU ]======
	pSusu,
	bool:pJobmilkduty,
	pMilkJob,
	pMilkJobStatus,
	bool:pLoading,
	pSusuOlahan,
	//========[ Duty Job ]========
	bool:DutyPenambang,
	bool:DutyMinyak,
	bool:DutyPemotong,
	//=============================
	pPeluru[2],
	pDe,
	pKatana,
	pMolotov,
	p9mm,
	pSg,
	pSpas,
	pMp5,
	pM4,
	pClip,
	//================
	pTrackCar,
	pBuyPvModel,
	pTrackHouse,
	pTrackBisnis,
	pTrackVending,
	pFacInvite,
	pFacOffer,
	pFamInvite,
	pFamOffer,
	pFindEms,
	pCuffed,
	toySelected,
	bool:PurchasedToy,
	pEditingItem,
	pProductModify,
	pEditingVendingItem,
	pVendingProductModify,
	pCurrSeconds,
	pCurrMinutes,
	pCurrHours,
	pSpec,
	playerSpectated,
	pFriskOffer,
	pDragged,
	pDraggedBy,
	pDragTimer,
	pHBEMode,
	pHelmetOn,
	pReportTime,
	pAskTime,
	//Player Progress Bar
	PlayerBar:spfuelbar,
	PlayerBar:spdamagebar,
	PlayerBar:sphungrybar,
	PlayerBar:spenergybar,
	PlayerBar:activitybar,
	pPart,
	pPartStatus,
	pProducting,
	pProductingStatus,
	Text3D:cNametag,
	pPemotong,
	pPemotongStatus,
	pCooking,
	pCookingStatus,
	pArmsDealer,
	pArmsDealerStatus,
	// Roleplay Booster
 	pBooster,
 	pBoostTime,
	pMechanic,
	pMechanicStatus,
	pActivity,
	pActivityStatus,
	pActivityTime,
	pCs,
	//Penambang
	pTimeTambang1,
	pTimeTambang2,
	pTimeTambang3,
	pTimeTambang4,
	pTimeTambang5,
	pTimeTambang6,
	//Jobs
	pSideJob,
	pSideJobTime,
	pBustime,
	pBusRute,
	pBusTime,
	bool:pBuswaiting,
	bool:TempatHealing,
	pSparepartTime,
	pGetJob,
	pGetJob2,
	pMechDuty,
	pAmbilCar,
	pLagiDealer,
	pKendaraanDealer,
	pKendaraanKerja,
	pLagiCarSteal,
	pMechVeh,
	pKendaraanFraksi,
	pMechColor1,
	pMechColor2,
	EditingTrash,
	EditingGarkot,
	//ATM
	EditingATMID,
	//lumber job
	pKamera,
	EditingTreeID,
	CuttingTreeID,
	bool:CarryingLumber,
	//Storage
	ST_MENU,
	ST_MONEY,
	ST_WITHDRAWMONEY,
	ST_DEPOSITMONEY,
	ST_COMPONENT,
	ST_COMPONENT2,
	ST_MATERIAL,
	ST_MATERIAL2,
	//Container
	pSedangContainer,
	//ROB
	pLockPick,
	BankDelay,
	pRobStatus,
	RobbankTime,
	RobatmTime,
	RobbizTime,
	//Vending
	EditingVending,
	//production
	CarryProduct,
	//part job
	CarryPart,
	//trucker
	pMission,
	pHauling,
	pVendingRestock,
	bool: CarryingBox,
	//kejar
	pCheckpointTarget,
	//Farmer
	pHarvest,
	pHarvestID,
	pOffer,
	//Bank
	pTransfer,
	pTransferRek,
	pTransferName[128],
	//Gas Station
	pFill,
	pFillStatus,
	pFillTime,
	pFillPrice,
	//boombox
	pBoombox,
	//Gate
	gEditID,
	gEdit,
	// WBR
	pHead,
 	pPerut,
 	pLHand,
 	pRHand,
 	pLFoot,
 	pRFoot,
 	// Inspect Offer
 	pInsOffer,
 	// Obat System
 	pObat,
 	// Suspect
 	pSuspectTimer,
 	pSuspect,
 	// Phone On Off
 	pPhoneStatus,
 	// Kurir
 	pKurirEnd,
 	// Shareloc Offer
 	pLocOffer,
 	// Register tinggi dan berat badan
 	// pTinggi[50],
 	// pBerat[50],
 	//download app handphone
 	pInstallTweet,
 	pInstallGojek,
 	pInstallMap,
 	pInstallBank,
 	// Twitter
 	pTwitter,
	pTwitterStatus, 
	pTwittername[MAX_PLAYER_NAME],
	pTwitterPostCooldown,
	pTwitterNameCooldown,
 	pRegTwitter,
 	// Kuota
 	pKuota,
 	// DUTY SYSTEM
 	pDutyHour,
 	//pemotong ayam
 	ayamcp,
	timerambilayamhidup,
    timerpotongayam,
    timerpackagingayam,
    timerjualayam,
    AmbilAyam,
    DutyAmbilAyam,
    AyamHidup,
	AyamPotong,
	AyamFillet,
	sedangambilayam,
    sedangpotongayam,
    sedangfilletayam,
    sedangjualayam,
 	// CHECKPOINT
 	pCP,
 	// ROBBERY
 	pRobTime,
 	pRobOffer,
 	pRobLeader,
 	pRobMember,
 	pMemberRob,
 	pKargo,
	pTrailer,
	// Smuggler
	bool:pTakePacket,
	pTrackPacket,
	// Garkot
	pPark,
	pLoc,
	//robbank
	pPanelHacking,
	pBomb,
	// WS
	pMenuType,
	pInWs,
	pTransferWS,
	//PENJAHIT
	pKain,
	pWool,
	pPakaian,
	//Anticheat
	pACWarns,
	pACTime,
	pRadioVoice,
	pTombolVoice,
	pTombolVoiceRadio,
	pTombolVoiceAdmin,
	pCallStage,
	pCallLine,
	pCalling,
	pJetpack,
	pArmorTime,
	pLastUpdate,
	//Checkpoint
	pCheckPoint,
	pBus,
	//SpeedCam
	pSpeedTime,
	//Starterpack
	pStarterpack,
	//inventkry
	PilihSpawn,
	pProgress,
	Float:pWeight,
	pilihbensin,
	WaktuWarung,
	pMasukinNama,
	pilihkarakter,
	pMasukinKelamin,
	pSelectItem,
	pTarget,
	pGiveAmount,
	//Anim
	pLoopAnim,
	//Rob Car
	pLastChop,
	pLastChopTime,
	pIsStealing,
	//Sparepart
	pSparepart,
	//
	pUangKorup,
	//Senter
	pFlashlight,
	pUsedFlashlight,
	//Moderator
	pServerModerator,
	pEventModerator,
	pFactionModerator,
	pFamilyModerator,
	//
	pPaintball,
	pPaintball2,
	//
	pDelayIklan,
	pTukar,
	//PENAMBANG
	pBatu,
	pBatuCucian,
	pBorax,
	pKecubung,
	pPaketborax,
	pPaketkecubung,
	pTujuan[100],
	pOngkos[50],
	pEmas,
	pBesi,
	pAluminium,
	//PENAMBANGMINYAK
	pMinyak,
	pEssence,
	//Pedagang
	pdgMenuType,
	pInPdg,
	//-----[ FARM PRIVATE]
	pFarm,
	pFarmRank,
	pFarmInvite,
	pFarmOffer,
	//GPS TAG HAN
	pWaypoint,
	pLocation[32],
	Float:pWaypointPos[3],
	PlayerText:pTextdraws[83],
	//SEATBLET
	pSeatbelt,
	// Vehicle Toys
	EditStatus,
	VehicleID,
	pInDealer
};
new pData[MAX_PLAYERS][E_PLAYERS];
new g_MysqlRaceCheck[MAX_PLAYERS];
#define PlayerData pData
#define PlayerInfo PlayerData

//-----[ Smuggler ]-----	

new Text3D:packetLabel,
	packetObj,
	Float:paX, 
	Float:paY, 
	Float:paZ;

//-----[ Forklifter Object ]-----	
// new 
// 	VehicleObject[MAX_VEHICLES] = {-1, ...};

//-----[ Lumber Object Vehicle ]-----	
#define MAX_BOX 50
#define BOX_LIFETIME 100
#define BOX_LIMIT 5

// enum    E_BOX
// {
// 	boxDroppedBy[MAX_PLAYER_NAME],
// 	boxSeconds,
// 	boxObjID,
// 	boxTimer,
// 	boxType,
// 	Text3D: boxLabel
// }
// new BoxData[MAX_BOX][E_BOX],
// 	Iterator:Boxs<MAX_BOX>;

new
	BoxStorage[MAX_VEHICLES][BOX_LIMIT];

//-----[ Trucker ]-----	
new VehProduct[MAX_VEHICLES];
new VehGasOil[MAX_VEHICLES];
new VehParts[MAX_VEHICLES];


//-----[ Type Checkpoint ]-----	
enum
{
	CHECKPOINT_NONE = 0,
	CHECKPOINT_DRIVELIC,
	CHECKPOINT_MISC,
	CHECKPOINT_BUS
}

//-----[ Storage Limit ]-----	
enum
{
	LIMIT_SNACK,
	LIMIT_SPRUNK,
	LIMIT_MEDICINE,
	LIMIT_MEDKIT,
 	LIMIT_BANDAGE,
 	LIMIT_SEED,
	LIMIT_MATERIAL,
	LIMIT_COMPONENT,
	LIMIT_MARIJUANA
};

//-----[ eSelection Define ]-----	
#define 	SPAWN_SKIN_MALE 		1
#define 	SPAWN_SKIN_FEMALE 		2
#define 	SHOP_SKIN_MALE 			3
#define 	SHOP_SKIN_FEMALE 		4
#define 	VIP_SKIN_MALE 			5
#define 	VIP_SKIN_FEMALE 		6
#define 	SAPD_SKIN_MALE 			7
#define 	SAPD_SKIN_FEMALE 		8
#define 	SAPD_SKIN_WAR 			9
#define 	SAGS_SKIN_MALE 			10
#define 	SAGS_SKIN_FEMALE 		11
#define 	SAMD_SKIN_MALE 			12
#define 	SAMD_SKIN_FEMALE 		13
#define 	SANA_SKIN_MALE 			14
#define 	SANA_SKIN_FEMALE 		15
#define 	TOYS_MODEL 				16
#define 	VIPTOYS_MODEL 			17
#define 	PDG_SKIN_MALE 			18
#define 	PDG_SKIN_FEMALE 		19
#define 	vtoyslist 		20

//-----[ Modular ]-----	
main() 
{
	SetTimer("onlineTimer", 1000, true);
	SetTimer("TDUpdates", 8000, true);
}
new bool:Warung;
new bool:Nikahan;
#include <textdraw-streamer>
//========= DATA =====================
#include "DATA\COLOR.pwn"
#include "DATA\AFK.pwn"
#include "DATA\DAMAGELOGS.pwn"
#include "DATA\LOADINGPROG.pwn"
#include "NOTIFIKASISYSTEM\INFONOTIF.pwn"
#include "NOTIFIKASISYSTEM\NOTIFIKASI.pwn"
#include "NOTIFIKASISYSTEM\SHOWITEMBOX.pwn"
#include "DATA\UCP.pwn"
#include "DATA\TEXTDRAW.pwn"
#include "DATA\NOPIXELINV.pwn"
#include "DATA\ANIMS.pwn"
#include "DATA\RENTAL.pwn"
#include "DATA\KANABIS.pwn"
#include "DATA\PRIVATE_VEHICLE.pwn"
#include "DYNAMIC\HOUSE.pwn"
#include "DYNAMIC\BISNIS.pwn"
#include "DYNAMIC\GARKOT.pwn"
#include "DYNAMIC\DOOR.pwn"
#include "DYNAMIC\GAS_STATION.pwn"
#include "DYNAMIC\LOCKER.pwn"
#include "DYNAMIC\DEALERSHIP.pwn"
#include "DYNAMIC\GATE.pwn"
#include "DYNAMIC\WORKSHOP.pwn"
#include "DYNAMIC\SPEEDCAM.pwn"
#include "DYNAMIC\ACTOR.pwn"
#include "DYNAMIC\TRASH.pwn"
#include "DYNAMIC\CHECKPOINT.pwn"
#include "DYNAMIC\ROBWARUNG.pwn"
#include "DATA\VSTORAGE.pwn"
#include "DATA\REPORT.pwn"
#include "DATA\ASK.pwn"
#include "DATA\WEAPON_ATTH.pwn"
#include "DATA\TOYS.pwn"
#include "DATA\HELMET.pwn"
#include "DATA\BILLS.pwn"
#include "DATA\SERVER.pwn"
#include "DATA\FAMILY.pwn"
#include "DATA\AUCTION.pwn"
#include "DATA\NATIVE.pwn"
#include "DATA\VOUCHER.pwn"
#include "DATA\SALARY.pwn"
#include "DATA\ATM.pwn"
#include "DATA\ARMS_DEALER.pwn"
#include "DATA\INGAMEMAP.pwn"
#include "DATA\ROB.pwn"
#include "DATA\ROBBANK.pwn"
#include "DATA\MDC.pwn"
#include "DATA\TEXTCLICK.pwn"
#include "DATA\ROBBERY.pwn"
#include "DATA\DMV.pwn"
#include "DATA\ANTICHEAT.pwn"
#include "DATA\VENDING.pwn"
#include "DATA\CONTACT.pwn"
#include "DATA\TOLL.pwn"
#include "DATA\MOD.pwn"
#include "DATA\LADANG.pwn"
#include "DATA\SIREN.pwn"
#include "DATA\STORAGE.pwn"
#include "DATA\GUDANG_PEDAGANG.pwn"
#include "DATA\MODIF.pwn"
//======[ Greenwich ]==========
#include "JOB\TUKANGAYAM.pwn"
#include "JOB\PENAMBANGMINYAK.pwn"
#include "JOB\KARGO.pwn"
#include "JOB\PENAMBANG.pwn"
#include "JOB\RECYCLER.pwn"
#include "JOB\PEMERAHSUSU.pwn"
#include "JOB\SMUGGLER.pwn"
#include "JOB\MANCING.pwn"
#include "JOB\TUKANGKAYU.pwn"
#include "JOB\PENJAHIT.pwn"
#include "JOB\BUS.pwn"
#include "JOB\PETANI.pwn"
#include "JOB\PEMBURU.pwn"
// MODSHOP
#include "DATA\VTOYS.pwn"
#include "DATA\MODSHOP.pwn"
#include "MODSHOP\ANAXY.pwn"

#include "CMD\FACTION.pwn"
#include "CMD\PLAYER.pwn"
#include "CMD\ADMIN.pwn"


#include "DATA\SAPD_TASER.pwn"
#include "DATA\SAPD_SPIKE.pwn"

#include "DATA\DIALOG.pwn"
#include "DATA\MAPPING.pwn"

#include "CMD\ALIAS\ALIAS_PRIVATE_VEHICLE.pwn"
#include "CMD\ALIAS\ALIAS_PLAYER.pwn"
#include "CMD\ALIAS\ALIAS_BISNIS.pwn"
#include "CMD\ALIAS\ALIAS_ADMIN.pwn"
#include "CMD\ALIAS\ALIAS_HOUSE.pwn"

#include "DATA\EVENT.pwn"

#include "DATA\FUNCTION.pwn"

#include "DATA\TASK.pwn"

#include "CMD\DISCORD.pwn"

native SendClientCheck(playerid, type, arg, offset, size);

//-----[ Discord Status ]-----	
forward BotStatus();
public BotStatus()
{
    new h = 0, m = 0, secs = 0, statuz[256];
	h = floatround(upt / 3600);
	m = floatround((upt / 60) - (h * 60));
	secs = floatround(upt - ((h * 3600) + (m * 60)));
	upt++;
	format(statuz,sizeof(statuz),"📶 %d/%d Civil | %02dj %02dm %02ds | Greenwich Roleplay | ☁️ Powered by Alendra's", pemainic, GetMaxPlayers(), h, m, secs);
	DCC_SetBotActivity(statuz);
}




forward splits(const strsrc[], strdest[][], delimiter);
public splits(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
		if(strsrc[i]==delimiter || i==strlen(strsrc)){
			len = strmid(strdest[aNum], strsrc, li, i, 128);
			strdest[aNum][len] = 0;
			li = i+1;
			aNum++;
		}
		i++;
	}
	return 1;
}

stock FIXES_valstr(dest[], value, bool:pack = false)
{
    // format can't handle cellmin properly
    static const cellmin_value[] = !"-2147483648";

    if (value == cellmin)
        pack && strpack(dest, cellmin_value, 12) || strunpack(dest, cellmin_value, 12);
    else
        format(dest, 12, "%d", value) && pack && strpack(dest, dest, 12);
}

stock number_format(number)
{
	new i, string[15];
	FIXES_valstr(string, number);
	if(strfind(string, "-") != -1) i = strlen(string) - 4;
	else i = strlen(string) - 3;
	while (i >= 1)
 	{
		if(strfind(string, "-") != -1) strins(string, ",", i + 1);
		else strins(string, ",", i);
		i -= 3;
	}
	return string;
}

public DCC_OnMessageCreate(DCC_Message:message)
{
	new realMsg[100];
    DCC_GetMessageContent(message, realMsg, 100);
    new bool:IsBot;
    new DCC_Channel:g_Discord_Chat;
    g_Discord_Chat = DCC_FindChannelById("981567510006624266");
    new DCC_Channel:channel;
 	DCC_GetMessageChannel(message, channel);
    new DCC_User:author;
	DCC_GetMessageAuthor(message, author);
    DCC_IsUserBot(author, IsBot);
    if(channel == g_Discord_Chat && !IsBot) //!IsBot will block BOT's message in game
    {
        new user_name[32 + 1], str[152];
       	DCC_GetUserName(author, user_name, 32);
        format(str,sizeof(str), "{8a6cd1}[DISCORD] {aa1bb5}%s: {ffffff}%s", user_name, realMsg);
        SendClientMessageToAll(-1, str);
    }

    return 1;
}

stock GetCS(playerid)
{
 	new astring[48];
 	if(pData[playerid][pCs] == 0)format(astring, sizeof(astring), ""RED_E"None");
	else if(pData[playerid][pCs] == 1)format(astring, sizeof(astring), ""LG_E"Approved");
	return astring;
}

function WaktuKeluar(playerid)
{
 	if(IsValidDynamic3DTextLabel(TagKeluar[playerid]))
  		DestroyDynamic3DTextLabel(TagKeluar[playerid]);
}

function RobWarung(playerid)
{
	new value = 500 + random(500), str[500];
	for(new i = 0; i < MAX_ROBBERY; i++)
	{
  		if(IsPlayerInRangeOfPoint(playerid, 2.3, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]))
		{
			GivePlayerMoneyEx(playerid, value);
			format(str,sizeof(str),"You Get ~g~%s Money", FormatMoney(value));
			SuccesMsg(playerid, str);
			new duet[500];
			format(duet, sizeof(duet), "Received_%sx", FormatMoney(value));
			ShowItemBox(playerid, "Uang", duet, 1212, 2);
		 	ApplyActorAnimation(RobberyData[i][robberyID], "ped", "cower",4.0,0,0,0,1,0);
		 	DeletePVar(playerid, "RobArea");
		 	PlayerPlaySound(playerid, 3401, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]);
		 	if(IsValidDynamic3DTextLabel(RobberyData[i][robberyText]))
		  	DestroyDynamic3DTextLabel(RobberyData[i][robberyText]);
		}
	}
}
function NotifHilang(playerid)
{
	for(new i = 0; i < 26; i++)
	{
		TextDrawHideForPlayer(playerid, NotifTwitter[i]);
	}
}
function SambutanHilang(playerid)
{
	PlayerTextDrawHide(playerid, SambutanTD[playerid][0]);
	PlayerTextDrawHide(playerid, SambutanTD[playerid][1]);
}
function SambutanMuncul(playerid)
{
    PlayerTextDrawShow(playerid, SambutanTD[playerid][0]);
    new AtmInfo[560];
   	format(AtmInfo,1000,"%s", GetName(playerid));
	PlayerTextDrawSetString(playerid, SambutanTD[playerid][1], AtmInfo);
    PlayerTextDrawShow(playerid, SambutanTD[playerid][1]);
}
function SimpanHp(playerid)
{
    for(new i = 0; i < 57; i++)
	{
		TextDrawHideForPlayer(playerid, PhoneBaru[i]);
	}
	CancelSelectTextDraw(playerid);
}
function SimpanCall(playerid)
{
    for(new i = 0; i < 30; i++)
	{
		TextDrawHideForPlayer(playerid, PhoneCall[i]);
	}
	CancelSelectTextDraw(playerid);
	RemovePlayerAttachedObject(playerid, 9);
	ClearAnimations(playerid);
}
public OnGameModeInit()
{
    SetGameModeText("Greenwich Roleplay v3");
	JamFivEm = 7;

	SetTimer("TambahDetikFivEM", 4000, true);
	CreateTextDraw();

	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    warnings{i} = 0;
	}
	//SetTimer("YANGTIM", 10000, true);
	////////////////////////////////
	mysql_log(ALL);
	SetTimer("BotStatus", 1000, true);
	SetTimer("BackupDB", 60000, true);

    DCC_FindChannelById("1194291022985957376"); //
	g_cekpin = DCC_FindChannelById("1185287016414461992");
    g_Discord_Serverstatus = DCC_FindChannelById("1183445689804529784");

    g_Discord_CHENH4X = DCC_FindChannelById("973240252162506822");
    
	new MySQLOpt: option_id = mysql_init_options();

	mysql_set_option(option_id, AUTO_RECONNECT, true);

	g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
	if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
	{
		print("MySQL connection failed. Server is shutting down.");
		SendRconCommand("exit");
		return 1;
	}
	print("MySQL connection is successful.");

	mysql_tquery(g_SQL, "SELECT * FROM `server`", "LoadServer");
	mysql_tquery(g_SQL, "SELECT * FROM `doors`", "LoadDoors");
	mysql_tquery(g_SQL, "SELECT * FROM `familys`", "LoadFamilys");
	mysql_tquery(g_SQL, "SELECT * FROM `houses`", "LoadHouses");
	mysql_tquery(g_SQL, "SELECT * FROM `bisnis`", "LoadBisnis");
	mysql_tquery(g_SQL, "SELECT * FROM `gstations`", "LoadGStations");
	mysql_tquery(g_SQL, "SELECT * FROM `atms`", "LoadATM");
	mysql_tquery(g_SQL, "SELECT * FROM `gates`", "LoadGates");
	mysql_tquery(g_SQL, "SELECT * FROM `vouchers`", "LoadVouchers");
	mysql_tquery(g_SQL, "SELECT * FROM `object`", "Object_Load", "");
	mysql_tquery(g_SQL, "SELECT * FROM `matext`", "Matext_Load", "");
	mysql_tquery(g_SQL, "SELECT * FROM `workshop`", "LoadWorkshop");
	mysql_tquery(g_SQL, "SELECT * FROM `dealership`", "LoadDealership");
	mysql_tquery(g_SQL, "SELECT * FROM `parks`", "LoadGarkot");
	mysql_tquery(g_SQL, "SELECT * FROM `trash`", "LoadTrash");
	mysql_tquery(g_SQL, "SELECT * FROM `checkpoint`", "LoadCepe");
	mysql_tquery(g_SQL, "SELECT * FROM `speedcameras`", "LoadSpeedCam");
	mysql_tquery(g_SQL, "SELECT * FROM `actor`", "LoadActor");
	mysql_tquery(g_SQL, "SELECT * FROM `pedagang`", "LoadPedagang");
	mysql_tquery(g_SQL, "SELECT * FROM `robbery`", "Loadrobbery");

	ShowNameTags(false);
	EnableTirePopping(0);
	CreateServerPoint();
	LoadTazerSAPD();
	CreateJoinSmugglerPoint();
	
	mysql_tquery(g_SQL, "SELECT * FROM `lockers`", "LoadLockers");
	robmobil = CreateActor(115, 938.67, 2057.42, 10.82, 5.06);
	SetActorVirtualWorld(robmobil, 0);
	ApplyActorAnimation(robmobil, "COP_AMBIENT", "COPLOOK_LOOP", 4.1, 1, 0, 0, 0, 0);
	new garasi;
	garasi = CreateDynamicObject(1316, 1564.26,-1711.47,5.89 -0.5, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
	SetDynamicObjectMaterial(garasi, 0, 18646, "matcolours", "white", 0xFFCCCC00);
	garasi = CreateDynamicObject(1316, 1122.9467,-1351.8933,13.7770 -0.5, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
	SetDynamicObjectMaterial(garasi, 0, 18646, "matcolours", "white", 0xFFCCCC00);
	garasi = CreateDynamicObject(1316, 515.57, -1798.68, 6.05 -0.5, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
	SetDynamicObjectMaterial(garasi, 0, 18646, "matcolours", "white", 0xFFCCCC00);
	CreateDynamicPickup(19134, 23, 1164.004394,-1201.940551,19.837736, -1, -1, -1, 50);
	CreateDynamic3DTextLabel("| Greenwich Storage |\n| Press "LG_E"ALT {FFFFFF}Get Storage Access |", COLOR_WHITE, 1164.004394,-1201.940551,19.837736, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	/*pintugerak1 = CreateDynamicObject(1560, 1651.209838, -1255.946899, 15.675873, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(pintugerak1, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(pintugerak1, 1, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(pintugerak1, 2, 16640, "a51", "a51_glass", 0x00000000);
	SetDynamicObjectMaterial(pintugerak1, 3, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(pintugerak1, 4, 18646, "matcolours", "grey-90-percent", 0x00000000);
	pintugerak2 = CreateDynamicObject(1560, 1649.721435, -1255.947021, 15.675871, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(pintugerak2, 0, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(pintugerak2, 1, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(pintugerak2, 2, 16640, "a51", "a51_glass", 0x00000000);
	SetDynamicObjectMaterial(pintugerak2, 3, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(pintugerak2, 4, 18646, "matcolours", "grey-90-percent", 0x00000000);*/
  	rusa = CreateDynamicObject(19315, -1911.798583,-2382.167480,30.197269, 0.00000, 0.00000, 0.00000);

	LoadMap();
	
	for (new i; i < sizeof(ColorList); i++) {
    format(color_string, sizeof(color_string), "%s{%06x}%03d %s", color_string, ColorList[i] >>> 8, i, ((i+1) % 16 == 0) ? ("\n") : (""));
    }

    for (new i; i < sizeof(FontNames); i++) {
        format(object_font, sizeof(object_font), "%s%s\n", object_font, FontNames[i]);
    }
	
	SpawnMale = LoadModelSelectionMenu("spawnmale.txt");
	SpawnFemale = LoadModelSelectionMenu("spawnfemale.txt");
	MaleSkins = LoadModelSelectionMenu("maleskin.txt");
	FemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	VIPMaleSkins = LoadModelSelectionMenu("maleskin.txt");
	VIPFemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	SAPDMale = LoadModelSelectionMenu("sapdmale.txt");
	SAPDFemale = LoadModelSelectionMenu("sapdfemale.txt");
	SAPDWar = LoadModelSelectionMenu("sapdwar.txt");
	SAGSMale = LoadModelSelectionMenu("sagsmale.txt");
	SAGSFemale = LoadModelSelectionMenu("sagsfemale.txt");
	SAMDMale = LoadModelSelectionMenu("samdmale.txt");
	SAMDFemale = LoadModelSelectionMenu("samdfemale.txt");
	SANEWMale = LoadModelSelectionMenu("sanewmale.txt");
	SANEWFemale = LoadModelSelectionMenu("sanewfemale.txt");
	toyslist = LoadModelSelectionMenu("toys.txt");
	viptoyslist = LoadModelSelectionMenu("viptoys.txt");
	vtoylist = LoadModelSelectionMenu("vtoylist.txt");
	PDGSkinMale = LoadModelSelectionMenu("pmale.txt");
	PDGSkinFemale = LoadModelSelectionMenu("pfemale.txt");
	TransFender = LoadModelSelectionMenu("transfender.txt");
	Waa = LoadModelSelectionMenu("waa.txt");
	LoCo = LoadModelSelectionMenu("loco.txt");
	
	LoadModsPoint();
	//Areair
	ShowRoomCP = CreateDynamicSphere(1864.952880,878.926574,10.930519, 1.0, 0, 0);
	pintupolis1 = CreateDynamicSphere(1651.27, -1257.07, 16.67, 1.0, 0, 0);
	pintupolis2 = CreateDynamicSphere(1651.27, -1255.07, 16.67, 1.0, 0, 0);
	Disnaker = CreateDynamicSphere(1376.430541,1576.555053,17.000314, 1.0, 0, 0);
	Healing = CreateDynamicSphere(660.42,-1866.95,5.46, 15.0, 0, 0);
	PenjualanBarang = CreateDynamicSphere(2506.981933,-2637.118896,13.646511, 2.0, 0, 0);
	////////////////////////////////////////////////////////////////////////////////////////////////////
	new gm[32];
	format(gm, sizeof(gm), "%s", TEXT_GAMEMODE);
	SetGameModeText(gm);
	format(gm, sizeof(gm), "weburl %s", TEXT_WEBURL);
	SendRconCommand(gm);
	format(gm, sizeof(gm), "language %s", TEXT_LANGUAGE);
	SendRconCommand(gm);
	//SendRconCommand("hostname Xero Gaming Roleplay");
	SendRconCommand("mapname Greenwich");
	ManualVehicleEngineAndLights();
	EnableStuntBonusForAll(0);
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	LimitPlayerMarkerRadius(20.0);
	SetNameTagDrawDistance(0);
	//DisableNameTagLOS();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetWorldTime(WorldTime);
	SetWeather(1);
	BlockGarages(.text="NO ENTER");
	//Audio_SetPack("default_pack");	
	/*CreateDynamicObject(19473, 2564.97, -462.55, 84.24, 0.000000, 0.000000, 133.731521, -1, -1, -1, 300.00, 300.00);//Kanabis1
	CreateDynamicObject(19473, 2561.40, -467.94, 84.67, 0.000000, 0.000000, 137.313674, -1, -1, -1, 300.00, 300.00);//Kanabis2
	CreateDynamicObject(19473, 2567.34, -470.12, 84.00, 0.000000, 0.000000, 137.313674, -1, -1, -1, 300.00, 300.00);//Kanabis3
	CreateDynamicObject(19473, 2572.66, -465.86, 83.38, 0.000000, 0.000000, 137.313674, -1, -1, -1, 300.00, 300.00);//Kanabis4
	CreateDynamicObject(19473, 2578.16, -471.84, 82.77, 0.000000, 0.000000, 137.313674, -1, -1, -1, 300.00, 300.00);//Kanabis5
	CreateDynamicObject(19473, 2575.55, -477.15, 83.09, 0.000000, 0.000000, 137.313674, -1, -1, -1, 300.00, 300.00);//Kanabis6*/
	CreateDynamicMapIcon(2506.981933,-2637.118896,13.646511, 52, 0, -1, -1, -1, 700.0, -1);
	CreateDynamicMapIcon(528.8009,-1819.9099,6.6213, 10, 0, -1, -1, -1, 700.0, -1);
	CreateDynamicMapIcon(1137.61, -1371.77, 13.86, 22, 0, -1, -1, -1, 700.0, -1);
	CreateDynamicMapIcon(1654.0135,-1265.9158,16.6759, 30, 0, -1, -1, -1, 700.0, -1);

	new strings[150];
	CreateDynamicPickup(2798, 23, 1775.85, -1904.42, 13.38, -1, -1, -1, 50);
	format(strings, sizeof(strings), "Press "LG_E"ALT {ffffff}Rent a Bike");
	CreateDynamic3DTextLabel(strings, COLOR_WHITE, 1775.85, -1904.42, 13.38, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // rent bike st

	CreateDynamicPickup(2798, 23, 1686.63, -2261.61, 13.50, -1, -1, -1, 50);
	format(strings, sizeof(strings), "Press "LG_E"ALT {ffffff}Rent a Bike");
	CreateDynamic3DTextLabel(strings, COLOR_WHITE, 1686.63, -2261.61, 13.50, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // rent bike bandara

	//------[ PENJAHIT ]-----------
	new str[150];
    CreateDynamicPickup(1275, 23, 1302.190673,-1876.173828,13.763982, -1, -1, -1, 50);
    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}To Make A Clothes");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2313.817382,-2075.185546,17.644004, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
    format(str, sizeof(str), "Press "LG_E"ALT {ffffff}To Sell Your Clothes");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1302.113769,-1876.048583,13.763982, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Press "LG_E"ALT {ffffff}To Take A Wool");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1925.521972,170.046707,37.281250, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Press "LG_E"ALT {ffffff}To Access Locker");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2318.562744,-2070.840576,17.644752, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Press "LG_E"ALT {ffffff}To Create A Flanel");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2319.573730,-2080.727783,17.692657, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
    format(str, sizeof(str), "Press "LG_E"ALT {ffffff}To Create A Flanel");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2321.482421,-2082.888671,17.652400, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Press "LG_E"ALT {ffffff}To Create A Flanel");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2317.667236,-2082.262939,17.694538, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Press "LG_E"ALT {ffffff}To Create A Flanel");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2319.653320,-2084.508544,17.652679, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Type "LG_E"/carsteal {ffffff}To Carsteal Action");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 938.0915,2075.0066,10.8209, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Press "LG_E"ALT {ffffff}To Buy Electronic Items");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1745.3582,-2516.8894,20.2869, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Press "LG_E"KLAKSON {ffffff}To Park the Vehicle!");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2529.4800,-1714.8500,13.4847, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), "Press "LG_E"ALT {ffffff}To Buy A Linggis!");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 938.4202,2059.3225,10.8209, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	//=========job penambang minyak=====//
	format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Untuk Membawa minyak");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 494.4636,1293.1964,10.0437, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Untuk Membawa minyak");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 498.3599,1296.6460,10.0437, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Untuk Membawa minyak");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 498.3147,1301.6930,10.0437, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Untuk Menyaring minyak");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 569.5151,1218.7412,11.7188, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    //=========job kayu==========//
    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Membeli chansaw");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -2043.4159,-2326.8677,30.6250, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Mengolah kayu");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -2000.2443,-2453.1018,30.5975, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Menebang Kayu");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -2001.2886,-2465.2129,31.2360, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
   
    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Menebang Kayu");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -1989.6028,-2464.2825,31.0153, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Menebang Kayu");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -1980.7644,-2486.7327,30.8771, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Menebang Kayu");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -1993.8621,-2494.8857,32.8715, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Menebang Kayu");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -2026.6808,-2480.3613,31.8755, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    //robbank
	format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Melakukan robbank!");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1275.2433,-1551.5659,13.5769, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Melakukan robbank!");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1985.1968,-2054.9270,13.5938, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Melakukan robbank!");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1375.7587,-1893.4819,13.5901, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	//CREATETING GUN
	CreateDynamicPickup(1239, 23, 2351.77, -653.31, 128.05, -1, -1, -1, 50);
    format(str, sizeof(str), "Press"LG_E"[ALT] {ffffff}Creafting Gun!");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 2351.77,-653.31,128.05, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    //JOBS SPAREPART/RECYCLE
	format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Mengambil");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -887.2399,-479.9101,826.8417, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Menyortir");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -927.1517,-486.4165,826.8417, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Mulai Pekerjaan");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -920.0016,-468.0568,826.8417, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
    format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Daur Ulang");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 34.4547,1365.0729,9.1719, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
    format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Daur Ulang");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 34.9240,1379.4988,9.1719, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
    format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Daur Ulang");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 34.9276,1351.1335,9.1719, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Mengambil");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -893.2037,-490.6880,826.8417, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), ""LG_E"[ALT] {ffffff}Mengambil");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, -898.6295,-500.8337,826.8417, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	//-----[ Toll System ]-----	
	for(new i;i < sizeof(BarrierInfo);i++)
	{
		new
		Float:X = BarrierInfo[i][brPos_X],
		Float:Y = BarrierInfo[i][brPos_Y];

		ShiftCords(0, X, Y, BarrierInfo[i][brPos_A]+90.0, 3.5);
		CreateDynamicObject(966,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z],0.00000000,0.00000000,BarrierInfo[i][brPos_A]);
		if(!BarrierInfo[i][brOpen])
		{
			gBarrier[i] = CreateDynamicObject(968,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.8,0.00000000,90.00000000,BarrierInfo[i][brPos_A]+180);
			MoveObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[i][brPos_A]+180);
			MoveObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.75,BARRIER_SPEED,0.0,90.0,BarrierInfo[i][brPos_A]+180);
		}
		else gBarrier[i] = CreateDynamicObject(968,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.8,0.00000000,20.00000000,BarrierInfo[i][brPos_A]+180);
	}
	//DYNAMICPICKUP
	CreateDynamicPickup(1581, 23, 1376.164062, 1573.931030, 17.000314, -1, -1, -1, 50);
	format(strings, sizeof(strings), "{007A1E}[Greenwich City Hall]\n{FFFFFF}Press "LG_E"ALT {FFFFFF}Open City Hall Menu");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 1376.164062, 1573.931030, 17.000314, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // text id card

   	CreateDynamicPickup(1239, 23, 116.03, 1165.16, 10019.16, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[PLATE]\n{00FC19}/buyplate\n"); //buyplate
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 116.03, 1165.16, 10019.16, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // buyplate

	CreateDynamicPickup(1239, 23, 801.12, -613.77, 16.33, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Sparepart]\n{FFFFFF}/sellpart\n");
	CreateDynamic3DTextLabel(strings, COLOR_GWRP, 801.12, -613.77, 16.33, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // sparepart
	
	CreateDynamicPickup(1239, 23, 2444.95, -2548.07, 17.91, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Greenwich Sparepart Shop]\n{FFFFFF}/buysparepart\n");
	CreateDynamic3DTextLabel(strings, COLOR_GWRP, 2444.95, -2548.07, 17.91, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // sparepart shop
	
	CreateDynamicPickup(1239, 23, 113.47, 1164.85, 10019.16, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Ticket]\n{00FC19}/payticket - for pay your tickets (denda)");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 113.47, 1164.85, 10019.16, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Pay Ticket Kanpol

	CreateDynamicPickup(1239, 23, -2020.3353, -186.8508, 39.7316, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Arrest Point]\n{FFFFFF}/arrest - arrest wanted player");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, -2020.3353, -186.8508, 39.7316, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // arrest
	
	CreateDynamicPickup(1239, 23, 1183.31, -1323.53, 13.57, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Greenwich Hospital]\n{FFFFFF}/dropinjured");
	CreateDynamic3DTextLabel(strings, COLOR_MEDIC, 1183.31, -1323.53, 13.57, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // hospital
	
	CreateDynamicPickup(1239, 23, 1977.40, -2055.13, 13.59, -1, -1, -1, 50);
	format(strings, sizeof(strings), "{007a1e}[Greenwich Bank]\n{FFFFFF}/bank - access rekening\n/newrek - new rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1977.40, -2055.13, 13.59, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, 787.32, -1332.86, 710.29, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[ADS]\n{00FC19}/ads - public ads");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, 787.32, -1332.86, 710.29, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // iklan

	CreateDynamicPickup(1239, 23, 1254.43, -1287.64, 1061.24, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[BPJS]\n{FFFFFF}/newbpjs\n");
	CreateDynamic3DTextLabel(strings, COLOR_MEDIC, 1254.43, -1287.64, 1061.24, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bpjs

	CreateDynamicPickup(1241, 23, 1264.14, -1316.30, 1061.14, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[MYRICOUS DRUGS MEDIC]\n{FFFFFF}/mix");
	CreateDynamic3DTextLabel(strings, COLOR_MEDIC, 1264.14, -1316.30, 1061.14, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // racik obat

	CreateDynamicPickup(1241, 23, 1256.64, -1284.35, 1061.14, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[SELL DRUGS MEDIC]\n{FFFFFF}/sellobat");
	CreateDynamic3DTextLabel(strings, COLOR_MEDIC, 1256.64, -1284.35, 1061.14, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // jual obat medic

	CreateDynamicPickup(1210, 23, 1376.430541,1576.555053,17.000314, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[DISNAKER]\n{ffffff}Press "LG_E"ALT {ffffff}- To Access Disnaker");
	CreateDynamic3DTextLabel(strings, COLOR_GWRP, 1376.430541,1576.555053,17.000314, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //disnaker

	CreateDynamicPickup(1239, 23, -349.99, -1035.29, 59.35, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Wash Money]\n{00FC19}/washmoney - Wash Your Red Money");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, -349.99, -1035.29, 59.35, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // pencucian uang haram
	
	CreateDynamicPickup(1239, 23, 1545.033935, -2177.635498, 13.582808, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Insurance]\n{FFFFFF}Press "LG_E" ALT {ffffff}- Claim Your Vehicle Stolen\n{FFFFFF}Or Use "LG_E" /claimpv {ffffff}- Claim");
	CreateDynamic3DTextLabel(strings, COLOR_GWRP, 1545.033935, -2177.635498, 13.582808, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	//Insurance
	
	format(strings, sizeof(strings), "Cooks Menu");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE, 524.6508, -1821.6819, 6.6213, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //menumasak
	
	format(strings, sizeof(strings), "Drink Menu");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE, 524.0871, -1817.6035, 6.6213, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //menuminum
	
	CreateDynamicPickup(1239, 23, 528.8009, -1819.9099, 6.6213, -1, -1, -1, 50);
	format(strings, sizeof(strings), "Menu Restaurant");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE, 528.8009, -1819.9099, 6.6213, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //menupedagang
	
	format(strings, sizeof(strings), "Food Vendors Vehicle");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE, 515.61, -1798.72, 6.05, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //garasipedagang
	
	format(strings, sizeof(strings), "Police Vehicle");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1564.26, -1711.47, 5.89, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //garasipolice
	
	format(strings, sizeof(strings), "Medical Vehicle");
	CreateDynamic3DTextLabel(strings, COLOR_MEDIC, 1122.9467, -1351.8933, 13.7770, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //garasimedic


	//PEMERAHSUSU
	CreateDynamicPickup(1239, 23, -60.03, 80.20, 3.13, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[MILK]\n{ffffff}Make a Milky");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, -60.03, 80.20, 3.13, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	CreateDynamicPickup(1239, 23, -62.24, 78.77, 3.13, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[MILK]\n{ffffff}Make a Milky");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, -62.24, 78.77, 3.13, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	CreateDynamicPickup(1239, 23, -65.53, 79.95, 3.13, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[MILK]\n{ffffff}Make a Milky");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, -65.53, 79.95, 3.13, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	CreateDynamicPickup(1239, 23, -61.81, 75.34, 3.13, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[MILK]\n{ffffff}Make a Milky");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, -61.81, 75.34, 3.13, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	
	//-----[ Dynamic Checkpoint ]-----	
	//pernikahan
	pernikahan = CreateDynamicCP(830.3033,-2066.9246,13.2240, 1.0, -1, -1, -1, 20.0);
	//--------[ ATM CP ]--------------
	atm1 = CreateDynamicCP(1920.387207,-1786.922729,13.546875, 1.0, -1, -1, -1, 5.0);
	atm4 = CreateDynamicCP(1291.651489,-1874.457031,13.783984, 1.0, -1, -1, -1, 5.0);
	atm2 = CreateDynamicCP(1550.266601,-2176.392578,13.546875, 1.0, -1, -1, -1, 5.0);
	atm3 = CreateDynamicCP(1545.033935,-2177.635498,13.582808, 1.0, -1, -1, -1, 5.0);
	asuransi = CreateDynamicCP(1545.033935,-2177.635498,13.582808, 1.0, -1, -1, -1, 5.0);
	menumasak = CreateDynamicCP(524.6508,-1821.6819,6.6213, 1.0, -1, -1, -1, 5.0);
	menuminum = CreateDynamicCP(524.0871,-1817.6035,6.6213, 1.0, -1, -1, -1, 5.0);
	menupedagang = CreateDynamicCP(528.8009,-1819.9099,6.6213, 1.0, -1, -1, -1, 5.0);
	bank = CreateDynamicSphere(1276.157348,-1558.395385,13.586855, 1.0, 0, 0);
	bank1 = CreateDynamicSphere(1977.570556,-2059.375488,13.593846, 1.0, 0, 0);
	bank2 = CreateDynamicSphere(1374.789306,-1887.354370,13.590130, 1.0, 0, 0);
	//kendaraan fraksi dan gudang
	kendaraansapd = CreateDynamicSphere(1564.26,-1711.47,5.89, 1.0, 0, 0);
	garasisamd = CreateDynamicCP(1122.9467,-1351.8933,13.7770, 2.0, -1, -1, -1, 5.0);
	garasipedagang = CreateDynamicCP(515.61,-1798.72,6.05, 2.0, -1, -1, -1, 5.0);
	gudangkota = CreateDynamicCP(1164.004394,-1201.940551,19.837736, 2.0, -1, -1, -1, 5.0);
	//MANCINGCP
	mancing1 = CreateDynamicSphere(403.764190,-2088.797119,7.835937, 1.0, 0, 0);
	mancing2 = CreateDynamicSphere(398.711486,-2088.480468,7.835937, 1.0, 0, 0);
	mancing3 = CreateDynamicSphere(396.217071,-2088.449218,7.835937, 1.0, 0, 0);
	mancing4 = CreateDynamicSphere(390.969543,-2088.627685,7.835937, 1.0, 0, 0);
	mancing5 = CreateDynamicSphere(383.510070,-2088.362304,7.835937, 1.0, 0, 0);
	mancing6 = CreateDynamicSphere(375.105041,-2088.289306,7.835937, 1.0, 0, 0);
	mancing7 = CreateDynamicSphere(369.805786,-2088.505859,7.835937, 1.0, 0, 0);
	mancing8 = CreateDynamicSphere(367.337066,-2088.360107,7.835937, 1.0, 0, 0);
	mancing9 = CreateDynamicSphere(361.865936,-2088.551513,7.835937, 1.0, 0, 0);
	mancing10 = CreateDynamicSphere(354.502258,-2088.541748,7.835937, 1.0, 0, 0);
	

	chLogsRobbank = DCC_FindChannelById("955040124348010536");

	new DCC_Channel:hidupp, DCC_Embed:logss;
	new yy, m, d, timestamp[200];
	getdate(yy, m , d);
	hidupp = DCC_FindChannelById("987628650939707442");

	format(timestamp, sizeof(timestamp), "%02i%02i%02i", yy, m, d);
	logss = DCC_CreateEmbed("Greenwich Roleplay");
	DCC_SetEmbedTitle(logss, "Greenwich Roleplay | HappyBarengGreenwich");
	DCC_SetEmbedTimestamp(logss, timestamp);
	DCC_SetEmbedColor(logss, 0x00ff00);
	DCC_SetEmbedUrl(logss, "https://cdn.discordapp.com/attachments/987628692299710544/1117232787628511283/NEWWW__Dibuat_dengan_Clipchamp_AdobeExpress.gif");
	DCC_SetEmbedThumbnail(logss, "https://cdn.discordapp.com/attachments/987628692299710544/1117232787628511283/NEWWW__Dibuat_dengan_Clipchamp_AdobeExpress.gif");
	DCC_SetEmbedFooter(logss, "Greenwich Roleplay | HappyBarengGreenwich", "");
	new stroi[5000];
	format(stroi, sizeof(stroi), "> Pintu Greenwich #1 telah dibuka, para penonton yang telah memiliki karcis dipersilakan memasuki ruangan Greenwich\n> Server update <#987628685446225940>\n\n> IP server <#987628723916374036>\nDihimbau semua warga untuk membaca:\n<#1095732507749666848>\n\n> Punya saran & kritik? <#1118751580456497233>\n> Mengalami kesulitan? <#987628795697721364>\n> Mendapatkan bug? <#987628764903145494>");
	DCC_AddEmbedField(logss, "Pintu Greenwich #1 Terbuka", stroi, true);
	DCC_SendChannelEmbedMessage(hidupp, logss);

	printf("[Objects]: %d Loaded.", CountDynamicObjects());
	

	return 1;
}
public OnGameModeExit()
{
   	print("-------------- [ Auto Gmx ] --------------");
	new count = 0, user = 0;
	foreach(new gsid : GStation)
	{
		if(Iter_Contains(GStation, gsid))
		{
			count++;
			GStation_Save(gsid);
		}
	}
	printf("[Gas Station]: %d Saved.", count);
	
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++) 
	{
		if (IsPlayerConnected(i))
		{
			OnPlayerDisconnect(i, 1);
		}
	}
	printf("[Database] User Saved: %d", user);
	print("-------------- [ Auto Gmx ] --------------");
	SendClientMessageToAll(COLOR_RED, "[!]"YELLOW_E" Sorry To Disturb Your Roleplay, The Server Will Restart.{00FFFF} ~Greenwich Bot");

	UnloadTazerSAPD();
	DestroyDynaimcRobBank();
	//Audio_DestroyTCPServer();
	mysql_close(g_SQL);
	new DCC_Channel:hidupp, DCC_Embed:logss;
	new yy, m, d, timestamp[200];
	getdate(yy, m , d);
	hidupp = DCC_FindChannelById("1095732514468933651");

	format(timestamp, sizeof(timestamp), "%02i%02i%02i", yy, m, d);
	logss = DCC_CreateEmbed("Greenwich Roleplay");
	DCC_SetEmbedTitle(logss, "Greenwich Roleplay | MENYATUKAN BANGSA");
	DCC_SetEmbedTimestamp(logss, timestamp);
	DCC_SetEmbedColor(logss, 0x00ff00);
	DCC_SetEmbedUrl(logss, "https://media.discordapp.net/attachments/1095732534962298993/1096270393700012062/1681441616752.jpg");
	DCC_SetEmbedThumbnail(logss, "https://media.discordapp.net/attachments/1095732534962298993/1096270393700012062/1681441616752.jpg");
	DCC_SetEmbedFooter(logss, "Greenwich Roleplay | MENYATUKAN BANGSAl", "");
	new stroi[5000];
	format(stroi, sizeof(stroi), "> Pintu Theater #1 telah tertutup.");
	DCC_AddEmbedField(logss, "Pintu Greenwich #1 Tertutup", stroi, true);
	DCC_SendChannelEmbedMessage(hidupp, logss);

	return 1;
}

stock RefreshDGHbec(playerid)
{
	PlayerTextDrawSetPreviewModel(playerid, DGHBEC[playerid], GetVehicleModel(GetPlayerVehicleID(playerid)));
	PlayerTextDrawShow(playerid, DGHBEC[playerid]);
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{

	new otherid;
    if(vehicleid == Car_Job[playerid])
	{
        KillTimer(timer_Car[playerid]);
        Seconds_timer[playerid] = 0;
    }
    if(vehicleid == pData[playerid][pKendaraanKerja]) 
	{
        KillTimer(KeluarKerja[playerid]);
        TimerKeluar[playerid] = 0;
	}
    if(vehicleid == pData[playerid][pKendaraanFraksi])
	{
        KillTimer(KeluarKerja[playerid]);
        TimerKeluar[playerid] = 0;
	}
	if(vehicleid == pData[otherid][pKendaraanDealer])
	{
	    RemovePlayerFromVehicle(playerid);
	    new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz);
	    Error(playerid, "Kendaraan Dealer!");
	}
    return 1;
}

stock SGetName(playerid)
{
    new name[ 64 ];
    GetPlayerName(playerid, name, sizeof( name ));
    return name;
}

public OnPlayerText(playerid, text[])
{
	if(isnull(text)) return 0;
	new str[150];
	format(str,sizeof(str),"[CHAT] %s: %s", GetRPName(playerid), text);
	LogServer("Chat", str);
	printf(str);

	if(pData[playerid][pSpawned] == 0 && pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be spawned or logged in to use chat.");
	    return 0;
	}
	//-----[ Auto RP ]-----	
	if(!strcmp(text, "rpgun", true) || !strcmp(text, "gunrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Pulling the gun out of the belt and ready to shoot at any time.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcrash", true) || !strcmp(text, "crashrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Feeling shocked after an accident .", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfish", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Fishing With Both Hands.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfall", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Falling down and feeling sick.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpmad", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Feeling upset and feeling like getting angry.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rprob", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Frisk for something and ready to rob.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcj", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Car jacking someone people.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpwar", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s At War With Someone.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdie", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s pingsan dan tidak sadarkan diri.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfixmeka", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Repairing Vehicle Engine.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcheckmeka", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Checking Vehicle Condition.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfight", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ribut dan memukul seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcry", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Feeling sad and crying.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rprun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s berlari dan kabur.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfear", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s fearing for something.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdropgun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s drop down the gun.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rptakegun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s take the gun.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpgivegun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memberikan kendaraan kepada seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpshy", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa malu.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpnusuk", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s menusuk dan membunuh seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpharvest", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memanen tanaman.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rplockhouse", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang mengunci rumah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rplockcar", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang mengunci kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpnodong", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memulai menodong seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpeat", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s makan makanan yang ia beli.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdrink", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s meminum minuman yang ia beli.", ReturnName(playerid));
		return 0;
	}
	if(text[0] == '@')
	{
		if(pData[playerid][pSMS] != 0)
		{
			if(pData[playerid][pPhoneCredit] < 1)
			{
				Error(playerid, "You Not Have Phone Credit!");
				return 0;
			}
			if(pData[playerid][pInjured] != 0)
			{
				Error(playerid, "You Can't Do It Right Now.");
				return 0;
			}
			new tmp[512];
			foreach(new ii : Player)
			{
				if(text[1] == ' ')
				{
			 		format(tmp, sizeof(tmp), "%s", text[2]);
				}
				else
				{
				    format(tmp, sizeof(tmp), "%s", text[1]);
				}
				if(pData[ii][pPhone] == pData[playerid][pSMS])
				{
					if(ii == INVALID_PLAYER_ID || !IsPlayerConnected(ii))
					{
						Error(playerid, "This Number Is Inactive!");
						return 0;
					}
					SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", pData[playerid][pSMS], tmp);
					SendClientMessageEx(ii, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], tmp);
					PlayerPlaySound(ii, 6003, 0,0,0);
					pData[ii][pSMS] = pData[playerid][pPhone];
					
					pData[playerid][pPhoneCredit] -= 1;
					return 0;
				}
			}
		}
	}
	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		format(lstr, sizeof(lstr), "[CellPhone] %s says: %s", ReturnName(playerid), text);
		ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
		SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
		SendClientMessageEx(pData[playerid][pCall], COLOR_YELLOW, "[CELLPHONE] "WHITE_E"%s.", text);
		return 0;
	}
	else
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		if(!IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		{
			if(pData[playerid][pAdminDuty] == 1)
			{
				if(strlen(text) > 64)
				{
					SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %.64s ..", ReturnName(playerid), text);
					SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", text[64]);
					return 0;
				}
				else
				{
					SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %s ))", ReturnName(playerid), text);
					return 0;
				}
			}

			format(lstr, sizeof(lstr), "{007a1e}[{ffffff}ID:%d{007a1e}]{ffffff}%s Says: %s", playerid, ReturnName(playerid), text);
			ProxDetector(25, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
			SetPlayerChatBubble(playerid, text, COLOR_GREEN, 10.0, 3000);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		{
			if(pData[playerid][pAdmin] < 1)
			{
				format(lstr, sizeof(lstr), "[OOC ZONE] %s: (( %s ))", ReturnName(playerid), text);
				ProxDetector(40, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
			}
			else if(pData[playerid][pAdmin] > 1 || pData[playerid][pHelper] > 1)
			{
				format(lstr, sizeof(lstr), "[OOC ZONE] %s: %s", pData[playerid][pAdminname], text);
				ProxDetector(40, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
			}
		}
		return 0;
	}
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    new str[1500];
    if (result == -1)
    {
	    format(str,sizeof(str),"Perintah ~y~/%s ~w~Tidak Ditemukan Gunakan ~y~/help", cmd);
		ErrorMsg(playerid, str);
        return 0;
    }
	
	format(str,sizeof(str),"[CMD] %s: [%s] [%s]", GetRPName(playerid), cmd, params);
	LogServer("Command", str);
	printf(str);
	new dc[128];
	format(dc, sizeof(dc),  "**\n[CMD] %s: [%s] [%s]**", GetRPName(playerid), cmd);
	SendDiscordMessage(1, dc);
    return 1;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	return 1;
}

//TD DEATH
stock ShowTdDeath(playerid)
{
	PlayerTextDrawShow(playerid, Text_Player[playerid][0]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][1]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][2]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][3]);
	PlayerTextDrawShow(playerid, Text_Player[playerid][4]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][5]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][6]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][7]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][8]);
    return 1;
}
stock HideTdDeath(playerid)
{
	PlayerTextDrawHide(playerid, Text_Player[playerid][0]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][1]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][2]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][3]);
	PlayerTextDrawHide(playerid, Text_Player[playerid][4]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][5]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][6]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][7]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][8]);
    return 1;
}

public OnPlayerConnect(playerid)
{
    Info(playerid, "{007a1e}[Sync]{ffffff} : Read Your Account Assets...");
	Info(playerid, "{007a1e}[INFO]{ffffff} : This City Has {007a1e}American{ffffff} Culture, Should Use an American Name.");
	Info(playerid, "{007a1e}[iNFO]{ffffff} : {007A1E}Greenwich Roleplay {FFFFFF}The Green Life Style");
		//jaden
	if(IsValidDynamic3DTextLabel(pData[playerid][cNametag]))
 	   DestroyDynamic3DTextLabel(pData[playerid][cNametag]);

	
	PlayerTextDrawShow(playerid, LenzLogo[playerid][0]);
	PlayerTextDrawShow(playerid, LenzLogo[playerid][1]);
	PlayerTextDrawShow(playerid, LenzLogo[playerid][2]);
	PlayerTextDrawShow(playerid, LenzLogo[playerid][3]);
	PlayerTextDrawShow(playerid, LenzLogo[playerid][4]);
	PlayerTextDrawShow(playerid, LenzLogo[playerid][5]);
	PlayerTextDrawShow(playerid, LenzLogo[playerid][6]);
	PlayerTextDrawShow(playerid, LenzLogo[playerid][7]);
	PlayerTextDrawShow(playerid, LenzLogo[playerid][8]);
	
   	if(IsValidDynamic3DTextLabel(pData[playerid][AdminTag]))
       DestroyDynamic3DTextLabel(pData[playerid][AdminTag]);
              
    if(IsValidDynamic3DTextLabel(TagKeluar[playerid]))
  		DestroyDynamic3DTextLabel(TagKeluar[playerid]);
  		
    PakaiSenjata[playerid] = 0;
    CreateProgress(playerid);
    CreatePlayerInv(playerid);
    PlayerInfo[playerid][pSelectItem] = 0;
    for (new i = 0; i != MAX_INVENTORY; i ++)
	{
	    InventoryData[playerid][i][invExists] = false;
	    InventoryData[playerid][i][invModel] = 0;
	}
	Player_EditVehicleObject[playerid] = -1;
    Player_EditVehicleObjectSlot[playerid] = -1;
    Player_EditingObject[playerid] = 0;
    JOB[playerid] = 0;
    inJOB[playerid] = 0;
    AntiBHOP[playerid] = 0;
	warnings{playerid} = 0;
	SendClientCheck(playerid, 0x48, 0, 0, 2);
	new PlayerIP[16], country[MAX_COUNTRY_LENGTH], city[MAX_CITY_LENGTH];
	g_MysqlRaceCheck[playerid]++;
	pemainic++;
	AntiBHOP[playerid] = 0;
	IsAtEvent[playerid] = 0;
	takingselfie[playerid] = 0;
	pData[playerid][pDriveLicApp] = 0;
	//AntiCheat
	pData[playerid][pJetpack] = 0;
	pData[playerid][pLastUpdate] = 0;
	pData[playerid][pArmorTime] = 0;
	pData[playerid][pACTime] = 0;
	pData[playerid][pToggleBank] = 0;
	//Anim
	pData[playerid][pLoopAnim] = 0;
	//Rob
	pData[playerid][pLastChop] = 0;
	//seatblet
	PlayerInfo[playerid][pSeatbelt] = 0;
	//Pengganti IsValidTimer
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPartStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pActivityTime] = 0;
	//

	ClearAnimations(playerid);

	ResetVariables(playerid);
	RemoveMappingGreenland(playerid);
	CreatePlayerTextDraws(playerid);

	GetPlayerName(playerid, pData[playerid][pUCP], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pIP] = PlayerIP;
	
	InterpolateCameraPos(playerid, 698.826049, -1404.027099, 16.206615, 2045.292480, -1425.237182, 128.337753, 60000);
	InterpolateCameraLookAt(playerid, 703.825317, -1404.041990, 500000681, 2050.291992, -1425.306762, 128.361190, 50000);

	GetPlayerCountry(playerid, country, MAX_COUNTRY_LENGTH);
	GetPlayerCity(playerid, city, MAX_CITY_LENGTH);
	

	
	SetTimerEx("SafeLogin", 1000, 0, "i", playerid);
	//Prose Load Data
	new query[103];
	mysql_format(g_SQL, query, sizeof query, "SELECT * FROM `playerucp` WHERE `ucp` = '%e' LIMIT 1", pData[playerid][pUCP]);
	mysql_pquery(g_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	SetPlayerColor(playerid, COLOR_WHITE);

	pData[playerid][activitybar] = CreatePlayerProgressBar(playerid, 273.500000, 157.333541, 88.000000, 8.000000, 5930683, 100, 0);
	
    if(pData[playerid][pHead] < 0) return pData[playerid][pHead] = 20;

    if(pData[playerid][pPerut] < 0) return pData[playerid][pPerut] = 20;

    if(pData[playerid][pRFoot] < 0) return pData[playerid][pRFoot] = 20;

    if(pData[playerid][pLFoot] < 0) return pData[playerid][pLFoot] = 20;

    if(pData[playerid][pLHand] < 0) return pData[playerid][pLHand] = 20;
   
    if(pData[playerid][pRHand] < 0) return pData[playerid][pRHand] = 20;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    DelHunter(playerid);
	if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;
    }
	explosive{playerid} = false;
	//////////
	warnings{playerid} = 0;

	pemainic--;

	SetPlayerName(playerid, pData[playerid][pUCP]);
	//Pengganti IsValidTimer
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPartStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pActivityTime] = 0;

	pData[playerid][pDriveLicApp] = 0;
	pData[playerid][pSpawnList] = 0;
	takingselfie[playerid] = 0;
	UpdateWeapons(playerid);//SAVEGUNEXIT
	UpdatePlayerData(playerid);
	//KillTimer(Unload_Timer[playerid]);
	
	if(IsPlayerInAnyVehicle(playerid))
	{
        RemovePlayerFromVehicle(playerid);
    }

	g_MysqlRaceCheck[playerid]++;

	if(pData[playerid][pFaction] == 3)
	{
		emsdikota--;
	}
	if(pData[playerid][pFaction] == 1)
	{
		polisidikota--;
	}
	if(pData[playerid][pFaction] == 2)
	{
		govdikota--;
	}
	if(pData[playerid][pFaction] == 7)
	{
		bengkeldikota--;
	}
	if(pData[playerid][pFaction] == 6)
	{
		gojekdikota--;
	}
	if(pData[playerid][pFaction] == 5)
	{
		pedagangdikota--;
	}
	if(pData[playerid][pFaction] == 4)
	{
		reporterdikota--;
	}
	if(pData[playerid][pLagiDealer] == 1)
	{
		delaydealer = false;
	}
	if(IsValidDynamic3DTextLabel(pData[playerid][cNametag]))
	DestroyDynamic3DTextLabel(pData[playerid][cNametag]);
	pData[playerid][pTogName] = 0;
	if(pData[playerid][pJob] == 1)
	{
		DeleteBusCP(playerid);
		Sopirbus--;
	}
	else if(pData[playerid][pJob] == 2)
	{
		tukangayam--;
		DeletePemotongCP(playerid);
	}
	else if(pData[playerid][pJob] == 3)
	{
		tukangtebang--;
	}
	else if(pData[playerid][pJob] == 4)
	{
		DeleteMinyakCP(playerid);
		penambangminyak--;
	}
	else if(pData[playerid][pJob] == 5)
	{
		DeleteJobPemerahMap(playerid);
		pemerah--;
	}
	else if(pData[playerid][pJob] == 6)
	{
		penambang--;
		DeletePenambangCP(playerid);
	}
	else if(pData[playerid][pJob] == 7)
	{
		DeletePetaniCP(playerid);
		petani--;
	}
	else if(pData[playerid][pJob] == 8)
	{
		Trucker--;
		DeleteKargoCP(playerid);
	}
	else if(pData[playerid][pJob] == 10)
	{
		penjahit--;
	}
	UpdatePlayerData(playerid);
	RemovePlayerVehicle(playerid);
	Report_Clear(playerid);
	Ask_Clear(playerid);

	if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
	DestroyVehicle(pData[playerid][pKendaraanFraksi]);

	if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
		DestroyVehicle(pData[playerid][pKendaraanKerja]);

	if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
		DestroyVehicle(pData[playerid][pKendaraanDealer]);

	KillTazerTimer(playerid);
	if(IsValidVehicle(pData[playerid][pTrailer]))
		DestroyVehicle(pData[playerid][pTrailer]);
	
	if(pData[playerid][IsLoggedIn] == true)
	{
		if(IsAtEvent[playerid] == 1)
		{
			if(GetPlayerTeam(playerid) == 1)
			{
				if(EventStarted == 1)
				{
					RedTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 2)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Congrats, Your team wins the event and gets the rewards $%d per person", EventPrize);
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 1)
						{
							Servers(ii, "Sorry, Your Team Has Lose, Try Next Time");
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							RedTeam = 0;
						}
					}
				}
			}
			if(GetPlayerTeam(playerid) == 2)
			{
				if(EventStarted == 1)
				{
					BlueTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 1)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Congrats, Your team wins the event and gets the rewards $%d per person", EventPrize);
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 2)
						{
							Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
					}
				}
			}
			SetPlayerTeam(playerid, 0);
			IsAtEvent[playerid] = 0;
			pData[playerid][pInjured] = 0;
			pData[playerid][pSpawned] = 1;
	    }
		if(pData[playerid][pRobLeader] == 1)
		{
			foreach(new ii : Player) 
			{
				if(pData[ii][pMemberRob] > 1)
				{
					Servers(ii, "* Pemimpin Perampokan anda telah keluar! [ MISI GAGAL ]");
					pData[ii][pMemberRob] = 0;
					RobMember = 0;
					pData[ii][pRobLeader] = 0;
					ServerMoney += robmoney;
				}
			}
		}
		if(pData[playerid][pMemberRob] == 1)
		{
			pData[playerid][pMemberRob] = 0;
			foreach(new ii : Player) 
			{
				if(pData[ii][pRobLeader] > 1)
				{
					Servers(ii, "* Member berkurang 1");
					pData[ii][pMemberRob] -= 1;
					RobMember -= 1;
				}
			}
		}
	}
	
	if(IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);

    if(IsValidDynamic3DTextLabel(pData[playerid][pBTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pBTag]);
			
	if(IsValidDynamicObject(pData[playerid][pFlare]))
            DestroyDynamicObject(pData[playerid][pFlare]);
    

    pData[playerid][pAdoActive] = false;
	

	if (pData[playerid][LoginTimer])
	{
		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
	}

	pData[playerid][IsLoggedIn] = false;
	new Float:x, Float:y, Float:z, strings[500];
	GetPlayerPos(playerid, x, y, z);
	new reasontext[526];
	switch(reason)
	{
	    case 0: reasontext = "Timeout/ Crash";
	    case 1: reasontext = "Quit";
	    case 2: reasontext = "Kicked/ Banned";
	}
	format(strings, sizeof(strings), "[%s | %s (%d) Out The City\nReason: [%s]", pData[playerid][pName], pData[playerid][pUCP], playerid, reasontext);
	TagKeluar[playerid] = CreateDynamic3DTextLabel(strings, 0xC6E2FFFF, x, y, z, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Text Jika Player Disconnect
 	SetTimerEx("WaktuKeluar", 10000, false, "d", playerid);
	new dc[100];
	format(dc, sizeof(dc),  "```\nName: %s Out At Greenwich City \nUcp: %s\nReason: %s.```", pData[playerid][pName], pData[playerid][pUCP], reasontext);
	SendDiscordMessage(0, dc);
	return 1;
}
public OnPlayerSpawn(playerid)
{

    PlayerTextDrawShow(playerid, normal[playerid][0]);
    PlayerTextDrawShow(playerid, normal[playerid][1]);
    
	StopAudioStreamForPlayer(playerid);
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
	SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
    SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, 0);
	SetPlayerSpawn(playerid);
	LoadAnims(playerid);
	if(IsValidDynamic3DTextLabel(pData[playerid][cNametag]))
 	DestroyDynamic3DTextLabel(pData[playerid][cNametag]);
 	new nametag[500];
    //format(nametag, sizeof(nametag), "{007A1E}[%i] {FFFFFF}%s\n{FFFFFF}%s", playerid, pData[playerid][pName]);
    format(nametag, sizeof(nametag), "{007A1E}[%i]", playerid);
    pData[playerid][cNametag] = CreateDynamic3DTextLabel(nametag, 0xFFFFFFFF, 0.0, 0.0, 0.1, NT_DISTANCE, .attachedplayer = playerid, .testlos = 1);
	teksrob[playerid] = CreateDynamic3DTextLabel("{007A1E}Gangster: {FFFFFF}Apa kau ingin melakukan tugas dariku?\nJika kau berani melakukannya maka akan kuberi bayaran yang setimpal.\n{FFFF00}CMD:{FFFFFF}/carsteal", COLOR_WHITE, 938.67, 2057.42, 10.82+1.0, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0, -1, 10.0);
	SetPlayerSkillLevel(playerid, WEAPON_COLT45, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPON_CHAINSAW, 1);
	SetPlayerSkillLevel(playerid, WEAPON_DEAGLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SAWEDOFF, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGSPA, 1);
	SetPlayerSkillLevel(playerid, WEAPON_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPON_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPON_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPON_M4, 1);
	SetPlayerSkillLevel(playerid, WEAPON_TEC9, 1);
	SetPlayerSkillLevel(playerid, WEAPON_RIFLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SNIPER, 1);
 	new dc[100];
	format(dc, sizeof(dc),  "```\nName: %s Success Join To Greenwich City\nUcp: %s\nRegion: Indonesian.```", pData[playerid][pName], pData[playerid][pUCP]);
	SendDiscordMessage(0, dc);
	return 1;
}

SetPlayerSpawn(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(pData[playerid][pGender] == 0)
		{
			TogglePlayerControllable(playerid,0);
			SetPlayerHealth(playerid, 100.0);
			SetPlayerArmour(playerid, 0.0);
			SetPlayerPos(playerid, 2823.21,-2440.34,12.08);
			SetPlayerCameraPos(playerid,1058.544433, -1086.021362, 41);
			SetPlayerCameraLookAt(playerid,1055.534057, -1082.029296, 39.802570);
			SetPlayerVirtualWorld(playerid, 0);
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Date Of Birth", "Enter Your Date Of Birth\n(Day/Month/Years)\nExmp : 15/04/1998", "{27d23d}Enter", "{e31d1d}Cancel");
		}
		else
		{
			SetPlayerColor(playerid, COLOR_WHITE);
			CheckPlayerSpawn3Titik(playerid);
			if(pData[playerid][pHBEMode] == 1) //simple
			{
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][0]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][1]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][2]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][3]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][4]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][5]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][6]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][7]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][8]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][9]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][10]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][11]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][12]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][13]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][14]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][15]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][16]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][17]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][18]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][19]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][20]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][21]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][22]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][23]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][24]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][25]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][26]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][27]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][28]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][29]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][30]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][31]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][32]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][33]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][34]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][35]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][36]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][37]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][38]);
				PlayerTextDrawShow(playerid, LenzHbe7[playerid][39]);
				PlayerTextDrawShow(playerid, darahhbe7[playerid]);
				PlayerTextDrawShow(playerid, armorhbe7[playerid]);
				PlayerTextDrawShow(playerid, makanhbe7[playerid]);
				PlayerTextDrawShow(playerid, minumhbe7[playerid]);
				PlayerTextDrawShow(playerid, stresshbe7[playerid]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][0]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][1]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][2]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][3]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][4]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][5]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][6]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][7]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][8]);
			}
			if(pData[playerid][pHBEMode ] == 2) //modern
			{
				for(new i = 0; i < 12; i++)
				{
					PlayerTextDrawShow(playerid, HbeNew[playerid][i]);
				}
				PlayerTextDrawShow(playerid, LenzLogo[playerid][0]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][1]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][2]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][3]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][4]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][5]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][6]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][7]);
				PlayerTextDrawShow(playerid, LenzLogo[playerid][8]);
			}
			else
			{
				
			}
			CheckPlayerSpawn3Titik(playerid);
			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				SetFactionColor(playerid);
			}
			if(pData[playerid][pAdminDuty] > 0)
			{
				SetPlayerColor(playerid, COLOR_BLACK);
			}
			SetTimerEx("SpawnTimer", 6000, false, "i", playerid);
		}
	}
}

function SpawnTimer(playerid)
{
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pData[playerid][pMoney]);
	SetPlayerScore(playerid, pData[playerid][pLevel]);
	SetPlayerHealth(playerid, pData[playerid][pHealth]);
	SetPlayerArmour(playerid, pData[playerid][pArmour]);
	pData[playerid][pSpawned] = 1;
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	AttachPlayerToys(playerid);
	SetWeapons(playerid);
	if(pData[playerid][pJail] > 0)
	{
		JailPlayer(playerid); 
	}
	if(pData[playerid][pArrestTime] > 0)
	{
		SetPlayerArrest(playerid, pData[playerid][pArrest]);
	}
	return 1;
}
public OnPlayerRequestClass(playerid, classid)
{
    InterpolateCameraPos(playerid, 583.33, -2149.81, 99.26, 467.62, -2022.67, 27.38, 60000);
	InterpolateCameraLookAt(playerid, 583.33, -2149.81, 99.26, 467.62, -2022.67, 27.38, 50000);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		Info(playerid, "{ff0000}Jangan di pencet spawn adik adik!!!");
		KickEx(playerid);
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	fly[playerid] = false;
	if(killerid != INVALID_PLAYER_ID)
	{
		new reasontext[526];
		switch(reason)
		{
	        case 0: reasontext = "Fist";
	        case 1: reasontext = "Brass Knuckles";
	        case 2: reasontext = "Golf Club";
	        case 3: reasontext = "Nite Stick";
	        case 4: reasontext = "Knife";
	        case 5: reasontext = "Basebal Bat";
	        case 6: reasontext = "Shovel";
	        case 7: reasontext = "Pool Cue";
	        case 8: reasontext = "Katana";
	        case 9: reasontext = "Chain Shaw";
	        case 14: reasontext = "Cane";
	        case 18: reasontext = "Molotov";
	        case 22..24: reasontext = "Pistol";
	        case 25..27: reasontext = "Shotgan";
	        case 28..34: reasontext = "Laras long";
		    case 49: reasontext = "Rammed by Car";
		    case 50: reasontext = "Helicopter blades";
		    case 51: reasontext = "Explosion";
		    case 53: reasontext = "Drowned";
		    case 54: reasontext = "Splat";
		    case 255: reasontext = "Suicide";
		}
		new h, m, s;
		new day, month, year;
	    gettime(h, m, s);
	    getdate(year,month,day);

        new dc[128];
        format(dc, sizeof dc, "```%02d.%02d.%d - %02d:%02d:%02d```\n```\n%s [ID: %d] killed %s [ID: %d] (%s)\n```",day, month, year, h, m, s, pData[killerid][pName], killerid, pData[playerid][pName], playerid, reasontext);
        SendDiscordMessage(9, dc);
	}
    else
	{
		new reasontext[526];
		switch(reason)
		{
	        case 0: reasontext = "Fist";
	        case 1: reasontext = "Brass Knuckles";
	        case 2: reasontext = "Golf Club";
	        case 3: reasontext = "Nite Stick";
	        case 4: reasontext = "Knife";
	        case 5: reasontext = "Basebal Bat";
	        case 6: reasontext = "Shovel";
	        case 7: reasontext = "Pool Cue";
	        case 8: reasontext = "Katana";
	        case 9: reasontext = "Chain Shaw";
	        case 14: reasontext = "Cane";
	        case 18: reasontext = "Molotov";
	        case 22..24: reasontext = "Pistol";
	        case 25..27: reasontext = "Shotgan";
	        case 28..34: reasontext = "Laras long";
		    case 49: reasontext = "Rammed by Car";
		    case 50: reasontext = "Helicopter blades";
		    case 51: reasontext = "Explosion";
		    case 53: reasontext = "Drowned";
		    case 54: reasontext = "Splat";
		    case 255: reasontext = "Suicide";
		}
	    new h, m, s;
	    new day, month, year;
	    gettime(h, m, s);
	    getdate(year,month,day);
	    new name[MAX_PLAYER_NAME + 1];
	    GetPlayerName(playerid, name, sizeof name);

	    new dc[128];
	    format(dc, sizeof dc, "```%02d.%02d.%d - %02d:%02d:%02d```\n```\n%s [ID: %d] death(%s)\n```",day, month, year, h, m, s, name, playerid, reasontext);
	    SendDiscordMessage(9, dc);
	}

	DeletePVar(playerid, "UsingSprunk");
	SetPVarInt(playerid, "GiveUptime", -1);
	pData[playerid][pSpawned] = 0;

	pData[playerid][CarryProduct] = 0;
	pData[playerid][CarryPart] = 0;
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pPartStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	
	KillTimer(pData[playerid][pActivity]);
	KillTimer(pData[playerid][pMechanic]);
	KillTimer(pData[playerid][pProducting]);
	KillTimer(pData[playerid][pCooking]);
	KillTimer(pData[playerid][pPemotong]);
	KillTimer(pData[playerid][pCheckpointTarget]);
	KillTimer(pData[playerid][pPart]);
	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
	PlayerTextDrawHide(playerid, ActiveTD[playerid]);
	pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
	pData[playerid][pActivityTime] = 0;
	
	pData[playerid][pMechDuty] = 0;
	pData[playerid][pMission] = -1;
	
	pData[playerid][pSideJob] = 0;
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	RemovePlayerAttachedObject(playerid, 9);
	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	UpdatePlayerData(playerid);
    if(IsAtEvent[playerid] == 1)
    {
    	SetPlayerPos(playerid, 1474.65, -1736.36, 13.38);
    	SetPlayerVirtualWorld(playerid, 0);
    	SetPlayerInterior(playerid, 0);
    	ClearAnimations(playerid);
    	ResetPlayerWeaponsEx(playerid);
       	SetPlayerColor(playerid, COLOR_WHITE);
    	if(GetPlayerTeam(playerid) == 1)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		RedTeam -= 1;
    	}
    	else if(GetPlayerTeam(playerid) == 2)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		BlueTeam -= 1;
    	}
    	if(BlueTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 1)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 2)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    		}
    	}
    	if(RedTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 2)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 1)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				RedTeam = 0;
    			}
    		}
    	}
    	SetPlayerTeam(playerid, 0);
    	IsAtEvent[playerid] = 0;
    	pData[playerid][pInjured] = 0;
    	pData[playerid][pSpawned] = 1;
    }
    if(IsAtEvent[playerid] == 0)
    {
    	new asakit = RandomEx(0, 5);
    	new bsakit = RandomEx(0, 9);
    	new csakit = RandomEx(0, 7);
    	new dsakit = RandomEx(0, 6);
    	pData[playerid][pLFoot] -= dsakit;
    	pData[playerid][pLHand] -= bsakit;
    	pData[playerid][pRFoot] -= csakit;
    	pData[playerid][pRHand] -= dsakit;
    	pData[playerid][pHead] -= asakit;
    }
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ,Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	new weaponid = EditingWeapon[playerid];
    if(weaponid)
    {
        if(response == 1)
        {
            new enum_index = weaponid - 22, weaponname[18], string[340];

            GetWeaponName(weaponid, weaponname, sizeof(weaponname));

            WeaponSettings[playerid][enum_index][Position][0] = fOffsetX;
            WeaponSettings[playerid][enum_index][Position][1] = fOffsetY;
            WeaponSettings[playerid][enum_index][Position][2] = fOffsetZ;
            WeaponSettings[playerid][enum_index][Position][3] = fRotX;
            WeaponSettings[playerid][enum_index][Position][4] = fRotY;
            WeaponSettings[playerid][enum_index][Position][5] = fRotZ;

            RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid));
            SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);

            Servers(playerid, "You have successfully adjusted the position of your %s.", weaponname);

            mysql_format(g_SQL, string, sizeof(string), "INSERT INTO weaponsettings (Owner, WeaponID, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES ('%d', %d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", pData[playerid][pID], weaponid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ);
            mysql_tquery(g_SQL, string);
        }
		else if(response == 0)
		{
			new enum_index = weaponid - 22;
			SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
		}
        EditingWeapon[playerid] = 0;
		return 1;
    }
	else
	{
		if(response == 1)
		{
			InfoTD_MSG(playerid, 4000, "~g~~h~Toy Position Updated~y~!");

			pToys[playerid][index][toy_x] = fOffsetX;
			pToys[playerid][index][toy_y] = fOffsetY;
			pToys[playerid][index][toy_z] = fOffsetZ;
			pToys[playerid][index][toy_rx] = fRotX;
			pToys[playerid][index][toy_ry] = fRotY;
			pToys[playerid][index][toy_rz] = fRotZ;
			pToys[playerid][index][toy_sx] = fScaleX;
			pToys[playerid][index][toy_sy] = fScaleY;
			pToys[playerid][index][toy_sz] = fScaleZ;
			
			MySQL_SavePlayerToys(playerid);
		}
		else if(response == 0)
		{
			InfoTD_MSG(playerid, 4000, "~r~~h~Selection Cancelled~y~!");

			SetPlayerAttachedObject(playerid,
				index,
				modelid,
				boneid,
				pToys[playerid][index][toy_x],
				pToys[playerid][index][toy_y],
				pToys[playerid][index][toy_z],
				pToys[playerid][index][toy_rx],
				pToys[playerid][index][toy_ry],
				pToys[playerid][index][toy_rz],
				pToys[playerid][index][toy_sx],
				pToys[playerid][index][toy_sy],
				pToys[playerid][index][toy_sz]);
		}
		SetPVarInt(playerid, "UpdatedToy", 1);
		TogglePlayerControllable(playerid, true);
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT: objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(Player_EditingObject[playerid])
	{
		if (response == EDIT_RESPONSE_FINAL)
		{
			new
                vehicleid = Player_EditVehicleObject[playerid],
                vehid = GetPlayerVehicleID(playerid),
                slot = Player_EditVehicleObjectSlot[playerid],
                Float:vx,
                Float:vy,
                Float:vz,
                Float:va,
                Float:real_x,
                Float:real_y,
                Float:real_z,
                Float:real_a
            ;

            GetVehiclePos(vehid, vx, vy, vz);
            GetVehicleZAngle(vehid, va); // Coba lagi

            real_x = x - vx;
            real_y = y - vy;
            real_z = z - vz;
            real_a = rz - va;

            new Float:v_size[3];
            GetVehicleModelInfo(pvData[vehicleid][cModel], VEHICLE_MODEL_INFO_SIZE, v_size[0], v_size[1], v_size[2]);
            if(	(real_x >= v_size[0] || -v_size[0] >= real_x) ||
                (real_y >= v_size[1] || -v_size[1] >= real_y) ||
                (real_z >= v_size[2] || -v_size[2] >= real_z))
            {
                SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"Posisi object terlalu jauh dari body kendaraan.");
                ResetEditing(playerid);
                return 1;
            }

            VehicleObjects[vehicleid][slot][vehObjectPosX] = real_x;
            VehicleObjects[vehicleid][slot][vehObjectPosY] = real_y;
            VehicleObjects[vehicleid][slot][vehObjectPosZ] = real_z;
            VehicleObjects[vehicleid][slot][vehObjectPosRX] = rx;
            VehicleObjects[vehicleid][slot][vehObjectPosRY] = ry;
            VehicleObjects[vehicleid][slot][vehObjectPosRZ] = real_a;
		
			Streamer_UpdateEx(playerid, VehicleObjects[vehicleid][slot][vehObjectPosX], VehicleObjects[vehicleid][slot][vehObjectPosY], VehicleObjects[vehicleid][slot][vehObjectPosZ]);
			if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_BODY)
			{
				SetDynamicObjectMaterial(VehicleObjects[vehicleid][slot][vehObject], 0, VehicleObjects[vehicleid][slot][vehObjectModel], "none", "none", RGBAToARGB(ColorList[VehicleObjects[vehicleid][slot][vehObjectColor]]));
			}
			else if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_TEXT)
			{
				SetDynamicObjectMaterialText(VehicleObjects[vehicleid][slot][vehObject], 0, VehicleObjects[vehicleid][slot][vehObjectText], 130, VehicleObjects[vehicleid][slot][vehObjectFont], VehicleObjects[vehicleid][slot][vehObjectFontSize], 1, RGBAToARGB(ColorList[VehicleObjects[vehicleid][slot][vehObjectFontColor]]), 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			}
			AttachDynamicObjectToVehicle(VehicleObjects[vehicleid][slot][vehObject], pvData[vehicleid][cVeh], real_x, real_y, real_z, rx, ry, real_a);
        	Vehicle_ObjectUpdate(vehicleid, slot);
			//Vehicle_AttachObject(vehicleid, slot);
            Vehicle_ObjectSave(vehicleid, slot);
			
            if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_BODY)
            {
                Dialog_Show(playerid, VACCSE, DIALOG_STYLE_LIST, "Edit Component", "Position\nPosition (Manual)\nChange Color\nRemove Modification\nSave", "Pilih", "Kembali");
            }
            else if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_TEXT)
            {
                Dialog_Show(playerid, VACCSE1, DIALOG_STYLE_LIST, "Edit Component", "Position\nPosition (Manual)\nText Name\nText Size\nText Font\nText Color\nRemove Modification\nSave", "Pilih", "Kembali");
            }
            else if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_LIGHT)
            {
                Dialog_Show(playerid, VACCSE2, DIALOG_STYLE_LIST, "Edit Component", "Position\nPosition (Manual)\nRemove Modification\nSave", "Pilih", "Kembali");
            }
			return 1;
		}

		if(response == EDIT_RESPONSE_CANCEL)
		{
			ResetEditing(playerid);
			return 1;
		}
	}
    if (response == EDIT_RESPONSE_FINAL)
	{
		if (EditingObject[playerid] != -1 && ObjectData[EditingObject[playerid]][objExists])
	    {
			ObjectData[EditingObject[playerid]][objPos][0] = x;
			ObjectData[EditingObject[playerid]][objPos][1] = y;
			ObjectData[EditingObject[playerid]][objPos][2] = z;
			ObjectData[EditingObject[playerid]][objPos][3] = rx;
			ObjectData[EditingObject[playerid]][objPos][4] = ry;
			ObjectData[EditingObject[playerid]][objPos][5] = rz;

			Object_Refresh(EditingObject[playerid]);
			Object_Save(EditingObject[playerid]);

			SendClientMessageEx(playerid, COLOR_WHITE, "OBJECT: {FFFFFF}You've edited the position of Object ID: %d.", EditingObject[playerid]);
	    }
		else if (EditingMatext[playerid] != -1 && MatextData[EditingMatext[playerid]][mtExists])
	    {
			MatextData[EditingMatext[playerid]][mtPos][0] = x;
			MatextData[EditingMatext[playerid]][mtPos][1] = y;
			MatextData[EditingMatext[playerid]][mtPos][2] = z;
			MatextData[EditingMatext[playerid]][mtPos][3] = rx;
			MatextData[EditingMatext[playerid]][mtPos][4] = ry;
			MatextData[EditingMatext[playerid]][mtPos][5] = rz;

			Matext_Refresh(EditingMatext[playerid]);
			Matext_Save(EditingMatext[playerid]);

			SendClientMessageEx(playerid, COLOR_WHITE, "MATEXT: {FFFFFF}You've edited the position of Material Text ID: %d.", EditingMatext[playerid]);
	    }

	    
	}
	if(pData[playerid][EditingATMID] != -1 && Iter_Contains(ATMS, pData[playerid][EditingATMID]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        AtmData[etid][atmX] = x;
	        AtmData[etid][atmY] = y;
	        AtmData[etid][atmZ] = z;
	        AtmData[etid][atmRX] = rx;
	        AtmData[etid][atmRY] = ry;
	        AtmData[etid][atmRZ] = rz;

	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_X, AtmData[etid][atmX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Y, AtmData[etid][atmY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Z, AtmData[etid][atmZ] + 0.3);

		    Atm_Save(etid);
	        pData[playerid][EditingATMID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);
	        pData[playerid][EditingATMID] = -1;
	    }
	}
	if(pData[playerid][gEditID] != -1 && Iter_Contains(Gates, pData[playerid][gEditID]))
	{
		new id = pData[playerid][gEditID];
		if(response == EDIT_RESPONSE_UPDATE)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
		}
		else if(response == EDIT_RESPONSE_CANCEL)
		{
			SetDynamicObjectPos(objectid, gPosX[playerid], gPosY[playerid], gPosZ[playerid]);
			SetDynamicObjectRot(objectid, gRotX[playerid], gRotY[playerid], gRotZ[playerid]);
			gPosX[playerid] = 0; gPosY[playerid] = 0; gPosZ[playerid] = 0;
			gRotX[playerid] = 0; gRotY[playerid] = 0; gRotZ[playerid] = 0;
			Servers(playerid, " You have canceled editing gate ID %d.", id);
			Gate_Save(id);
		}
		else if(response == EDIT_RESPONSE_FINAL)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
			if(pData[playerid][gEdit] == 1)
			{
				gData[id][gCX] = x;
				gData[id][gCY] = y;
				gData[id][gCZ] = z;
				gData[id][gCRX] = rx;
				gData[id][gCRY] = ry;
				gData[id][gCRZ] = rz;
				if(IsValidDynamic3DTextLabel(gData[id][gText])) DestroyDynamic3DTextLabel(gData[id][gText]);
				new str[64];
				format(str, sizeof(str), "Gate ID: %d", id);
				gData[id][gText] = CreateDynamic3DTextLabel(str, COLOR_WHITE, gData[id][gCX], gData[id][gCY], gData[id][gCZ], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 10.0);
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's closing position.", id);
				gData[id][gStatus] = 0;
				Gate_Save(id);
			}
			else if(pData[playerid][gEdit] == 2)
			{
				gData[id][gOX] = x;
				gData[id][gOY] = y;
				gData[id][gOZ] = z;
				gData[id][gORX] = rx;
				gData[id][gORY] = ry;
				gData[id][gORZ] = rz;
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's opening position.", id);

				gData[id][gStatus] = 1;
				Gate_Save(id);
			}
		}
	}
	return 1;
}

public DoGMX()
{
	SendRconCommand("gmx");
	return 1;
}
function StressBerkurang(playerid)
{
	pData[playerid][pBladder] --;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid == Healing)
	{
	    InfoMsg(playerid, "You Leave At Healing Place");
	    pData[playerid][TempatHealing] = false;
	    KillTimer(stresstimer[playerid]);
	}
	if(areaid == pintupolis1)
	{
		MoveDynamicObject(pintugerak1,1651.209838, -1255.946899, 15.675873,1.0,0.0,0.0,0.0);
		MoveDynamicObject(pintugerak2,1649.721435, -1255.947021, 15.675871,1.0,0.0,0.0,0.0);
	}
	if(areaid == pintupolis2)
	{
		MoveDynamicObject(pintugerak1,1651.209838, -1255.946899, 15.675873,1.0,0.0,0.0,0.0);
		MoveDynamicObject(pintugerak2,1649.721435, -1255.947021, 15.675871,1.0,0.0,0.0,0.0);
	}
}

forward OnPlayerEnterDynamicArea(playerid, areaid);
public OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(areaid == Healing)
	{
	    InfoMsg(playerid, "You Entered Healing Place");
        pData[playerid][TempatHealing] = true;
	}
	if(areaid == PenjualanBarang)
	{
	    Jembut(playerid, "Selling Items", 5);
	}
	if(areaid == ShowRoomCP)
	{
		Jembut(playerid, "Buying Vehicle", 5);
	}
	/*if(areaid == pintupolis1)
	{
		MoveDynamicObject(pintugerak2,1648.450195, -1255.947021, 15.675870,1.0,0.0,0.0,0.0);
		MoveDynamicObject(pintugerak1,1652.540649, -1255.946899, 15.675872,1.0,0.0,0.0,0.0);
	}
	if(areaid == pintupolis2)
	{
		MoveDynamicObject(pintugerak2,1648.450195, -1255.947021, 15.675870,1.0,0.0,0.0,0.0);
		MoveDynamicObject(pintugerak1,1652.540649, -1255.946899, 15.675872,1.0,0.0,0.0,0.0);
	}*/
	if(areaid == Disnaker)
	{
	    Jembut(playerid, "Mengambil pekerjaaan", 5);
	}
	if(areaid == PemotongArea[playerid][AmbilAyamHidup1])
	{
		Jembut(playerid, "Mengambil Ayam", 5);
	}
	if(areaid == PemotongArea[playerid][AmbilAyamHidup2])
	{
		Jembut(playerid, "Mengambil Ayam", 5);
	}
	if(areaid == kendaraansapd)
	{
		Jembut(playerid, "Access Police Vehicles", 5);
	}
	if(areaid == PemotongArea[playerid][AmbilAyamHidup3])
	{
		Jembut(playerid, "Mengambil Ayam", 5);
	}
	if(areaid == PemotongArea[playerid][AmbilAyamHidup4])
	{
		Jembut(playerid, "Mengambil Ayam", 5);
	}
	if(areaid == PemotongArea[playerid][AmbilAyamHidup5])
	{
		Jembut(playerid, "Mengambil Ayam", 5);
	}
	if(areaid == PemotongArea[playerid][AmbilAyam])
	{
		Jembut(playerid, "Memulai Mengambil Ayam", 5);
	}
	if(areaid == bank)
	{
	    Jembut(playerid, "mengakses bank", 5);
	}
	if(areaid == bank1)
	{
	    Jembut(playerid, "mengakses bank", 5);
	}
	if(areaid == bank2)
	{
	    Jembut(playerid, "mengakses bank", 5);
	}
	if(areaid == mancing1)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
	if(areaid == mancing2)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
	if(areaid == mancing3)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
	if(areaid == mancing4)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
	if(areaid == mancing5)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
	if(areaid == mancing6)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
	if(areaid == mancing7)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
	if(areaid == mancing8)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
	if(areaid == mancing9)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
	if(areaid == mancing10)
	{
		Jembut(playerid, "Memancing Ikan", 5);
	}
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
    if(checkpointid == KargoArea[playerid][Kargo])
	{
		Jembut(playerid, "Mulai Tugas Kargo", 5);
	}
	if(checkpointid == atm2)
	{
		Jembut(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == gudangkota)
	{
		Jembut(playerid, "Mengakses Gudang Kota", 5);
	}
	if(checkpointid == garasisamd)
	{
		Jembut(playerid, "Access Medical Vehicles", 5);
	}
	if(checkpointid == garasipedagang)
	{
		Jembut(playerid, "Access Food Vendors Vehicles", 5);
	}
	if(checkpointid == menumasak)
	{
		Jembut(playerid, "Open Food Menu", 5);
	}
	if(checkpointid == menuminum)
	{
		Jembut(playerid, "Pickup Drink", 5);
	}
	if(checkpointid == menupedagang)
	{
		Jembut(playerid, "Open Menu Resto", 5);
	}
	if(checkpointid == atm3)
	{
		Jembut(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == atm4)
	{
		Jembut(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == atm1)
	{
		Jembut(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == asuransi)
	{
		Jembut(playerid, "Mengakses Asuransi", 5);
	}
	if(checkpointid == pernikahan)
	{
		Jembut(playerid, "mengambil makanan", 5);
	}
	if(checkpointid == BusArea[playerid][BusCp])
	{
		Jembut(playerid, "memulai pekerjaan bus", 5);
	}
	if(checkpointid == BusArea[playerid][BusCpBaru])
	{
		Jembut(playerid, "memulai pekerjaan bus", 5);
	}
	if(checkpointid == PetaniArea[playerid][LockerTani])
	{
		Jembut(playerid, "Membeli Bibit", 5);
	}
	if(checkpointid == PetaniArea[playerid][PembuatanJadiApa])
	{
		Jembut(playerid, "Memproses Bahan Tani", 5);
	}
	if(checkpointid == PetaniArea[playerid][NanamTani])
	{
		Jembut(playerid, "Menanam Bibit", 5);
	}
	if(checkpointid == PetaniArea[playerid][NanamLagi])
	{
		Jembut(playerid, "Menanam Bibit", 5);
	}
	if(checkpointid == PetaniArea[playerid][NanamJuga])
	{
		Jembut(playerid, "Menanam Bibit", 5);
	}
	if(checkpointid == PetaniArea[playerid][NanamAja])
	{
		Jembut(playerid, "Menanam Bibit", 5);
	}
	if(checkpointid == PemotongArea[playerid][PotongAyam])
	{
		Jembut(playerid, "Saw a Chicken", 5);
	}
	if(checkpointid == PemotongArea[playerid][PotongAyam2])
	{
		Jembut(playerid, "Saw a Chicken", 5);
	}
	if(checkpointid == PemotongArea[playerid][PotongAyam3])
	{
		Jembut(playerid, "Saw a Chicken", 5);
	}
	if(checkpointid == PemotongArea[playerid][PackingAyam2])
	{
		Jembut(playerid, "Packing Chicken", 5);
	}
	if(checkpointid == PemotongArea[playerid][PackingAyam])
	{
		Jembut(playerid, "Packing Chicken", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang])
	{
		Jembut(playerid, "Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang2])
	{
		Jembut(playerid, "Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang3])
	{
		Jembut(playerid, "Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang4])
	{
		Jembut(playerid, "Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang5])
	{
		Jembut(playerid, "Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang6])
	{
		Jembut(playerid, "Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][CuciBatu])
	{
		Jembut(playerid, "Mencuci Batu", 5);
	}
	if(checkpointid == PenambangArea[playerid][Peleburan])
	{
		Jembut(playerid, "Meleburkan Batu", 5);
	}
	if(checkpointid == MinyakArea[playerid][OlahMinyak])
	{
	    Jembut(playerid, "Olah Minyak", 5);
	}
	if(checkpointid == PemerahCP)
	{
		Jembut(playerid, "Akses ~p~Locker", 5);
	}
	if(checkpointid == MinyakArea[playerid][Nambangg])
	{
	    Jembut(playerid, "Ambil Minyak", 5);
	}
	if(checkpointid == MinyakArea[playerid][Nambang])
	{
	    Jembut(playerid, "Ambil Minyak", 5);
	}
	return 1;
}
public OnPlayerLeaveCheckpoint(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
	if(pData[playerid][pBus] && GetVehicleModel(vehicleid) == 431)
	{
		pData[playerid][pBuswaiting] = false;
		HideSemua(playerid);
	}
	return 1;
}
public OnPlayerEnterRaceCheckpoint(playerid)
{
	switch(pData[playerid][pCheckPoint])
	{
		case CHECKPOINT_BUS:
		{
			if(pData[playerid][pJob] == 1)
			{
				new vehicleid = GetPlayerVehicleID(playerid);//rute a
				if(GetVehicleModel(vehicleid) == 431)
				{
					if(pData[playerid][pBus] == 1)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 2;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint2, abuspoint2, 5.0);
					}
					else if(pData[playerid][pBus] == 2)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 3;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint3, abuspoint3, 5.0);
					}
					else if(pData[playerid][pBus] == 3)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 4;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint4, abuspoint4, 5.0);
					}
					else if(pData[playerid][pBus] == 4)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 5;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint5, abuspoint5, 5.0);
					}
					else if(pData[playerid][pBus] == 5)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 6;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint6, abuspoint6, 5.0);
					}
					else if(pData[playerid][pBus] == 6)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 7;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint7, abuspoint7, 5.0);
					}
					else if(pData[playerid][pBus] == 7)
					{
						pData[playerid][pBuswaiting] = true;
						pData[playerid][pBustime] = 10;
						PlayerPlaySound(playerid, 43000, 1233.421142,-1826.628662,13.410322);
					}
					else if(pData[playerid][pBus] == 8)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 9;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint9, abuspoint9, 5.0);
					}
					else if(pData[playerid][pBus] == 9)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 10;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint10, abuspoint10, 5.0);
					}
					else if(pData[playerid][pBus] == 10)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 11;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint11, abuspoint11, 5.0);
					}
					else if(pData[playerid][pBus] == 11)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 12;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint12, abuspoint12, 5.0);
					}
					else if(pData[playerid][pBus] == 12)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 13;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint13, abuspoint13, 5.0);
					}
					else if(pData[playerid][pBus] == 13)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 14;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint14, abuspoint14, 5.0);
					}
					else if(pData[playerid][pBus] == 16)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 17;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint16, abuspoint16, 5.0);
					}
					else if(pData[playerid][pBus] == 17)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 18;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint17, abuspoint17, 5.0);
					}
					else if(pData[playerid][pBus] == 18)
					{
						pData[playerid][pBuswaiting] = true;
						pData[playerid][pBustime] = 10;
						PlayerPlaySound(playerid, 43000, 1664.885498,-2250.255615,13.363609);
					}
					else if(pData[playerid][pBus] == 19)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 20;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint19, abuspoint19, 5.0);
					}
					else if(pData[playerid][pBus] == 20)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 21;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint20, abuspoint20, 5.0);
					}
					else if(pData[playerid][pBus] == 21)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 22;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint21, abuspoint21, 5.0);
					}
					else if(pData[playerid][pBus] == 22)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 23;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint22, abuspoint22, 5.0);
					}
					else if(pData[playerid][pBus] == 23)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 24;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint23, abuspoint23, 5.0);
					}
					else if(pData[playerid][pBus] == 24)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 25;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint24, abuspoint24, 5.0);
					}
					else if(pData[playerid][pBus] == 25)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 26;
						SetPlayerRaceCheckpoint(playerid, 2, abuspoint25, abuspoint25, 5.0);
					}
					else if(pData[playerid][pBus] == 26)
					{
						pData[playerid][pBuswaiting] = true;
						pData[playerid][pBustime] = 10;
						PlayerPlaySound(playerid, 43000, 1957.487670,-1977.764892,13.390586);
					}
					else if(pData[playerid][pBus] == 27)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 28;
						SetPlayerRaceCheckpoint(playerid, 1, abuspoint27, abuspoint27, 5.0);
					}
					else if(pData[playerid][pBus] == 28)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 29;
						SetPlayerRaceCheckpoint(playerid, 1, abuspoint28, abuspoint28, 5.0);
					}
					else if(pData[playerid][pBus] == 29)
					{
						pData[playerid][pBus] = 0;
						pData[playerid][pSideJob] = 0;
						pData[playerid][pBusTime] = 0;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						DisablePlayerRaceCheckpoint(playerid);
						GivePlayerMoneyEx(playerid, 125);
					    ShowItemBox(playerid, "Uang", "Received_$125", 1212, 4);
						RemovePlayerFromVehicle(playerid);
						if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
   						DestroyVehicle(pData[playerid][pKendaraanKerja]);  //jika player disconnect maka kendaraan akan ilang
					}
				}
			}
		}
		case CHECKPOINT_MISC:
		{
			pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
			DisablePlayerRaceCheckpoint(playerid);
		}
	}
	if(pData[playerid][pGpsActive] == 1)
	{
		pData[playerid][pGpsActive] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackCar] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan kendaraan anda!");
		pData[playerid][pTrackCar] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackHouse] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan rumah anda!");
		pData[playerid][pTrackHouse] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackBisnis] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan bisnis!");
		pData[playerid][pTrackBisnis] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Mission) , /storeproduct.");
	}
	if(pData[playerid][pJob] == 8)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 515)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.5, 290.330383,2542.228027,16.820337))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("MuatBarang", 20000, false, "d", playerid);
				DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2814.943847,964.729858,10.750000))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("MuatBarangRock", 20000, false, "d", playerid);
				DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, 1633.136718,971.050537,10.820312))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("MuatBarangLva", 20000, false, "d", playerid);
				DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, -1326.462036,2688.859619,50.062500))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("BahanBakar", 20000, false, "d", playerid);
                DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, 249.263397,1443.614746,10.585937))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("BahanBakarLv", 20000, false, "d", playerid);
                DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, -1676.272094,412.909149,7.179687))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("BahanBakarSf", 20000, false, "d", playerid);
                DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, -1040.951782,-656.037048,32.007812))
			{
			    if(pData[playerid][pKargo] == 1)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 2050);
					ShowItemBox(playerid, "Uang", "Received_$2,050", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Puing Pesawat ~w~seharga ~p~$2,050.");
			    }
			    if(pData[playerid][pKargo] == 2)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 2250);
					ShowItemBox(playerid, "Uang", "Received_$2,250", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Bahan Bakar ~w~seharga ~p~$2,250.");
			    }
			    if(pData[playerid][pKargo] == 3)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 1900);
					ShowItemBox(playerid, "Uang", "Received_$1,900", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Barang ~w~seharga ~p~$1,900.");
			    }
			    if(pData[playerid][pKargo] == 4)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 1450);
					ShowItemBox(playerid, "Uang", "Received_$1450", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Bahan Bakar ~w~seharga ~p~$1450.");
			    }
			    if(pData[playerid][pKargo] == 5)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 1700);
					ShowItemBox(playerid, "Uang", "Received_$1700", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Barang ~w~seharga ~p~$1700.");
			    }
			    if(pData[playerid][pKargo] == 6)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 1100);
					ShowItemBox(playerid, "Uang", "Received_$1100", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Bahan Bakar ~w~seharga ~p~$1100.");
			    }
			}
		}
	}
	if(pData[playerid][pHauling] > -1)
	{
		if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
		{
			DisablePlayerRaceCheckpoint(playerid);
			Info(playerid, "'/storegas' untuk menyetor GasOilnya!");
		}
		else
		{
			if(IsPlayerInRangeOfPoint(playerid, 10.0, 335.66, 861.02, 21.01))
			{
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerCheckpoint(playerid, 336.70, 895.54, 20.40, 5.5);
				Info(playerid, "Silahkan ambil trailer dan menuju ke checkpoint untuk membeli GasOil!");
			}
			else
			{
				Error(playerid, "Anda tidak membawa Trailer Gasnya, Silahkan ambil kembali trailernnya!");
			}
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
    CPHunter(playerid);
	if (PlayerInfo[playerid][pWaypoint])
	{
		PlayerInfo[playerid][pWaypoint] = 0;

		DisablePlayerCheckpoint(playerid);
		PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][69]);
		SuccesMsg(playerid, "Anda telah sampai ditujuan :)");
	}
	if(pData[playerid][pHauling] > -1)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.5, 336.70, 895.54, 20.40))
		{
			DisablePlayerCheckpoint(playerid);
			Info(playerid, "/buy, /gps(My Hauling), /storegas.");
		}
	}
	if(pData[playerid][pFindEms] != INVALID_PLAYER_ID)
	{
		pData[playerid][pFindEms] = INVALID_PLAYER_ID;
		DisablePlayerCheckpoint(playerid);
	}
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint1))
			{
				SetPlayerCheckpoint(playerid, buspoint2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint2))
			{
				SetPlayerCheckpoint(playerid, buspoint3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint3))
			{
				SetPlayerCheckpoint(playerid, buspoint4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint4))
			{
				SetPlayerCheckpoint(playerid, buspoint5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint5))
			{
				SetPlayerCheckpoint(playerid, buspoint6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint6))
			{
				SetPlayerCheckpoint(playerid, buspoint7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint7))
			{
				SetPlayerCheckpoint(playerid, buspoint8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint8))
			{
				SetPlayerCheckpoint(playerid, buspoint9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint9))
			{
				SetPlayerCheckpoint(playerid, buspoint10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint10))
			{
				SetPlayerCheckpoint(playerid, buspoint11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint11))
			{
				SetPlayerCheckpoint(playerid, buspoint12, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint12))
			{
				SetPlayerCheckpoint(playerid, buspoint13, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint13))
			{
				SetPlayerCheckpoint(playerid, buspoint14, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint14))
			{
				SetPlayerCheckpoint(playerid, buspoint15, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint15))
			{
				SetPlayerCheckpoint(playerid, buspoint16, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint16))
			{
				SetPlayerCheckpoint(playerid, buspoint17, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint17))
			{
				SetPlayerCheckpoint(playerid, buspoint18, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint18))
			{
				SetPlayerCheckpoint(playerid, buspoint19, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint19))
			{
				SetPlayerCheckpoint(playerid, buspoint20, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint20))
			{
				SetPlayerCheckpoint(playerid, buspoint21, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint21))
			{
				SetPlayerCheckpoint(playerid, buspoint22, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint22))
			{
				SetPlayerCheckpoint(playerid, buspoint23, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint23))
			{
				SetPlayerCheckpoint(playerid, buspoint24, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint24))
			{
				SetPlayerCheckpoint(playerid, buspoint25, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint25))
			{
				SetPlayerCheckpoint(playerid, buspoint26, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint26))
			{
				SetPlayerCheckpoint(playerid, buspoint27, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,buspoint27))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pBusTime] = 280;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Bus)", 300);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if((newkeys & KEY_JUMP) && !IsPlayerInAnyVehicle(playerid))
    {
        AntiBHOP[playerid] ++;
        if(pData[playerid][pRFoot] <= 70 || pData[playerid][pLFoot] <= 70)
        {
        	SetTimerEx("AppuiePasJump", 1700, false, "i", playerid);
        	if(AntiBHOP[playerid] == 5)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
        if(pData[playerid][pRFoot] <= 90 || pData[playerid][pLFoot] <= 90)
        {
        	SetTimerEx("AppuiePasJump", 700, false, "i", playerid);
        	if(AntiBHOP[playerid] == 5)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
        if(pData[playerid][pRFoot] <= 40 || pData[playerid][pLFoot] <= 40)
        {
        	SetTimerEx("AppuiePasJump", 3200, false, "i", playerid);
        	if(AntiBHOP[playerid] == 5)
        	{
        		ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
        		new jpName[MAX_PLAYER_NAME];
        		GetPlayerName(playerid,jpName,MAX_PLAYER_NAME);
        		SetTimerEx("AppuieJump", 3000, false, "i", playerid);
        	}
        	return 1;
        }
    }
    DEN_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	if((newkeys & (KEY_FIRE | KEY_CROUCH)) == (KEY_FIRE | KEY_CROUCH) && (oldkeys & (KEY_FIRE | KEY_CROUCH)) != (KEY_FIRE | KEY_CROUCH))
	{
		new gun = GetPlayerWeapon(playerid);
		if(gun == 24)
		{
			cbugwarn[playerid]++;
			if(cbugwarn[playerid] == 5) return Kick(playerid);
			InfoMsg(playerid, "Kamu telah menggunakan cbug, peringatan ke 5 akan ditendang!");
			return 1;
		}
	}
	if((newkeys & KEY_SECONDARY_ATTACK))
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
					return ErrorMsg(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

				if(dData[did][dLocked])
					return ErrorMsg(playerid, "This entrance is locked at the moment.");
					
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return ErrorMsg(playerid, "This door only for faction.");
				}
				if(dData[did][dFamily] > 0)
				{
					if(dData[did][dFamily] != pData[playerid][pFamily])
						return ErrorMsg(playerid, "This door only for family.");
				}
				
				if(dData[did][dVip] > pData[playerid][pVip])
					return ErrorMsg(playerid, "Your VIP level not enough to enter this door.");
				
				if(dData[did][dAdmin] > pData[playerid][pAdmin])
					return ErrorMsg(playerid, "Your admin level not enough to enter this door.");
					
				if(strlen(dData[did][dPass]))
				{
					new params[256];
					if(sscanf(params, "s[256]", params)) return SyntaxMsg(playerid, "/enter [password]");
					if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
					
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					if(PlayerInfo[playerid][pProgress] == 4) return ErrorMsg(playerid, "Tunggu Sebentar");
					pData[playerid][pInDoor] = did;
					ShowProgressbar(playerid, "Loading Rendering", 5);
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
				else
				{
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
					pData[playerid][pInDoor] = did;
					ShowProgressbar(playerid, "Loading Rendering", 5);
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				
				if(dData[did][dCustom])
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				else
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				pData[playerid][pInDoor] = -1;
				if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
				ShowProgressbar(playerid, "Loading Rendering", 5);
				SetPlayerInterior(playerid, dData[did][dExtint]);
				SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");
				
				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			pData[playerid][pInHouse] = -1;
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);
			
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");
					
				pData[playerid][pInFamily] = fid;	
				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
			new difamily = pData[playerid][pInFamily];
			if(pData[playerid][pInFamily] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, fData[difamily][fIntposX], fData[difamily][fIntposY], fData[difamily][fIntposZ]))
			{
				pData[playerid][pInFamily] = -1;	
				SetPlayerPositionEx(playerid, fData[difamily][fExtposX], fData[difamily][fExtposY], fData[difamily][fExtposZ], fData[difamily][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
	}
	//SAPD Taser/Tazer
	if(newkeys & KEY_FIRE && TaserData[playerid][TaserEnabled] && GetPlayerWeapon(playerid) == 0 && !IsPlayerInAnyVehicle(playerid) && TaserData[playerid][TaserCharged])
	{
  		TaserData[playerid][TaserCharged] = false;

	    new Float: x, Float: y, Float: z, Float: health;
     	GetPlayerPos(playerid, x, y, z);
	    PlayerPlaySound(playerid, 6003, 0.0, 0.0, 0.0);
	    ApplyAnimation(playerid, "KNIFE", "KNIFE_3", 4.1, 0, 1, 1, 0, 0, 1);
		pData[playerid][pActivityTime] = 0;
	    TaserData[playerid][ChargeTimer] = SetTimerEx("ChargeUp", 1000, true, "i", playerid);
		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Recharge...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);

	    for(new i, maxp = GetPlayerPoolSize(); i <= maxp; ++i)
		{
	        if(!IsPlayerConnected(i)) continue;
          	if(playerid == i) continue;
          	if(TaserData[i][TaserCountdown] != 0) continue;
          	if(IsPlayerInAnyVehicle(i)) continue;
			if(GetPlayerDistanceFromPoint(i, x, y, z) > 2.0) continue;
			ClearAnimations(i, 1);
			TogglePlayerControllable(i, false);
   			ApplyAnimation(i, "CRACK", "crckdeth2", 4.1, 0, 0, 0, 1, 0, 1);
			PlayerPlaySound(i, 6003, 0.0, 0.0, 0.0);

			GetPlayerHealth(i, health);
			TaserData[i][TaserCountdown] = TASER_BASETIME + floatround((100 - health) / 12);
   			Info(i, "Anda bisa memakai Taser setelah %d detik!", TaserData[i][TaserCountdown]);
			TaserData[i][GetupTimer] = SetTimerEx("TaserGetUp", 1000, true, "i", i);
			break;
	    }
	}
	if((newkeys & KEY_CTRL_BACK))
	{
	    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "You still have activity progress!");
		ShowPlayerDialog(playerid, DIALOG_RADIAL, DIALOG_STYLE_TABLIST_HEADERS, "Radial Menu - {007a1e}Greenwich City", "Category\tDetails\n{BABABA}Private Document\t{BABABA}-> For Open Your Private Documenta\n{ffffff}Phone\t-> For Open Your Phone\n{BABABA}Inventory\t{BABABA}-> For Open Your Backpack\n{ffffff}Walkie Talkie\t-> For Open Your Walky Talky\n{BABABA}Faction Menu\t{BABABA}-> For Open Faction Menu\n{ffffff}Voice Mode\t-> For Change Your Range Voice\n{BABABA}Vehicles\t{BABABA}-> Fir Open Your Vehicle Panel\n{ffffff}Accessories\t-> For Use Your Accessories\n{BABABA}Radio Mode\t{BABABA}-> For On/Off Radio Toggle\n{FFFFFF}Frisk\t{FFFFFf}-> For Look Other People Backpack\n{BABABA}AirDrop\t{BABABA}-> For Sharing Your Number", "{27d23d}Enter", "{e31d1d}Close");
	}
	if(newkeys & KEY_HANDBRAKE && GetPlayerWeapon(playerid) == 24 && GetNearbyRobbery(playerid) >= 0)
	{
	    for(new i = 0; i < MAX_ROBBERY; i++)
		{
		    if(IsPlayerInRangeOfPoint(playerid, 2.3, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]))
			{
				if(Warung == true) return 1;
				if(polisidikota < 5)
				return ErrorMsg(playerid, "Anda tidak dapat mengambil ini!, dikarenakan kurang dari 5 polisi dikota");
				if(pData[playerid][pFamily] == -1)
        		return ErrorMsg(playerid, "Anda bukan anggota keluarga!");
				SetTimerEx("RobWarung", 10000, false, "d", playerid);
				ApplyActorAnimation(RobberyData[i][robberyID], "ROB_BANK","SHP_HandsUp_Scr",4.0,0,0,0,1,0);
				Warung = true;
				new label[100];
				format(label, sizeof label, "Penjaga : Jangan sakiti aku tuan, aku akan memberikanmu uangnya");
				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				new lstr[1024];
				format(lstr, sizeof(lstr), "ROBERRY | NEWS: {ffffff}Telah terjadi perampokan warung di daerah %s", GetLocation(x, y, z));
				SendClientMessageToAll(COLOR_ORANGE2, lstr);
				RobberyData[i][robberyText] = CreateDynamic3DTextLabel(label, COLOR_WHITE, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]+1.3, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0, -1, 10.0);
			}
		}
	}
	if(newkeys & KEY_NO)
	{
		callcmd::death(playerid, "");
	}
	//-----[ Vehicle ]-----	
	if((newkeys & KEY_NO ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			callcmd::engine(playerid, "");
			callcmd::light(playerid, "");
		}
		return 1;
	}
	if(newkeys & KEY_NO)
	{
	    foreach(new gsid : GStation)
		{
			if(IsPlayerInRangeOfPoint(playerid, 4.0, gsData[gsid][gsPosX], gsData[gsid][gsPosY], gsData[gsid][gsPosZ]))
			{
			    if(IsPlayerInAnyVehicle(playerid))
				return ErrorMsg(playerid, "Anda harus berada di luar kendaraan.");
				if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity");
	 	 		callcmd::belijerigen(playerid, "");
			}
	    }
	}
	if((newkeys & KEY_WALK ))
	{
		foreach(new lid : Lockers)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, lData[lid][lPosX], lData[lid][lPosY], lData[lid][lPosZ]))
			{
				if(pData[playerid][pVip] > 0 && lData[lid][lType] == 7)
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERVIP, DIALOG_STYLE_LIST, "Greenwich // VIP Locker", "Health\nWeapons\nClothing\nVip Toys", "Okay", "Batal");
				}
				else if(pData[playerid][pFaction] == 1 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSAPD, DIALOG_STYLE_LIST, "Greenwich // GWPD Locker", "Baju Kerja\nArmour\nSenjata\nClothing\nClothing War", "Pilih", "Batal");
				}
				else if(pData[playerid][pFaction] == 2 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSAGS, DIALOG_STYLE_LIST, "Greenwich // GWGS Locker", "Baju Kerja\nArmour\nSenjata\nClothing", "Pilih", "Batal");
				}
				else if(pData[playerid][pFaction] == 3 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSAMD, DIALOG_STYLE_LIST, "Greenwich // GWMD Locker", "Baju Kerja\nObat\nClothing", "Pilih", "Batal");
				}
				else if(pData[playerid][pFaction] == 4 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSANEW, DIALOG_STYLE_LIST, "Greenwich // GWNA Locker", "Baju Kerja\nClothing", "Proceed", "Batal");
				}
				else if(pData[playerid][pFaction] == 5 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERPEDAGANG, DIALOG_STYLE_LIST, "Greenwich // FVENDOR Lokcer", "Baju Kerja\nClothing", "Pilih", "Batal");
				}
				else if(pData[playerid][pFaction] == 6 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERGOJEK, DIALOG_STYLE_LIST, "Greenwich // GWJEK Locker", "Seragam Driver Gwjek\nHelm Gwjek", "Pilih", "Batal");
				}
				else if(pData[playerid][pFamily] > 0 && lData[lid][lType] == 7)
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKFAMS, DIALOG_STYLE_LIST, "Greenwich // Family Lockers", "Clothing", "Pilih", "Batal");
				}
				else return ErrorMsg(playerid, "Anda tidak mengakses locker ini!");
			}
		}
	}
	if((newkeys & KEY_WALK ))
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1545.033935,-2177.635498,13.582808))
		{
		    if(!GetOwnedVeh(playerid)) return ErrorMsg(playerid, "Anda tidak memiliki kendaraan apapun.");
			new vid, _tmpstring[128], count = GetOwnedVeh(playerid), CMDSString[512], status[30];
			CMDSString = "";
			strcat(CMDSString,"VID\tModel [Database ID]\tPlate\t\tBiaya Asuransi\n",sizeof(CMDSString));
			Loop(itt, (count + 1), 1)
			{
				vid = ReturnPlayerVehID(playerid, itt);
				if(pvData[vid][cPark] != -1)
				{
					status = ""LG_E"Garkot";
				}
				else if(pvData[vid][cClaim] != 0)
				{
					status = "Asuransi";
				}
				else if(pvData[vid][cStolen] != 0)
				{
					status = ""RED_E"Rusak";
				}
				else
				{
					status = "Spawned";
				}

				if(itt == count)
				{
					format(_tmpstring, sizeof(_tmpstring), "{ffffff}[%s]\t%s [%d]{ffffff}\t%s\t\t"LG_E"$500\n", status, GetVehicleModelName(pvData[vid][cModel]), pvData[vid][cID], pvData[vid][cPlate]);
				}
				else format(_tmpstring, sizeof(_tmpstring), "{ffffff}[%s]\t%s [%d]{ffffff}\t%s\t\t"LG_E"$500\n", status, GetVehicleModelName(pvData[vid][cModel]), pvData[vid][cID], pvData[vid][cPlate]);
				strcat(CMDSString, _tmpstring);
			}
			ShowPlayerDialog(playerid, DIALOG_ASURANSI, DIALOG_STYLE_TABLIST_HEADERS, "{007a1e}Greenwich - Insurance Vehicle", CMDSString, "Enter", "Cancel");
		}
	}
    if((newkeys & KEY_WALK ))
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1864.952880,878.926574,10.930519))
		{
		    if(delaydealer == true) return ErrorMsg(playerid, "Harap antri!");
	        for(new i = 0; i < 14; i++)
			{
				TextDrawShowForPlayer(playerid, DealerTD[i]);
			}
			cskin[playerid]++;
			delaydealer = true;
			pData[playerid][pLagiDealer] = 1;
		    if(cskin[playerid] >= sizeof Kendaraan) cskin[playerid] = 0;
		    if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
	   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
	   		pData[playerid][pKendaraanDealer] = CreateVehicle(Kendaraan[cskin[playerid]], 1853.037475,869.174865,10.910516,359.373474,0,0,-1);
	   		PutPlayerInVehicle(playerid, pData[playerid][pKendaraanDealer], 0);
	   		new AtmInfo[560];
		   	format(AtmInfo,1000,"%s", FormatMoney(GetVehicleCost(Kendaraan[cskin[playerid]])));
			TextDrawSetString(DealerTD[6], AtmInfo);
		    TextDrawShowForPlayer(playerid, DealerTD[6]);
		    format(AtmInfo,1000,"%s", GetVehicleModelName(Kendaraan[cskin[playerid]]));
			TextDrawSetString(DealerTD[13], AtmInfo);
		    TextDrawShowForPlayer(playerid, DealerTD[13]);
		    SetPlayerCameraPos(playerid,1850.219970,875.313476,10.910516);
			SelectTextDraw(playerid, COLOR_BLUE);
	    }
	}
	if((newkeys & KEY_YES))
	{
	   	foreach(new gsid : GStation)
		{
			if(IsPlayerInRangeOfPoint(playerid, 4.0, gsData[gsid][gsPosX], gsData[gsid][gsPosY], gsData[gsid][gsPosZ]))
			{
				if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
				return ErrorMsg(playerid, "Anda harus berada di dalam kendaraan.");

				new vehid = GetPlayerVehicleID(playerid);
				if(!IsEngineVehicle(vehid))
			            return ErrorMsg(playerid, "Anda tidak berada di kendaraan yang mempunyai bahan bakar.");

				if(GetEngineStatus(vehid))
								return ErrorMsg(playerid, "Mohon matikan mesin kendaraan terlebih dahulu");

				if(pData[playerid][pFill] != -1)
					return ErrorMsg(playerid, "Anda sedang mengisi bahan bakar, mohon ditunggu!");

				if(gsData[gsid][gsStock] < 1)
					return ErrorMsg(playerid, "Pom bensin tidak mempunyai stok!");

				pData[playerid][pFill] = gsid;
				pData[playerid][pFillStatus] = 1;
				for(new i = 0; i < 26; i++)
				{
					PlayerTextDrawShow(playerid, PomTD[playerid][i]);
				}
				SelectTextDraw(playerid, COLOR_BLUE);
			}
		}
	}
	//-----[ Bisnis ]-----
	if((newkeys & KEY_WALK))
	{
	    foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bLocked])
					return ErrorMsg(playerid, "Bussines Close Right Now!");

				pData[playerid][pInBiz] = bid;
				Bisnis_BuyMenu(playerid, pData[playerid][pInBiz]);
			}
		}
	}
	if((newkeys & KEY_NO ))
	{
		foreach(new id : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, bData[id][bExtposX], bData[id][bExtposY], bData[id][bExtposZ]))
			{
				if(bData[id][bPrice] > GetPlayerMoney(playerid)) return ErrorMsg(playerid, "Uang anda tidak cukup, anda tidak dapat membeli bisnis ini!.");
				if(strcmp(bData[id][bOwner], "-")) return ErrorMsg(playerid, "Someone already owns this bisnis.");
				if(pData[playerid][pVip] == 1)
				{
					#if LIMIT_PER_PLAYER > 0
					if(Player_BisnisCount(playerid) + 1 > 2) return ErrorMsg(playerid, "You can't buy any more bisnis.");
					#endif
				}
				else if(pData[playerid][pVip] == 2)
				{
					#if LIMIT_PER_PLAYER > 0
					if(Player_BisnisCount(playerid) + 1 > 3) return ErrorMsg(playerid, "You can't buy any more bisnis.");
					#endif
				}
				else if(pData[playerid][pVip] == 3)
				{
					#if LIMIT_PER_PLAYER > 0
					if(Player_BisnisCount(playerid) + 1 > 4) return Error(playerid, "You can't buy any more bisnis.");
					#endif
				}
				else
				{
					#if LIMIT_PER_PLAYER > 0
					if(Player_BisnisCount(playerid) + 1 > 1) return ErrorMsg(playerid, "You can't buy any more bisnis.");
					#endif
				}
				GivePlayerMoneyEx(playerid, -bData[id][bPrice]);
				GetPlayerName(playerid, bData[id][bOwner], MAX_PLAYER_NAME);
				bData[id][bOwnerID] = pData[playerid][pID];
				bData[id][bVisit] = gettime();
				new str[522], query[500];
				format(str,sizeof(str),"[BIZ]: %s membeli bisnis id %d seharga %s!", GetRPName(playerid), id, FormatMoney(bData[id][bPrice]));
				SuccesMsg(playerid, str);
				LogServer("Property", str);
				mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET owner='%s', ownerid='%d', visit='%d' WHERE ID='%d'", bData[id][bOwner], bData[id][bOwnerID], bData[id][bVisit], id);
				mysql_tquery(g_SQL, query);
				Bisnis_Refresh(id);
				Bisnis_Save(id);
			}
		}
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3, 494.4636,1293.1964,10.0437))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
			return 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 498.3599,1296.6460,10.0437))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
			return 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 498.3147,1301.6930,10.0437))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
			return 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 570.088989,1219.789794,11.711267))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
			return 1;
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 2351.77,-653.31,128.05)) //creategun
        {
			SelectTextDraw(playerid, 0x00FFFFFF);
			return 1;
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -887.2399,-479.9101,826.8417))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
			return 1;
        }
		else  if(IsPlayerInRangeOfPoint(playerid, 3, -893.2037,-490.6880,826.8417))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
			return 1;
        }
		else  if(IsPlayerInRangeOfPoint(playerid, 3, -898.6295,-500.8337,826.8417))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -927.1517,-486.4165,826.8417))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -920.0016,-468.0568,826.8417))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 34.4547,1365.0729,9.1719))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9240,1379.4988,9.1719))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9276,1351.1335,9.1719))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -2043.9037,-2327.0183,30.6250))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -2000.2443,-2453.1018,30.5975))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -2001.2886,-2465.2129,31.2360))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -1989.6028,-2464.2825,31.0153))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -1980.7644,-2486.7327,30.8771))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -1993.8621,-2494.8857,32.8715))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -2026.6808,-2480.3613,31.8755))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 1275.2433,-1551.5659,13.5769))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 1985.1968,-2054.9270,13.5938))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 1375.7587,-1893.4819,13.5901))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }

	}
	if(newkeys & KEY_WALK)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1, 354.502258,-2088.541748,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 361.865936,-2088.551513,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 367.337066,-2088.360107,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 369.805786,-2088.505859,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 375.105041,-2088.289306,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 383.510070,-2088.362304,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 390.969543,-2088.627685,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 396.217071,-2088.449218,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 398.711486,-2088.480468,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 403.764190,-2088.797119,7.835937))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2318.562744,-2070.840576,17.644752))//penjahit
		{
		    SelectTextDraw(playerid, 0x00FFFFFF);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.573730,-2080.727783,17.692657))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 2321.482421,-2082.888671,17.652400))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2317.667236,-2082.262939,17.694538))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2319.653320,-2084.508544,17.652679))
        {
        	SelectTextDraw(playerid, 0x00FFFFFF);
        }
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 1, 1690.892456,-2237.770751,13.539621))
		{
			callcmd::atmdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 1276.157348,-1558.395385,13.586855))
        {
			callcmd::atmdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 1374.789306,-1887.354370,13.590130))
        {
			callcmd::atmdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 1977.570556,-2059.375488,13.593846))
        {
			callcmd::atmdentot(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 1550.266601,-2176.392578,13.546875))
        {
			callcmd::atmdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 1125.240966,-2033.215698,69.883659))
        {
			callcmd::atmdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 1291.651489,-1874.457031,13.783984))
        {
			callcmd::atmdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 1920.387207,-1786.922729,13.546875))
        {
			callcmd::atmdentot(playerid, "");
        }
	}
	if((newkeys & KEY_WALK))
	{
		if(GetNearbyTrash(playerid) >= 0)
		{
		    for(new i = 0; i < MAX_TRASH; i++)
			{
			    if(IsPlayerInRangeOfPoint(playerid, 2.3, TrashData[i][TrashX], TrashData[i][TrashY], TrashData[i][TrashZ]))
				{
					if(pData[playerid][sampahsaya] < 1) return ErrorMsg(playerid, "Anda tidak mempunyai sampah");
					new total = pData[playerid][sampahsaya];
					pData[playerid][sampahsaya] -= total;
					new str[500];
					format(str, sizeof(str), "Removed_%dx", total);
					ShowItemBox(playerid, "Sampah", str, 1265, total);
					Inventory_Update(playerid);
					TrashData[i][Sampah] += total;
					new query[128];
					mysql_format(g_SQL, query, sizeof(query), "UPDATE trash SET sampah='%d' WHERE ID='%d'", TrashData[i][Sampah], i);
					mysql_tquery(g_SQL, query);
					ShowProgressbar(playerid, "Membuang sampah..", 1);
					ApplyAnimation(playerid,"GRENADE","WEAPON_throwu",4.0, 1, 0, 0, 0, 0, 1);
					Trash_Save(i);
				}
			}
		}
	}
	if((newkeys & KEY_WALK))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3.0, 1775.85, -1904.42, 13.38))
		{
			new str[1024];
			format(str, sizeof(str), "Bike Category\tPrice Rent\n"WHITE_E"TDR-3000\t"LG_E"$75\n{ffffff} Mountain Bike Aviator 2690 XT Steel\t"LG_E"$150\n> Press this to return the rental vehicle to the state");
			ShowPlayerDialog(playerid, DIALOG_RENT_BIKE, DIALOG_STYLE_TABLIST_HEADERS, "{007a1e}Greenwich - Rent Bike", str, "{27d23d}Rent", "{e31d1d}Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 1686.63, -2261.61, 13.50))
        {
        	new str[1024];
			format(str, sizeof(str), "Bike Category\tPrice Rent\n"WHITE_E"TDR-3000\t"LG_E"$75\n{ffffff} Mountain Bike Aviator 2690 XT Steel\t"LG_E"$150\n> Press this to return the rental vehicle to the state");
			ShowPlayerDialog(playerid, DIALOG_RENT_BIKE, DIALOG_STYLE_TABLIST_HEADERS, "{007a1e}Greenwich - Rent Bike", str, "{27d23d}Rent", "{e31d1d}Close");
		}
	}
	if(newkeys & KEY_CROUCH)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 2529.4800,-1714.8500,13.4847))
		{
			if(pData[playerid][pLagiCarSteal] < 1) return ErrorMsg(playerid, "Anda tidak sedang melakukan carsteal!!.");
			if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
   			DestroyVehicle(pData[playerid][pKendaraanFraksi]);
   			SuccesMsg(playerid, "Anda berhasil Melakukan aksi Dan mendapatkan Uang Sejumlah 4000$");
   			GivePlayerMoneyEx(playerid, 4000);
   			pData[playerid][pLagiCarSteal] = 0;
			ShowItemBox(playerid, "Uang", "Removed_$4000", 1212, 2);
		}
	}
	if(newkeys & KEY_CROUCH)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1564.26,-1711.47,5.89))
		{
		    if(pData[playerid][pFaction] != 1)
        	return ErrorMsg(playerid, "Anda bukan seorang kepolisian!");
			if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
   			DestroyVehicle(pData[playerid][pKendaraanFraksi]);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1122.9467,-1351.8933,13.7770))
		{
		    if(pData[playerid][pFaction] != 3)
        	return ErrorMsg(playerid, "Anda bukan seorang tenaga medis!");
			if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
   			DestroyVehicle(pData[playerid][pKendaraanFraksi]);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1493.067138,-666.322204,94.769989))
		{
		    if(pData[playerid][pFaction] != 5)
        	return ErrorMsg(playerid, "Anda bukan seorang pedagang!");
			if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
   			DestroyVehicle(pData[playerid][pKendaraanFraksi]);
		}
	}
	if((newkeys & KEY_WALK))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3.0, 1564.26,-1711.47,5.89))
		{
		    if(pData[playerid][pFaction] != 1)
        	return ErrorMsg(playerid, "Anda bukan seorang kepolisian!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nBullet\nSultan\nKendaraan Patroli\nSanchez\nMotor Patroli");
			ShowPlayerDialog(playerid, DIALOG_GARASIPD, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich - Garasi Kepolisian", str, "Pilih", "Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1122.9467,-1351.8933,13.7770))
		{
		    if(pData[playerid][pFaction] != 3)
        	return ErrorMsg(playerid, "Anda bukan seorang tenaga medis!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nAmbulance\nSanchez");
			ShowPlayerDialog(playerid, DIALOG_GARASIMD, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich - Garasi Tenaga Medis", str, "Pilih", "Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 515.57, -1798.68, 6.05))
		{
		    if(pData[playerid][pFaction] != 5)
        	return ErrorMsg(playerid, "Anda bukan seorang pedagang!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nMobil Pedagang\nPizza Boy");
			ShowPlayerDialog(playerid, DIALOG_GARASIPEDAGANG, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich - Garasi Pedagang", str, "Pilih", "Close");
		}
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2, 874.795104,-13.976298,63.195312))//Olah kanabis
		{
			new strings[300];
			format(strings, sizeof(strings), "[PROCCESS MARIJUANA]\n{ffffff}Press "LG_E"ALT {ffffff}- To Proccsess Marijuana");
			CreateDynamic3DTextLabel(strings, COLOR_RED, 874.795104,-13.976298,63.195312, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
  			callcmd::olahkanabis(playerid, "");
		}
	    else if(IsPlayerInRangeOfPoint(playerid, 2, 2556.52,-494.11,85.18))//ambilkanabis1
        {
        	new strings[300];
			format(strings, sizeof(strings), "[TAKE CANABIS]\n{ffffff}Press "LG_E"ALT {ffffff}- Take Canabis");
			CreateDynamic3DTextLabel(strings, COLOR_RED, 2556.52,-494.11,85.18, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2557.42,-486.62,85.08))//ambilkanabis2
        {
        	new strings[300];
			format(strings, sizeof(strings), "[TAKE CANABIS]\n{ffffff}Press "LG_E"ALT {ffffff}- Take Canabis");
			CreateDynamic3DTextLabel(strings, COLOR_RED, 2557.42,-486.62,85.08, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
        	callcmd::ambilkanabis(playerid, "");
        }
       	else if(IsPlayerInRangeOfPoint(playerid, 2, 2559.40,-479.19,84.94))//ambilkanabis3
        {
        	new strings[300];
			format(strings, sizeof(strings), "[TAKE CANABIS]\n{ffffff}Press "LG_E"ALT {ffffff}- Take Canabis");
			CreateDynamic3DTextLabel(strings, COLOR_RED, 2559.40,-479.19,84.94, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2562.84,-486.20,84.57))//ambilkanabis4
        {
        	new strings[300];
			format(strings, sizeof(strings), "[TAKE CANABIS]\n{ffffff}Press "LG_E"ALT {ffffff}- Take Canabis");
			CreateDynamic3DTextLabel(strings, COLOR_RED, 2562.84,-486.20,84.57, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2564.97,-478.80,84.30))//ambilkanabis5
        {
        	new strings[300];
			format(strings, sizeof(strings), "[TAKE CANABIS]\n{ffffff}Press "LG_E"ALT {ffffff}- Take Canabis");
			CreateDynamic3DTextLabel(strings, COLOR_RED, 2564.97,-478.80,84.30, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2563.17,-494.38,84.57))//ambilkanabis6
        {
        	new strings[300];
			format(strings, sizeof(strings), "[TAKE CANABIS]\n{ffffff}Press "LG_E"ALT {ffffff}- Take Canabis");
			CreateDynamic3DTextLabel(strings, COLOR_RED, 2563.17,-494.38,84.57, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2567.56,-487.49,84.04))//ambilkanabis7
        {
        	new strings[300];
			format(strings, sizeof(strings), "[TAKE CANABIS]\n{ffffff}Press "LG_E"ALT {ffffff}- Take Canabis");
			CreateDynamic3DTextLabel(strings, COLOR_RED, 2567.56,-487.49,84.04, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2555.95,-490.83,85.14))//ambilkanabis8
        {
        	new strings[300];
			format(strings, sizeof(strings), "[TAKE CANABIS]\n{ffffff}Press "LG_E"ALT {ffffff}- Take Canabis");
			CreateDynamic3DTextLabel(strings, COLOR_RED, 2555.95,-490.83,85.14, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
        	callcmd::ambilkanabis(playerid, "");
        }        
	}
	if((newkeys & KEY_WALK)) 
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 1376.164062,1573.931030,17.000314))
		{
			PlayerPlaySound(playerid, 5202, 0,0,0);
	    	ShowPlayerDialog(playerid, DIALOG_PEMERINTAH, DIALOG_STYLE_TABLIST_HEADERS, "{007A1E}Greenwich City Hall", "Category\nCreate Id Card\n{FFFFFF}Sell House\n{FFFFFF}Sell Bussines", "{27d23d}Enter", "{e31d1d}Cancel");
		}
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 1376.430541,1576.555053,17.000314))
		{
		    if(pData[playerid][pIDCard] == 0) return ErrorMsg(playerid, "You Not Have Id Card!");
			PlayerPlaySound(playerid, 5202, 0,0,0);
			new string[1000];
		    format(string, sizeof(string), "{007a1e}Jobs\t\t{007a1e}Worker Status\n{62fd89}Bus Driver/Supir Bus\t\t{FFFF00}%d Worker\n{ffffff}Chicken Bucther/Pemotong Ayam\t\t{FFFF00}%d Worker\n{62fd89}Lumberjack/Penebang Kayu\t\t{FFFF00}%d Worker\n{ffffff}Farmer/Petani\t\t{FFFF00}%d Worker\n{62fd89}Miner Oil/Penambang Minyak\t\t{FFFF00}%d Worker\n{ffffff}Milky Farmer/Pemerah Susu\t\t{FFFF00}%d Worker\n{62fd89}Miner/Penambang\t\t{FFFF00}%d Worker\n{ffffff}Cargo/Kargo\t\t{FFFF00}%d Worker\n{62fd89}Tailor/Penjahit\t\t{FFFF00}%d Worker\n{ffffff}Recycler/Daur Ulang\t\t{FFFF00}%d Worker\n"RED_E"Out Your Jobs",
			Sopirbus,
			tukangayam,
			tukangtebang,
			petani,
			penambangminyak,
		 	pemerah,
		 	penambang,
		 	Trucker,
			penjahit,
			Recycler
		    );
	    	ShowPlayerDialog(playerid, DIALOG_DISNAKER, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich Disnaker", string, "{27d23d}Enter", "{e31d1d}Cancel");
		}
	}
	//-----[ Toll System ]-----	
	if(newkeys & KEY_CROUCH)
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
		{
			new forcount = MuchNumber(sizeof(BarrierInfo));
			for(new i;i < forcount;i ++)
			{
				if(i < sizeof(BarrierInfo))
				{
					if(IsPlayerInRangeOfPoint(playerid,8,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]))
					{
						if(BarrierInfo[i][brOrg] == TEAM_NONE)
						{
							if(!BarrierInfo[i][brOpen])
							{
								if(pData[playerid][pMoney] < 5)
								{
									ErrorMsg(playerid, "Uangmu tidak cukup untuk membayar toll");
								}
								else
								{
									MoveDynamicObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[i][brPos_A]+180);
									SetTimerEx("BarrierClose",5000,0,"i",i);
									BarrierInfo[i][brOpen] = true;
									GivePlayerMoneyEx(playerid, -5);
									ShowItemBox(playerid, "Uang", "Removed_$5", 1212, 2);
									if(BarrierInfo[i][brForBarrierID] != -1)
									{
										new barrierid = BarrierInfo[i][brForBarrierID];
										MoveDynamicObject(gBarrier[barrierid],BarrierInfo[barrierid][brPos_X],BarrierInfo[barrierid][brPos_Y],BarrierInfo[barrierid][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[barrierid][brPos_A]+180);
										BarrierInfo[barrierid][brOpen] = true;

									}
								}
							}
						}
						else Toll(playerid, "Anda tidak bisa membuka pintu Toll ini!");
						break;
					}
				}
			}
		}
		return true;		
	}
	if(GetPVarInt(playerid, "UsingSprunk"))
	{
		if(pData[playerid][pEnergy] >= 100 )
		{
  			Info(playerid, " Anda terlalu banyak minum.");
	   	}
	   	else
	   	{
		    pData[playerid][pEnergy] += 5;
		}
	}
	if(takingselfie[playerid] == 1)
	{
		if(PRESSED(KEY_ANALOG_RIGHT))
		{
			GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
			static Float: n1X, Float: n1Y;
		    if(Degree[playerid] >= 360) Degree[playerid] = 0;
		    Degree[playerid] += Speed;
		    n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		    n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		    SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		    SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		    SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		}
		if(PRESSED(KEY_ANALOG_LEFT))
		{
		    GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
			static Float: n1X, Float: n1Y;
		    if(Degree[playerid] >= 360) Degree[playerid] = 0;
		    Degree[playerid] -= Speed;
		    n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		    n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		    SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		    SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		    SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		}
	}

    if(PRESSED( KEY_WALK ) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
    	foreach(new pid : Pedagang)
		{
    		if(IsPlayerInRangeOfPoint(playerid, 4.0, pdgDATA[pid][pdgPosX], pdgDATA[pid][pdgPosY], pdgDATA[pid][pdgPosZ]))
			{
				if(pData[playerid][pFaction] != 5)
    				return Error(playerid, "You must be part of a Pedagang faction.");
				ShowPedagangMenu(playerid, pid);
			}
		}
    }  
	if(PRESSED( KEY_WALK ))
    {
  		if(IsPlayerInRangeOfPoint(playerid, 2.0, 938.4202,2059.3225,10.8209))
		{
		    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
	        PlayerPlaySound(playerid, 5202, 0,0,0);
			new string[1000];
	    	format(string, sizeof(string), "Barang\t\tHarga\nLiggis\t\t"LG_E"$300/{ffffff}1 linggis");
	   		ShowPlayerDialog(playerid, DIALOG_LINGGIS, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich ILEGAL", string, "Beli", "Batal");
		}
	}
    if(PRESSED( KEY_WALK ))
    {
  		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1744.9585,-2516.6980,20.2869))
		{
		    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
		    {
		        PlayerPlaySound(playerid, 5202, 0,0,0);
				new string[1000];
	    		format(string, sizeof(string), "Barang\t\tHarga\nPhone\t\t50$\nBoombox\t\t50$");
	   			ShowPlayerDialog(playerid, DIALOG_BANDARA, DIALOG_STYLE_TABLIST_HEADERS, ""YELLOW_E"Greenwich Market - Penjualan", string, "Beli", "Batal");
			}
		}
  	}
    if(PRESSED( KEY_WALK ))
    {
  		if(IsPlayerInRangeOfPoint(playerid, 2.0, 2506.981933,-2637.118896,13.646511))
		{
		    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
		    if(pData[playerid][pVip] > 0)
		    {
		        PlayerPlaySound(playerid, 5202, 0,0,0);
				new string[1000];
	    		format(string, sizeof(string), "Barang\t\tHarga\nAyam Fillet\t\t"LG_E"$40/{ffffff}1 Paket\nSusu Olahan\t\t"LG_E"$40/{ffffff}1 Botol\nEssence\t\t"LG_E"$20/{ffffff}1 Kotak\nEmas\t\t"LG_E"$40/{ffffff}1 Emas\nBeras\t\t"LG_E"$1000/{ffffff}1 Paket\nSambal\t\t"LG_E"$800/{ffffff}1 Paket\nTepung\t\t"LG_E"$200/{ffffff}1 Paket\nGula\t\t"LG_E"$240/{ffffff}1 Paket\nPenyu\t\t"LG_E"$18/{ffffff}1 Penyu\nIkan Marakel\t\t"LG_E"$6/{ffffff}1 Ikan\nIkan Nemo\t\t"LG_E"$10/{ffffff}1 Ikan\nBlue Fish\t\t"LG_E"$12/{ffffff}1 Ikan\nBesi\t\t"LG_E"$20/{ffffff}1 Besi\nAluminium\t\t"LG_E"$40/{ffffff}1 Aluminium\nKayu\t\t"LG_E"$40/{ffffff}1 kayu\nKaret\t\t"LG_E"$70/{ffffff}1 karet");
	   			ShowPlayerDialog(playerid, DIALOG_HOLIMARKET, DIALOG_STYLE_TABLIST_HEADERS, ""YELLOW_E"VIP {FFFFFF}Greenwich Market // Penjualan", string, "{27d23d}Sell", "{e31d1d}Cancel");
		    }
		    else
		    {
		        PlayerPlaySound(playerid, 5202, 0,0,0);
				new string[1000];
	    		format(string, sizeof(string), "Barang\t\tHarga\nAyam Fillet\t\t"LG_E"$20/{ffffff}1 Paket\nSusu Olahan\t\t"LG_E"$40/{ffffff}1 Botol\nEssence\t\t"LG_E"$13/{ffffff}1 Kotak\nEmas\t\t"LG_E"$30/{ffffff}1 Emas\nBeras\t\t"LG_E"$500/{ffffff}1 Paket\nSambal\t\t"LG_E"$400/{ffffff}1 Paket\nTepung\t\t"LG_E"$100/{ffffff}1 Paket\nGula\t\t"LG_E"$120/{ffffff}1 Paket\nPenyu\t\t"LG_E"$9/{ffffff}1 Penyu\nIkan Marakel\t\t"LG_E"$3/{ffffff}1 Ikan\nIkan Nemo\t\t"LG_E"$5/{ffffff}1 Ikan\nBlue Fish\t\t"LG_E"$6/{ffffff}1 Ikan\nBesi\t\t"LG_E"$10/{ffffff}1 Besi\nAluminium\t\t"LG_E"$20/{ffffff}1 Aluminium\nKayu\t\t"LG_E"$30/{ffffff}1 kayu\nKaret\t\t"LG_E"$50/{ffffff}1 karet");
	   			ShowPlayerDialog(playerid, DIALOG_HOLIMARKET, DIALOG_STYLE_TABLIST_HEADERS, "Greenwich Market // Penjualan", string, "{27d23d}Sell", "{e31d1d}Cancel");
		    }
		}
  	}
   	if(PRESSED(KEY_WALK) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
        if(IsPlayerInRangeOfPoint(playerid, 3, 524.6508,-1821.6819,6.6213))
        {
        	return callcmd::menumasak(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 529.2660,-1819.7333,6.6213))
        {
        	return callcmd::menu(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 524.0871,-1817.6035,6.6213))
        {
        	return callcmd::menuminum(playerid, "");
        }
	}
    if(PRESSED(KEY_WALK) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
       	if(IsPlayerInRangeOfPoint(playerid, 1.5, 1431.42,369.74,18.90))
        {
            if(pData[playerid][ayamcp] != 1) return 1;
        	callcmd::ambilayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1.5, 1434.44,380.18,18.90))
        {
            if(pData[playerid][ayamcp] != 2) return 1;
        	callcmd::ambilayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1.5, 1428.06,376.23,18.89))
        {
            if(pData[playerid][ayamcp] != 3) return 1;
        	callcmd::ambilayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1.5, 1435.63,370.24,18.96))
        {
            if(pData[playerid][ayamcp] != 4) return 1;
        	callcmd::ambilayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1413.80,369.49,19.25))
        {
        	return callcmd::potongayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -999.998291,-683.041320,32.007812))
        {
        	return callcmd::kargodentwot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1410.96,358.80,19.18))
        {
            return callcmd::izinayam(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1415.58,373.10,19.24))
        {
        	return callcmd::potongayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1417.30,376.64,19.23))
        {
        	return callcmd::potongayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1408.68,380.80,19.54))
        {
        	return callcmd::packingayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1407.52,378.37,19.54))
        {
        	return callcmd::packingayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1409.96,383.56,19.53))
        {
        	return callcmd::packingayamdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2395.137695,-1495.538696,23.834865))
        {
        	return callcmd::jualayam(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 5, 528.9647,-1819.8907,6.6213))
        {
        	return callcmd::menumasak(playerid, "");
        }
    }
    if(PRESSED(KEY_WALK) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
        if(IsPlayerInRangeOfPoint(playerid, 2, ORusa1))
        {
        	return callcmd::ambilrusa(playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, ORusa2))
        {
        	return callcmd::ambilrusa(playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, ORusa2))
        {
        	return callcmd::ambilrusa(playerid);
        }
    }
    if(PRESSED(KEY_WALK) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
        if(IsPlayerInRangeOfPoint(playerid, 2, -1060.852172,-1195.437011,129.664138))
        {
        	return callcmd::belibibitdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1141.685791,-1095.497192,129.218750))
        {
        	return callcmd::plantdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1129.279663,-1095.668579,129.218750))
        {
        	return callcmd::plantdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1125.371826,-1084.356811,129.218750))
        {
        	return callcmd::plantdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1138.143554,-1084.205688,129.218750))
        {
        	return callcmd::plantdentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1431.233398,-1460.474975,101.693000))
        {
        	return callcmd::prosesdentot(playerid, "");
        }
    }
    if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 1244.857910,-2020.113891,59.894012))
		{
            if(pData[playerid][pJob] != 1) return 1;
		    if(pData[playerid][pBusTime] > 0)
		    	return	ErrorMsg(playerid, "Anda harus menunggu.");
		    	
	    	pData[playerid][pKendaraanKerja] = CreateVehicle(431, 1244.857910,-2020.113891,59.894012,180.118698,0,0,-1);
			PutPlayerInVehicle(playerid, pData[playerid][pKendaraanKerja], 0);
	    	SetVehicleNumberPlate(pData[playerid][pKendaraanKerja], "JOB VEHICLE");
	    	new tmpobjid;
	    	tmpobjid = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10837, "airroadsigns_sfse", "ws_airbigsign1", 0);
		    SetDynamicObjectMaterial(tmpobjid, 1, 16646, "a51_alpha", "des_rails1", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "PELABUHAN - BANDARA", 80, "Arial", 30, 0, 0xFF555999, 0xFF000000, 1);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.274, 0.464, -0.120, 0.000, 0.000, 89.899);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.330, -2.455, 0.490, 0.000, 0.000, 90.099);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.349, -4.018, 0.490, 0.000, 0.000, 90.999);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "u", 90, "Webdings", 100, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.411, -3.781, 0.550, 0.000, 0.000, 90.799);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "Greenwich Transit", 90, "Times New Roman", 45, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.427, -3.071, 0.480, 0.000, 0.000, 91.600);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS", 90, "Times New Roman", 65, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.342, -2.997, 0.210, 0.000, 0.000, 91.299);
		    tmpobjid = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10837, "airroadsigns_sfse", "ws_airbigsign1", 0);
		    SetDynamicObjectMaterial(tmpobjid, 1, 16646, "a51_alpha", "des_rails1", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "PELABUHAN - BANDARA", 80, "Arial", 30, 0, 0xFF555999, 0xFF000000, 1);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.322, 0.442, -0.090, 0.000, 0.000, -90.900);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.345, -1.662, 0.490, 0.000, 0.000, -90.000);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.342, -3.243, 0.490, 0.000, 0.000, -90.299);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "u", 90, "Webdings", 100, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.400, -4.109, 0.550, 0.000, 0.000, -91.899);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "Greenwich Transit", 90, "Times New Roman", 48, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.448, -2.595, 0.440, 0.000, 0.000, -84.799);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS", 90, "Times New Roman", 65, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.397, -3.351, 0.150, 0.000, 0.000, -89.399);
			pData[playerid][pBusTime] = 360;
			pData[playerid][pBus] = 1;
			SetPlayerRaceCheckpoint(playerid, 2, buspoint1, buspoint1, 4.0);
			pData[playerid][pCheckPoint] = CHECKPOINT_BUS;
			InfoMsg(playerid, "Ikuti Checkpoint!");
			SwitchVehicleEngine(pData[playerid][pKendaraanKerja], true);
		}
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 2118.415283,-1920.911254,13.606877))
		{
            if(pData[playerid][pJob] != 1) return 1;
		    if(pData[playerid][pBusTime] > 0)
		    	return	ErrorMsg(playerid, "Anda harus menunggu.");

	    	pData[playerid][pKendaraanKerja] = CreateVehicle(431, 2118.415283,-1920.911254,13.606877,3.195123,0,0,-1);
			PutPlayerInVehicle(playerid, pData[playerid][pKendaraanKerja], 0);
	    	SetVehicleNumberPlate(pData[playerid][pKendaraanKerja], "JOB VEHICLE");
	    	SwitchVehicleEngine(pData[playerid][pKendaraanKerja], true);
	    	pData[playerid][pBusRute] = 2;
	    	new tmpobjid;
	    	tmpobjid = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10837, "airroadsigns_sfse", "ws_airbigsign1", 0);
		    SetDynamicObjectMaterial(tmpobjid, 1, 16646, "a51_alpha", "des_rails1", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS IDLEWOOD", 80, "Arial", 30, 0, 0xFF555999, 0xFF000000, 1);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.274, 0.464, -0.120, 0.000, 0.000, 89.899);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.330, -2.455, 0.490, 0.000, 0.000, 90.099);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.349, -4.018, 0.490, 0.000, 0.000, 90.999);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "u", 90, "Webdings", 100, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.411, -3.781, 0.550, 0.000, 0.000, 90.799);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "Greenwich Transit", 90, "Times New Roman", 45, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.427, -3.071, 0.480, 0.000, 0.000, 91.600);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS", 90, "Times New Roman", 65, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.342, -2.997, 0.210, 0.000, 0.000, 91.299);
		    tmpobjid = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10837, "airroadsigns_sfse", "ws_airbigsign1", 0);
		    SetDynamicObjectMaterial(tmpobjid, 1, 16646, "a51_alpha", "des_rails1", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS IDLEWOOD", 80, "Arial", 30, 0, 0xFF555999, 0xFF000000, 1);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.322, 0.442, -0.090, 0.000, 0.000, -90.900);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.345, -1.662, 0.490, 0.000, 0.000, -90.000);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.342, -3.243, 0.490, 0.000, 0.000, -90.299);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "u", 90, "Webdings", 100, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.400, -4.109, 0.550, 0.000, 0.000, -91.899);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "Greenwich Transit", 90, "Times New Roman", 48, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.448, -2.595, 0.440, 0.000, 0.000, -84.799);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS", 90, "Times New Roman", 65, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.397, -3.351, 0.150, 0.000, 0.000, -89.399);
			pData[playerid][pBusTime] = 360;
			pData[playerid][pBus] = 66;
			SetPlayerRaceCheckpoint(playerid, 2, cpbus1, cpbus1, 4.0);
			pData[playerid][pCheckPoint] = CHECKPOINT_BUS;
			InfoMsg(playerid, "Ikuti Checkpoint!");
		}
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3, 830.3033,-2066.9246,13.2240))
		{
		   callcmd::pernikahan(playerid, "");
		}
	}

	if(newkeys & KEY_WALK)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1, 698.8157,881.3616,-38.2358))
        {
            if(pData[playerid][pTimeTambang1] > 0) return 1;
        	callcmd::nambangdentot1(playerid, "");
        	pData[playerid][pTimeTambang1] = 1;
        	SetTimerEx("TungguNambang1", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 700.6220,888.0744,-36.8952))
        {
        	if(pData[playerid][pTimeTambang2] > 0) return 1;
        	callcmd::nambangdentot1(playerid, "");
        	pData[playerid][pTimeTambang2] = 1;
        	SetTimerEx("TungguNambang2", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 701.1542,897.5233,-36.8892))
        {
        	if(pData[playerid][pTimeTambang3] > 0) return 1;
        	callcmd::nambangdentot1(playerid, "");
        	pData[playerid][pTimeTambang3] = 1;
        	SetTimerEx("TungguNambang3", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 698.3236,904.3176,-37.7373))
        {
        	if(pData[playerid][pTimeTambang4] > 0) return 1;
        	callcmd::nambangdentot1(playerid, "");
        	pData[playerid][pTimeTambang4] = 1;
        	SetTimerEx("TungguNambang4", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 693.0031,911.1717,-38.0931))
        {
        	if(pData[playerid][pTimeTambang5] > 0) return 1;
        	callcmd::nambangdentot1(playerid, "");
        	pData[playerid][pTimeTambang5] = 1;
        	SetTimerEx("TungguNambang5", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 689.9236,917.0135,-38.6226))
        {
        	if(pData[playerid][pTimeTambang6] > 0) return 1;
        	callcmd::nambangdentot1(playerid, "");
        	pData[playerid][pTimeTambang6] = 1;
        	SetTimerEx("TungguNambang6", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -422.11,1167.82,2.30))
        {
        	callcmd::cucibatudentot(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 2152.539062,-2263.646972,13.300081))
        {
        	callcmd::peleburanbatudentot(playerid, "");
        }
	}
	if((newkeys & KEY_WALK)) //PEMERAH
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, -65.75, 97.02, 3.11))
		{
		    if(pData[playerid][pJob] == 5)
			ShowPlayerDialog(playerid, DIALOG_LOCKERPEMERAH, DIALOG_STYLE_LIST, "{007a1e}Greenwich {ffffff}/{007a1e}/ {ffffff}Locker Pemerah", "Work Clothes\nYour Clothes", "Enter", "Back");
		}
	}

	if(PRESSED( KEY_CTRL_BACK ))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1 || pData[playerid][pCuffed] == 1) return Error(playerid, "You can't do at this moment.");
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pData[playerid][pCuffed] == 0)
		{
			if(pData[playerid][pLoopAnim])
	    	{	
	        	pData[playerid][pLoopAnim] = 0;

				ClearAnimations(playerid);
				StopLoopingAnim(playerid);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
				TogglePlayerControllable(playerid, 1);
		    	TextDrawHideForPlayer(playerid, AnimationTD);
			}
		}
    }
	//flymode
	if(!fly[playerid])return 1;

    new
		k, ud, lr,
        Float:hMult = 0.01,
		Float:angle,
		Float:forwd;

	GetPlayerKeys(playerid, k, ud, lr);
	GetPlayerFacingAngle(playerid, angle);

	if(ud == KEY_UP)        forwd	= VELOCITY_NORM;
	else if(ud == KEY_DOWN) forwd	=-VELOCITY_NORM;
	
	if(k & KEY_JUMP)forwd *= VELOCITY_MULT;
	if(k & KEY_SPRINT)hMult = HEIGHT_GAIN * 10;
	if(k & KEY_SPRINT && k & KEY_JUMP) hMult = HEIGHT_GAIN * 10;
	if(k & KEY_CROUCH)hMult =-HEIGHT_GAIN;


	if(k & KEY_FIRE)
	{
		if(lr == KEY_LEFT)		forwd = VELOCITY_NORM, angle	+= 90.0;
		else if(lr == KEY_RIGHT)forwd = VELOCITY_NORM, angle	-= 90.0;
	}
	else
	{
		if(lr == KEY_LEFT)		angle	+= 6.0;
		else if(lr == KEY_RIGHT)angle	-= 6.0;
		SetPlayerFacingAngle(playerid, angle);
	}
	SetPlayerHealth(playerid, 1000.0);
	SetPlayerVelocity(playerid, forwd*floatsin(-angle, degrees), forwd*floatcos(-angle, degrees), hMult);
	SetPlayerHealth(playerid, 1000.0);
	if(newkeys & KEY_JUMP && newkeys & 16 && usefly[playerid])
	{
	    if(fly[playerid])
		{
		    fly[playerid] = false;
		    ClearAnimations(playerid);
		}
		else
		{
		    fly[playerid] = true;
		    ClearAnimations(playerid);
			ApplyAnimation(playerid, "PARACHUTE", "FALL_SKYDIVE", 4.0, 1, 0, 0, 0, 0, 1);
		}
	}
	//flymode
	return 1;

}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_WASTED && pData[playerid][pJail] < 1)
    {	
		if(pData[playerid][pInjured] == 0)
        {
            pData[playerid][pInjured] = 1;
            SetPlayerHealthEx(playerid, 99999);

            pData[playerid][pInt] = GetPlayerInterior(playerid);
            pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

            GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
            GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
        }
        else
        {
            pData[playerid][pHospital] = 1;
        }
	}
	//Spec Player
	new vehicleid = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(pData[playerid][playerSpectated] != 0)
		{
			foreach(new ii : Player)
			{
				if(pData[ii][pSpec] == playerid)
				{
					PlayerSpectatePlayer(ii, playerid);
					Servers(ii, ,"%s(%i) is now on foot.", pData[playerid][pName], playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
		if(pData[playerid][pInjured] == 1)
        {
            //RemoveFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
            SetPlayerHealthEx(playerid, 99999);
        }
		foreach (new ii : Player) if(pData[ii][pSpec] == playerid) 
		{
            PlayerSpectateVehicle(ii, GetPlayerVehicleID(playerid));
        }
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {	
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemovePlayerFromVehicle(playerid);/*RemoveFromVehicle(playerid);*/
	
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][0]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][1]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][2]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][3]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][4]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][5]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][6]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][7]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][8]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][9]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][10]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][11]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][12]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][13]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][14]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][15]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][16]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][17]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][18]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][19]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][20]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][21]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][22]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][23]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][24]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][25]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][26]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][27]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][28]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][29]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][30]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][31]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][32]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][33]);
		PlayerTextDrawHide(playerid, LenzHUD7[playerid][34]);
		PlayerTextDrawHide(playerid, barv1[playerid]);
		PlayerTextDrawHide(playerid, barv2[playerid]);
		PlayerTextDrawHide(playerid, barv3[playerid]);
		PlayerTextDrawHide(playerid, barv4[playerid]);
		PlayerTextDrawHide(playerid, barv5[playerid]);
		PlayerTextDrawHide(playerid, barv6[playerid]);
		PlayerTextDrawHide(playerid, barv7[playerid]);
		PlayerTextDrawHide(playerid, barv8[playerid]);
		PlayerTextDrawHide(playerid, barv9[playerid]);
		PlayerTextDrawHide(playerid, barv10[playerid]);
		PlayerTextDrawHide(playerid, barengine[playerid]);
		PlayerTextDrawHide(playerid, barlight[playerid]);

		//SIMPLE
		for(new i = 0; i < 7; i++)
		{
			PlayerTextDrawHide(playerid, VEHFIVEM[playerid][i]);
		}
		
		for(new i = 0; i < 39; i++)
		{
			PlayerTextDrawHide(playerid, VEHFIVEM[playerid][i]);
		}
        
		HidePlayerProgressBar(playerid, pData[playerid][spfuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][spdamagebar]);
	}
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
				{
					if(pvData[pv][cLocked] == 1)
					{
						RemovePlayerFromVehicle(playerid);
						ErrorMsg(playerid, "This Vehicle is Locked");
						return 1;
					}
				}
			}
		}
		if(!IsEngineVehicle(vehicleid))
        {
            SwitchVehicleEngine(vehicleid, true);
        }
		if(IsEngineVehicle(vehicleid) && pData[playerid][pDriveLic] <= 0)
        {
            WarningMsg(playerid, "Anda tidak memiliki sim.");
        }
		if(pData[playerid][pHBEMode] == 1)
		{
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][0]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][1]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][2]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][3]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][4]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][5]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][6]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][7]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][8]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][9]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][10]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][11]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][12]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][13]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][14]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][15]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][16]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][17]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][18]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][19]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][20]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][21]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][22]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][23]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][24]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][25]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][26]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][27]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][28]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][29]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][30]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][31]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][32]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][33]);
			PlayerTextDrawShow(playerid, LenzHUD7[playerid][34]);
			PlayerTextDrawShow(playerid, barv1[playerid]);
			PlayerTextDrawShow(playerid, barv2[playerid]);
			PlayerTextDrawShow(playerid, barv3[playerid]);
			PlayerTextDrawShow(playerid, barv4[playerid]);
			PlayerTextDrawShow(playerid, barv5[playerid]);
			PlayerTextDrawShow(playerid, barv6[playerid]);
			PlayerTextDrawShow(playerid, barv7[playerid]);
			PlayerTextDrawShow(playerid, barv8[playerid]);
			PlayerTextDrawShow(playerid, barv9[playerid]);
			PlayerTextDrawShow(playerid, barv10[playerid]);
			PlayerTextDrawShow(playerid, barengine[playerid]);
			PlayerTextDrawShow(playerid, barlight[playerid]);
		}
	    else if(pData[playerid][pHBEMode] == 2)
		{
			new Float:fDamage, color1, color2, str[128];

			GetVehicleColor(vehicleid, color1, color2);

			GetVehicleHealth(vehicleid, fDamage);
			if(fDamage <= 350) fDamage = 0;
			else if(fDamage > 1000) fDamage = 1000;

			new tstr[64];
			for(new i = 0; i < 7; i++)
			{
				PlayerTextDrawShow(playerid, VEHFIVEM[playerid][i]);
			}
			format(tstr, sizeof(tstr), "%i", GetVehicleFuel(vehicleid));
			PlayerTextDrawSetString(playerid, VEHFIVEM[playerid][4], tstr);

			format(str, sizeof(str), "%.0f", GetVehicleSpeed(vehicleid));
			PlayerTextDrawSetString(playerid, VEHFIVEM[playerid][2], str);
			PlayerTextDrawShow(playerid, VEHFIVEM[playerid][2]);
    	}
		else
		{
		
		}
		new Float:health;
        GetVehicleHealth(GetPlayerVehicleID(playerid), health);
        VehicleHealthSecurityData[GetPlayerVehicleID(playerid)] = health;
        VehicleHealthSecurity[GetPlayerVehicleID(playerid)] = true;
		
		if(pData[playerid][playerSpectated] != 0)
  		{
			foreach(new ii : Player)
			{
    			if(pData[ii][pSpec] == playerid)
			    {
        			PlayerSpectateVehicle(ii, vehicleid);
				    Servers(ii, "%s(%i) is now driving a %s(%d).", pData[playerid][pName], playerid, GetVehicleModelName(GetVehicleModel(vehicleid)), vehicleid);
				}
			}
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(Deer[playerid] == 1) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2046.76978, -799.45319, 127.07957) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2046.7698, -799.4532, 126.7188, 3.5, -90.0000, 0.0000, 0.0000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing F. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 2) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2021.1818, -494.0207, 76.1904) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2021.18176, -494.02069, 76.19040, 3.5, -90.0000, 0.0000, 0.0000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasat CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 3) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 1632.5769, -599.7444, 62.0889) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 1632.57690, -599.74438, 61.82332, 3.5, 90.00000, 0.00000, -54.66002);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }

                }
            }
        }
    }else if(Deer[playerid] == 4) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 1741.4386, -979.5817, 36.9209) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 1741.43860, -979.58173, 36.61147, 3.5, 90.00000, 0.00000, -7.38000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 5) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2553.6780, -963.4338, 82.0169) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2553.67798, -963.43378, 81.66848, 3.5, 90.00000, 0.00000, 0.00000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 6) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2637.4963, -380.2195, 58.2060) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2637.49634, -380.21951, 57.92605, 3.5, 90.00000, 0.00000, -49.26000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 7) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2406.9773, -403.4681, 72.4926) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid],  2406.97729, -403.46811, 72.17617, 3.5, 90.00000, 0.00000, 0.00000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }
	if(explosive{playerid})
	{
	    CreateExplosion(fX, fY, fZ, 12, 5.0);
	}
	switch(weaponid){ case 0..18, 39..54: return 1;} //invalid weapons
	if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
	{
		pData[playerid][pAmmo][g_aWeaponSlots[weaponid]]--;
		if(pData[playerid][pGuns][g_aWeaponSlots[weaponid]] != 0 && !pData[playerid][pAmmo][g_aWeaponSlots[weaponid]])
		{
			pData[playerid][pGuns][g_aWeaponSlots[weaponid]] = 0;
		}
	}
	return 1;
}

stock GivePlayerHealth(playerid,Float:Health)
{
	new Float:health; GetPlayerHealth(playerid,health);
	SetPlayerHealth(playerid,health+Health);
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
   	new Float: p_HP;
    GetPlayerHealth(playerid, p_HP);
	if(!pData[playerid][pSeatbelt])
	{
		SetPlayerHealth(playerid, p_HP-3);
		PlayerPlaySoundEx(playerid, 1130);
		SetTimerEx("HidePlayerBox", 500, false, "dd", playerid, _:ShowPlayerBox(playerid, 0xFF000066));
	}

	new
        Float: vehicleHealth,
        playerVehicleId = GetPlayerVehicleID(playerid);

    new Float: health;
	health = GetPlayerHealth(playerid, health);
    GetVehicleHealth(playerVehicleId, vehicleHealth);
    if(pData[playerid][pSeatbelt] == 0 || pData[playerid][pHelmetOn] == 0)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		new asakit = RandomEx(0, 2);
    		new bsakit = RandomEx(0, 2);
    		new csakit = RandomEx(0, 2);
    		new dsakit = RandomEx(0, 2);
    		pData[playerid][pLFoot] -= dsakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= dsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -2);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 100)
    	{
    		new asakit = RandomEx(0, 3);
    		new bsakit = RandomEx(0, 3);
    		new csakit = RandomEx(0, 3);
    		new dsakit = RandomEx(0, 3);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= csakit;
    		pData[playerid][pRFoot] -= dsakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -5);
    		return 1;
    	}
    	return 1;
    }
    if(pData[playerid][pSeatbelt] == 1 || pData[playerid][pHelmetOn] == 1)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		new dsakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= dsakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= dsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 90)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		new dsakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= csakit;
    		pData[playerid][pRFoot] -= dsakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -3);
    		return 1;
    	}
    }
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	new str[60];
	new Float:hp;
	GetPlayerHealth(playerid, hp);
	if(IsPlayerNPC(issuerid) || !IsPlayerInAnyVehicle(issuerid)) return 0;
	if(weaponid == 9)
	{
		ShowPlayerDialog(issuerid, 12221, DIALOG_STYLE_MSGBOX, "{FF0000}Warning!!", "{FF0000}You've been kicked for chainsaw abuse!", "Ok", "");
	    KickEx(issuerid);
	}
	if(weaponid > 21 && weaponid < 34 || weaponid == 38)
	{
	    SetPlayerHealth(playerid, hp);
		TogglePlayerControllable(issuerid, 0);
		warnings{issuerid} ++;
		if(warnings{issuerid} < MAX_WARININGS)
		{
		    format(str, sizeof(str), "{FFFFFF}Jangan lakukan drive-by {FF0000}%d{FFFFFF}/{FF0000}%d", warnings{issuerid}, MAX_WARININGS);
		    ShowPlayerDialog(issuerid, 12221, DIALOG_STYLE_MSGBOX, "{FF0000}Drive-By", str, "Ok", "");
		    TogglePlayerControllable(issuerid, 1);
		}
		if(warnings{issuerid} >= MAX_WARININGS)
		{
		    ShowPlayerDialog(issuerid, 12221, DIALOG_STYLE_MSGBOX, "{FF0000}Drive-By", "{FF0000}Anda telah di tendang karna drive-by", "Ok", "");
		    KickEx(issuerid);
		}
	}
	if(IsAtEvent[playerid] == 0)
	{
		new sakit = RandomEx(1, 4);
		new asakit = RandomEx(1, 5);
		new bsakit = RandomEx(1, 7);
		new csakit = RandomEx(1, 4);
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 9)
		{
			pData[playerid][pHead] -= 20;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 3)
		{
			pData[playerid][pPerut] -= sakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 6)
		{
			pData[playerid][pRHand] -= bsakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 5)
		{
			pData[playerid][pLHand] -= asakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 8)
		{
			pData[playerid][pRFoot] -= csakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 7)
		{
			pData[playerid][pLFoot] -= bsakit;
		}
	}
	else if(IsAtEvent[playerid] == 1)
	{
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 9)
		{
			GivePlayerHealth(playerid, -90);
			SendClientMessage(issuerid, -1,"{7fffd4}[ TDM ]{ffffff} Headshot!");
		}
	}
    return 1;
}

stock SavePeluru(playerid)
{
    new queryBuffer[103];
	if(GetPlayerWeapon(playerid) == WEAPON_DEAGLE)
	{
		pData[playerid][pPeluru][0] = GetPlayerAmmo(playerid);
		mysql_format(g_SQL, queryBuffer, sizeof(queryBuffer), "UPDATE players SET peluru_0 = %i WHERE uid = %i", pData[playerid][pPeluru][0], pData[playerid][pID]);
		mysql_tquery(g_SQL, queryBuffer);
	}
	else if(GetPlayerWeapon(playerid) == WEAPON_SILENCED)
	{
		pData[playerid][pPeluru][1] = GetPlayerAmmo(playerid);
		mysql_format(g_SQL, queryBuffer, sizeof(queryBuffer), "UPDATE players SET peluru_1 = %i WHERE uid = %i", pData[playerid][pPeluru][1], pData[playerid][pID]);
		mysql_tquery(g_SQL, queryBuffer);
	}
}

public OnPlayerUpdate(playerid)
{
    afk_tick[playerid]++;
    new string[256];
	format(string, sizeof string, "%02d:%02d", JamFivEm, DetikFivEm);
   	PlayerTextDrawSetString(playerid, HudDentot[playerid][43], string);
   	PlayerTextDrawSetString(playerid, VEHFIVEM[playerid][6], string);
    TextDrawSetString(PhoneBaru[16], string);
   	TextDrawSetString(NotifTwitter[12], string);
   	TextDrawSetString(PhoneCall[23], string);
   	TextDrawSetString(PhoneCall1[22], string);
   	TextDrawSetString(PHONESCREEN[16], string);
    SavePeluru(playerid);
	static str[500];
	if (PlayerInfo[playerid][pWaypoint])
	{
		format(str, sizeof(str), "~b~GPS:~w~ %s (%.2f meters)", PlayerInfo[playerid][pLocation], GetPlayerDistanceFromPoint(playerid, PlayerInfo[playerid][pWaypointPos][0], PlayerInfo[playerid][pWaypointPos][1], PlayerInfo[playerid][pWaypointPos][2]));
		PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][69], str);
	}
	//SAPD Tazer/Taser
	UpdateTazer(playerid);
	
	//SAPD Road Spike
	CheckPlayerInSpike(playerid);

	//Report ask
	//GetPlayerName(playerid, g_player_name[playerid], MAX_PLAYER_NAME);

	//AntiCheat
	pData[playerid][pLastUpdate] = gettime();

	//SpeedCam
	static id;
	new vehicled = Vehicle_Nearest2(playerid), query[326];
	if ((id = SpeedCam_Nearest(playerid)) != -1 && GetPlayerSpeedCam(playerid) > CamData[id][CamLimit] && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && pvData[vehicled][cOwner] == pData[playerid][pID] && GetEngineStatus(vehicled) && !pData[playerid][pSpeedTime])
	{
	    if (!IsACruiser(vehicled) && !IsABoat(vehicled) && !IsAPlane(vehicled) && !IsAHelicopter(vehicled))
	    {
	 		new price = 30 + floatround(GetPlayerSpeedCam(playerid) - CamData[id][CamLimit]);
	   		format(str, sizeof(str), "Kecepatan (%.0f/%.0f mph)", GetPlayerSpeedCam(playerid), CamData[id][CamLimit]);
	        SetTimerEx("HidePlayerBox", 500, false, "dd", playerid, _:ShowPlayerBox(playerid, 0xFFFFFF66));
    		format(str, sizeof(str), "Anda telah melebihi kecepatan dan mendapatkan denda sebesar ~y~%s", FormatMoney(price));
     		InfoMsg(playerid, str);
			pvData[vehicled][cTicket] += price;

			mysql_format(g_SQL, query, sizeof(query), "UPDATE vehicle SET ticket = '%d' WHERE id = '%d'", pvData[vehicled][cTicket], pvData[vehicled][cID]);
			mysql_tquery(g_SQL, query);
			pData[playerid][pSpeedTime] = 5;
		}
	}
	return 1;
}

task VehicleUpdate[40000]()
{
	for (new i = 1; i != MAX_VEHICLES; i ++) if(IsEngineVehicle(i) && GetEngineStatus(i))
    {
        if(GetVehicleFuel(i) > 0)
        {
			new fuel = GetVehicleFuel(i);
            SetVehicleFuel(i, fuel - 1);

            if(GetVehicleFuel(i) >= 1 && GetVehicleFuel(i) <= 20)
            {
               Info(GetVehicleDriver(i), "Kendaraan ingin habis bensin, Harap pergi ke SPBU ( Gas Station )");
            }
        }
        if(GetVehicleFuel(i) <= 0)
        {
            SetVehicleFuel(i, 0);
            SwitchVehicleEngine(i, false);
        }
    }
	foreach(new ii : PVehicles)
	{
		if(IsValidVehicle(pvData[ii][cVeh]))
		{
			if(pvData[ii][cPlateTime] != 0 && pvData[ii][cPlateTime] <= gettime())
			{
				format(pvData[ii][cPlate], 32, "NoHave");
				SetVehicleNumberPlate(pvData[ii][cVeh], pvData[ii][cPlate]);
				pvData[ii][cPlateTime] = 0;
			}
			if(pvData[ii][cRent] != 0 && pvData[ii][cRent] <= gettime())
			{
				pvData[ii][cRent] = 0;
				new query[128], xuery[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, query);

				mysql_format(g_SQL, xuery, sizeof(xuery), "DELETE FROM vstorage WHERE owner = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, xuery);
				if(IsValidVehicle(pvData[ii][cVeh])) DestroyVehicle(pvData[ii][cVeh]);
				pvData[ii][cVeh] = INVALID_VEHICLE_ID;
				Iter_SafeRemove(PVehicles, ii, ii);
			}
		}
		if(pvData[ii][cClaimTime] != 0 && pvData[ii][cClaimTime] <= gettime())
		{
			pvData[ii][cClaimTime] = 0;
		}
	}
}
public OnVehicleDeath(vehicleid, killerid)
{
    foreach(new i : PVehicles)
    {
        if(pvData[i][cVeh] == vehicleid)
        {
            pvData[i][cStolen] = gettime() + 15;
        }
    }
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
    //LoadedTrash[vehicleid] = 0;
    foreach(new ii : PVehicles)
    {
        if(vehicleid == pvData[ii][cVeh] && pvData[ii][cRent] == 0 && pvData[ii][cStolen] > gettime())
        {
            if(pvData[ii][cInsu] > 0)
            {
                pvData[ii][cStolen] = 0;
                pvData[ii][cClaim] = 1;
                foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
                {
                    InfoMsg(pid, "Kendaraan anda hancur, silahkan ambil di kantor insurance.");
                }
                if(IsValidVehicle(pvData[ii][cVeh]))
                    DestroyVehicle(pvData[ii][cVeh]);

                pvData[ii][cVeh] = INVALID_VEHICLE_ID;
            }
            else
            {
                foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
                {
                   	pvData[ii][cStolen] = 0;
					pvData[ii][cClaim] = 1;
					foreach(new meme : Player) if (pvData[ii][cOwner] == pData[pid][pID])
					{
						InfoMsg(meme, "Kendaraan anda hancur, silahkan ambil di kantor insurance.");
					}
					if(IsValidVehicle(pvData[ii][cVeh]))
						DestroyVehicle(pvData[ii][cVeh]);

					pvData[ii][cVeh] = INVALID_VEHICLE_ID;
				}
               	pvData[ii][cStolen] = 0;
            }
            return 1;
        }
    }
    return 1;
}
ptask PlayerVehicleUpdate[200](playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsValidVehicle(vehicleid))
	{
		if(!GetEngineStatus(vehicleid) && IsEngineVehicle(vehicleid))
		{	
			SwitchVehicleEngine(vehicleid, false);
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new Float:fHealth;
			GetVehicleHealth(vehicleid, fHealth);
			if(IsValidVehicle(vehicleid) && fHealth <= 250.0)
			{

				SwitchVehicleEngine(vehicleid, false);
				ErrorMsg(playerid, "Mesin kendaraan anda rusak, segera perbaiki");
			}
		}
	   	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(pData[playerid][pHBEMode] == 1)
			{
                new Float:fFuel, color1, color2;
				new Float:bengsin;
				GetVehicleColor(vehicleid, color1, color2);
				////
				fFuel = GetVehicleFuel(vehicleid);
 				if(fFuel < 0) fFuel = 0;
				else if(fFuel > 3000) fFuel = 3000;
				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawColor(playerid, barengine[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barengine[playerid], 291727871);
				}
				if(!GetLightStatus(vehicleid))
				{
					PlayerTextDrawColor(playerid, barlight[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barlight[playerid], 291727871);
				}
				new str[128];
				format(str, sizeof(str), "%.0f", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, LenzHUD7[playerid][25], str);
				PlayerTextDrawShow(playerid, LenzHUD7[playerid][25]);

				bengsin = GetVehicleFuel(vehicleid);
	            if(bengsin < 90.0)
				{
					PlayerTextDrawColor(playerid, barv10[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv10[playerid], 291727871);
				}
				if(bengsin < 80.0)
				{
					PlayerTextDrawColor(playerid, barv9[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv9[playerid], 291727871);
				}
				if(bengsin < 70.0)
				{
					PlayerTextDrawColor(playerid, barv8[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv8[playerid], 291727871);
				}
				if(bengsin < 60.0)
				{
					PlayerTextDrawColor(playerid, barv7[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv7[playerid], 291727871);
				}
				if(bengsin < 50.0)
				{
					PlayerTextDrawColor(playerid, barv6[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv6[playerid], 291727871);
				}
				if(bengsin < 40.0)
				{
					PlayerTextDrawColor(playerid, barv5[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv5[playerid], 291727871);
				}
				if(bengsin < 30.0)
				{
					PlayerTextDrawColor(playerid, barv4[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv4[playerid], 291727871);
				}
				if(bengsin < 20.0)
				{
					PlayerTextDrawColor(playerid, barv3[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv3[playerid], 291727871);
				}
				if(bengsin < 10.0)
				{
					PlayerTextDrawColor(playerid, barv2[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv2[playerid], 291727871);
				}
				if(bengsin < 5.0)
				{
					PlayerTextDrawColor(playerid, barv1[playerid], -1);
				}
				else
				{
					PlayerTextDrawColor(playerid, barv1[playerid], 291727871);
				}
			}
			else if(pData[playerid][pHBEMode] == 2)
			{
		        new Float:fDamage, color1, color2, str[128];

				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);
				if(fDamage <= 350) fDamage = 0;
				else if(fDamage > 1000) fDamage = 1000;

				new tstr[64];
			    for(new i = 0; i < 7; i++)
		    	{
			       PlayerTextDrawShow(playerid, VEHFIVEM[playerid][i]);
		        }
                format(tstr, sizeof(tstr), "%i", GetVehicleFuel(vehicleid));
				PlayerTextDrawSetString(playerid, VEHFIVEM[playerid][4], tstr);

				format(str, sizeof(str), "%.0f", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, VEHFIVEM[playerid][2], str);
				PlayerTextDrawShow(playerid, VEHFIVEM[playerid][2]);
			}
			else
			{
			
			}
		}
	}
}
ptask PlayerUpdate[999](playerid)
{
    // AFK
	new StringF[50];
	if(afk_tick[playerid] > 10000) afk_tick[playerid] = 1, afk_check[playerid] = 0;
	if(afk_check[playerid] < afk_tick[playerid] && GetPlayerState(playerid)) afk_check[playerid] = afk_tick[playerid], afk_time[playerid] = 0;
	if(afk_check[playerid] == afk_tick[playerid] && GetPlayerState(playerid))
	{
		afk_time[playerid]++;
		if(afk_time[playerid] > 2) 
		{
			format(StringF,sizeof(StringF), "[IDLE]");
			SetPlayerChatBubble(playerid, StringF, COLOR_RED, 15.0, 1200);
		}
	}
		//Anti-Money Hack
	if(GetPlayerMoney(playerid) > pData[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pData[playerid][pMoney]);
		//SendAdminMessage(COLOR_RED, "Possible money hacks detected on %s(%i). Check on this player. "LG_E"($%d).", pData[playerid][pName], playerid, GetPlayerMoney(playerid) - pData[playerid][pMoney]);
	}
   	if(pData[playerid][pSpawned] == 1)
    {
        if(GetPlayerWeapon(playerid) != pData[playerid][pWeapon])
        {
            pData[playerid][pWeapon] = GetPlayerWeapon(playerid);

            if(pData[playerid][pWeapon] >= 1 && pData[playerid][pWeapon] <= 45 && pData[playerid][pWeapon] != 40 && pData[playerid][pWeapon] != 2 && pData[playerid][pGuns][g_aWeaponSlots[pData[playerid][pWeapon]]] != GetPlayerWeapon(playerid))
            {
                SendAdminMessage(COLOR_RED, "%s(%d) has possibly used weapon hacks (%s), Please to check /spec this player first!", pData[playerid][pName], playerid, ReturnWeaponName(pData[playerid][pWeapon]));
                //SendClientMessageToAllEx(COLOR_RED, "BotCmd: %s was kicked by BOT. Reason: used weapon hacks (%s).", pData[playerid][pName], ReturnWeaponName(pData[playerid][pWeapon]));
                SetWeapons(playerid); //Reload old weapons
				//KickEx(playerid);
                //Log_Write("logs/cheat_log.txt", "[%s] %s has possibly used weapon hacks (%s).", ReturnDate(), pData[playerid][pName], ReturnWeaponName(pData[playerid][pWeapon]));
                //return 1;
            }
        }
    }
    	//Weapon Atth
	if(NetStats_GetConnectedTime(playerid) - WeaponTick[playerid] >= 250)
	{
		static weaponid, ammo, objectslot, count, index;

		for (new i = 2; i <= 7; i++) //Loop only through the slots that may contain the wearable weapons
		{
			GetPlayerWeaponData(playerid, i, weaponid, ammo);
			index = weaponid - 22;

			if (weaponid && ammo && !WeaponSettings[playerid][index][Hidden] && IsWeaponWearable(weaponid) && EditingWeapon[playerid] != weaponid)
			{
				objectslot = GetWeaponObjectSlot(weaponid);

				if (GetPlayerWeapon(playerid) != weaponid)
					SetPlayerAttachedObject(playerid, objectslot, GetWeaponModel(weaponid), WeaponSettings[playerid][index][Bone], WeaponSettings[playerid][index][Position][0], WeaponSettings[playerid][index][Position][1], WeaponSettings[playerid][index][Position][2], WeaponSettings[playerid][index][Position][3], WeaponSettings[playerid][index][Position][4], WeaponSettings[playerid][index][Position][5], 1.0, 1.0, 1.0);

				else if (IsPlayerAttachedObjectSlotUsed(playerid, objectslot)) RemovePlayerAttachedObject(playerid, objectslot);
			}
		}
		for (new i = 4; i <= 8; i++) if (IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			count = 0;

			for (new j = 22; j <= 38; j++) if (PlayerHasWeapon(playerid, j) && GetWeaponObjectSlot(j) == i)
				count++;

			if(!count) RemovePlayerAttachedObject(playerid, i);
		}
		WeaponTick[playerid] = NetStats_GetConnectedTime(playerid);
	}
    if(pData[playerid][TempatHealing])
    {
        stresstimer[playerid] = SetTimerEx("StressBerkurang", 20000, true, "d", playerid);
    }
    if(pData[playerid][pBladder] <= 15)
    {
        pData[playerid][TempatHealing] = false;
        KillTimer(stresstimer[playerid]);
    }
    if(pData[playerid][AmbilAyam] == 10)
    {
        pData[playerid][AmbilAyam] = 0;
        destroyayam(playerid);
        pData[playerid][DutyAmbilAyam] = 0;
        SetPlayerPos(playerid, 1417.92,356.25,18.95);
		SetPlayerFacingAngle(playerid, 175.453338);
		SuccesMsg(playerid, "You Have Completed the Work");
    }
    //JOB BUS
    new vehicleid = GetPlayerVehicleID(playerid);
	if(pData[playerid][pBus] && GetVehicleModel(vehicleid) == 431 && pData[playerid][pBuswaiting])// rute b
	{
		if(pData[playerid][pBustime] > 0)
		{
			pData[playerid][pBustime]--;
			new str[512];
			format(str, sizeof(str), "Wait %d Seconds", pData[playerid][pBustime]);
			Jembut(playerid, str, 1);
			PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
		}
		else
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, 1965.075073,-1779.868530,13.479113))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 16;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 2, buspoint16, buspoint16, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 2763.975097,-2479.834228,13.575368))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 27;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, buspoint27, buspoint27, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1235.685913,-1855.510986,13.481544))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 59;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, buspoint59, buspoint59, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1909.409545,-1929.344238,12.945344))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 69;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, cpbus4, cpbus4, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1825.054931,-1665.261474,12.955155))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 73;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, cpbus7, cpbus7, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 2082.242187,-1777.502929,12.955197))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 77;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, cpbus11, cpbus11, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
		}
	}
	if(GetPlayerScore(playerid) < 3)//artinya kalau level dibawah 2 bakalan ke kick terkena anti cheat weapon hack
 	{
		if(GetPlayerWeapon(playerid) == 10)//id 25 sama dengan senjata shotgun
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 11)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 12)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 13)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 14)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 15)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 16)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
        if(GetPlayerWeapon(playerid) == 17)//id 38 sama dengan senjata minigun
		{	
			ResetPlayerWeaponsEx(playerid); 
		   	Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 18)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 19)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 20)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 21)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 22)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 23)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 24)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 25)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 26)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 27)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 28)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 29)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 30)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 32)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 32)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 33)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 34)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 35)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 36)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 37)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 38)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 39)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 40)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
	}
	//Anti-Cheat Vehicle health hack
	if(pData[playerid][pAdmin] < 2 && pData[playerid][pLagiDealer] == 0)
	{
		for(new v, j = GetVehiclePoolSize(); v <= j; v++) if(GetVehicleModel(v))
		{
			new Float:health;
			GetVehicleHealth(v, health);
			if( (health > VehicleHealthSecurityData[v]) && VehicleHealthSecurity[v] == false)
			{
				if(GetPlayerVehicleID(playerid) == v)
				{
					new playerState = GetPlayerState(playerid);
					if(playerState == PLAYER_STATE_DRIVER)
					{
						SetValidVehicleHealth(v, VehicleHealthSecurityData[v]);
						SendClientMessageToAllEx(COLOR_RED, "[GreenwichBOT]: telah menendang %s dari kota, Alasan: Vehicle Health!", pData[playerid][pName]);
						KickEx(playerid);
					}
				}
			}
			if(VehicleHealthSecurity[v] == true)
			{
				VehicleHealthSecurity[v] = false;
			}
			VehicleHealthSecurityData[v] = health;
		}
	}	
	//Anti-Money Hack
	if(GetPlayerMoney(playerid) > pData[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pData[playerid][pMoney]);
		//SendAdminMessage(COLOR_RED, "Possible money hacks detected on %s(%i). Check on this player. "LG_E"($%d).", pData[playerid][pName], playerid, GetPlayerMoney(playerid) - pData[playerid][pMoney]);
	}
	if(pData[playerid][pJail] <= 0)
	{
		if(pData[playerid][pHunger] > 100)
		{
			pData[playerid][pHunger] = 100;
		}
		if(pData[playerid][pHunger] < 0)
		{
			pData[playerid][pHunger] = 0;
		}
		if(pData[playerid][pBladder] > 100)
		{
			pData[playerid][pBladder] = 100;
		}
		if(pData[playerid][pBladder] < 0)
		{
			pData[playerid][pBladder] = 0;
		}
		if(pData[playerid][pEnergy] > 100)
		{
			pData[playerid][pEnergy] = 100;
		}
		if(pData[playerid][pEnergy] < 0)
		{
			pData[playerid][pEnergy] = 0;
		}
        if(pData[playerid][pKencing] > 100)
		{
			pData[playerid][pKencing] = 100;
		}
		if(pData[playerid][pKencing] < 0)
		{
			pData[playerid][pKencing] = 0;
		}
	}
	
	if(pData[playerid][pHBEMode] == 1 && pData[playerid][IsLoggedIn] == true)
	{
		new Float: HealthPlayer[MAX_PLAYERS], Float:ArmorPlayer[MAX_PLAYERS];
		new Float: Lapar, Float: Haus, Float: Stresss, Float: HealthBar, Float: ArmourBar;
		new Float: healths, Float: armours;
		GetPlayerHealth(playerid, healths);
		GetPlayerArmour(playerid, armours);

		HealthPlayer[playerid] = healths;
		ArmorPlayer[playerid] = armours;
		//darah
		HealthBar = HealthPlayer[playerid] * 12.0/100;
		PlayerTextDrawTextSize(playerid, darahhbe7[playerid], HealthBar, 3.0);
		//PlayerTextDrawShow(playerid, darahhbe7[playerid]);
		//armor
		ArmourBar = ArmorPlayer[playerid] * 12.0/100;
		PlayerTextDrawTextSize(playerid, armorhbe7[playerid], ArmourBar, 3.0);
		PlayerTextDrawShow(playerid, armorhbe7[playerid]);
		//lapar
		Lapar = pData[playerid][pHunger] * 12.0/100;
		PlayerTextDrawTextSize(playerid, makanhbe7[playerid], Lapar, 3.0);
		//PlayerTextDrawShow(playerid, makanhbe7[playerid]);
		//haus
		Haus = pData[playerid][pEnergy] * 12.0/100;
		PlayerTextDrawTextSize(playerid, minumhbe7[playerid], Haus, 3.0);
		//PlayerTextDrawShow(playerid, minumhbe7[playerid]);
		//stress
		Stresss = pData[playerid][pBladder] * 12.0/100;
		PlayerTextDrawTextSize(playerid, stresshbe7[playerid], Stresss, 3.0);
		//PlayerTextDrawShow(playerid, stresshbe7[playerid]);

		// //factionlist
		// new AlenTD[1000];
		// format(AlenTD, 250, "%d", pData[playerid][polisidikota]);
		// PlayerTextDrawSetString(playerid, factionListTD[playerid][5], AlenTD);
		// PlayerTextDrawShow(playerid, factionListTD[playerid][5]);

		// format(AlenTD, 250, "%d", pData[playerid][emsdikota]);
		// PlayerTextDrawSetString(playerid, factionListTD[playerid][6], AlenTD);
		// PlayerTextDrawShow(playerid, factionListTD[playerid][6]);

		// format(AlenTD, 250, "%d", pData[playerid][govdikota]);
		// PlayerTextDrawSetString(playerid, factionListTD[playerid][7], AlenTD);
		// PlayerTextDrawShow(playerid, factionListTD[playerid][7]);

		// format(AlenTD, 250, "%d", pData[playerid][bengkeldikota]);
		// PlayerTextDrawSetString(playerid, factionListTD[playerid][8], AlenTD);
		// PlayerTextDrawShow(playerid, factionListTD[playerid][8]);

		// format(AlenTD, 250, "%d", pData[playerid][reporterdikota]);
		// PlayerTextDrawSetString(playerid, factionListTD[playerid][9], AlenTD);
		// PlayerTextDrawShow(playerid, factionListTD[playerid][9]);

		new LenzPro[1000];
		//idkita
	    format(LenzPro, 250, "ID : %i", playerid);
	    PlayerTextDrawSetString(playerid, LenzHbe7[playerid][29], LenzPro);
	    PlayerTextDrawShow(playerid, LenzHbe7[playerid][29]);
		//totalplayer
		format(LenzPro, 250, "%d/%d", pemainic, GetMaxPlayers());
		PlayerTextDrawSetString(playerid, LenzHbe7[playerid][28], LenzPro);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][28]);
		//tanggal
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][18]);
		//jam
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][17]);
	}
	else if(pData[playerid][pHBEMode] == 2 && pData[playerid][IsLoggedIn] == true)
	{
		new Float:ArmorPlayer[MAX_PLAYERS];
		// new Float: Lapar, Float: Haus, Float: ArmourBar;
		new Float: armours;
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);

		GetPlayerArmour(playerid, armours);

		ArmorPlayer[playerid] = armours;


		new Nazarhbe[1000];
		format(Nazarhbe, 250, "%.1d", pData[playerid][pHunger]);
		PlayerTextDrawSetString(playerid, HbeNew[playerid][9], Nazarhbe);
		PlayerTextDrawShow(playerid, HbeNew[playerid][9]);

		format(Nazarhbe, 250, "%.1d", pData[playerid][pEnergy]);
		PlayerTextDrawSetString(playerid, HbeNew[playerid][10], Nazarhbe);
		PlayerTextDrawShow(playerid, HbeNew[playerid][10]);

		format(Nazarhbe, 250, "%.1d", pData[playerid][pBladder]);
		PlayerTextDrawSetString(playerid, HbeNew[playerid][11], Nazarhbe);
		PlayerTextDrawShow(playerid, HbeNew[playerid][11]);

	}
	else
	{
	
	}
	
	if(pData[playerid][pHospital] == 1)
    {
		if(pData[playerid][pInjured] == 1)
		{
			SetPlayerPosition(playerid, 1253.64,-1301.35,1061.13,181.16, 0);
			TogglePlayerControllable(playerid, 0);
			pData[playerid][pInjured] = 0;
			ResetPlayerWeaponsEx(playerid);
		}
		pData[playerid][pHospitalTime]++;
		new mstr[64];
		format(mstr, sizeof(mstr), "~n~~n~~n~~w~Recovering... %d", 15 - pData[playerid][pHospitalTime]);
		InfoTD_MSG(playerid, 1000, mstr);

		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
        if(pData[playerid][pHospitalTime] >= 15)
        {
            pData[playerid][pHospitalTime] = 0;
            pData[playerid][pHospital] = 0;
			pData[playerid][pHunger] = 100;
			pData[playerid][pEnergy] = 100;
			SetPlayerHealthEx(playerid, 100);
			pData[playerid][pBladder] = 0;
			pData[playerid][pKencing] = 0;
			pData[playerid][pSick] = 0;
			GivePlayerMoneyEx(playerid, -150);
			SetPlayerHealthEx(playerid, 100);
			HideTdDeath(playerid);

            for (new i; i < 20; i++)
            {
                SendClientMessage(playerid, -1, "");
            }

            InfoMsg(playerid, "You Pay $150 To Hospital.");
 
			SetPlayerPosition(playerid, 1253.64,-1301.35,1061.13,181.16);

            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);

            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
			ClearAnimations(playerid);
			pData[playerid][pSpawned] = 1;
			SetPVarInt(playerid, "GiveUptime", -1);
		}
    }
	if(pData[playerid][pInjured] == 1 && pData[playerid][pHospital] != 1)
    {
		ShowTdDeath(playerid);
		//pData[playerid][pDeathTime]--;
		pData[playerid][pDeathTime] = 300;
		new mstr[128];
		format(mstr, sizeof(mstr), "%d detik.", pData[playerid][pDeathTime]);
		PlayerTextDrawSetString(playerid, Text_Player[playerid][8], mstr);
		
		if(GetPVarInt(playerid, "GiveUptime") == -1)
		{
			SetPVarInt(playerid, "GiveUptime", gettime());
		}
		
		if(GetPVarInt(playerid,"GiveUptime"))
        {
            if((gettime()-GetPVarInt(playerid, "GiveUptime")) > 100)
            {
                Info(playerid, "Now you can spawn, type '/death' for spawn to hospital.");
                SetPVarInt(playerid, "GiveUptime", 0);
            }
        }
		
        ApplyAnimation(playerid, "KNIFE", "null", 4.0, 0, 0, 0, 1, 0, 0);
        ApplyAnimation(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.0, 0, 0, 0, 1, 0, 0);
        SetPlayerHealthEx(playerid, 99999);
    }
	if(pData[playerid][pInjured] == 0 && pData[playerid][pGender] != 0) //Pengurangan Data
	{
		if(++ pData[playerid][pHungerTime] >= 100)
        {
            if(pData[playerid][pHunger] > 0)
            {
                pData[playerid][pHunger]--;
            }
            else if(pData[playerid][pHunger] <= 0)
            {
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pHungerTime] = 0;
        }
        if(++ pData[playerid][pEnergyTime] >= 100)
        {
            if(pData[playerid][pEnergy] > 0)
            {
                pData[playerid][pEnergy]--;
            }
            else if(pData[playerid][pEnergy] <= 0)
            {
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pEnergyTime] = 0;
        }
        if(++ pData[playerid][pBladderTime] >= 100)
        {
            if(pData[playerid][pBladder] < 97)
            {
                pData[playerid][pBladder]++;
            }
            else if(pData[playerid][pBladder] >= 50)
            {
          		Info(playerid, "If you think you're stressed, go to the beach or use a stress pill.");
          		SetPlayerDrunkLevel(playerid, 2200);
            }
            pData[playerid][pBladderTime] = 0;
        }
		if(pData[playerid][pSick] == 1)
		{
			if(++ pData[playerid][pSickTime] >= 200)
			{
				if(pData[playerid][pSick] >= 1)
				{
					new Float:hp;
					GetPlayerHealth(playerid, hp);
					Info(playerid, "You sick, now going to Hospital.");
					SetPlayerDrunkLevel(playerid, 2200);
					pData[playerid][pSickTime] = 0;
				}
			}
		}
	}
	if (pData[playerid][pSpeedTime] > 0)
	{
	    pData[playerid][pSpeedTime]--;
	}
	if(pData[playerid][pLastChopTime] > 0)
    {
		pData[playerid][pLastChopTime]--;
		new mstr[64];
        format(mstr, sizeof(mstr), "Time Robbery ~r~%d ~w~seconds", pData[playerid][pLastChopTime]);
        InfoTD_MSG(playerid, 1000, mstr);
	}
	//Jail Player
	if(pData[playerid][pJail] > 0)
	{
		if(pData[playerid][pJailTime] > 0)
		{
			pData[playerid][pJailTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "You'll be released in %d seconds.", pData[playerid][pJailTime]);
			TextDrawSetString(PenjaraTD[9], mstr);
			for(new i = 0; i < 11; i++)
			{
				TextDrawShowForPlayer(playerid, PenjaraTD[i]);
			}
		}
		else
		{
		    for(new i = 0; i < 11; i++)
			{
				TextDrawHideForPlayer(playerid, PenjaraTD[i]);
			}
			pData[playerid][pJail] = 0;
			pData[playerid][pJailTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1544.43,-1675.28,13.55, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			InfoMsg(playerid, "You now Is Un Arrested");
		}
	}
	//Arreset Player
	if(pData[playerid][pArrest] > 0)
	{
		if(pData[playerid][pArrestTime] > 0)
		{
			pData[playerid][pArrestTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~You Is Arrested  ~w~%d ~b~~h~seconds.", pData[playerid][pArrestTime]);
			Jembut(playerid, mstr, pData[playerid][pArrestTime]);
		}
		else
		{
			pData[playerid][pArrest] = 0;
			pData[playerid][pArrestTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1545.74,-1675.46,13.56, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			InfoMsg(playerid, "You Are Released Right Now");
		}
	}
	return 1;
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(vehicleid == Car_Job[playerid])
    {
        timer_Car[playerid] = SetTimerEx("Detectare_Intrare", 1000, true, "i", playerid);
        Seconds_timer[playerid] = 0;
        SendClientMessage(playerid, ATENTIE, "Silahkan kembali ke kendaraan selama 120 detik.");
    }
	if(vehicleid == pData[playerid][pKendaraanKerja])
    {
        KeluarKerja[playerid] = SetTimerEx("KeluarKendaraanKerja", 1000, true, "i", playerid);
        TimerKeluar[playerid] = 0;
        InfoMsg(playerid, "Segera masuk kedalam kendaraan dalam 15 detik!");
    }
    if(pData[playerid][pDriveLicApp] > 0)
	{
		//new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 602)
		{
		    DisablePlayerCheckpoint(playerid);
			DisablePlayerRaceCheckpoint(playerid);
		    Info(playerid, "Anda Dengan Sengaja Keluar Dari Mobil Latihan, Anda Telah "RED_E"DIDISKUALIFIKASI.");
		    RemovePlayerFromVehicle(playerid);
		    pData[playerid][pDriveLicApp] = 0;
		    SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if(PlayerData[playerid][pAdmin] > 0)
	{
		DisplayStats(clickedplayerid, playerid);
	}
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	Waypoint_Set(playerid, GetLocation(fX, fY, fZ), fX, fY, fZ);
    if (pData[playerid][pAdmin] >= 4 && PlayerInfo[playerid][pAdminDuty] == 1)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
                SetVehiclePos(vehicleid, fX, fY, fZ+10);
        }
        else
        {
                SetPlayerPosFindZ(playerid, fX, fY, 999.0);
                SetPlayerVirtualWorld(playerid, 0);
                SetPlayerInterior(playerid, 0);
        }
    }
    return 1;
}


stock SendDiscordMessage(channel, message[])
{
	new DCC_Channel:ChannelId;
	switch(channel)
	{
		//==[ Log Join & Leave ]
		case 0:
		{
			ChannelId = DCC_FindChannelById("1158963322482339903");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Command ]
		case 1:
		{
			ChannelId = DCC_FindChannelById("1202658430783987722");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Chat IC ]
		case 2:
		{
			ChannelId = DCC_FindChannelById("1086881963954159683");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Warning & Banned ]
		case 3:
		{
			ChannelId = DCC_FindChannelById("1089784876825329775");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Death ]
		case 4:
		{
			ChannelId = DCC_FindChannelById("1185276493157388427");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Ucp ]
		case 5:
		{
			ChannelId = DCC_FindChannelById("1086881965464100870");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		case 6://Korup
		{
			ChannelId = DCC_FindChannelById("1158962842402312232");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		case 7://Register
		{
			ChannelId = DCC_FindChannelById("1086881965464100870");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		case 8://Bot Admin
		{
			ChannelId = DCC_FindChannelById("1090642592250740746");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Death ]
		case 9:
		{
			ChannelId = DCC_FindChannelById("1185276493157388427");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log CMD Admin ]
		case 10:
		{
			ChannelId = DCC_FindChannelById("1188026348212600852");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ LOG STATUS SERVER ]==
		case 11:
		{
			ChannelId = DCC_FindChannelById("1183445689804529784");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
	}
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	//new fishing system//
	if(clickedid == FishTD[2])
	{
		pData[playerid][pInFish] = 1;
		if(value == 0)
		{
			TextDrawTextSize(Fishbar, 16.000, 0.000);
			TextDrawShowForPlayer(playerid, Fishbar);
			SelectTextDraw(playerid, COLOR_BLUE);
			value++;
		}
		else if(value == 1)
		{
			TextDrawTextSize(Fishbar, 16.000, -30.000);
			TextDrawShowForPlayer(playerid, Fishbar);
			SelectTextDraw(playerid, COLOR_BLUE);
			value++;
		}
		else if(value == 2)
		{
			TextDrawTextSize(Fishbar, 16.000, -60.000);
			TextDrawShowForPlayer(playerid, Fishbar);
			SelectTextDraw(playerid, COLOR_BLUE);
			value++;
		}
		else if(value == 3)
		{
			TextDrawTextSize(Fishbar, 16.000, -90.000);
			TextDrawShowForPlayer(playerid, Fishbar);
			SelectTextDraw(playerid, COLOR_BLUE);
			value++;
		}
		else if(value == 4)
		{
			for(new i=0; i<3; i++)
			{
				TextDrawHideForPlayer(playerid,FishTD[i]);
			}
			TextDrawHideForPlayer(playerid,Fishbar);
			value=0;
			CancelSelectTextDraw(playerid);
			SuccesMsg(playerid, "Mancing Sukses");
			FishSukses(playerid);
		}
	}
	//new fishing system//
    if(clickedid == PhoneCall1[23])
	{
	   	if(pData[playerid][pCallStage] != 2) return ErrorMsg(playerid, "Anda sedang tidak menelepon");
		if(pData[playerid][pCallStage] == 2)
		{
			new caller = pData[playerid][pCall];
			pData[caller][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
			SendNearbyMessage(caller, 20.0, COLOR_PURPLE, "* %s mematikan panggilan telepon.", ReturnName(caller));
			if(StreamTelpon[caller])
			{
				SvDetachListenerFromStream(StreamTelpon[caller], caller);
			}
			if(StreamTelpon[playerid])
			{
				SvDetachListenerFromStream(StreamTelpon[playerid], playerid);
			}
			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s mematikan panggilan telepon.", ReturnName(playerid));
			pData[playerid][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
			pData[playerid][pCallStage] = 0;
			pData[playerid][pCallLine] = INVALID_PLAYER_ID;
			pData[caller][pCallStage] = 0;
			pData[caller][pCallLine] = INVALID_PLAYER_ID;
			pData[playerid][pTombolVoice] = 1;
			pData[caller][pTombolVoice] = 1;
			CancelSelectTextDraw(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	        TogglePlayerControllable(playerid, 1);
			ClearAnimations(playerid);
			for(new b = 0; b < 28; b++)
			{
				TextDrawHideForPlayer(caller, PhoneCall1[b]);
			}
			for(new a = 0; a < 28; a++)
			{
				TextDrawHideForPlayer(playerid, PhoneCall1[a]);
			}
		}
	}
    if(clickedid == PhoneCall[29])
	{
	   	if(pData[playerid][pCallStage] != 2) return ErrorMsg(playerid, "Anda sedang tidak menelepon");
		if(pData[playerid][pCallStage] == 2)
		{
			new caller = pData[playerid][pCall];
			pData[caller][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
			SendNearbyMessage(caller, 20.0, COLOR_PURPLE, "* %s mematikan panggilan telepon.", ReturnName(caller));
			if(StreamTelpon[caller])
			{
				SvDetachListenerFromStream(StreamTelpon[caller], caller);
			}
			if(StreamTelpon[playerid])
			{
				SvDetachListenerFromStream(StreamTelpon[playerid], playerid);
			}
			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s mematikan panggilan telepon.", ReturnName(playerid));
			pData[playerid][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
			pData[playerid][pCallStage] = 0;
			pData[playerid][pCallLine] = INVALID_PLAYER_ID;
			pData[caller][pCallStage] = 0;
			pData[caller][pCallLine] = INVALID_PLAYER_ID;
			pData[playerid][pTombolVoice] = 1;
			pData[caller][pTombolVoice] = 1;
			CancelSelectTextDraw(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	        TogglePlayerControllable(playerid, 1);
			ClearAnimations(playerid);
			for(new b = 0; b < 28; b++)
			{
				TextDrawHideForPlayer(caller, PhoneCall1[b]);
			}
			for(new a = 0; a < 28; a++)
			{
				TextDrawHideForPlayer(playerid, PhoneCall1[a]);
			}
		}
	}
    if(clickedid == PhoneCall[25])
	{
	   	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
			return ErrorMsg(playerid, "Anda sudah sedang menelpon seseorang!");
		
		if(pData[playerid][pInjured] != 0)
			return ErrorMsg(playerid, "You cant do that in this time.");
		
		foreach(new ii : Player)
		{
			if(playerid == pData[ii][pCall])
			{
				pData[playerid][pCall] = ii;
				
				new targetid = pData[playerid][pCall];
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
				SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s mengangkat panggilan telepon.", ReturnName(playerid));
				pData[ii][pCallStage] = 2;
				pData[playerid][pCallStage] = 2;
				pData[playerid][pTombolVoice] = 0;
				pData[ii][pTombolVoice] = 0;
			/*	new aaa[600];
				format(aaa, sizeof(aaa), "%s", pData[playerid][pName]);
				TextDrawSetString(playerid, PhoneCall[23], aaa);
				//PlayerTextDrawSetString(ii, PhoneCall[ii][22], aaa);
				format(aaa, sizeof(aaa), "%s", pData[ii][pName]);
				TextDrawSetString(ii, PhoneCall[23], aaa);*/
				Info(playerid, "Use '/cursor'If Mouse Not Detected From Screen Or Textdraw Not Respons Click!");
				SelectTextDraw(playerid, COLOR_BLUE);
				//PlayerTextDrawSetString(playerid, TELPON[playerid][3], "Connected In Call");
			//	PlayerTextDrawSetString(ii, TELPON[ii][3], "Connected In Call");
				for(new b = 0; b < 28; b++)
				{
					TextDrawShowForPlayer(ii, PhoneCall1[b]);
				}
				for(new a = 0; a < 28; a++)
				{
					TextDrawShowForPlayer(playerid, PhoneCall1[a]);
				}
				for(new i = 0; i < 30; i++)
				{
					TextDrawHideForPlayer(playerid, PhoneCall[i]);
				}
				for(new i = 0; i < 57; i++)
				{
					TextDrawHideForPlayer(playerid, PhoneBaru[i]);
				}
				//////////Samp Voice/////////////////////////////////////////////////////////////
				StreamTelpon[targetid] = SvCreateGStream(0xFF0000FF, "Call");
				if (StreamTelpon[targetid]) {
					SvAttachListenerToStream(StreamTelpon[targetid], targetid);
					SvAttachListenerToStream(StreamTelpon[targetid], playerid);
				}
				if (StreamTelpon[targetid] && pData[playerid][pCall] != INVALID_PLAYER_ID) {
					SvAttachSpeakerToStream(StreamTelpon[targetid], playerid);
				}

				if(StreamTelpon[targetid] && pData[targetid][pCall] != INVALID_PLAYER_ID){
					SvAttachSpeakerToStream(StreamTelpon[targetid], targetid);
				}
			}
		}
	}
    if(clickedid == PhoneCall[26])
	{
		RemovePlayerAttachedObject(playerid, 9);

		if(!IsPlayerInAnyVehicle(playerid) && !PlayerData[playerid][pInjured] && !PlayerData[playerid][pLoopAnim])
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			TogglePlayerControllable(playerid, 1);
		}    
		CancelSelectTextDraw(playerid);
	   	SimpanCall(playerid);
	}
    if(clickedid == PhoneBaru[50])
	{
		RemovePlayerAttachedObject(playerid, 9);

		if(!IsPlayerInAnyVehicle(playerid) && !PlayerData[playerid][pInjured] && !PlayerData[playerid][pLoopAnim])
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			TogglePlayerControllable(playerid, 1);
		}    
		CancelSelectTextDraw(playerid);
		SimpanHp(playerid);
	}
	if(clickedid == PHONESCREEN[23])
	{
        for(new i = 0; i < 57; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneBaru[i]);
		}
		SelectTextDraw(playerid, COLOR_WHITE);
		for(new i = 0; i < 28; i++)
		{
			TextDrawHideForPlayer(playerid, PHONESCREEN[i]);
		}
	}
	if(clickedid == PhoneBaru[40])
	{
		ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "{007a1e}Greenwich {ffffff}- GPS", "Jobs Location\nPublic Location\nBussiness In City\nAtm Location\nBank Location\n"RED_E"(Delete Checkpoint)", "Enter", "Cancel");
	}
	if(clickedid == PhoneBaru[24])
	{
	    for(new i = 0; i < 57; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneBaru[i]);
		}
		for(new i = 0; i < 45; i++)
		{
			PlayerTextDrawShow(playerid, BRIMOBILE[playerid][i]);
		}
		new AtmInfo[560];
		format(AtmInfo,1000,"Rekening %d", pData[playerid][pBankRek]);
		PlayerTextDrawSetString(playerid, BRIMOBILE[playerid][30], AtmInfo);
	   	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
		PlayerTextDrawSetString(playerid, BRIMOBILE[playerid][31], AtmInfo);
	}
	if(clickedid == PhoneBaru[28])
	{
	    for(new i = 0; i < 57; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneBaru[i]);
		}
		for(new i = 0; i < 58; i++)
		{
			PlayerTextDrawShow(playerid, GojekAPP[playerid][i]);
		}
		new AtmInfo[560];
	   	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pGopay]));
		PlayerTextDrawSetString(playerid, GojekAPP[playerid][46], AtmInfo);
	}
	if(clickedid == PhoneBaru[54])
	{
		ShowPlayerDialog(playerid, DIALOG_TOGGLEPHONE, DIALOG_STYLE_LIST, "Greenwich - Settings", "About Phone\n Service", "Enter", "Back");
	}
	if(clickedid == PhoneBaru[34])
	{
		new string[555], notif[20];
		format(string, sizeof(string), "Tweet\nChangename Twitter({0099ff}%s{ffffff})\nNotification: %s", pData[playerid][pTwittername], notif);
		ShowPlayerDialog(playerid, DIALOG_TWITTER, DIALOG_STYLE_LIST, "Greenwich - Twitter", string, "Enter", "Close");
	}
	if(clickedid == PhoneBaru[37])
	{
		ShowContacts(playerid);
	}
	if(clickedid == PhoneBaru[43])
	{
		ShowPlayerDialog(playerid, DIALOG_WASSAP, DIALOG_STYLE_LIST, "Greenwich - WhatsApp", "Contact\nShareloc\nWhatsapp", "Enter", "Back");
	}
	if(clickedid == PhoneBaru[47])
	{
		ShowPlayerDialog(playerid, DIALOG_PHONE_DIALUMBER, DIALOG_STYLE_INPUT, "Phone - Call", "Enter The Number :", "Input", "Back");
	}
    //BAJU SYSTEM DENTOT
	if(clickedid == BajuTD[1])//exit
	{
	    SetPlayerSkin(playerid, pData[playerid][pSkin]);
        for(new i = 0; i < 19; i++)
		{
			TextDrawHideForPlayer(playerid, BajuTD[i]);
		}
		CancelSelectTextDraw(playerid);
	}
	if(clickedid == BajuTD[2])//baju
	{
	    TextDrawShowForPlayer(playerid, BajuTD[4]);
		TextDrawShowForPlayer(playerid, BajuTD[5]);
		TextDrawShowForPlayer(playerid, BajuTD[6]);
		TextDrawShowForPlayer(playerid, BajuTD[7]);
		TextDrawShowForPlayer(playerid, BajuTD[13]);
		TextDrawShowForPlayer(playerid, BajuTD[14]);
		TextDrawShowForPlayer(playerid, BajuTD[15]);
		TextDrawShowForPlayer(playerid, BajuTD[16]);
		TextDrawShowForPlayer(playerid, BajuTD[17]);
		TextDrawShowForPlayer(playerid, BajuTD[18]);
	}
	if(clickedid == BajuTD[3])//aksesoris
	{
	    for(new i = 0; i < 19; i++)
		{
			TextDrawHideForPlayer(playerid, BajuTD[i]);
		}
		CancelSelectTextDraw(playerid);
	    new string[248];
		if(pToys[playerid][0][toy_model] == 0)
		{
			strcat(string, ""dot"Slot 1\n");
		}
		else strcat(string, ""dot"Slot 1 "RED_E"(Used)\n");

		if(pToys[playerid][1][toy_model] == 0)
		{
			strcat(string, ""dot"Slot 2\n");
		}
		else strcat(string, ""dot"Slot 2 "RED_E"(Used)\n");

		if(pToys[playerid][2][toy_model] == 0)
		{
			strcat(string, ""dot"Slot 3\n");
		}
		else strcat(string, ""dot"Slot 3 "RED_E"(Used)\n");

		if(pToys[playerid][3][toy_model] == 0)
		{
			strcat(string, ""dot"Slot 4\n");
		}
		else strcat(string, ""dot"Slot 4 "RED_E"(Used)\n");
		
		ShowPlayerDialog(playerid, DIALOG_TOYBUY, DIALOG_STYLE_LIST, "Greenwich - Accessories", string, "Enter", "Cancel");
	}
	if(clickedid == BajuTD[17])//aksesoris
	{
		if(pData[playerid][pHelmet] != 0) return ErrorMsg(playerid, "You Already Have Helm!");
		SuccesMsg(playerid, "Success To Buy Helm!");
		pData[playerid][pHelmet] ++;
	}
	//DEALER SYSTEM DENTOT
	if(clickedid == DealerTD[0])//kiri 
	{
	    cskin[playerid]--;
   		if(cskin[playerid] < 0) cskin[playerid] = sizeof Kendaraan - 1;
    	if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
   		pData[playerid][pKendaraanDealer] = CreateVehicle(Kendaraan[cskin[playerid]], 1853.037475,869.174865,10.910516,359.373474,0,0,-1);
   		PutPlayerInVehicle(playerid, pData[playerid][pKendaraanDealer], 0);
   		new AtmInfo[560];
	   	format(AtmInfo,1000,"%s", FormatMoney(GetVehicleCost(Kendaraan[cskin[playerid]])));
		TextDrawSetString(DealerTD[6], AtmInfo);
	    TextDrawShowForPlayer(playerid, DealerTD[6]);
	    format(AtmInfo,1000,"%s", GetVehicleModelName(Kendaraan[cskin[playerid]]));
		TextDrawSetString(DealerTD[13], AtmInfo);
	    TextDrawShowForPlayer(playerid, DealerTD[13]);
	    SetPlayerCameraPos(playerid,1850.219970,875.313476,10.910516); 
		return 1;
	}
	if(clickedid == DealerTD[1])//kanan
	{
	    cskin[playerid]++;
	    if(cskin[playerid] >= sizeof Kendaraan) cskin[playerid] = 0;
	    if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
   		pData[playerid][pKendaraanDealer] = CreateVehicle(Kendaraan[cskin[playerid]], 1853.037475,869.174865,10.910516,359.373474,0,0,-1);
   		PutPlayerInVehicle(playerid, pData[playerid][pKendaraanDealer], 0);
   		new AtmInfo[560];
	   	format(AtmInfo,1000,"%s", FormatMoney(GetVehicleCost(Kendaraan[cskin[playerid]])));
		TextDrawSetString(DealerTD[6], AtmInfo);
	    TextDrawShowForPlayer(playerid, DealerTD[6]);
	    format(AtmInfo,1000,"%s", GetVehicleModelName(Kendaraan[cskin[playerid]]));
		TextDrawSetString(DealerTD[13], AtmInfo);
	    TextDrawShowForPlayer(playerid, DealerTD[13]);
	    SetPlayerCameraPos(playerid,1850.219970,875.313476,10.910516);
   		return 1;
	}
	if(clickedid == DealerTD[2])//batal
	{
	    if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
   		for(new i = 0; i < 14; i++)
		{
			TextDrawHideForPlayer(playerid, DealerTD[i]);
		}
		CancelSelectTextDraw(playerid);
		SetPlayerPos(playerid, 1840.484130,883.824645,10.910516);
		SetPlayerFacingAngle(playerid, 180.544662);
		SetCameraBehindPlayer(playerid);
		delaydealer = false;
		pData[playerid][pLagiDealer] = 0;
	}
	if(clickedid == DealerTD[3])//Beli
	{
	    new modelid = Kendaraan[cskin[playerid]];
	    new cost = GetVehicleCost(modelid);
		if(pData[playerid][pMoney] < cost)
		{
			ErrorMsg(playerid, "Uang anda tidak mencukupi.!");
			return 1;
		}
   		new count = 0, limit = MAX_PLAYER_VEHICLE + pData[playerid][pVip];
		foreach(new ii : PVehicles)
		{
			if(pvData[ii][cOwner] == pData[playerid][pID])
			count++;
		}
		if(count >= limit)
		{
			ErrorMsg(playerid, "Slot kendaraan anda sudah penuh, silahkan jual beberapa kendaraan anda terlebih dahulu!");
			return 1;
		}
		GivePlayerMoneyEx(playerid, -cost);
		new duet[500];
		format(duet, sizeof(duet), "Removed_%sx", FormatMoney(cost));
		ShowItemBox(playerid, "Uang", duet, 1212, 2);
		new cQuery[1024];
		new Float:x,Float:y,Float:z, Float:a;
		if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
		new model, color1, color2;
		color1 = 0;
		color2 = 0;
		model = modelid;
		x = 1837.052856;
		y = 870.937805;
		z = 10.910516;
		a = 94.845832;
		for(new i = 0; i < 14; i++)
		{
			TextDrawHideForPlayer(playerid, DealerTD[i]);
		}
		CancelSelectTextDraw(playerid);
		SetPlayerPos(playerid, 1840.484130,883.824645,10.910516);
		SetPlayerFacingAngle(playerid, 180.544662);
		SetCameraBehindPlayer(playerid);
		delaydealer = false;
		pData[playerid][pLagiDealer] = 0;
		mysql_format(g_SQL, cQuery, sizeof(cQuery), "INSERT INTO `vehicle` (`owner`, `model`, `color1`, `color2`, `price`, `x`, `y`, `z`, `a`) VALUES (%d, %d, %d, %d, %d, '%f', '%f', '%f', '%f')", pData[playerid][pID], model, color1, color2, cost, x, y, z, a);
		mysql_tquery(g_SQL, cQuery, "OnVehBuyPV", "ddddddffff", playerid, pData[playerid][pID], model, color1, color2, cost, x, y, z, a);
		return 1;
	}
	if(clickedid == BajuTD[4])//kiri
	{
	    cskin[playerid]--;
 		if(pData[playerid][pGender] == 1)
  		{
   			if(cskin[playerid] < 0) cskin[playerid] = sizeof PedMan - 1;
    		SetPlayerSkin(playerid, PedMan[cskin[playerid]]);
		}
		else
		{
			if(cskin[playerid] < 0) cskin[playerid] = sizeof PedMale - 1;
			SetPlayerSkin(playerid, PedMale[cskin[playerid]]);
		}
		return 1;
	}
	if(clickedid == BajuTD[5])//kanan
	{
	    cskin[playerid]++;
   		if(pData[playerid][pGender] == 1)
    	{
   			if(cskin[playerid] >= sizeof PedMan) cskin[playerid] = 0;
			SetPlayerSkin(playerid, PedMan[cskin[playerid]]);
		}
		else
		{
			if(cskin[playerid] >= sizeof PedMale) cskin[playerid] = 0;
			SetPlayerSkin(playerid, PedMale[cskin[playerid]]);
		}
		return 1;
	}
	if(clickedid == BajuTD[6])//beli
	{
	    pData[playerid][pSkin] = GetPlayerSkin(playerid);
        GivePlayerMoneyEx(playerid, -100);
        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "> %s telah membeli baju seharga $100 <", ReturnName(playerid));
        ShowItemBox(playerid, "Uang", "Removed_$100", 1212, 3);
    	TextDrawHideForPlayer(playerid, BajuTD[4]);
		TextDrawHideForPlayer(playerid, BajuTD[5]);
		TextDrawHideForPlayer(playerid, BajuTD[6]);
		TextDrawHideForPlayer(playerid, BajuTD[7]);
		TextDrawHideForPlayer(playerid, BajuTD[13]);
		TextDrawHideForPlayer(playerid, BajuTD[14]);
		TextDrawHideForPlayer(playerid, BajuTD[15]);
		TextDrawHideForPlayer(playerid, BajuTD[16]);
		TextDrawHideForPlayer(playerid, BajuTD[17]);
		TextDrawHideForPlayer(playerid, BajuTD[18]);
		return 1;
	}
	if(clickedid == BajuTD[7])//exit
	{
	    SetPlayerSkin(playerid, pData[playerid][pSkin]);
	    TextDrawHideForPlayer(playerid, BajuTD[4]);
		TextDrawHideForPlayer(playerid, BajuTD[5]);
		TextDrawHideForPlayer(playerid, BajuTD[6]);
		TextDrawHideForPlayer(playerid, BajuTD[7]);
		TextDrawHideForPlayer(playerid, BajuTD[13]);
		TextDrawHideForPlayer(playerid, BajuTD[14]);
		TextDrawHideForPlayer(playerid, BajuTD[15]);
		TextDrawHideForPlayer(playerid, BajuTD[16]);
		TextDrawHideForPlayer(playerid, BajuTD[17]);
		TextDrawHideForPlayer(playerid, BajuTD[18]);
	}
	return 1;
}
function SetPlayerCameraBehind(playerid)
{
	SetCameraBehindPlayer(playerid);
}
function SetPlayerCameraBehindAyam(playerid)
{
	SetCameraBehindPlayer(playerid);
}
stock RefreshVModel(playerid)
{
    return 1;
}

// stock RefreshPSkin(playerid)
// {
//     return 1;
// }

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
	if(listid == SpawnMale)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1764.07,-1899.12,13.55,274.86, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
	}
	
	if(listid == SpawnFemale)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1764.07,-1899.12,13.55,274.86, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
   }

   //Locker Faction Skin
	if(listid == SAPDMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}
	
	if(listid == SAPDFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAPDWar)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAGSMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAGSFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAMDMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAMDFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SANEWMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SANEWFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}
	if(listid == MaleSkins)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli pakaian ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
			Bisnis_Save(bizid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Info(playerid, "Anda tidak jadi membeli pakaian");
	}

	if(listid == FemaleSkins)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Telah Membeli Pakaian No %d Seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
			Bisnis_Save(bizid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Info(playerid, "Anda tidak jadi membeli pakaian");
	}
	if(listid == VIPMaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Telah Mengganti Pakaian No %d.", ReturnName(playerid), modelid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
	}

	if(listid == VIPFemaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Telah Membeli Pakaian No %d.", ReturnName(playerid), modelid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Servers(playerid, "Canceled Buy Clothes");
	}
	if(listid == VIPMaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Telah Mengganti Pakaian No %d.", ReturnName(playerid), modelid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Servers(playerid, "Canceled buy skin");
	}

	if(listid == VIPFemaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Telah Membeli Pakaian No %d.", ReturnName(playerid), modelid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Servers(playerid, "Canceled buy skin");
	}
	if(listid == toyslist)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][1];
			
			GivePlayerMoneyEx(playerid, -price);
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Pilih", "Batal");
			
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "> %s telah membeli aksesoris seharga %s <", ReturnName(playerid), FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
			new str[500];
			format(str, sizeof(str), "Removed_%s", FormatMoney(price));
			ShowItemBox(playerid, "Uang", str, 1212, 2);
            SuccesMsg(playerid, "Anda telah membeli aksesoris baru");
			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
		else return ErrorMsg(playerid, "Batal membeli aksesoris");
	}

	//modshop
	if(listid == TransFender)
	{
		if(response)
        {
            new
            price = 5000,
            vehicleid
            ;

            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return Error(playerid, "You need to be inside vehicle as driver");

            vehicleid = Vehicle_Nearest(playerid);

            if(vehicleid == -1)
                return 0;

            Vehicle_ObjectAddObjects(playerid, vehicleid, modelid, OBJECT_TYPE_BODY);

            SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"You have purchased a {00FFFF}%s "WHITE_E"for "GREEN_E"$%s.", GetVehObjectNameByModel(modelid), FormatMoney(price));
        }
	}

	if(listid == Waa)
	{
		if(response)
        {
            new
            price = 5000,
            vehicleid
            ;

            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return Error(playerid, "You need to be inside vehicle as driver");

            vehicleid = Vehicle_Nearest(playerid);

            if(vehicleid == -1)
                return 0;

            Vehicle_ObjectAddObjects(playerid, vehicleid, modelid, OBJECT_TYPE_BODY);

            SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"You have purchased a {00FFFF}%s "WHITE_E"for "GREEN_E"$%s.", GetVehObjectNameByModel(modelid), FormatMoney(price));
        }
	}

	if(listid == LoCo)
	{
		if(response)
        {
            new
            price = 5000,
            vehicleid
            ;

            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return Error(playerid, "You need to be inside vehicle as driver");

            vehicleid = Vehicle_Nearest(playerid);

            if(vehicleid == -1)
                return 0;

            Vehicle_ObjectAddObjects(playerid, vehicleid, modelid, OBJECT_TYPE_BODY);

            SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"You have purchased a {00FFFF}%s "WHITE_E"for "GREEN_E"$%s.", GetVehObjectNameByModel(modelid), FormatMoney(price));
        }
	}

	if(listid == viptoyslist)
	{
		if(response)
		{
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");

            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengambil object ID %d dilocker.", ReturnName(playerid), modelid);
		}
		else return Servers(playerid, "Canceled toys");
	}
	if(listid == PDGSkinMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
			// RefreshPSkin(playerid);
		}
	}

	if(listid == PDGSkinFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
			// RefreshPSkin(playerid);
		}
	}

	if(listid == vtoylist)
	{
		if(response)
		{
			new x = pData[playerid][VehicleID], Float:vPosx, Float:vPosy, Float:vPosz;
			GetVehiclePos(x, vPosx, vPosy, vPosz);
			foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new vehid = pvData[i][cVeh];
				new toyslotid = pvData[vehid][vtoySelected];
				vtData[vehid][toyslotid][vtoy_modelid] = modelid;

				if(pvData[vehid][PurchasedvToy] == false) 			// Cek kalo gada database di mysql auto di buat
				{
					MySQL_CreateVehicleToy(i);
				}

				printf("VehicleID: %d, Object: %d, Pos: (%f ,%f, %f), ToySlotID: %d", vehid, vtData[vehid][toyslotid][vtoy_modelid], vPosx, vPosy, vPosz, toyslotid);

				vtData[vehid][toyslotid][vtoy_model] = CreateObject(modelid, vPosx, vPosy, vPosz, 0.0, 0.0, 0.0);
				AttachObjectToVehicle(vtData[vehid][toyslotid][vtoy_model], vehid, vtData[vehid][toyslotid][vtoy_x], vtData[vehid][toyslotid][vtoy_y], vtData[vehid][toyslotid][vtoy_z], vtData[vehid][toyslotid][vtoy_rx], vtData[vehid][toyslotid][vtoy_ry], vtData[vehid][toyslotid][vtoy_rz]);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memasang toys untuk vehicleid(%d) object ID %d", ReturnName(playerid), vehid, modelid);
				ShowPlayerDialog(playerid, DIALOG_MODTACCEPT, DIALOG_STYLE_MSGBOX, "Vehicle Toys", "Do You Want To Save it?", "Yes", "Batal");
			}
		}
		else return Servers(playerid, "Canceled buy toys");
	}
	return 1;
}

stock DisplayDokumen(playerid)
{
    /*new skckstatus[36];
	if(pData[playerid][pSkck] == 1)
	{
		format(skckstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(skckstatus, 36, ""RED_E"Tidak");
	}*/
    new ktpstatus[36];
	if(pData[playerid][pIDCard] == 1)
	{
		format(ktpstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(ktpstatus, 36, ""RED_E"Tidak");
	}

	//SKCK
	/*new skckstatus[36];
	if(pData[playerid][pSkck] == 1)
	{
		format(skckstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(skckstatus, 36, ""RED_E"Tidak");
	}*/

	new simstatus[36];
	if(pData[playerid][pDriveLic] == 1)
	{
		format(simstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(simstatus, 36, ""RED_E"Tidak");
	}
	
	new weaponstatus[36];
	if(pData[playerid][pWeaponLic] == 1)
	{
		format(weaponstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(weaponstatus, 36, ""RED_E"Tidak");
	}
	new sksstatus[36];
	if(pData[playerid][pSks] == 1)
	{
		format(sksstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(sksstatus, 36, ""RED_E"Tidak");
	}
	new string[2048];
	format(string, sizeof(string),"ID Card\t[%s]\nDrive License\t[%s]\nLisensi Senjata\t[%s]\nSurat Kesehatan\t[%s]",
    ktpstatus,
	simstatus,
	weaponstatus,
	sksstatus);
	ShowPlayerDialog(playerid, DIALOG_DOKUMEN, DIALOG_STYLE_LIST, "Greenwich - Document", string, "Close","");
}
forward TambahDetikTelepon(playerid);
public TambahDetikTelepon(playerid)
{
	DetikTelpon[playerid] ++;

	if(DetikTelpon[playerid] == 60)
	{
		DetikTelpon[playerid] = 0;
		TambahJamTelpon(playerid);
	}
}

forward TambahJamTelpon(playerid);
public TambahJamTelpon(playerid)
{
	JamTelpon[playerid] ++;

	if(JamTelpon[playerid] == 24)
	{
		JamTelpon[playerid] = 0;
	}
}

forward TambahDetikFivEM();
public TambahDetikFivEM()
{
	DetikFivEm ++;

	if(DetikFivEm == 60)
	{
		DetikFivEm = 0;
		TambahJamFivEm();
	}

	SetWorldTime(JamFivEm);
}

forward TambahJamFivEm();
public TambahJamFivEm()
{
	JamFivEm ++;

	if(JamFivEm == 24)
	{
		JamFivEm = 0;
	}

	SetWorldTime(JamFivEm);
}

stock GetMonthName(months)
{
    new monthname_str[10];

	switch(months)
	{
		case 1: monthname_str = "Januari";
		case 2: monthname_str = "Februari";
		case 3: monthname_str = "Maret";
		case 4: monthname_str = "April";
		case 5: monthname_str = "Mei";
		case 6: monthname_str = "Juni";
		case 7: monthname_str = "Juli";
		case 8: monthname_str = "Augustus";
		case 9: monthname_str = "September";
		case 10: monthname_str = "Oktober";
		case 11: monthname_str = "November";
		case 12: monthname_str = "Desember";
	}

	return monthname_str;
}

function SedangKencing(playerid)
{
	pData[playerid][pKencing] = 0;
	InfoMsg(playerid, "Anda merasa lega.");
	ClearAnimations(playerid);
	StopLoopingAnim(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	return 1;
}
function WaktuBerburu(playerid)
{
	ClearAnimations(playerid);
	InfoMsg(playerid, "Silahkan Melanjutkan Berburu");
	return 1;
}

function WaktuBerburu1(playerid)
{
	ClearAnimations(playerid);
	PutRusa[playerid] = 1;
	SetPlayerCheckpoint(playerid, -280.6513, -2175.8017, 28.6393, 5);
	SetPlayerAttachedObject(playerid, 6, 19315, 3, 0.1, 0.1, -0.1, 0.0, 270.0, 0.0, 1, 1, 1);
	InfoMsg(playerid, "Kembali Ke Om Badak Untuk Menjual Rusa");
	return 1;
}

CMD:starthunter(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 5, -280.6513, -2175.8017, 28.6393))
	{
		if(JobHunter[playerid] != 0) return ErrorMsg(playerid, "Kamu Sudah Mulai Berburu");
		JobHunter[playerid] = 1;
		GivePlayerWeapon(playerid, 33, 5);
		SetPlayerCheckpoint(playerid, -515.0798, -2276.4099, 33.4140, 1);
	    SendClientMessage(playerid, COLOR_YELLOW, "Pergi Ke Tanda Merah Untuk Berburu");
	}
	return 1;
}
/*stock RemovePlayerFromVehicleEx(playerid)
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) return 0;

	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		vehicle_driver[vehicleid] = INVALID_PLAYER_ID;
	}

    new Float: x, Float: y, Float: z;

    GetPlayerPos(playerid, x, y, z);

    return SetPlayerPos(playerid, x + 1.5, y + 1.5, z);
}*/
CMD:sellrusa(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 5, -280.6513, -2175.8017, 28.6393))
	{
		if(PutRusa[playerid] != 1) return ErrorMsg(playerid, "Kamu Tidak Membawa Rusa");
		RemovePlayerAttachedObject(playerid, 6);
		JobHunter[playerid] = 0;
		PutRusa[playerid] = 0;
		pData[playerid][pMoney] += 100;
	}
	return 1;
}
CMD:rusagerak(playerid, params[])
{
    MoveObject(rusa, -1934.440795,-2371.890136,30.826015, 3.5, -90.0000, 0.0000, 0.0000);
	return 1;
}
CMD:oxs(playerid, params[])
{
	PlayerTextDrawShow(playerid, ox_pasive[playerid][0]);
	PlayerTextDrawShow(playerid, ox_pasive[playerid][1]);
	return 1;
}
CMD:oxhide(playerid, params[])
{
	PlayerTextDrawHide(playerid,ox_pasive[playerid][0]);
	PlayerTextDrawHide(playerid,ox_pasive[playerid][1]);
	PlayerTextDrawHide(playerid, ox_active[playerid][0]);
	PlayerTextDrawHide(playerid, ox_active[playerid][1]);
	CancelSelectTextDraw(playerid);
	return 1;
}
function OnPlayerGeledah(playerid, userid)
{
    new str[256], string[256], totalall, quantitybar;
	format(str,1000,"%s", GetName(userid));
	PlayerTextDrawSetString(playerid, INVNAME[userid][3], str);
	BarangMasuk(userid);
	BukaInven[playerid] = 1;
	PlayerPlaySound(playerid, 1039, 0,0,0);
	SelectTextDraw(playerid, COLOR_PINK2);
	for(new a = 0; a < 6; a++)
	{
		PlayerTextDrawShow(playerid, INVNAME[userid][a]);
	}
	for(new a = 0; a < 11; a++)
	{
		PlayerTextDrawShow(playerid, INVINFO[userid][a]);
	}
	for(new i = 0; i < MAX_INVENTORY; i++)
	{
	    PlayerTextDrawShow(playerid, INDEXTD[userid][i]);
		PlayerTextDrawShow(playerid, AMOUNTTD[userid][i]);
		totalall += InventoryData[userid][i][invTotalQuantity];
		format(str, sizeof(str), "%.1f/850.0", float(totalall));
		PlayerTextDrawSetString(playerid, INVNAME[userid][4], str);
		quantitybar = totalall * 199/850;
	  	PlayerTextDrawTextSize(playerid, INVNAME[userid][2], quantitybar, 3.0);
	  	PlayerTextDrawShow(playerid, INVNAME[userid][2]);
		if(InventoryData[userid][i][invExists])
		{
			PlayerTextDrawShow(playerid, NAMETD[userid][i]);
			PlayerTextDrawShow(playerid, GARISBAWAH[userid][i]);
			PlayerTextDrawSetPreviewModel(playerid, MODELTD[userid][i], InventoryData[userid][i][invModel]);
			//sesuakian dengan object item kalian
			if(InventoryData[userid][i][invModel] == 18867)
			{
				PlayerTextDrawSetPreviewRot(playerid, MODELTD[userid][i], -254.000000, 0.000000, 0.000000, 2.779998);
			}
			else if(InventoryData[userid][i][invModel] == 16776)
			{
				PlayerTextDrawSetPreviewRot(playerid, MODELTD[userid][i], 0.000000, 0.000000, -85.000000, 1.000000);
			}
			else if(InventoryData[userid][i][invModel] == 1581)
			{
				PlayerTextDrawSetPreviewRot(playerid, MODELTD[userid][i], 0.000000, 0.000000, -180.000000, 1.000000);
			}
			PlayerTextDrawShow(playerid, MODELTD[userid][i]);
			strunpack(string, InventoryData[userid][i][invItem]);
			format(str, sizeof(str), "%s", string);
			PlayerTextDrawSetString(playerid, NAMETD[userid][i], str);
			format(str, sizeof(str), "%dx", InventoryData[userid][i][invAmount]);
			PlayerTextDrawSetString(playerid, AMOUNTTD[userid][i], str);
		}
		else
		{
			PlayerTextDrawHide(playerid, AMOUNTTD[userid][i]);
		}
	}
    new stra[500];
    format(stra, sizeof(stra), "You're Being Frisked by %s", pData[playerid][pName]);
    InfoMsg(userid, stra);
}
function OnPlayerTreatment(playerid, userid)
{
    pData[userid][pInjured] = 0;
    pData[userid][pHospital] = 0;
    pData[userid][pSick] = 0;
    pData[userid][pHead] = 100;
    pData[userid][pPerut] = 100;
    pData[userid][pRHand] = 100;
    pData[userid][pLHand] = 100;
    pData[userid][pRFoot] = 100;
    pData[userid][pLFoot] = 100;
    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);
    ClearAnimations(userid);
    TogglePlayerControllable(userid, 1);
    SetPVarInt(playerid, "gcPlayer", userid);
    ApplyAnimation(playerid,"MEDIC","CPR",4.1, 0, 1, 1, 1, 1, 1);
    SetPlayerHealthEx(userid, 100.0);
    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s menyembuhkan segala luka %s.", ReturnName(playerid), ReturnName(userid));
    new stra[500];
    format(stra, sizeof(stra), "Anda telah disembuhkan oleh %s", pData[playerid][pName]);
    InfoMsg(userid, stra);
}
function OnPlayerBorgol(playerid, userid)
{
    if(pData[userid][pCuffed])
			return ErrorMsg(playerid, "The player is already cuffed at the moment.");

	pData[userid][pCuffed] = 1;
	SetPlayerSpecialAction(userid, SPECIAL_ACTION_CUFFED);
	TogglePlayerControllable(userid, 0);

	new mstr[128];
	format(mstr, sizeof(mstr), "You've been ~r~cuffed~w~ by %s.", ReturnName(playerid));
	InfoMsg(userid, mstr);
	return 1;
}
function OnPlayerUnBorgol(playerid, userid)
{
	pData[userid][pCuffed] = 0;
	SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);
	TogglePlayerControllable(userid, 1);

	new mstr[128];
	format(mstr, sizeof(mstr), "You've been ~r~uncuffed~w~ by %s.", ReturnName(playerid));
	InfoMsg(userid, mstr);
}
function OnPlayerPeriksa(playerid, userid)
{
    new hstring[512], info[512];
	new hh = pData[userid][pHead];
	new hp = pData[userid][pPerut];
	new htk = pData[userid][pRHand];
	new htka = pData[userid][pLHand];
	new hkk = pData[userid][pRFoot];
	new hkka = pData[userid][pLFoot];
	format(hstring, sizeof(hstring),"Bagian Tubuh\tKondisi\n{ffffff}Kepala\t{7fffd4}%d.0%\n{ffffff}Perut\t{7fffd4}%d.0%\n{ffffff}Tangan Kanan\t{7fffd4}%d.0%\n{ffffff}Tangan Kiri\t{7fffd4}%d.0%\n",hh,hp,htk,htka);
	strcat(info, hstring);
    format(hstring, sizeof(hstring),"{ffffff}Kaki Kanan\t{7fffd4}%d.0%\n{ffffff}Kaki Kiri\t{7fffd4}%d.0%\n",hkk,hkka);
    strcat(info, hstring);
    ShowPlayerDialog(playerid, DIALOG_HEALTH, DIALOG_STYLE_TABLIST_HEADERS,"Health Condition",info,"Oke","");
}
function OnPlayerGiveKontak(playerid, userid)
{
	new string[500];
    for (new i = 0; i != MAX_CONTACTS; i ++)
	{
		if (!ContactData[userid][i][contactExists])
		{
	        ContactData[userid][i][contactExists] = true;
	        ContactData[userid][i][contactNumber] = pData[playerid][pPhone];
			format(ContactData[userid][i][contactName], 32, pData[playerid][pName]);
			mysql_format(g_SQL, string, sizeof(string), "INSERT INTO `contacts` (`ID`, `contactName`, `contactNumber`) VALUES('%d', '%s', '%d')", pData[userid][pID], pData[playerid][pName], ContactData[playerid][i][contactNumber]);
			mysql_tquery(g_SQL, string, "OnContactAdd", "dd", userid, i);
			new meme[500];
			format(meme,sizeof(meme),"~y~%s ~w~telah membagikan kontak kepada anda", pData[playerid][pName]);
			SuccesMsg(userid, meme);
			SuccesMsg(playerid, "Berhasil membagikan kontak");
	        return 1;
		}
	}		
	return 1;
}
function OnPlayerRevive(playerid, userid)
{
    SetTimerEx("Reviving", 5000, 0, "i", playerid);
    TogglePlayerControllable(playerid, 0);
    ShowProgressbar(playerid, "Revive..", 5);
    pData[playerid][pObat] -= 1;
    pData[userid][pInjured] = 0;
    pData[userid][pHospital] = 0;
    pData[userid][pSick] = 0;
    pData[userid][pHead] = 100;
    pData[userid][pPerut] = 100;
    pData[userid][pRHand] = 100;
    pData[userid][pLHand] = 100;
    pData[userid][pRFoot] = 100;
    pData[userid][pLFoot] = 100;
    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);
    ClearAnimations(userid);
    TogglePlayerControllable(userid, 1);
    SetPVarInt(playerid, "gcPlayer", userid);
    ApplyAnimation(playerid,"MEDIC","CPR",4.1, 0, 1, 1, 1, 1, 1);
    SetPlayerHealthEx(userid, 100.0);
    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s menyembuhkan segala luka %s.", ReturnName(playerid), ReturnName(userid));
    new stra[500];
    format(stra, sizeof(stra), "Anda telah disembuhkan oleh %s", pData[playerid][pName]);
    InfoMsg(userid, stra);
}
function OnPlayerInVoice(playerid, userid)
{
    new biid = Iter_Free(tagihan);
    if(biid == -1) return ErrorMsg(playerid, "Kamu tidak bisa memberi tagihan lagi");
    new bill[3400];
    bilData[biid][bilType] = pData[playerid][pFaction];
    bilData[biid][bilTarget] = pData[userid][pID];
    Iter_Add(tagihan, biid);
    mysql_format(g_SQL, bill, sizeof(bill), "INSERT INTO `bill` (`bid`,`type`,`name`,`target`,`ammount`) VALUES ('%d','%d','%s','%d','%d')",
    biid,
    bilData[biid][bilType],
    bilData[biid][bilName],
    bilData[biid][bilTarget],
    bilData[biid][bilammount]);
    mysql_tquery(g_SQL, bill);
    new memem[500];
    format(memem, sizeof(memem), "Kamu diberikan invoice sebesar ~y~%s, oleh %s",FormatMoney(bilData[biid][bilammount]), pData[playerid][pName]);
    InfoMsg(userid, memem);
	format(memem, sizeof(memem), "Kamu berhasil memberikan invoice sebesar ~y~%s, kepada %s",FormatMoney(bilData[biid][bilammount]), pData[userid][pName]);
    InfoMsg(playerid, memem);
    return 1;
}
forward AppuieJump(playerid);
public AppuieJump(playerid)
{
    AntiBHOP[playerid] = 0;
    ClearAnimations(playerid);
    return 1;
}
forward AppuiePasJump(playerid);
public AppuiePasJump(playerid)
{
    AntiBHOP[playerid] = 0;
    return 1;
}

stock hidehplenz(playerid)
{
	for(new u = 0; u < 62; u++)
	{
		PlayerTextDrawHide(playerid, LenzMenuTD[playerid][u]);
	}
	PlayerTextDrawHide(playerid, kliktutuphp[playerid]);
	PlayerTextDrawHide(playerid, sms[playerid]);
	PlayerTextDrawHide(playerid, telpon[playerid]);
	PlayerTextDrawHide(playerid, kontak[playerid]);
	PlayerTextDrawHide(playerid, gps[playerid]);
	PlayerTextDrawHide(playerid, twitter[playerid]);
	PlayerTextDrawHide(playerid, setting[playerid]);
	PlayerTextDrawHide(playerid, airdrop[playerid]);
	PlayerTextDrawHide(playerid, kamera[playerid]);
	PlayerTextDrawHide(playerid, gojek[playerid]);
	PlayerTextDrawHide(playerid, brimobile[playerid]);
	PlayerTextDrawHide(playerid, spotify[playerid]);
	PlayerTextDrawHide(playerid, apklainnya[playerid]);
	CancelSelectTextDraw(playerid);
	}
	stock showhbelenz(playerid)
	{
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][0]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][1]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][2]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][3]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][4]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][5]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][6]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][7]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][8]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][9]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][10]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][11]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][12]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][13]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][14]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][15]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][16]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][17]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][18]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][19]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][20]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][21]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][22]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][23]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][24]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][25]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][26]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][27]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][28]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][29]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][30]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][31]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][32]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][33]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][34]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][35]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][36]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][37]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][38]);
		PlayerTextDrawShow(playerid, LenzHbe7[playerid][39]);
		PlayerTextDrawShow(playerid, darahhbe7[playerid]);
		PlayerTextDrawShow(playerid, armorhbe7[playerid]);
		PlayerTextDrawShow(playerid, makanhbe7[playerid]);
		PlayerTextDrawShow(playerid, minumhbe7[playerid]);
		PlayerTextDrawShow(playerid, stresshbe7[playerid]);
		PlayerTextDrawShow(playerid, LenzLogo[playerid][0]);
		PlayerTextDrawShow(playerid, LenzLogo[playerid][1]);
		PlayerTextDrawShow(playerid, LenzLogo[playerid][2]);
		PlayerTextDrawShow(playerid, LenzLogo[playerid][3]);
		PlayerTextDrawShow(playerid, LenzLogo[playerid][4]);
		PlayerTextDrawShow(playerid, LenzLogo[playerid][5]);
		PlayerTextDrawShow(playerid, LenzLogo[playerid][6]);
		PlayerTextDrawShow(playerid, LenzLogo[playerid][7]);
		PlayerTextDrawShow(playerid, LenzLogo[playerid][8]);
	
}
stock hidehbelenz(playerid)
{
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][0]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][1]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][2]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][3]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][4]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][5]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][6]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][7]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][8]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][9]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][10]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][11]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][12]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][13]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][14]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][15]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][16]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][17]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][18]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][19]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][20]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][21]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][22]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][23]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][24]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][25]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][26]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][27]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][28]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][29]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][30]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][31]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][32]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][33]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][34]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][35]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][36]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][37]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][38]);
	PlayerTextDrawHide(playerid, LenzHbe7[playerid][39]);
	PlayerTextDrawHide(playerid, darahhbe7[playerid]);
	PlayerTextDrawHide(playerid, armorhbe7[playerid]);
	PlayerTextDrawHide(playerid, makanhbe7[playerid]);
	PlayerTextDrawHide(playerid, minumhbe7[playerid]);
	PlayerTextDrawHide(playerid, stresshbe7[playerid]);
	PlayerTextDrawHide(playerid, LenzLogo[playerid][0]);
	PlayerTextDrawHide(playerid, LenzLogo[playerid][1]);
	PlayerTextDrawHide(playerid, LenzLogo[playerid][2]);
	PlayerTextDrawHide(playerid, LenzLogo[playerid][3]);
	PlayerTextDrawHide(playerid, LenzLogo[playerid][4]);
	PlayerTextDrawHide(playerid, LenzLogo[playerid][5]);
	PlayerTextDrawHide(playerid, LenzLogo[playerid][6]);
	PlayerTextDrawHide(playerid, LenzLogo[playerid][7]);
	PlayerTextDrawHide(playerid, LenzLogo[playerid][8]);
}

stock showfaclist(playerid)
{
	PlayerTextDrawShow(playerid, factionListTD[playerid][0]);
	PlayerTextDrawShow(playerid, factionListTD[playerid][1]);
	PlayerTextDrawShow(playerid, factionListTD[playerid][2]);
	PlayerTextDrawShow(playerid, factionListTD[playerid][3]);
	PlayerTextDrawShow(playerid, factionListTD[playerid][4]);
	PlayerTextDrawShow(playerid, factionListTD[playerid][5]);
	PlayerTextDrawShow(playerid, factionListTD[playerid][6]);
	PlayerTextDrawShow(playerid, factionListTD[playerid][7]);
	PlayerTextDrawShow(playerid, factionListTD[playerid][8]);
	PlayerTextDrawShow(playerid, factionListTD[playerid][9]);
}
// stock showoxp(playerid)
// {
// 	PlayerTextDrawShow(playerid, OXtdpasive[playerid][0]);
// 	PlayerTextDrawShow(playerid, OXtdpasive[playerid][1]);
// }
stock hidefaclist(playerid)
{
	PlayerTextDrawHide(playerid, factionListTD[playerid][0]);
	PlayerTextDrawHide(playerid, factionListTD[playerid][1]);
	PlayerTextDrawHide(playerid, factionListTD[playerid][2]);
	PlayerTextDrawHide(playerid, factionListTD[playerid][3]);
	PlayerTextDrawHide(playerid, factionListTD[playerid][4]);
	PlayerTextDrawHide(playerid, factionListTD[playerid][5]);
	PlayerTextDrawHide(playerid, factionListTD[playerid][6]);
	PlayerTextDrawHide(playerid, factionListTD[playerid][7]);
	PlayerTextDrawHide(playerid, factionListTD[playerid][8]);
	PlayerTextDrawHide(playerid, factionListTD[playerid][9]);
}
/*function Register(playerid)
{
    for(new i = 0; i < 32; i++)
    {
        PlayerTextDrawShow(playerid, BuatKarakter[playerid][i]);
    }
    SelectTextDraw(playerid, COLOR_BLUE);
    return 1;
}*/ 
