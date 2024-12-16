Return-Path: <SRS0=g8Jw=TJ=opensource.cirrus.com=prvs=908076ffdf=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65077E7717F
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Dec 2024 11:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34805C4CED3; Mon, 16 Dec 2024 11:16:11 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C1B9C4CED0
	for <linux-firmware@kernel.org>; Mon, 16 Dec 2024 11:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C1B9C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGAfCqG014436
	for <linux-firmware@kernel.org>; Mon, 16 Dec 2024 05:16:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=JMgHT3g/6AJbviZwtASk/cQrdlIkkJKCLjXCWAcD6Z4=; b=
	HVS/Zz0fIi1Fu9BiZhnSfEKqBejTDOWkpG6JH9wuVyOBUaNJB7wUrYvvcBNSyhQK
	XrQTpc52E3czFACSoOp7Edd/Zu+eSfgKfCOlEUrpb1v0kp4OPCb0RWNo8Bd/4WkZ
	B5/EHevJIVJI5aXlhokiYWFGQoBeEs+kTiqzT5zC22vYIYmeZ2AH4fjO70w/r3oc
	33f1Mz2KYfGmzs9fEDitZm1ExUZHbaDFdLKBe9W6fwHHJfQS8AqtdK4VF8HW17Vf
	iDpDQMbiU0RgnCOWCfbcHJ6qnTUO7RlethCv+gTIsw2dU171P36iP3gqbMspCcCZ
	eKWLjRPZLL1kwrgiO3jw9Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a21snb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 16 Dec 2024 05:16:08 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 16 Dec
 2024 11:16:06 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 16 Dec 2024 11:16:06 +0000
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 742AE820248;
	Mon, 16 Dec 2024 11:16:06 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Correct filenames of SSID 17aa3832 
Date: Mon, 16 Dec 2024 11:16:06 +0000
Message-ID: <000f01db4fab$e6a8ddb0$b3fa9910$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0010_01DB4FAB.E6AA1630"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdtPq2M24MukovvzRgS5adeiUtV2Zg==
X-Proofpoint-ORIG-GUID: ASEMQ3Xm5b_IsREY2ERR6riOs9UCR0R2
X-Proofpoint-GUID: ASEMQ3Xm5b_IsREY2ERR6riOs9UCR0R2
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0010_01DB4FAB.E6AA1630
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'd like to correct the naming of a few firmware files

Thanks,

-Simon

 

 

The following changes since commit 2cdfe09ef48746c4de791ccc1b6f2cc59e991289:

 

  Merge branch 'robot/pr-0-1734020971' into 'main' (2024-12-12 16:53:23
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241216

 

for you to fetch changes up to bd491523d7f02d20b8031e4fc934f719f4388ae2:

 

  cirrus: cs35l56: Correct filenames of SSID 17aa3832 (2024-12-16 11:10:24
+0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Correct filenames of SSID 17aa3832

 

WHENCE
|   8 ++++----

cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin =>
cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampl.bin} | Bin

cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin =>
cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampr.bin} | Bin

cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin =>
cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampl.bin} | Bin

cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin =>
cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampr.bin} | Bin

5 files changed, 4 insertions(+), 4 deletions(-)

rename cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin =>
cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampl.bin} (100%)

rename cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin =>
cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampr.bin} (100%)

rename cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin =>
cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampl.bin} (100%)

rename cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin =>
cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampr.bin} (100%)


------=_NextPart_000_0010_01DB4FAB.E6AA1630
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
class=3DWordSection1><p class=3DMsoNormal>Hi,<o:p></o:p></p><p =
class=3DMsoNormal>I&#8217;d like to correct the naming of a few firmware =
files<o:p></o:p></p><p class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>-Simon<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>The =
following changes since commit =
2cdfe09ef48746c4de791ccc1b6f2cc59e991289:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; Merge =
branch 'robot/pr-0-1734020971' into 'main' (2024-12-12 16:53:23 =
+0000)<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>are available in the Git repository =
at:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> cs35l56-20241216<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>for you to =
fetch changes up to =
bd491523d7f02d20b8031e4fc934f719f4388ae2:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
cirrus: cs35l56: Correct filenames of SSID 17aa3832 (2024-12-16 11:10:24 =
+0000)<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>-------------------------------------------------------=
---------<o:p></o:p></p><p class=3DMsoNormal>Simon Trimmer =
(1):<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l56: Correct filenames of SSID 17aa3832<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp; 8 ++++----<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin =3D&gt; =
cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampl.bin} | Bin<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin =
=3D&gt; cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampr.bin} | =
Bin<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin =3D&gt; =
cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampl.bin} | Bin<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin =
=3D&gt; cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampr.bin} | =
Bin<o:p></o:p></p><p class=3DMsoNormal> 5 files changed, 4 =
insertions(+), 4 deletions(-)<o:p></o:p></p><p class=3DMsoNormal> rename =
cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin =3D&gt; =
cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampl.bin} (100%)<o:p></o:p></p><p =
class=3DMsoNormal> rename =
cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin =3D&gt; =
cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampr.bin} (100%)<o:p></o:p></p><p =
class=3DMsoNormal> rename =
cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin =3D&gt; =
cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampl.bin} (100%)<o:p></o:p></p><p =
class=3DMsoNormal> rename =
cirrus/{cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin =3D&gt; =
cs35l56-b0-dsp1-misc-17aa3832-spkid1-ampr.bin} =
(100%)<o:p></o:p></p></div></body></html>
------=_NextPart_000_0010_01DB4FAB.E6AA1630--
