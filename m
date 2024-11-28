Return-Path: <SRS0=olzv=SX=opensource.cirrus.com=prvs=9062e49da0=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E449AD69102
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Nov 2024 12:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B470FC4CED3; Thu, 28 Nov 2024 12:17:02 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BE4EC4CECE
	for <linux-firmware@kernel.org>; Thu, 28 Nov 2024 12:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BE4EC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS91no9015411
	for <linux-firmware@kernel.org>; Thu, 28 Nov 2024 06:16:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=wlIeLSPSRRhmshljc+Ck5Wlofgk3f3CdDmK00T9+VyM=; b=
	TKpFXeKdDzdM+2u8pv5anVnLMeMyVrDMUMZFc2FNnIXE0ZjL7Y1/r6G/w9nlNZcY
	m1r8xKQWGNbTuJIbtA7b3pTga1R4XEjizsKfxv+92fUTYUFZgV/TgXgCbyxTV5bC
	3qChmR4yQUlcFfAd1Wmh5zZjPbXWDHE2D6OvfhIXlWp0EOa8g7R0I0B55jVNrg2W
	ssK5ORSqa9TlBCkkEd6UoCGpvhpGO3iLqT9vYvpEpCYvWFAgX9bUNTasyr7jIfIb
	YCpeRF7NuF47bNwv8nLBYgd4sFmgL/g6g2FlQnheaSryT7Y8H+vagUMO5+UNma1R
	Omps7WvzawlBw5zexTnJoQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4366yw9g4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 28 Nov 2024 06:16:53 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 28 Nov
 2024 12:16:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 28 Nov 2024 12:16:50 +0000
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.200.127])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AC532820247;
	Thu, 28 Nov 2024 12:16:50 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some Dell laptops
Date: Thu, 28 Nov 2024 12:16:50 +0000
Message-ID: <000201db418f$6757d5e0$360781a0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0003_01DB418F.67587220"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdtBjy2KP22BUNHCSPGx0NHyi0xC9g==
Content-Language: en-gb
X-Proofpoint-ORIG-GUID: 4baQhQxVQkNRvweIdzi-4SQ1LfKl_I_O
X-Proofpoint-GUID: 4baQhQxVQkNRvweIdzi-4SQ1LfKl_I_O
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0003_01DB418F.67587220
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to add the firmware for the Cirrus CS35L56 smart amplifier for
some Dell Laptops.

Thanks,

-Simon

 

The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a7943:

 

  Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241128

 

for you to fetch changes up to 741a828989a0356de48401d2f88b5eaeed6948c7:

 

  cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell laptops
(2024-11-28 12:06:35 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell
laptops

 

WHENCE                                               |  13 +++++++++++++

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin | Bin 0 -> 11532 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin | Bin 0 -> 11532 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin | Bin 0 -> 11532 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin | Bin 0 -> 11532 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin | Bin 0 -> 11532 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin | Bin 0 -> 11532 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin | Bin 0 -> 11532 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin | Bin 0 -> 11532 bytes

cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw               | Bin 0 -> 34964 bytes

10 files changed, 13 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw


------=_NextPart_000_0003_01DB418F.67587220
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
lang=3DEN-GB>We&#8217;d like to add the firmware for the Cirrus CS35L56 =
smart amplifier for some Dell Laptops.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>The following changes since commit =
7c3031c18ab851792c49f594a4d43200d55a7943:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; Merge branch =
'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>are available in the Git repository =
at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> =
cs35l56-20241128<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>for you to fetch changes up to =
741a828989a0356de48401d2f88b5eaeed6948c7:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; cirrus: cs35l56: Add =
firmware for Cirrus CS35L56 for various Dell laptops (2024-11-28 =
12:06:35 +0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>------------------------------------------------------------=
----<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB>Simon =
Trimmer (1):<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Add =
firmware for Cirrus CS35L56 for various Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
13 +++++++++++++<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin | Bin =
0 -&gt; 11532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin | Bin =
0 -&gt; 11532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin | Bin =
0 -&gt; 11532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin | Bin =
0 -&gt; 11532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin | Bin =
0 -&gt; 11532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin | Bin =
0 -&gt; 11532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin | Bin =
0 -&gt; 11532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin | Bin =
0 -&gt; 11532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 34964 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> 10 =
files changed, 13 insertions(+)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.11.27.wmfw<o:p></o:p></span></p></div></body>=
</html>
------=_NextPart_000_0003_01DB418F.67587220--
