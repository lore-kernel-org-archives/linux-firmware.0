Return-Path: <SRS0=5boO=UC=opensource.cirrus.com=prvs=0105d01c48=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB501E77188
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Jan 2025 16:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8981BC4CEE2; Fri, 10 Jan 2025 16:32:36 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CADAC4CEE1
	for <linux-firmware@kernel.org>; Fri, 10 Jan 2025 16:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CADAC4CEE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A6aUbi017409
	for <linux-firmware@kernel.org>; Fri, 10 Jan 2025 10:32:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=e7zn121aJ6CGZSncB6GuKZx47MVlJtqR/EvChFG3Kfw=; b=
	UcjWy79BRowJjVu3+umaMA3trAV+G3ALAemlna3GEcPP0BN4w73gFTA8lWXl9Ype
	UqPfifF5DHa46DfGxXHvItVlqEwgA136djWA0ctj3WeK0yVsGZmBXjmIC3jyjIUf
	2wZ4sP3smET6KJF0YK4EXHiWAWJQ+ULo3Xgy+20X5XTqbqXykZSaSSCRgekJbsSC
	AtdRK5c/kZhCInFWw75KrAN782Vb2lSpRrzD0Q4qp7VP350ZELaM71+Y/Nf8h6Gr
	b9Y14uTymTJBVcIIOrR2M8U/zWvhAIhfqwVcPGaMRL1trCFPTQtJpdgn/s+EE5Bm
	K0hkG4jjqaiBFEZdK+FdpA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 442t2m0qqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 10 Jan 2025 10:32:27 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 10 Jan
 2025 16:32:26 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 10 Jan 2025 16:32:26 +0000
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 19B3D82026C;
	Fri, 10 Jan 2025 16:32:26 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Correct some links to address the correct amp instance
Date: Fri, 10 Jan 2025 16:32:26 +0000
Message-ID: <002f01db637d$3bbdfc10$b339f430$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0030_01DB637D.3BBE4A30"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdtjfTBIHEt/1IE0Tra+qFBPRQ4GUA==
X-Proofpoint-ORIG-GUID: E0QdSj5RK-4tcOQx3ps8dch3toqphxAd
X-Authority-Analysis: v=2.4 cv=b/dI4sGx c=1 sm=1 tr=0 ts=67814b9b cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=tvVjgmz14fIxVDbPtGcA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=rmLGDYyCHobOCT7BfIAA:9 a=roJZSURqtmWzaCeG:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
X-Proofpoint-GUID: E0QdSj5RK-4tcOQx3ps8dch3toqphxAd
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0030_01DB637D.3BBE4A30
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'd like to update some links that pointed to an incorrect amplifier
instance.

Thanks,

-Simon

 

The following changes since commit 94fa58192826c8d25a517dba5d9199bca5596f56:

 

  Merge branch '23.100.2.1' into 'main' (2025-01-10 12:28:18 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250110

 

for you to fetch changes up to 5e1e0ae5ff54388047a6fe6a72a6cd443edfe087:

 

  cirrus: cs35l56: Correct some links to address the correct amp instance
(2025-01-10 16:25:37 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Correct some links to address the correct amp
instance

 

WHENCE | 16 ++++++++--------

1 file changed, 8 insertions(+), 8 deletions(-)

 


------=_NextPart_000_0030_01DB637D.3BBE4A30
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
class=3DMsoNormal>I&#8217;d like to update some links that pointed to an =
incorrect amplifier instance.<o:p></o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p class=3DMsoNormal>-Simon<span =
lang=3DEN-GB><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>The following changes since commit =
94fa58192826c8d25a517dba5d9199bca5596f56:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; Merge branch '23.100.2.1' =
into 'main' (2025-01-10 12:28:18 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>are available in the Git repository =
at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> =
cs35l56-20250110<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>for you to fetch changes up to =
5e1e0ae5ff54388047a6fe6a72a6cd443edfe087:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; cirrus: cs35l56: Correct =
some links to address the correct amp instance (2025-01-10 16:25:37 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>------------------------------------------------------------=
----<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB>Simon =
Trimmer (1):<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Correct =
some links to address the correct amp instance<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> WHENCE | 16 =
++++++++--------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> 1 file changed, 8 insertions(+), 8 =
deletions(-)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_000_0030_01DB637D.3BBE4A30--
