Return-Path: <SRS0=PFwB=NP=opensource.cirrus.com=prvs=38942f2995=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD872C27C4F
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Jun 2024 09:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81D16C2BBFC; Thu, 13 Jun 2024 09:15:56 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51274C4AF1A
	for <linux-firmware@kernel.org>; Thu, 13 Jun 2024 09:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51274C4AF1A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D4sfYO018676
	for <linux-firmware@kernel.org>; Thu, 13 Jun 2024 04:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=J6zxzv7I8QP7BzV0inGyAg7/Dgw9ZjoSUuEjyyvfsfg=; b=
	HdVZE0zA/svmMKikAgTFK48GE0V2MtGZL5dsB5QsjW3IeUfcjNxqviHmoax6Ao+u
	Yv2qPY1xRuYQuTT7QuqljhkjrFuFmkXpk0231/9rM/ClCCDqFuIRNJCuMazgtB1x
	8kF1gS3nWJ2xzGAEog1+yO0bwwF56Axk3EhrlxUD90Is5ZEWLqRIjt+pZ1eEXeUT
	PqjGUW4uAIENISPooRo8i8TlNEUVsg0ez69pnlOcgp4bH3SOigdcGqbWlfsd0Pzv
	LdQTIMKc/l4WEdWt9GwrZlZNHFBnKU4yXiE2peH+xbdPWoZCIrXLgHLBTibdLbRP
	NCEbbRaR5XpPTrHoolMlWA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yqb8eh44g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Jun 2024 04:15:47 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 10:15:46 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 13 Jun 2024 10:15:46 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.65.41])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D6308820248;
	Thu, 13 Jun 2024 09:15:45 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Update firmware for Cirrus CS35L56 for ASUS UM5606 laptop
Date: Thu, 13 Jun 2024 10:15:45 +0100
Message-ID: <00e701dabd72$46058820$d2109860$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00E8_01DABD7A.A7CB0190"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Adq9cjEfViAbSFYpQPukzs+K5EoEPg==
X-Proofpoint-ORIG-GUID: 7heOzlrSDqbBC86GLY4deuzgRtbaKRb8
X-Proofpoint-GUID: 7heOzlrSDqbBC86GLY4deuzgRtbaKRb8
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_00E8_01DABD7A.A7CB0190
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to update the firmware for the Cirrus CS35L56 smart amplifiers on
another ASUS laptop,

this is for the UM5606.

Thanks,

-Simon

 

The following changes since commit 776320a95269f47ed32369821d7daaffbdbbdbba:

 

  Merge branch 'robot/pr-0-1718209490' into 'main' (2024-06-12 16:26:33
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20240613

 

for you to fetch changes up to e857ce35e94f114d049f44b43835bbcd8773ed52:

 

  cirrus: cs35l56: Update firmware for Cirrus CS35L56 for ASUS UM5606 laptop
(2024-06-13 09:12:51 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Update firmware for Cirrus CS35L56 for ASUS UM5606
laptop

 

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin | Bin 7812 -> 7896 bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin | Bin 7816 -> 7900 bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin | Bin 7812 -> 7896 bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin | Bin 7808 -> 7896 bytes

4 files changed, 0 insertions(+), 0 deletions(-)


------=_NextPart_000_00E8_01DABD7A.A7CB0190
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#467886" vlink=3D"#96607D" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-GB>Hi,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>We&#8217;d like to update the firmware for the Cirrus =
CS35L56 smart amplifiers on another ASUS laptop,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>this is for the =
UM5606.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Thanks,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>-Simon<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>The following changes since commit =
776320a95269f47ed32369821d7daaffbdbbdbba:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; Merge branch =
'robot/pr-0-1718209490' into 'main' (2024-06-12 16:26:33 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>are available in the Git repository =
at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> =
cs35l56-20240613<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>for you to fetch changes up to =
e857ce35e94f114d049f44b43835bbcd8773ed52:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; cirrus: cs35l56: Update =
firmware for Cirrus CS35L56 for ASUS UM5606 laptop (2024-06-13 09:12:51 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>------------------------------------------------------------=
----<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB>Simon =
Trimmer (1):<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Update =
firmware for Cirrus CS35L56 for ASUS UM5606 =
laptop<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin | Bin 7812 =
-&gt; 7896 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin | Bin 7816 =
-&gt; 7900 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin | Bin 7812 =
-&gt; 7896 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin | Bin 7808 =
-&gt; 7896 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> 4 files changed, 0 insertions(+), 0 =
deletions(-)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_00E8_01DABD7A.A7CB0190--
