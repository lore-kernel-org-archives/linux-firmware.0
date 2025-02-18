Return-Path: <SRS0=rP3r=VJ=opensource.cirrus.com=prvs=11441876ff=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD918C021AD
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Feb 2025 16:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99FFDC4CEE8; Tue, 18 Feb 2025 16:17:25 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAA65C4CEE7
	for <linux-firmware@kernel.org>; Tue, 18 Feb 2025 16:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BAA65C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IDQWqt025435
	for <linux-firmware@kernel.org>; Tue, 18 Feb 2025 10:17:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=kOuScTwqRBx6ZQfMravOcA54S0ehCvi8Bj3381R4Ygk=; b=
	FXVadlAnd50/vT9NowJVtgC5vZkFHLS2Y4YNOMOWCxrj0DjaSfnyVFLrenSv61Mj
	/7RajvuQxu6zcvs76VGQIUMHncpnvCRbXauna3OuqGXF+NpQw0vxpCe5vasLXjXk
	TEX9axUsUphKg9ObSXJX153/bEsOtA/UiUpMMph3mb2bOnnaMV5EKVV/gN82rmy8
	4Tbko+4O3MJpL+CQi8zZuo4QSAxGYQHmRPPakmZtbOSXr9DJfEqkDCslaET9hqBT
	hhtKJM+fjRVGdelX8Mbcckya6QS0Zk2k7zZ07JQM4JPPVWs5fzAqTadWyeeDk6+m
	yfKVZvXArizRiX9QLABglA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44vu3h0dnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Feb 2025 10:17:15 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Feb
 2025 16:17:13 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 16:17:13 +0000
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 52CA982025A;
	Tue, 18 Feb 2025 16:17:13 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Update firmware for Cirrus CS35L56 Amps
Date: Tue, 18 Feb 2025 16:17:13 +0000
Message-ID: <003c01db8220$91ce91c0$b56bb540$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003D_01DB8220.91CFF150"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AduCIDLi/f0DdNbhRySyjM6GW7N0iQ==
X-Proofpoint-GUID: C_PVfAl65Q8eQgkrjswK0-Gg1tX2HUfz
X-Proofpoint-ORIG-GUID: C_PVfAl65Q8eQgkrjswK0-Gg1tX2HUfz
X-Authority-Analysis: v=2.4 cv=SKW4VPvH c=1 sm=1 tr=0 ts=67b4b28b cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=v7td4zDK1-8k_aGP8hsA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=248OjtZRZaCkeOrIfkUA:9 a=yHkr22lfClNEasPc:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_003D_01DB8220.91CFF150
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to update the firmware for the Cirrus CS35L56 smart amplifier.

 

There are four patches today adding and updating support for several

products from Dell, Lenovo, HP and ASUS.

Thanks,

-Simon

 

 

The following changes since commit 4431686f4f45f1bcf0712b896b21413d991f0521:

 

  Merge branch 'en8811h' into 'main' (2025-02-18 13:01:56 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250218

 

for you to fetch changes up to 307af4cea232fd663f6ef9890d90dc4f300d9e7a:

 

  cirrus: cs35l56: Add and update firmware for Cirrus CS35L56 for two HP
laptops (2025-02-18 16:09:05 +0000)

 

----------------------------------------------------------------

Simon Trimmer (4):

      cirrus: cs35l56: Update firmware for Cirrus Amps for some Dell laptops

      cirrus: cs35l56: Add and update firmware for Cirrus CS35L56 for
various Lenovo laptops

      cirrus: cs35l56: Add firmware for Cirrus Amps for some ASUS laptops

      cirrus: cs35l56: Add and update firmware for Cirrus CS35L56 for two HP
laptops

 

WHENCE                                                              |  60
+++++++++++++++++++++++++++++++++++++++++++++++++++---------

cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin                       | Bin
7500 -> 7508 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin                       | Bin
7464 -> 7472 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin                       | Bin
7468 -> 7476 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin                       | Bin
7500 -> 7508 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin                       | Bin 0
-> 7508 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin                       | Bin 0
-> 7472 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin                       | Bin 0
-> 7476 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin                       | Bin 0
-> 7508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin                | Bin
11532 -> 11532 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin                | Bin
11532 -> 11532 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin                | Bin
11532 -> 11528 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin                | Bin
11532 -> 11528 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin                | Bin
11532 -> 11524 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin                | Bin
11532 -> 11524 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin                | Bin
11532 -> 11524 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin                | Bin
11532 -> 11524 bytes

cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin                | Bin 0
-> 8264 bytes

cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin                | Bin 0
-> 8264 bytes

cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin                | Bin 0
-> 8256 bytes

cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin                | Bin 0
-> 8256 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampl.bin                | Bin
8628 -> 8580 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampr.bin                | Bin
8628 -> 8584 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin                | Bin 0
-> 6772 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin                | Bin 0
-> 6776 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin                | Bin 0
-> 6768 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin                | Bin 0
-> 6772 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin                       | Bin
7456 -> 7840 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin                       | Bin
7456 -> 7840 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp1.bin                       | Bin 0
-> 6680 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp2.bin                       | Bin 0
-> 6680 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp1.bin                | Bin 0
-> 6684 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp2.bin                | Bin 0
-> 6684 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp1.bin                | Bin 0
-> 6684 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp2.bin                | Bin 0
-> 6684 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp1.bin                | Bin 0
-> 6708 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp2.bin                | Bin 0
-> 6708 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin                | Bin 0
-> 6688 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp2.bin                | Bin 0
-> 6688 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin                | Bin 0
-> 8348 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin                | Bin 0
-> 8348 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin                | Bin 0
-> 6200 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin                | Bin 0
-> 6200 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin                | Bin 0
-> 6212 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin                | Bin 0
-> 6212 bytes

cirrus/cs35l56/{CS35L56_Rev3.11.27.wmfw => CS35L56_Rev3.11.21.wmfw} | Bin
34964 -> 33364 bytes

46 files changed, 51 insertions(+), 9 deletions(-)

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin

rename cirrus/cs35l56/{CS35L56_Rev3.11.27.wmfw => CS35L56_Rev3.11.21.wmfw}
(52%)

 


------=_NextPart_000_003D_01DB8220.91CFF150
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
class=3DWordSection1><p class=3DMsoNormal>Hi,<o:p></o:p></p><p =
class=3DMsoNormal>We&#8217;d like to update the firmware for the Cirrus =
CS35L56 smart amplifier.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>There are =
four patches today adding and updating support for =
several<o:p></o:p></p><p class=3DMsoNormal>products from Dell, Lenovo, =
HP and ASUS.<o:p></o:p></p><p class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>-Simon<o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>The following changes since commit =
4431686f4f45f1bcf0712b896b21413d991f0521:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; Merge branch 'en8811h' into =
'main' (2025-02-18 13:01:56 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>are available in the Git repository =
at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> =
cs35l56-20250218<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>for you to fetch changes up to =
307af4cea232fd663f6ef9890d90dc4f300d9e7a:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; cirrus: cs35l56: Add and =
update firmware for Cirrus CS35L56 for two HP laptops (2025-02-18 =
16:09:05 +0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>------------------------------------------------------------=
----<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB>Simon =
Trimmer (4):<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Update =
firmware for Cirrus Amps for some Dell laptops<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l56: Add and update firmware for Cirrus CS35L56 for various =
Lenovo laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Add =
firmware for Cirrus Amps for some ASUS laptops<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l56: Add and update firmware for Cirrus CS35L56 for two HP =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; 60 =
+++++++++++++++++++++++++++++++++++++++++++++++++++---------<o:p></o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 7500 -&gt; 7508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 7464 -&gt; 7472 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 7468 -&gt; 7476 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 7500 -&gt; 7508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 7508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 7472 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 7476 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 7508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 11532 -&gt; 11532 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 11532 -&gt; 11532 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 11532 -&gt; 11528 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 11532 -&gt; 11528 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 11532 -&gt; 11524 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 11532 -&gt; 11524 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 11532 -&gt; 11524 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 11532 -&gt; 11524 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 8264 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 8264 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 8256 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 8256 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampl.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 8628 -&gt; 8580 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampr.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 8628 -&gt; 8584 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6772 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6776 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6768 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6772 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 7456 -&gt; 7840 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 7456 -&gt; 7840 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 6680 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 6680 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6684 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6684 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6684 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6684 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6708 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6708 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6688 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6688 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 8348 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 8348 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6200 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6200 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6212 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
Bin 0 -&gt; 6212 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56/{CS35L56_Rev3.11.27.wmfw =3D&gt; =
CS35L56_Rev3.11.21.wmfw} | Bin 34964 -&gt; 33364 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> 46 =
files changed, 51 insertions(+), 9 deletions(-)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> rename =
cirrus/cs35l56/{CS35L56_Rev3.11.27.wmfw =3D&gt; CS35L56_Rev3.11.21.wmfw} =
(52%)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_000_003D_01DB8220.91CFF150--
