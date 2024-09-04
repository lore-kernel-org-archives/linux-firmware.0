Return-Path: <SRS0=3qE1=QC=opensource.cirrus.com=prvs=6977ef6907=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD2BCD4853
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Sep 2024 16:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 006D8C4CEC9; Wed,  4 Sep 2024 16:22:49 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64C47C4CEC2
	for <linux-firmware@kernel.org>; Wed,  4 Sep 2024 16:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64C47C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484CjWER013901
	for <linux-firmware@kernel.org>; Wed, 4 Sep 2024 11:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=Nc2C7CTwYSdUbP4hFxezKJQJVtCKYquRgUdXQWBlLjc=; b=
	UMcym1Y8btekDt83Y6FTpPIxpWFOS3suZnx6BTaXmSBjSAb/iOg/38rvP3U2Lgdv
	EHUsCpKj++ZMZysdGI1l5kIGwtIPMrOY9/+ZTpv+SqY5srDEXzf2VV6SfmUVKMKM
	NpXapelf55UQFFhoBYujQxDmoEhl+L1GpEzkssrsWL+Gettp7L7i2D3bY5a+DKyt
	h4Mo3JlSNgO2bLdAm9IlWtsksI3fVRX1DvTR6EKNY1dhOKitgRH3yv7JDv1g4Aa5
	4HFRscUJj2lND1W+oAncP23L17MOVDLTBiO3LbAPFEvSw1XR6V5dZxWdjEBwMhtU
	7gulXVCwUKDF1cgtzyshUw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41bykkcvkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Sep 2024 11:22:45 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 17:22:44 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 4 Sep 2024 17:22:44 +0100
Received: from EDIN6ZZ2FY3 (unknown [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E946682024A;
	Wed,  4 Sep 2024 16:22:43 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Add firmware for Cirrus CS35L54 for some HP laptops 
Date: Wed, 4 Sep 2024 17:22:43 +0100
Message-ID: <007501dafee6$abe2ed80$03a8c880$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0076_01DAFEEF.0DA7CAB0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Adr+5LJ09QaF7YcgQBaP45KuObr0xg==
X-Proofpoint-GUID: Ss55vquNZrk7Xz44t21XfTw6HsfqnYRr
X-Proofpoint-ORIG-GUID: Ss55vquNZrk7Xz44t21XfTw6HsfqnYRr
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0076_01DAFEEF.0DA7CAB0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to add the firmware for the Cirrus CS35L54 smart amplifiers on a
couple of HP laptops (these are supported by the cs35l56 driver
infrastructure)

 

Thanks,

-Simon

 

The following changes since commit 7a7a88fe1a481c6a1d04b1733a446c11e4f16935:

 

  Merge branch 'amd-staging' into 'main' (2024-09-03 16:49:10 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ 2024-09-04

 

for you to fetch changes up to a9c9dbf495fd3aa6e880b2ba32af576f83e7f7fa:

 

  cirrus: cs35l56: Add firmware for Cirrus CS35L54 for some HP laptops
(2024-09-04 16:05:13 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus CS35L54 for some HP laptops

 

WHENCE                                        |  13 ++++++++++++-

cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin | Bin 0 -> 7500 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin | Bin 0 -> 7464 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin | Bin 0 -> 7468 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin | Bin 0 -> 7500 bytes

cirrus/cs35l56/CS35L56_Rev3.11.18.wmfw        | Bin 0 -> 33308 bytes

6 files changed, 12 insertions(+), 1 deletion(-)

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.18.wmfw


------=_NextPart_000_0076_01DAFEEF.0DA7CAB0
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
lang=3DEN-GB>We&#8217;d like to add the firmware for the Cirrus CS35L54 =
smart amplifiers on a couple of HP laptops (these are supported by the =
cs35l56 driver infrastructure)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>The =
following changes since commit =
7a7a88fe1a481c6a1d04b1733a446c11e4f16935:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; Merge =
branch 'amd-staging' into 'main' (2024-09-03 16:49:10 =
+0000)<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>are available in the Git repository =
at:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> 2024-09-04<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>for you to =
fetch changes up to =
a9c9dbf495fd3aa6e880b2ba32af576f83e7f7fa:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus CS35L54 for some HP laptops =
(2024-09-04 16:05:13 +0000)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>-------------------------------------------------------=
---------<o:p></o:p></p><p class=3DMsoNormal>Simon Trimmer =
(1):<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus CS35L54 for some HP =
laptops<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 13 ++++++++++++-<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin | Bin 0 =
-&gt; 7500 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin | Bin 0 -&gt; 7464 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin | Bin 0 -&gt; 7468 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin | Bin 0 -&gt; 7500 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56/CS35L56_Rev3.11.18.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; | Bin 0 -&gt; 33308 bytes<o:p></o:p></p><p class=3DMsoNormal> 6 =
files changed, 12 insertions(+), 1 deletion(-)<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.11.18.wmfw<o:p></o:p></p></div></body></html>
------=_NextPart_000_0076_01DAFEEF.0DA7CAB0--
