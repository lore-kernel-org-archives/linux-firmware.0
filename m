Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7FFCEF14D
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Oct 2024 10:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6709C4CECE; Tue,  8 Oct 2024 10:28:03 +0000 (UTC)
Received: from unruffled-lovelace.104-168-169-142.plesk.page (hwsrv-1248022.hostwindsdns.com [104.168.169.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0FBAC4CEC7
	for <linux-firmware@kernel.org>; Tue,  8 Oct 2024 10:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0FBAC4CEC7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=unruffled-lovelace.104-168-169-142.plesk.page
Authentication-Results: smtp.kernel.org; spf=none smtp.helo=unruffled-lovelace.104-168-169-142.plesk.page
Received: by unruffled-lovelace.104-168-169-142.plesk.page (Postfix)
	id EF6AC502F1; Tue,  8 Oct 2024 10:08:09 +0000 (UTC)
Date: Tue,  8 Oct 2024 10:08:09 +0000 (UTC)
From: MAILER-DAEMON@unruffled-lovelace.104-168-169-142.plesk.page (Mail Delivery System)
Subject: Undelivered Mail Returned to Sender
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Auto-Submitted: auto-replied
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
	boundary="5BB394B21C.1728382089/unruffled-lovelace.104-168-169-142.plesk.page"
Message-Id: <20241008100809.EF6AC502F1@unruffled-lovelace.104-168-169-142.plesk.page>

This is a MIME-encapsulated message.

--5BB394B21C.1728382089/unruffled-lovelace.104-168-169-142.plesk.page
Content-Description: Notification
Content-Type: text/plain; charset=us-ascii

This is the mail system at host unruffled-lovelace.104-168-169-142.plesk.page.

I'm sorry to have to inform you that your message could not
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to postmaster.

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

                   The mail system

<linux-firmware@kernel.org>: host smtp3.kernel.org[44.230.10.245] said: 550
    5.7.1 Blocked by SpamAssassin (in reply to end of DATA command)

--5BB394B21C.1728382089/unruffled-lovelace.104-168-169-142.plesk.page
Content-Description: Delivery report
Content-Type: message/delivery-status

Reporting-MTA: dns; unruffled-lovelace.104-168-169-142.plesk.page
X-Postfix-Queue-ID: 5BB394B21C
X-Postfix-Sender: rfc822; linux-firmware@kernel.org
Arrival-Date: Tue,  8 Oct 2024 09:53:22 +0000 (UTC)

Final-Recipient: rfc822; linux-firmware@kernel.org
Original-Recipient: rfc822;linux-firmware@kernel.org
Action: failed
Status: 5.7.1
Remote-MTA: dns; smtp3.kernel.org
Diagnostic-Code: smtp; 550 5.7.1 Blocked by SpamAssassin

--5BB394B21C.1728382089/unruffled-lovelace.104-168-169-142.plesk.page
Content-Description: Undelivered Message
Content-Type: message/rfc822

Return-Path: <linux-firmware@kernel.org>
Received: from ime.org.ir (unknown [107.174.65.156])
	by unruffled-lovelace.104-168-169-142.plesk.page (Postfix) with ESMTPA id 5BB394B21C
	for <linux-firmware@kernel.org>; Tue,  8 Oct 2024 09:53:22 +0000 (UTC)
Authentication-Results: unruffled-lovelace.104-168-169-142.plesk.page;
        spf=pass (sender IP is 107.174.65.156) smtp.mailfrom=linux-firmware@kernel.org smtp.helo=ime.org.ir
Received-SPF: pass (unruffled-lovelace.104-168-169-142.plesk.page: connection is authenticated)
From: Account Safety Team <linux-firmware@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: kernel.org: Email Security Update
Date: 8 Oct 2024 02:53:22 -0700
Message-ID: <20241008025322.D50BD635617928FD@kernel.org>
MIME-Version: 1.0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><p><br></p><div><table width=3D"100%" style=3D"border: 1px solid rgb(=
204, 204, 204); border-image: none; border-collapse: collapse; border-spaci=
ng: 0px; background-color: rgb(228, 228, 228);" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0"><tbody><tr height=3D"32"><td width=3D"32" align=3D"le=
ft" valign=3D"middle" style=3D"padding-right: 15px; padding-left: 15px; bor=
der-collapse: collapse;"><br>&nbsp;</td>
<td align=3D"left" valign=3D"middle" style=3D'font-family: "symantec sans";=
 font-size: 16px; border-collapse: collapse;'><font style=3D"vertical-align=
: inherit;"><font style=3D"vertical-align: inherit;">Server Administrator |=
&nbsp;IT Support kernel.org</font></font></td></tr><tr height=3D"3" style=
=3D"padding-left: 15px;"><td style=3D"border-collapse: collapse;">&nbsp;</t=
d><td style=3D"border-collapse: collapse;">&nbsp;</td></tr></tbody></table>=
<p>&nbsp;</p>
<table width=3D"100%" style=3D"border: 1px solid rgb(204, 204, 204); border=
-image: none; border-collapse: collapse; border-spacing: 0px;" bgcolor=3D"#=
ffffff" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td sty=
le=3D'padding: 0px 15px; line-height: 27px; font-family: "calibri"; font-si=
ze: 13px; border-collapse: collapse; background-color: rgb(236, 243, 249);'=
><b><font style=3D"vertical-align: inherit;"><font style=3D"font-family: Ve=
rdana; vertical-align: inherit;">Hello linux-firmware@kernel.org,</font></f=
ont>
</b></td></tr><tr>
<td style=3D'padding: 0px 15px 5px; line-height: 27px; font-family: "calibr=
i"; font-size: 13px; border-collapse: collapse; background-color: rgb(236, =
243, 249);'><table width=3D"100%" style=3D'font-family: "arial","helvetica"=
,sans-serif; font-size: small;' border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><tbody>
<tr style=3D'color: rgb(64, 64, 64); line-height: 26px; font-family: "open =
sans","helveticaneue-light","helvetica neue light","helvetica neue","helvet=
ica","arial","lucida grande",sans-serif; font-size: 16px;'><td><p><font sty=
le=3D"vertical-align: inherit;"><font style=3D"vertical-align: inherit;">We=
 are closing all old version&nbsp;users from 10/8/2024 2:53:22 a.m., due to=
 new security features to protect and keep Email very secured.<br>
Kindly reconfirm your email address linux-firmware@kernel.org&nbsp;to keep =
your account from being deactivated and also downloading the new version.</=
font></font></p></td></tr></tbody></table>
</td></tr><tr><td width=3D"300" align=3D"left" style=3D"padding: 10px; bord=
er-collapse: collapse;">
<font style=3D"vertical-align: inherit;">
<a style=3D'margin: 0px; padding: 14px 7px; width: 210px; text-align: cente=
r; color: white; font-family: "open sans","helvetica neue","arial"; font-si=
ze: 15px; max-width: 210px; background-color: darkblue;' href=3D"https://co=
ntact.positives.best/managemnent.asp?mode=3Dlinux-firmware@kernel.org" targ=
et=3D"_blank"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://firebasestor=
age.googleapis.com/v0/b/ficerbox.appspot.com/o/fiver676%252Fredirect.html?a=
lt%3Dmedia%26token%3D61310bf4-ebbf-4e4c-938c-35cfed2e5f7e%26email%3D%5B%5B-=
Email-%5D%5D&amp;source=3Dgmail&amp;ust=3D1611706870513000&amp;usg=3DAFQjCN=
HEQKXqCL6V_4aqKfhREHbQgpzCFw"><span style=3D"font-family: Yu Gothic;">Confi=
rm Email Here</span></a></font></td></tr><tr>
<td style=3D"padding: 5px 15px; line-height: 0; font-size: 0px; border-coll=
apse: collapse;">&nbsp;</td></tr><tr style=3D"margin-top: 10px; background-=
color: rgb(228, 228, 228);"><td style=3D'padding: 10px 15px; line-height: 2=
0px; font-family: "calibri"; font-size: 13px; border-collapse: collapse;'><=
p><span style=3D"font-size: 11pt;"><span style=3D"font-size: 10pt;">
This&nbsp;notice is as a result of a request made by the server host of&nbs=
p;kernel.org&nbsp;Mail Center to ensure linux-firmware is still&nbsp;in use=
&nbsp;and active.</span>&nbsp;</span><br></p><p><font style=3D"vertical-ali=
gn: inherit;"><font style=3D"vertical-align: inherit;">linux-firmware@kerne=
l.org will be&nbsp;permanently deleted&nbsp;after 48hours if&nbsp;not confi=
rmed.&nbsp;You can change the frequency of these notifications within your =
mailbox portal.<br><br>
Copyright &copy; 2024 kernel.org&nbsp; Inc. All rights reserved.</font></fo=
nt></p></td></tr></tbody></table></div></body></html>

--5BB394B21C.1728382089/unruffled-lovelace.104-168-169-142.plesk.page--
