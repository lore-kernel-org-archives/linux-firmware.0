Return-Path: <SRS0=8LUo=SD=opensource.cirrus.com=prvs=8042f86517=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F167CD5C0E5
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Nov 2024 14:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0A5FC4CECF; Fri,  8 Nov 2024 14:58:46 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28D80C4CECD
	for <linux-firmware@kernel.org>; Fri,  8 Nov 2024 14:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28D80C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A84hXlQ008900
	for <linux-firmware@kernel.org>; Fri, 8 Nov 2024 08:58:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=Zr3xWQMft63XIEuVVPkD0YiPNJuczfCiQFsW+jxZfMU=; b=
	B4AtKSXiH5Wz0eBmHjNSuBDjf+ACYM8NKHzlviTZaDoqVMzeHjJ3GQ2aPTITRZHg
	cVFQLGw5oeCWJ7ocs4fc2D76Wbnfxs3pzleS7OqjuBSZwNpnhjYuT40WO8WIcw6n
	AH4UROAUwzimCsj/9DdSyzs4umF1JaXBl+KhoEbZEPHm3sxlRBgMjIuksXFTeWBG
	ezHoB4RIza+FzmrL1cij2Yl5wohVbppUAMMxP5twVGnqtEhj9GQPTT+72T4aIsOF
	YAsI6Q0snnQL8C3CfWNX2Ydqlg2JxMc2IG02k2HSX1TUvcUQQjYDeINKNYcRO+aU
	C4E47xKMsQv0PtVjdezbzQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 42s6f20rmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 08 Nov 2024 08:58:38 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 8 Nov 2024
 14:58:35 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 8 Nov 2024 14:58:35 +0000
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B3026820241;
	Fri,  8 Nov 2024 14:58:35 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Update firmware for Cirrus Amps for some Dell laptops
Date: Fri, 8 Nov 2024 14:58:35 +0000
Message-ID: <002301db31ee$afbfed50$0f3fc7f0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0024_01DB31EE.AFC0B0A0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Adsx7cieXl8PPZxcRhmKYWJbNc+oGw==
X-Proofpoint-GUID: VovjIb06u2atntPFq0152b3G9jZaDJek
X-Proofpoint-ORIG-GUID: VovjIb06u2atntPFq0152b3G9jZaDJek
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0024_01DB31EE.AFC0B0A0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to update the firmware for the Cirrus CS35L56 smart amplifier for
some Dell Laptops.

Thanks,

-Simon

 

The following changes since commit 3bbb13a78b3defc5cfca702114108f0bd7fcf542:

 

  Merge branch 'amd-staging' into 'main' (2024-11-08 14:14:44 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241108

 

for you to fetch changes up to 1486d9aa55fd5efea6e242eb993181fdeca43f5e:

 

  cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell laptops
(2024-11-08 14:49:01 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell
laptops

 

WHENCE                                               |  25
+++++++++++++++++++++++++

cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampl.bin | Bin 0 -> 11612 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampr.bin | Bin 0 -> 11612 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampl.bin | Bin 0 -> 11616 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampr.bin | Bin 0 -> 11616 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampl.bin | Bin 0 -> 11612 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampr.bin | Bin 0 -> 11612 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampl.bin | Bin 0 -> 11616 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampr.bin | Bin 0 -> 11616 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampl.bin | Bin 0 -> 11620 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampr.bin | Bin 0 -> 11620 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampl.bin | Bin 0 -> 11620 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampr.bin | Bin 0 -> 11620 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampl.bin | Bin 0 -> 11620 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampr.bin | Bin 0 -> 11620 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin | Bin 0 -> 11624 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin | Bin 0 -> 11624 bytes

cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw               | Bin 0 -> 34596 bytes

18 files changed, 25 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw

 


------=_NextPart_000_0024_01DB31EE.AFC0B0A0
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
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
CS35L56 smart amplifier for some Dell Laptops.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>The =
following changes since commit =
3bbb13a78b3defc5cfca702114108f0bd7fcf542:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; Merge =
branch 'amd-staging' into 'main' (2024-11-08 14:14:44 =
+0000)<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>are available in the Git repository =
at:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> cs35l56-20241108<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>for you to =
fetch changes up to =
1486d9aa55fd5efea6e242eb993181fdeca43f5e:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell =
laptops (2024-11-08 14:49:01 +0000)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>-------------------------------------------------------=
---------<o:p></o:p></p><p class=3DMsoNormal>Simon Trimmer =
(1):<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell =
laptops<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
25 +++++++++++++++++++++++++<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampl.bin | Bin 0 -&gt; 11612 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampr.bin | Bin 0 -&gt; 11612 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampl.bin | Bin 0 -&gt; 11616 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampr.bin | Bin 0 -&gt; 11616 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampl.bin | Bin 0 -&gt; 11612 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampr.bin | Bin 0 -&gt; 11612 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampl.bin | Bin 0 -&gt; 11616 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampr.bin | Bin 0 -&gt; 11616 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampl.bin | Bin 0 -&gt; 11620 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampr.bin | Bin 0 -&gt; 11620 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampl.bin | Bin 0 -&gt; 11620 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampr.bin | Bin 0 -&gt; 11620 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampl.bin | Bin 0 -&gt; 11620 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampr.bin | Bin 0 -&gt; 11620 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin | Bin 0 -&gt; 11624 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin | Bin 0 -&gt; 11624 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 34596 =
bytes<o:p></o:p></p><p class=3DMsoNormal> 18 files changed, 25 =
insertions(+)<o:p></o:p></p><p class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid0-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid1-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid2-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce3-spkid3-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid0-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid1-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid2-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce4-spkid3-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.11.25.wmfw<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0024_01DB31EE.AFC0B0A0--
