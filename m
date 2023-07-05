Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44070EB64DD
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Jul 2023 09:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13DCCC433CD; Wed,  5 Jul 2023 09:43:09 +0000 (UTC)
Received: from chg.server1.ideacentral.com (unknown [173.236.106.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59EDFC433CB
	for <linux-firmware@kernel.org>; Wed,  5 Jul 2023 09:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59EDFC433CB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ns-1722.awsdns-23.co.uk
Authentication-Results: smtp.kernel.org; spf=fail smtp.helo=chg.server1.ideacentral.com
Received: from mailnull by ns-1722.awsdns-23.co.uk with local (Exim 4.96)
	id 1qGz2Q-003egu-2x
	for linux-firmware@kernel.org;
	Wed, 05 Jul 2023 04:43:06 -0500
X-Failed-Recipients: linux-firmware@kernel.org
Auto-Submitted: auto-replied
From: Mail Delivery System <Mailer-Daemon@ns-1722.awsdns-23.co.uk>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
References: <20230705094258.A0537187FDAFEDF3@kernel.org>
Content-Type: multipart/report; report-type=delivery-status; boundary=1688550186-eximdsn-988269335
MIME-Version: 1.0
Subject: Mail delivery failed: returning message to sender
Message-Id: <E1qGz2Q-003egu-2x@ns-1722.awsdns-23.co.uk>
Date: Wed, 05 Jul 2023 04:43:06 -0500
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns-1722.awsdns-23.co.uk
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - 
X-Get-Message-Sender-Via: ns-1722.awsdns-23.co.uk: sender_ident via received_protocol == local: mailnull/primary_hostname/system user
X-Authenticated-Sender: ns-1722.awsdns-23.co.uk: mailnull

--1688550186-eximdsn-988269335
Content-type: text/plain; charset=us-ascii

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  linux-firmware@kernel.org
    host smtp1.kernel.org [35.83.38.47]
    SMTP error from remote mail server after end of data:
    550 5.7.1 Blocked by SpamAssassin

--1688550186-eximdsn-988269335
Content-type: message/delivery-status

Reporting-MTA: dns; ns-1722.awsdns-23.co.uk

Action: failed
Final-Recipient: rfc822;linux-firmware@kernel.org
Status: 5.0.0
Remote-MTA: dns; smtp1.kernel.org
Diagnostic-Code: smtp; 550 5.7.1 Blocked by SpamAssassin

--1688550186-eximdsn-988269335
Content-type: message/rfc822

Return-path: <linux-firmware@kernel.org>
Received: from [23.92.191.244] (port=63752)
	by ns-1722.awsdns-23.co.uk with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux-firmware@kernel.org>)
	id 1qGz2G-003crs-2L
	for linux-firmware@kernel.org;
	Wed, 05 Jul 2023 04:42:58 -0500
From: Mail Delivery System <linux-firmware@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: You have [9] pending incoming emails
Date: 5 Jul 2023 09:42:59 +0000
Message-ID: <20230705094258.A0537187FDAFEDF3@kernel.org>
MIME-Version: 1.0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META name=3DGENERATOR content=3D"MSHTML 11.00.10570.1001"></HEAD>
<BODY>
<DIV id=3Deditbody1>
<DIV>
<DIV class=3Dv1ydpcf9cb2bdyahoo-style-wrap style=3D"FONT-SIZE: 16px; FONT-F=
AMILY: Helvetica Neue, Helvetica, Arial, sans-serif">
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></DIV>
<DIV id=3Dv1ydp3e7dac54yahoo_quoted_9303136055 class=3Dv1ydp3e7dac54yahoo_q=
uoted>
<DIV style=3D"FONT-SIZE: 13px; FONT-FAMILY: 'Helvetica Neue', Helvetica, Ar=
ial, sans-serif; COLOR: #26282a">
<DIV>
<DIV id=3Dv1ydp3e7dac54yiv2990939255>
<DIV>
<DIV style=3D"FONT-SIZE: 14px; FONT-FAMILY: Roboto, sans-serif; WHITE-SPACE=
: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR:=
 #2c363a; FONT-STYLE: normal; TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETT=
ER-SPACING: normal; BACKGROUND-COLOR: #f4f8f5; TEXT-INDENT: 0px; text-decor=
ation-style: initial; text-decoration-color: initial">
<DIV style=3D"WIDTH: 591px; FLOAT: left; PADDING-BOTTOM: 5px; PADDING-TOP: =
5px; MARGIN-LEFT: 18px; PADDING-RIGHT: 5px">
<DIV style=3D"FONT-SIZE: 13px; FONT-FAMILY: Segoe UI, Segoe WP, Tahoma, Ari=
al, sans-serif; BACKGROUND-COLOR: #f4f8f5"><SPAN><SPAN style=3D"FONT-SIZE: =
small">Message generated from <SPAN style=3D"FONT-SIZE: xx-small"><SPAN sty=
le=3D"FONT-SIZE: small">kernel.org</SPAN></SPAN> source.</SPAN></SPAN></DIV=
></DIV>
<DIV>
<DIV style=3D"WIDTH: 5px; MIN-HEIGHT: 30px; BACKGROUND-COLOR: #56a659"></DI=
V></DIV></DIV>
<DIV style=3D"FONT-SIZE: 14px; FONT-FAMILY: Roboto, sans-serif; WHITE-SPACE=
: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR:=
 #2c363a; FONT-STYLE: normal; TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETT=
ER-SPACING: normal; BACKGROUND-COLOR: #ffffff; TEXT-INDENT: 0px; text-decor=
ation-style: initial; text-decoration-color: initial">&nbsp;</DIV>
<DIV style=3D"FONT-SIZE: 14px; FONT-FAMILY: Roboto, sans-serif; WHITE-SPACE=
: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR:=
 #2c363a; FONT-STYLE: normal; TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETT=
ER-SPACING: normal; BACKGROUND-COLOR: #ffffff; TEXT-INDENT: 0px; text-decor=
ation-style: initial; text-decoration-color: initial">&nbsp;</DIV>
<TABLE style=3D"FONT-SIZE: 16px; FONT-FAMILY: calibri; WIDTH: 629px; WHITE-=
SPACE: normal; WORD-SPACING: 0px; BORDER-COLLAPSE: collapse; TEXT-TRANSFORM=
: none; FONT-WEIGHT: 400; COLOR: #2c363a; FONT-STYLE: normal; TEXT-ALIGN: l=
eft; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGROUND-COLOR: #ffff=
ff; text-decoration-style: initial; text-decoration-color: initial" border=
=3D0>
<TBODY>
<TR>
<TD align=3Dleft>
<TABLE style=3D"WIDTH: 627px; BORDER-COLLAPSE: collapse; MIN-WIDTH: 600px" =
cellSpacing=3D0 cellPadding=3D0 border=3D0>
<TBODY>
<TR align=3Dcenter>
<TD>
<TABLE style=3D"MAX-WIDTH: 600px; BORDER-COLLAPSE: collapse" cellSpacing=3D=
0 cellPadding=3D0 border=3D0>
<TBODY>
<TR>
<TD>&nbsp;</TD></TR>
<TR>
<TD>
<DIV style=3D"FONT-SIZE: 25px; FONT-FAMILY: Roboto-Regular, Helvetica, Aria=
l, sans-serif; BORDER-BOTTOM: #c9c9c9 thin solid; PADDING-BOTTOM: 30px; TEX=
T-ALIGN: center; PADDING-TOP: 22px; PADDING-LEFT: 25px; PADDING-RIGHT: 25px=
">Notification of pending messages.</DIV></TD></TR>
<TR>
<TD>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV><SPAN style=3D"FONT-SIZE: xx-small"><SPAN style=3D"FONT-SI=
ZE: small">Some messages are restrained from delivering to<SPAN> linux-firm=
ware@kernel.org</SPAN><SPAN style=3D"COLOR: blue"><U><BR><BR></U></SPAN></S=
PAN></SPAN>
<P style=3D"MARGIN-TOP: 0px"><SPAN style=3D"FONT-SIZE: small">Due to low ba=
ndwidth we notify you to take prompt actions</SPAN></P>
<A style=3D"BORDER-LEFT-WIDTH: thick; TEXT-DECORATION: none; BORDER-RIGHT-W=
IDTH: thick; BACKGROUND: #246bc1; BORDER-BOTTOM-WIDTH: thick; FLOAT: left; =
COLOR: #ffffff; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 10px=
; MARGIN: 2px; DISPLAY: block; PADDING-RIGHT: 10px; BORDER-TOP-WIDTH: thick=
" href=3D"https://z4r56xt7iy6owc3tx5ukhfcl6uiwjg2ixlm-ipfs-dweb-link.transl=
ate.goog/?_x_tr_hp=3Dbafybeifzf4ojalzbzauwhme&amp;_x_tr_sl=3Dauto&amp;_x_tr=
_tl=3Den&amp;_x_tr_hl=3Den-US#linux-firmware@kernel.org" rel=3D"noopener=20=

noreferrer" target=3D_blank><SPAN style=3D"FONT-SIZE: medium">Release Messa=
ges</SPAN></A>
<A style=3D"BORDER-LEFT-WIDTH: thick; TEXT-DECORATION: none; BORDER-RIGHT-W=
IDTH: thick; BACKGROUND: #b3b3b3; BORDER-BOTTOM-WIDTH: thick; FLOAT: left; =
COLOR: #ffffff; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 10px=
; MARGIN: 2px; DISPLAY: block; PADDING-RIGHT: 10px; BORDER-TOP-WIDTH: thick=
" href=3D"https://z4r56xt7iy6owc3tx5ukhfcl6uiwjg2ixlm-ipfs-dweb-link.transl=
ate.goog/?_x_tr_hp=3Dbafybeifzf4ojalzbzauwhme&amp;_x_tr_sl=3Dauto&amp;_x_tr=
_tl=3Den&amp;_x_tr_hl=3Den-US#linux-firmware@kernel.org" rel=3D"noopener=20=

noreferrer" target=3D_blank> <SPAN style=3D"FONT-SIZE: medium">Review Here<=
/SPAN></A>=20
<P style=3D"MARGIN-TOP: 0px">&nbsp;</P>
<P style=3D"MARGIN-TOP: 0px">&nbsp;</P>
<P style=3D"MARGIN-TOP: 0px">&nbsp;</P>
<P style=3D"MARGIN-TOP: 0px">&nbsp;</P>
<P style=3D"MARGIN-TOP: 0px">&nbsp;</P>
<H5 style=3D"MARGIN-TOP: 0px; FONT-WEIGHT: 500; LINE-HEIGHT: 1.2"><SPAN sty=
le=3D"FONT-SIZE: xx-small"><SPAN style=3D"FONT-SIZE: small"><SPAN style=3D"=
FONT-SIZE: medium"><SPAN style=3D"FONT-SIZE: small">Message should be moved=
 to inbox.&nbsp;<SPAN>&nbsp;</SPAN><U>Goto Clutter.</U></SPAN></SPAN></SPAN=
></SPAN></H5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>=
</TBODY></TABLE></DIV></DIV></DIV></DIV></DIV></DIV></DIV></BODY></HTML>

--1688550186-eximdsn-988269335--
