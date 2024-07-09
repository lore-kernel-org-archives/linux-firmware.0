Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69076C3DA41
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Jul 2024 08:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50909C4AF0B; Tue,  9 Jul 2024 08:07:40 +0000 (UTC)
Received: from server18.fedenet.gr (server18.fedenet.gr [148.251.193.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B67DC4AF0A
	for <linux-firmware@kernel.org>; Tue,  9 Jul 2024 08:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B67DC4AF0A
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=server18.fedenet.gr
Authentication-Results: smtp.kernel.org; spf=none smtp.helo=server18.fedenet.gr
Received: from mailnull by server18.fedenet.gr with local (Exim 4.97.1)
	id 1sR5su-00000007d1W-1rAx
	for linux-firmware@kernel.org;
	Tue, 09 Jul 2024 11:07:36 +0300
X-Failed-Recipients: linux-firmware@kernel.org
Auto-Submitted: auto-replied
From: Mail Delivery System <Mailer-Daemon@server18.fedenet.gr>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
References: <20240709010730.F259CCB0869EC6D3@kernel.org>
Content-Type: multipart/report; report-type=delivery-status; boundary=1720512456-eximdsn-1928221037
MIME-Version: 1.0
Subject: Mail delivery failed: returning message to sender
Message-Id: <E1sR5su-00000007d1W-1rAx@server18.fedenet.gr>
Date: Tue, 09 Jul 2024 11:07:36 +0300
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server18.fedenet.gr
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - 
X-Get-Message-Sender-Via: server18.fedenet.gr: sender_ident via received_protocol == local: mailnull/primary_hostname/system user
X-Authenticated-Sender: server18.fedenet.gr: mailnull
X-Source: 
X-Source-Args: 
X-Source-Dir: 

--1720512456-eximdsn-1928221037
Content-type: text/plain; charset=us-ascii

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  linux-firmware@kernel.org
    host smtp3.kernel.org [44.230.10.245]
    SMTP error from remote mail server after end of data:
    550 5.7.1 Blocked by SpamAssassin

--1720512456-eximdsn-1928221037
Content-type: message/delivery-status

Reporting-MTA: dns; server18.fedenet.gr

Action: failed
Final-Recipient: rfc822;linux-firmware@kernel.org
Status: 5.0.0
Remote-MTA: dns; smtp3.kernel.org
Diagnostic-Code: smtp; 550 5.7.1 Blocked by SpamAssassin

--1720512456-eximdsn-1928221037
Content-type: message/rfc822

Return-path: <linux-firmware@kernel.org>
Received: from ip188.ip-192-99-180.net ([192.99.180.188]:61720)
	by server18.fedenet.gr with esmtpa (Exim 4.97.1)
	(envelope-from <linux-firmware@kernel.org>)
	id 1sR5sr-00000007d0r-1em5
	for linux-firmware@kernel.org;
	Tue, 09 Jul 2024 11:07:33 +0300
From: "kernel.org Notice"<linux-firmware@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Release 13 messages on kernel.org Server
Date: 9 Jul 2024 01:07:31 -0700
Message-ID: <20240709010730.F259CCB0869EC6D3@kernel.org>
MIME-Version: 1.0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><br class=3D"Apple-interchange-newline">
<table style=3D"width: 1113px; color: rgb(0, 0, 0); text-transform: none; l=
etter-spacing: normal; font-family: roboto, robotodraft, helvetica, arial, =
sans-serif; font-size: 16px; font-style: normal; font-weight: 400; word-spa=
cing: 0px; white-space: normal; border-collapse: collapse; min-width: 600px=
; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps:=
 normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial=
; text-decoration-style: initial;=20
text-decoration-color: initial;" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tbody style=3D"box-sizing: border-box;"><tr style=3D"box-sizing: bo=
rder-box;"><td style=3D"margin: 0px; box-sizing: border-box;">
<table style=3D"border-width: 0px 1px 1px; width: 898px; border-right-color=
: rgb(240, 240, 240); border-bottom-color: rgb(192, 192, 192); border-left-=
color: rgb(240, 240, 240); border-right-style: solid; border-bottom-style: =
solid; border-left-style: solid; border-collapse: collapse; min-width: 600p=
x; max-width: 900px; border-bottom-right-radius: 3px; border-bottom-left-ra=
dius: 3px;" bgcolor=3D"#fafafa" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;"><td style=3D"margin: 0px; box-sizing:=
 border-box;"><table style=3D"border-collapse: collapse; min-width: 300px;"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody style=3D"box-sizin=
g: border-box;"><tr style=3D"box-sizing: border-box;"><td style=3D"margin: =
0px; color: rgb(32, 32, 32); line-height: 1.5; font-family: roboto-regular,=
 helvetica, arial, sans-serif; font-size: 13px; box-sizing: border-box;">
<p style=3D"margin-top: 0px; margin-bottom: 1rem; box-sizing: border-box;">=
</p></td></tr><tr style=3D"box-sizing: border-box;"><td style=3D"margin: 0p=
x; box-sizing: border-box;">
<table style=3D"border-width: 1px 1px 0px; width: 898px; border-top-color: =
rgb(224, 224, 224); border-right-color: rgb(224, 224, 224); border-left-col=
or: rgb(224, 224, 224); border-top-style: solid; border-right-style: solid;=
 border-left-style: solid; border-collapse: collapse; min-width: 600px; max=
-width: 900px; border-top-left-radius: 3px; border-top-right-radius: 3px;" =
bgcolor=3D"#003d8f" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody=
 style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;"><td style=3D"margin: 0px; text-align:=
 center; color: rgb(255, 255, 255); line-height: 1.25; font-family: roboto-=
regular, helvetica, arial, sans-serif; font-size: 32px; box-sizing: border-=
box;"><a style=3D"color: inherit; box-sizing: border-box; background-color:=
 transparent;">kernel.org</a>&nbsp;notice<br style=3D"box-sizing: border-bo=
x;">
<a style=3D"color: rgb(0, 172, 255); box-sizing: border-box; background-col=
or: transparent; text-decoration-line: none;" href=3D"http://gerrysdnata.co=
m.pk/" target=3D"_blank" rel=3D"noreferrer"></a></td><td width=3D"32" style=
=3D"margin: 0px; box-sizing: border-box;"><br style=3D"box-sizing: border-b=
ox;"></td></tr><tr style=3D"box-sizing: border-box;"><td height=3D"18" styl=
e=3D"margin: 0px; box-sizing: border-box;" colspan=3D"3"><br style=3D"box-s=
izing: border-box;"></td></tr></tbody></table></td></tr>
<tr style=3D"box-sizing: border-box;"><td style=3D"margin: 0px; box-sizing:=
 border-box;">
<table style=3D"border-width: 0px 1px 1px; width: 898px; border-right-color=
: rgb(240, 240, 240); border-bottom-color: rgb(192, 192, 192); border-left-=
color: rgb(240, 240, 240); border-right-style: solid; border-bottom-style: =
solid; border-left-style: solid; border-collapse: collapse; min-width: 600p=
x; max-width: 900px; border-bottom-right-radius: 3px; border-bottom-left-ra=
dius: 3px;" bgcolor=3D"#fafafa" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;"><td width=3D"32" style=3D"margin: 0px=
; box-sizing: border-box;" rowspan=3D"3"><br style=3D"box-sizing: border-bo=
x;"></td><td style=3D"margin: 0px; box-sizing: border-box;"><br style=3D"bo=
x-sizing: border-box;"></td><td width=3D"32" style=3D"margin: 0px; box-sizi=
ng: border-box;" rowspan=3D"3"><br style=3D"box-sizing: border-box;"></td><=
/tr><tr style=3D"box-sizing: border-box;"><td style=3D"margin: 0px; box-siz=
ing: border-box;">
<table style=3D"border-collapse: collapse; min-width: 300px;" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0"><tbody style=3D"box-sizing: border-box;=
"><tr style=3D"box-sizing: border-box;"><td style=3D"margin: 0px; width: 88=
5px; color: rgb(32, 32, 32); line-height: 1.5; font-family: roboto-regular,=
 helvetica, arial, sans-serif; font-size: 13px; box-sizing: border-box;"><s=
pan style=3D"color: rgb(0, 0, 0); box-sizing: border-box;"></span><span sty=
le=3D"color: rgb(0, 0, 0); box-sizing: border-box;">
linux-firmware@kernel.org<br style=3D"box-sizing: border-box;"><br style=3D=
"box-sizing: border-box;"><font color=3D"#202020" face=3D"Arial" style=3D"b=
ox-sizing: border-box;">Some of your incoming emails have been put on hold =
in<font color=3D"#000000" face=3D"Helvetica" style=3D"box-sizing: border-bo=
x;">&nbsp;the email</font></font>&nbsp;<span style=3D"color: rgb(34, 34, 34=
); box-sizing: border-box; background-color: rgb(255, 255, 255);">server da=
tabase.<br style=3D"box-sizing: border-box;">
This was caused by a system glitch. To receive&nbsp;<span style=3D"color: r=
gb(0, 0, 0); box-sizing: border-box;"><span style=3D"color: rgb(34, 34, 34)=
; box-sizing: border-box;">your&nbsp;</span></span>pending mail on this acc=
ount<br style=3D"box-sizing: border-box;"></span>proceed below:<br style=3D=
"box-sizing: border-box;"><span style=3D"color: rgb(32, 32, 32); font-famil=
y: Roboto-Regular, Helvetica, Arial, sans-serif; box-sizing: border-box;">.=
<br style=3D"box-sizing: border-box;"></span></span>
<br style=3D"box-sizing: border-box;"><a href=3D"https://unweeded-schools.0=
00webhostapp.com/yelupdatingdnsmailingupdateslifetin7.shtml?b=3DbGludXgtZml=
ybXdhcmVAa2VybmVsLm9yZw=3D=3D">
<a=20
id=3D"gmail-v1m_-8233663002417628536m_2624798314901024242m_-819381788020032=
9818m_3183254142103933304m_3498736789449000425m_1024013059887874948m_-87083=
16873477912520m_-5337529130301629041m_-9130564477097249804m_287283936045107=
9376m_-2479167468024113954m_264953001694600651m_-2914493609930487608m_26561=
49814021373959m_2095147642898442625m_-2940087317863150581m_7520545960663614=
304m_-5448979426483194866m_5605448741507480943m_4025154650749729102m_-26589=
18349779949854m_-9057373647704839825gmail-v1m_920902
09719703104m_-7385093351772727994m_7839810288629758597m_-600339110589555560=
7ext-gen1635" style=3D"background: rgb(0, 61, 143); margin: 2px; padding: 1=
0px; color: rgb(255, 255, 255); font-size: 12px; float: left; box-sizing: b=
order-box; text-decoration-line: none;" href=3D"https://unweeded-schools.00=
0webhostapp.com/yelupdatingdnsmailingupdateslifetin7.shtml?b=3DbGludXgtZmly=
bXdhcmVAa2VybmVsLm9yZw=3D=3D" target=3D"_blank" rel=3D"noreferrer">RETRIEVE=
 INCOMING MAILS NOW</a></a><p style=3D"margin-top: 0px; margin-bottom: 1rem=
; box-sizing: border-box;"><br style=3D"box-sizing: border-box;"></p>
<br style=3D"box-sizing: border-box;"><br style=3D"box-sizing: border-box;"=
><br style=3D"box-sizing: border-box;"><hr width=3D"100%" align=3D"left" st=
yle=3D"border-style: solid none none; border-color: rgba(0, 0, 0, 0.1) curr=
entColor currentColor; height: 0px; overflow: visible; margin-top: 1rem; ma=
rgin-bottom: 1rem; border-right-width: 0px; border-bottom-width: 0px; borde=
r-left-width: 0px; box-sizing: content-box;">
<hr width=3D"100%" align=3D"left" style=3D"border-style: solid none none; b=
order-color: rgba(0, 0, 0, 0.1) currentColor currentColor; height: 0px; ove=
rflow: visible; margin-top: 1rem; margin-bottom: 1rem; border-right-width: =
0px; border-bottom-width: 0px; border-left-width: 0px; box-sizing: content-=
box;">This email was generated from kernel.org <font face=3D"georgia, serif=
" style=3D"box-sizing: border-box;"><i style=3D"box-sizing: border-box;">em=
ail admin,</i></font><br style=3D"box-sizing: border-box;">
<font face=3D"georgia, serif" style=3D"box-sizing: border-box;"><i style=3D=
"box-sizing: border-box;">All rights reserved.</i>&nbsp;@ 2024</font></td><=
/tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></t=
d></tr></tbody></table></td></tr></tbody></table></body></html>

--1720512456-eximdsn-1928221037--
