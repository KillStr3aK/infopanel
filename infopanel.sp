#pragma semicolon 1

#include <sourcemod>
#include <sdktools>
#include <cstrike>

#pragma newdecls required

#define ITEMDRAW_RAWLINE (1<<1)

public Plugin myinfo =
{
	name			= "Infopanel for the last T",
	description	= "Opens an infopanel for the last Terrorist",
	author			= "Nexd + Nano",
	version		= "1.0"
	url			= "http://steamcommunity.com/id/marianzet1 // http://steelclouds.clans.hu"
}

public void OnPluginStart() 
{ 
    HookEvent("player_death", Event_PlayerDeath, EventHookMode_PostNoCopy); 
} 

public Action Event_PlayerDeath(Event event, char[] name, bool dontBroadcast) 
{
	int count, client;
	for (int i = 1; i <= MaxClients; i++)
    {
        if (IsClientInGame(i) && GetClientTeam(i) == 2 && IsPlayerAlive(i)) 
        {
            client = i;
            count++;
        }
    }
    
	if (count == 1)
    {
		Infopanel(client);
    }
} 

public Action Infopanel(int client)
{
	Handle infopanel = CreatePanel(INVALID_HANDLE);

	SetPanelTitle(infopanel, "Title line");
	DrawPanelText(infopanel, "-----------------------------------------");
	DrawPanelText(infopanel, "Line 2");
	DrawPanelText(infopanel, "Line 3");
	DrawPanelText(infopanel, "Line 4");
	DrawPanelText(infopanel, "Line 5");
	DrawPanelText(infopanel, "Line 6");
	DrawPanelText(infopanel, "-----------------------------------------");
	SendPanelToClient(infopanel, client, NullMenuHandler, 15);
	CloseHandle(infopanel);
}

int NullMenuHandler(Handle menu, MenuAction action, int param1, int param2) 
{
}