Return-Path: <SRS0=uHQ0=42=tutanota.com=laufer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CD8C10F25
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Mar 2020 05:27:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7836B20828; Mon,  9 Mar 2020 05:27:25 +0000 (UTC)
X-Greylist: delayed 451 seconds by postgrey-1.34 at mail.kernel.org; Mon, 09 Mar 2020 05:27:24 UTC
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com header.b="rSIsuCWP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43A6720728
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutanota.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=laufer@tutanota.com
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A6720728
	for <linux-firmware@kernel.org>; Mon,  9 Mar 2020 05:27:24 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
	by w1.tutanota.de (Postfix) with ESMTP id 05CDAFBF321
	for <linux-firmware@kernel.org>; Mon,  9 Mar 2020 05:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1583731190;
	s=s1; d=tutanota.com;
	h=From:To:Subject:Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:In-Reply-To:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:References:Resent-Message-ID:Resent-From:Sender:from;
	bh=QqtAQZKslAekEtucvD7m8W1YrTHqIE8oDFn5107AQdM=;
	b=rSIsuCWPA/1Dw8xcROpvHHzV6bvIc/s5U5s85C9YLvHyOBzVLf0v9jenGWJA/Uk+
	6LL1PfZRwBl4rDM3zBR4znDN/K9lFApZyzXLn7QM6Xwt2Nlup8As6vK9vJl/do1ItzR
	u1jQo5UHFjwC4AFBud1vIEeSjmggtUgWXhZo1GhR1X3v+O5JCbYtg9lEN1V8A4mrnGL
	tBAD/QmQP1DACosMUgK5E+uK62MUq77JHb9G+PfvaH+rPr8ayKeH6i4SSSRaqD7mhf7
	GchePHOJCh0rJwRYdB1x6eY4F2DPLiHx+/ML1UluwupmoHDqbL3EbKE0ebKUiPNPIHF
	EdpCc6rdNw==
Date: Mon, 9 Mar 2020 06:19:50 +0100 (CET)
From: =?UTF-8?Q?Zdzis=C5=82aw_Dyrma?= <laufer@tutanota.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Message-ID: <M1xj1ID--3-2@tutanota.com>
Subject: Problem installing firmware please help me but I  got stuck:(
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_127473_1117618750.1583731191013"

------=_Part_127473_1117618750.1583731191013
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Welcome!
I think I stood in the place for good and I don't know which way to go ... =
please help ... :(
I had / have a problem with Possible missing firmware /lib/firmware/i915/bx=
t_huc_ver01_8_2893.bin for module i915 (and 4 more)
I found your firmware fixes here
https://github.com/wkennington/linux-firmware
I downloaded the complete linux-firmware folder but I have no idea how to i=
nstall it ... :(

messiah @ matrix: ~ $ sudo apt install --reinstall linux-firmware
[sudo] password for user messiah:
Reading package lists ... Done
Building a dependency tree
Reading status information ... Ready
E: Could not find linux-firmware package
Messiah matrix @: ~ $

? There is a general massacre ....

I will be grateful to you for showing me the direction to go

Thank you in advance :)
Pozdrawiam!
Zdzis=C5=82aw Dyrma. Zasadniczo...

------=_Part_127473_1117618750.1583731191013
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
<div>Welcome!<br></div><div>I think I stood in the place for good and I don=
't know which way to go ... please help ... :(<br></div><div>I had / have a=
 problem with Possible missing firmware /lib/firmware/i915/bxt_huc_ver01_8_=
2893.bin for module i915 (and 4 more)<br></div><div>I found your firmware f=
ixes here<br></div><div><a href=3D"https://github.com/wkennington/linux-fir=
mware">https://github.com/wkennington/linux-firmware</a><br></div><div>I do=
wnloaded the complete linux-firmware folder but I have no idea how to insta=
ll it ... :(<br></div><div><br></div><div>messiah @ matrix: ~ $ sudo apt in=
stall --reinstall linux-firmware<br></div><div>[sudo] password for user mes=
siah:<br></div><div>Reading package lists ... Done<br></div><div>Building a=
 dependency tree<br></div><div>Reading status information ... Ready<br></di=
v><div>E: Could not find linux-firmware package<br></div><div>Messiah matri=
x @: ~ $<br></div><div><br></div><div>? There is a general massacre ....<br=
></div><div><br></div><div>I will be grateful to you for showing me the dir=
ection to go<br></div><div><br></div><div>Thank you in advance :)<br></div>=
<div>Pozdrawiam!<br></div><div>Zdzis=C5=82aw Dyrma. Zasadniczo...<br></div>=
  </body>
</html>

------=_Part_127473_1117618750.1583731191013--
