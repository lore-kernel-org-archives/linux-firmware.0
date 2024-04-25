Return-Path: <SRS0=fuLA=L6=opensource.cirrus.com=prvs=1845b4f7d7=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AE7C4345F
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Apr 2024 13:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CA2AC113CE; Thu, 25 Apr 2024 13:25:42 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 062ACC113CC
	for <linux-firmware@kernel.org>; Thu, 25 Apr 2024 13:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 062ACC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P4iNpQ012824
	for <linux-firmware@kernel.org>; Thu, 25 Apr 2024 08:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	PODMain02222019; bh=3EPm945B/b/BO5bP7MSHmhpWQnaYcQGUrIf3/QcFN3g=; b=
	CziVTHFLsweQKS0EGH7O71SbS49sbH9NAiaprClM2KEasEjH1LqS8c4yoZykdd6O
	ZpvCKanFLNBvI3nYkuqjvkMcSff4WJUtpsHHZ3/C8nkAotbjEb2lfC06XVrwbV5u
	8IRgz384OZkgj5Nq87riEH4mScbkXamF8mMPxqoZNSAYhXe40WSzNiL4gcEecfUn
	QKVHiepXaRvsY4CgX1teGbBzpRoUTtb0JLr5shLvUy8klc0uKkWRTBzw6Yz500y3
	bC5sED7hvJ17lxgcAknFpsDl4EnVMM2JUpqDSpuZFsZyGfw7THBEv63KA8/T4Y6x
	YbWhRFgrrk/3VgBpasRHSQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xmqmh5f9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 25 Apr 2024 08:25:33 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 14:25:32 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 25 Apr 2024 14:25:32 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.200.117])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E780782025A;
	Thu, 25 Apr 2024 13:25:31 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add CS35L56 firmware for HP laptops
Date: Thu, 25 Apr 2024 14:25:31 +0100
Message-ID: <001001da9714$0c2d81e0$248885a0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0011_01DA971C.6DF1E9E0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdqXE8l9OiCoqPa1TQ24jMtHCpsUNQ==
Content-Language: en-gb
X-Proofpoint-ORIG-GUID: g4wQAhSLOC1PkTR4LSexRF_EJFvUGIoW
X-Proofpoint-GUID: g4wQAhSLOC1PkTR4LSexRF_EJFvUGIoW
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0011_01DA971C.6DF1E9E0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We would like to add firmware files to support Cirrus Logic Smart Amp

CS35L56 for some HP laptops.

 

Thanks,

-Simon

 

The following changes since commit 63a66b66576fa0c43d8e1b757bb79165e1be393a:

 

  Merge branch 'robot/pr-0-1713990671' into 'main' (2024-04-24 22:51:31
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56

 

for you to fetch changes up to 09c1846d416e2fccd293bc77dfb989c9c6ea4ea1:

 

  linux-firmware: Add firmware for Cirrus CS35L56 for various HP laptops
(2024-04-25 11:54:09 +0100)

 

----------------------------------------------------------------

Simon Trimmer (1):

      linux-firmware: Add firmware for Cirrus CS35L56 for various HP laptops

 

WHENCE                                        |  11 +++++++++++

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin | Bin 0 -> 8136 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin | Bin 0 -> 8132 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin | Bin 0 -> 8124 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp4.bin | Bin 0 -> 8124 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp1.bin | Bin 0 -> 8132 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin | Bin 0 -> 8128 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin | Bin 0 -> 8120 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin | Bin 0 -> 8120 bytes

cirrus/cs35l56/CS35L56_Rev3.11.16.wmfw        | Bin 0 -> 31996 bytes

10 files changed, 11 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.16.wmfw


------=_NextPart_000_0011_01DA971C.6DF1E9E0
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
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
class=3DWordSection1><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>We would =
like to add firmware files to support Cirrus Logic Smart =
Amp<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>CS35L56 for =
some HP laptops.<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;<o:p></=
o:p></span></p><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>Thanks,<o:p><=
/o:p></span></p><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>-Simon<o:p></=
o:p></span></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>The following changes since commit =
63a66b66576fa0c43d8e1b757bb79165e1be393a:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; Merge =
branch 'robot/pr-0-1713990671' into 'main' (2024-04-24 22:51:31 =
+0000)<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>are available in the Git repository =
at:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp; https://github.com/CirrusLogic/linux-firmware/ =
cs35l56<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>for you to fetch changes up to =
09c1846d416e2fccd293bc77dfb989c9c6ea4ea1:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
linux-firmware: Add firmware for Cirrus CS35L56 for various HP laptops =
(2024-04-25 11:54:09 +0100)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>-------------------------------------------------------=
---------<o:p></o:p></p><p class=3DMsoNormal>Simon Trimmer =
(1):<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
linux-firmware: Add firmware for Cirrus CS35L56 for various HP =
laptops<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 11 +++++++++++<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin | Bin 0 =
-&gt; 8136 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin | Bin 0 -&gt; 8132 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin | Bin 0 -&gt; 8124 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp4.bin | Bin 0 -&gt; 8124 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp1.bin | Bin 0 -&gt; 8132 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin | Bin 0 -&gt; 8128 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin | Bin 0 -&gt; 8120 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin | Bin 0 -&gt; 8120 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56/CS35L56_Rev3.11.16.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; | Bin 0 -&gt; 31996 bytes<o:p></o:p></p><p class=3DMsoNormal> 10 =
files changed, 11 insertions(+)<o:p></o:p></p><p class=3DMsoNormal> =
create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.11.16.wmfw<o:p></o:p></p></div></body></html>
------=_NextPart_000_0011_01DA971C.6DF1E9E0--
