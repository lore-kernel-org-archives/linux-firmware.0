Return-Path: <SRS0=GjB5=NO=opensource.cirrus.com=prvs=38933d39e0=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E83CC27C53
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Jun 2024 16:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 062E9C116B1; Wed, 12 Jun 2024 16:21:17 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3BAEC32786
	for <linux-firmware@kernel.org>; Wed, 12 Jun 2024 16:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3BAEC32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CEKx3B001060
	for <linux-firmware@kernel.org>; Wed, 12 Jun 2024 11:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=vHhLIrjDMcUz9bQdLlndAaL4nX9Q/NX3318rke3twQ4=; b=
	FxWbrHguZkU7L2b9qpvGGi1vwTbViH0phRbmHr1NzhIh69XcELqLaP+aSRNwDjfS
	+8t++PT3mkMc+YyyWiFGv/Fyq770RGy+Zal5TXHqqrVGgKEgNhktfrONMO0kRFoB
	LWxRcBiciojWOQS977H+VQ5oIbvT4+gVt5sCH2DCQMPBWgkRmp2Y7x/0+WBcQ0kX
	lfuznSvRJj2YKRd9urBqwPrktXwwiOK41N9OUdgBXFh4+PcQ6JfUPVQSZ74thwg7
	uvShJLHppMmQQYOAqUxAZh0p+m8uDr0DWwc+yVR3q2SXzZW0BajQAng+4hBLK5aQ
	D1YAw62aAek7wVvQgnyFWQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yqb8ega67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 12 Jun 2024 11:21:13 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 17:21:12 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 12 Jun 2024 17:21:12 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.65.41])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 10689820248;
	Wed, 12 Jun 2024 16:21:12 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Update firmware for Cirrus CS35L56 for various ASUS laptops
Date: Wed, 12 Jun 2024 17:21:11 +0100
Message-ID: <005801dabce4$8a671df0$9f3559d0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0059_01DABCEC.EC2C4940"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Adq85F0gcnx6j3WWSRea0HtovVPziw==
X-Proofpoint-ORIG-GUID: jpfIJe9C88kPjo_qlZLKXapv8KeuuL_s
X-Proofpoint-GUID: jpfIJe9C88kPjo_qlZLKXapv8KeuuL_s
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0059_01DABCEC.EC2C4940
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to update the firmware for the Cirrus CS35L56 smart amplifiers on
a couple of ASUS laptops.

Thanks,

-Simon

 

 

The following changes since commit 9c10a2083c3663828e7c06554dfbb3929085b5bd:

 

  Merge branch 'qca' into 'main' (2024-06-10 14:06:27 +0000)

 

are available in the Git repository at:

 

   <https://github.com/CirrusLogic/linux-firmware/>
https://github.com/CirrusLogic/linux-firmware/ cs35l56-20240612

 

for you to fetch changes up to 87fd13b131d5aed2e8c4ded4797d4d5f19c1c8d9:

 

  cirrus: cs35l56: Update firmware for Cirrus CS35L56 for various ASUS
laptops (2024-06-12 16:09:40 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Update firmware for Cirrus CS35L56 for various ASUS
laptops

 

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin | Bin 8196 -> 8196
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin | Bin 8196 -> 8196
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin | Bin 8192 -> 8192
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin | Bin 8192 -> 8192
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin | Bin 8196 -> 8196
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin | Bin 8196 -> 8196
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin | Bin 8192 -> 8192
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin | Bin 8192 -> 8192
bytes

8 files changed, 0 insertions(+), 0 deletions(-)

 


------=_NextPart_000_0059_01DABCEC.EC2C4940
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" =
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
CS35L56 smart amplifiers on a couple of ASUS =
laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Thanks,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>-Simon<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>The =
following changes since commit =
9c10a2083c3663828e7c06554dfbb3929085b5bd:<o:p></o:p></span></p><p =
style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;<o:p></=
o:p></span></p><p style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp; Merge =
branch 'qca' into 'main' (2024-06-10 14:06:27 =
+0000)<o:p></o:p></span></p><p style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;<o:p></=
o:p></span></p><p style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;<o:p></=
o:p></span></p><p style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/"><span =
style=3D'font-size:12.0pt'>https://github.com/CirrusLogic/linux-firmware/=
</span></a> cs35l56-20240612<o:p></o:p></span></p><p =
style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;<o:p></=
o:p></span></p><p style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>for you to =
fetch changes up to =
87fd13b131d5aed2e8c4ded4797d4d5f19c1c8d9:<o:p></o:p></span></p><p =
style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;<o:p></=
o:p></span></p><p style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp; =
cirrus: cs35l56: Update firmware for Cirrus CS35L56 for various ASUS =
laptops (2024-06-12 16:09:40 +0000)<o:p></o:p></span></p><p =
style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;<o:p></=
o:p></span></p><p style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>-------------=
---------------------------------------------------<o:p></o:p></span></p>=
<p style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>Simon =
Trimmer (1):<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; cirrus: cs35l56: Update firmware for Cirrus CS35L56 =
for various ASUS laptops<o:p></o:p></span></p><p =
style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;<o:p></=
o:p></span></p><p style=3D'margin:0cm'><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin | Bin 8196 -&gt; =
8196 bytes<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin | Bin 8196 -&gt; =
8196 bytes<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin | Bin 8192 -&gt; =
8192 bytes<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin | Bin 8192 -&gt; =
8192 bytes<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin | Bin 8196 -&gt; =
8196 bytes<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin | Bin 8196 -&gt; =
8196 bytes<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin | Bin 8192 -&gt; =
8192 bytes<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin | Bin 8192 -&gt; =
8192 bytes<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> 8 files =
changed, 0 insertions(+), 0 deletions(-)<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_000_0059_01DABCEC.EC2C4940--
