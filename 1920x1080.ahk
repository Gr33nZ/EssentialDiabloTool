#NoEnv
#MaxHotkeysPerInterval 99
#HotkeyInterval 99
#KeyHistory 
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input


;=======================================================================================================================;
;					Essential Diablo Tool   by Gr33nZ						;
;=======================================================================================================================;
;	NB5 = Cube All in Inventory (Small) 	|	NB0 	 = Stop the Task	|	STRG + x = Close	;
;	NB4 = Cube All in Inventory (Big) 	|	STRG + 1 = Macro spams 1	|				;
;	NB3 = Discard Inventory			|	STRG + 2 = Macro spams 2	|				;
;	NB2 = Blacksmith Clear Inventory	|	STRG + 3 = Macro spams 3	|				;
;	NB1 = Kadala Buy			|	STRG + 4 = Macro spams 4	|				;
;=======================================================================================================================;
;	USE THIS TOOL ON OWN RISK, im not responsable for your actions.							;
;	I wrote this tool to save some time of my and your life while speed farming  					;
;	All the tool is be able to, you can achive with normal Key-Inputs 						;
;	https://us.forums.blizzard.com/en/overwatch/t/can-i-be-banned-for-using-autohotkey/75928/4			;
;	If anyone finds a Blue Post that says explicitly that Actions that emulate Normal Inputs -			;
; 	is against Blizzards Rules i will Stop supporting this tool and removeing my Downloads				;
;		-https://github.com/Gr33nZ										;	
;=======================================================================================================================;
;															;
;Adjusting Vars 											|(1920x1080)	;
InvPos1X := 1425	;Position Top Left in Inventory X (Coord) 					|1425		;
InvPos1Y := 580 	;Position Top Left in Inventory Y (Coord)					|580		;
InvSpace := 50		;Spacing between each Inventory Field  (pixel)					|50		;
InvStartX := 1375	;Start on next Row (InvPos1X - InvSpace)					|1375		;
Sle := 1			;Sleep Timer (ms) 							|1		;
FuInv := 1			;Inventory Position of your Mouse (Fix)					|1		;
CubeFillX := 665	;Cube Fill X (Coord) 								|665		;
CubeFillY := 836	;Cube Fill Y (Coord)								|836		;
CubeTransX := 220	;Cube Transmute x (Coord) 							|220		;
CubeTransY := 820 	;Cube Transmute Y (Coord)							|820		;
CubeRemoveX := 260	;Position Top Mid in Cube X (Coord) 						|260		;
CubeRemoveY := 410	;Position Top Mid in Cube Y (Coord)						|410		;
CubeSle := 500		;Sleep between each Action (ms) 						|500		;
CubeAccept := 2500	;Sleep Timer for Cube (ms | Fix)						|2500		;
CubeSpace := 100	;For Fields that have a height of 2 (InvSpace * 2) 				|100		;
DisPosX := 975		;Discard Position X (Coord) 							|975		;
DisPosY := 500		;Discard Position Y (Coord)							|500		;
;															;
;=======================================================================================================================;
 

;======================================================== Macros =======================================================;
;Macro Nr. 1														;
^1:: 		;Here you can Adjust the Trigger of the Macro (^ = STRG |  1 = 1)					;
	LoopKiller := 0													;
	Loop,{														;
		send, {1} 	;Which Keyboard Input you want to send (1 = 1)						;
		sleep, 150 		;How Fast should it be ? here your Input get send every 150ms			; 
			if LoopKiller = 1 										;
			Break 												;
	}  														;
Return 															;
;Macro Nr. 2 														;
^2:: 															;
	LoopKiller := 0 												;
	Loop,{ 														;
		send, {2} 												;
		sleep, 150 												;
			if LoopKiller = 1  										;
			Break 												;
	} 														;
Return 															;
;Macro Nr. 3 														;
^3:: 															;
	LoopKiller := 0 												;
	Loop,{ 														;
		send, {3} 												;
		sleep, 150 												;
			if LoopKiller = 1  										;
			Break 												;
	} 														;
Return 															;
;Macro Nr. 4														;
^4:: 															;
	LoopKiller := 0 												;
	Loop,{ 														;
		send, {4} 												;
		sleep, 150 												;
			if LoopKiller = 1  										;
			Break 												;
	} 														;
Return 															;
;															;
;=======================================================================================================================;

;Kadala v1.0
Numpad1::
	LoopKiller := 0
	Loop,60{
		send, {Click Right}
		sleep, 10
			if LoopKiller = 1 
			Break
	}
Return

;Inv Clear v1.2
Numpad2::
	ClearX := InvPos1X
	ClearY := InvPos1Y
	SleepClear := Sle 
	RowsClear := FuInv  
	LoopKiller := 0
	MouseMove, %ClearX%, %ClearY%,
	click,
	send, {Enter}
	Sleep, %SleepClear%
		Loop,59{
			ClearX += InvSpace
			RowsClear += 1
			MouseMove, %ClearX%, %ClearY%,
			click,
			Sleep, %SleepClear%
			send, {Enter}
			Sleep, %SleepClear%
			if (RowsClear = 10){
				ClearY += InvSpace
				ClearX := InvStartX
			} 
			if (RowsClear = 20){
				ClearY +=InvSpace
				ClearX := InvStartX
			}
			if (RowsClear = 30){
				ClearY +=InvSpace
				ClearX := InvStartX
			}
			if (RowsClear = 40){
				ClearY +=InvSpace
				ClearX := InvStartX
			}
			if (RowsClear = 50){
				ClearY +=InvSpace
				ClearX := InvStartX
			}
			if (LoopKiller = 1){
				Break
			}
		}
Return

;Cube v1.1 
Numpad4::
	CubeX := InvPos1X
	CubeY := InvPos1Y
	CubeFX := CubeFillX
	CubeFY := CubeFillY
	CubeTransmuteX := CubeTransX
	CubeTransmuteY := CubeTransY
	CubeItemX := CubeRemoveX
	CubeItemY := CubeRemoveY
	CSle := CubeSle   
	Accep := CubeAccept 
	LoopKiller := 0 
	CubeRow := FuInv 
	MouseMove, %CubeX%, %CubeY%, 
	send, {Click Right} 
	sleep, %CSle%
	MouseMove, %CubeFX%, %CubeFY%
	click,
	sleep, %CSle%
	MouseMove, %CubeTransmuteX%, %CubeTransmuteY% 
	click,
	MouseMove, %CubeItemX%, %CubeItemY% 
	sleep %Accep%
	send, {Click Right}
		Loop,29{
			CubeX += 50
			CubeRow += 1 
			MouseMove, %CubeX%, %CubeY%,  
			send, {Click Right} 
			sleep, %CSle%
			MouseMove, %CubeFX%, %CubeFY%
			click,
			sleep, %CSle%
			MouseMove, %CubeTransmuteX%, %CubeTransmuteY% 
			click,
			MouseMove, %CubeItemX%, %CubeItemY% 
			sleep %Accep%
			send, {Click Right}
			if (CubeRow = 10){ 
				CubeY += CubeSpace
				CubeX := InvStartX
			}
			if (CubeRow = 20){ 
				CubeY += CubeSpace
				CubeX := InvStartX
			}
			if (LoopKiller = 1){
				Break 
			}
		}
Return

;Discard 1.0
NumPad3::
	StartX := InvPos1X
	StartY := InvPos1Y
	DiscardX := DisPosX
	DiscardY := DisPosY
	DisSle := Sle
	LoopKiller := 0 
	DisRow := FuInv
	MouseMove, %StartX%, %StartY%, 
	click,
	sleep, %DisSle%
	MouseMove, %DiscardX%, %DiscardY%
	click, 
		Loop,59{
			StartX += 50
			DisRow += 1
			MouseMove, %StartX%, %StartY%, 
			click,
			sleep, %DisSle%
			MouseMove, %DiscardX%, %DiscardY%
			click,
			if (DisRow = 10){
				StartY +=InvSpace
				StartX := InvStartX
			} 
			if (DisRow = 20){
				StartY +=InvSpace
				StartX := InvStartX
			}
			if (DisRow = 30){
				StartY +=InvSpace
				StartX := InvStartX
			}
			if (DisRow = 40){
				StartY +=InvSpace
				StartX := InvStartX
			}
			if (DisRow = 50){
				StartY +=InvSpace
				StartX := InvStartX
			}
			if (LoopKiller = 1){
				Break
			}
		}
Return

;Cube (one field items) v1.1
Numpad5::
	CubeRX := InvPos1X
	CubeRY := InvPos1Y
	CRFillX := CubeFillX
	CRFillY := CubeFillY
	CRTransX := CubeTransX
	CRTransY := CubeTransY
	CRItemX := CubeRemoveX
	CRItemY := CubeRemoveY
	CRSle := CubeSle   
	CRAccept := CubeAccept 
	LoopKiller := 0 
	CRInv := FuInv 
	MouseMove, %CubeRX%, %CubeRY%, 
	send, {Click Right} 
	sleep, %CRSle%
	MouseMove, %CRFillX%, %CRFillY%
	click,
	sleep, %CRSle%
	MouseMove, %CRTransX%, %CRTransY% 
	click,
	MouseMove, %CRItemX%, %CRItemY% 
	sleep %CRAccept%
	send, {Click Right}
		Loop,59{
			CubeRX += InvSpace
			CRInv += 1 
			MouseMove, %CubeRX%, %CubeRY%,  
			send, {Click Right} 
			sleep, %CRSle%
			MouseMove, %CRFillX%, %CRFillY%
			click,
			sleep, %CRSle%
			MouseMove, %CRTransX%, %CRTransY% 
			click,
			MouseMove, %CRItemX%, %CRItemY% 
			sleep %CRAccept%
			send, {Click Right}
			if (CRInv = 10){ 
				CubeRY += InvSpace
				CubeRX := InvStartX
			}
			if (CRInv = 20){ 
				CubeRY += InvSpace
				CubeRX := InvStartX
			}
			if (CRInv = 30){ 
				CubeRY += InvSpace
				CubeRX := InvStartX
			}
			if (CRInv = 40){ 
				CubeRY += InvSpace
				CubeRX := InvStartX
			}
			if (CRInv = 50){ 
				CubeRY += InvSpace
				CubeRX := InvStartX
			}
			if (LoopKiller = 1){
				Break 
			}
		}
Return

Numpad0::
	LoopKiller = 1
Return

^x::
exitapp
