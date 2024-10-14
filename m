Return-Path: <SRS0=AuoV=RK=opensource.cirrus.com=prvs=7017b5b0b1=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6561AD18128
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Oct 2024 15:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FC16C4CED0; Mon, 14 Oct 2024 15:31:52 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 043D5C4CEC7
	for <linux-firmware@kernel.org>; Mon, 14 Oct 2024 15:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 043D5C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E564Cq006850
	for <linux-firmware@kernel.org>; Mon, 14 Oct 2024 10:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=vswFnY+jJUDwpAV/Zo2qx9FscmBUlWH5VZZu5sISpGI=; b=
	JPas3g8VP04o12CEezoxtuUBE/25+xnv3M3oOzC+R+2d/vb4/P+MLo9m0yLLgrTZ
	EUHvCMUN7FiZBbXV4/OYTZRfr0W5N3FtirXKNIrv85QsetQq3VYCwLn3PLhyAYuA
	4fjsp7K1EqJ/4h9B/ERQxGCUNW6y92rrSVCpA0u0WFXzBcEelMMFhojsJKE3aJRz
	I916rmPxtppD4xvKw18gk8bXoSOhFx0pHRyYyWnwequngPFWtSv47yBwsEBxkxbO
	eEryC+SjRTC4/PvdiSyoT6NbDsWH9ijOiu3LyLWhLWHseE9m2NFhFRwFI8pTVgLl
	SeyptPMNLg/ROfIrHkUtew==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 427pgxjfcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 14 Oct 2024 10:31:42 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 16:31:40 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 14 Oct 2024 16:31:40 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7AA8882024A;
	Mon, 14 Oct 2024 15:31:40 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add more firmware for Cirrus CS35L54 and CS35L56 amps in HP, ASUS and Lenovo products
Date: Mon, 14 Oct 2024 16:31:40 +0100
Message-ID: <002201db1e4e$2a75d7d0$7f618770$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0023_01DB1E56.8C3B2A30"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdseThREaDciXthhTK+13su62PDlxQ==
X-Proofpoint-GUID: Ei8IxGsuPiPPkUMGf0SxB6rSovELQU0A
X-Proofpoint-ORIG-GUID: Ei8IxGsuPiPPkUMGf0SxB6rSovELQU0A
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0023_01DB1E56.8C3B2A30
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to add the firmware for the Cirrus CS35L54 and CS35L56 smart
amplifiers for some HP, ASUS and Lenovo Laptops

Thanks,

-Simon

 

The following changes since commit 1292f4f7301e25fc16305e60d49282fe4bdd0df5:

 

  Merge branch 'en8811h' into 'main' (2024-10-14 14:21:12 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241014

 

for you to fetch changes up to 879bd9ae0b893ee00ca4069f09d018a9efd25ac3:

 

  cirrus: cs35l56: Add firmware for Cirrus CS35L56 for a Lenovo Laptop
(2024-10-14 15:22:54 +0000)

 

----------------------------------------------------------------

Simon Trimmer (3):

      cirrus: cs35l56: Add firmware for Cirrus Amps for some HP laptops

      cirrus: cs35l56: Add firmware for Cirrus CS35L56 for some ASUS laptops

      cirrus: cs35l56: Add firmware for Cirrus CS35L56 for a Lenovo Laptop

 

WHENCE                                               |  82
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++

cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp1.bin        | Bin 0 -> 7680 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp2.bin        | Bin 0 -> 7648 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp3.bin        | Bin 0 -> 7680 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp4.bin        | Bin 0 -> 7648 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp1.bin        | Bin 0 -> 7684 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp2.bin        | Bin 0 -> 7656 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp3.bin        | Bin 0 -> 7684 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp4.bin        | Bin 0 -> 7656 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp1.bin        | Bin 0 -> 7104 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp2.bin        | Bin 0 -> 7100 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp1.bin        | Bin 0 -> 7108 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp2.bin        | Bin 0 -> 7108 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin        | Bin 0 -> 7108 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin        | Bin 0 -> 7108 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp1.bin        | Bin 0 -> 7100 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp2.bin        | Bin 0 -> 7096 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp1.bin        | Bin 0 -> 7108 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp2.bin        | Bin 0 -> 7108 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin        | Bin 0 -> 7168 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin        | Bin 0 -> 7172 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp1.bin        | Bin 0 -> 7172 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp2.bin        | Bin 0 -> 7172 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e13-amp1.bin        | Bin 0 -> 8980 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e13-amp2.bin        | Bin 0 -> 9020 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e13-amp3.bin        | Bin 0 -> 9024 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e13-amp4.bin        | Bin 0 -> 8988 bytes

cirrus/cs35l56-b0-dsp1-misc-10431f43-amp1.bin        | Bin 0 -> 7952 bytes

cirrus/cs35l56-b0-dsp1-misc-10431f43-amp2.bin        | Bin 0 -> 7960 bytes

cirrus/cs35l56-b0-dsp1-misc-10431f43-amp3.bin        | Bin 0 -> 7964 bytes

cirrus/cs35l56-b0-dsp1-misc-10431f43-amp4.bin        | Bin 0 -> 7956 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampl.bin | Bin 0 -> 8628 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampr.bin | Bin 0 -> 8628 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampl.bin | Bin 0 -> 8628 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampr.bin | Bin 0 -> 8628 bytes

cirrus/cs35l56/CS35L56_Rev3.11.11.1.wmfw             | Bin 0 -> 30520 bytes

cirrus/cs35l56/CS35L56_Rev3.11.20.wmfw               | Bin 0 -> 33388 bytes

37 files changed, 82 insertions(+)

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp2.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp3.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp4.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp2.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp3.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp4.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp2.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp2.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp2.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp2.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin

create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e13-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e13-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e13-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e13-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431f43-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431f43-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431f43-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431f43-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampr.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.11.1.wmfw

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.20.wmfw


------=_NextPart_000_0023_01DB1E56.8C3B2A30
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
lang=3DEN-GB>We&#8217;d like to add the firmware for the Cirrus CS35L54 =
and CS35L56 smart amplifiers for some HP, ASUS and Lenovo =
Laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Thanks,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>The =
following changes since commit =
1292f4f7301e25fc16305e60d49282fe4bdd0df5:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; Merge =
branch 'en8811h' into 'main' (2024-10-14 14:21:12 =
+0000)<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>are available in the Git repository =
at:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> cs35l56-20241014<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>for you to =
fetch changes up to =
879bd9ae0b893ee00ca4069f09d018a9efd25ac3:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus CS35L56 for a Lenovo Laptop =
(2024-10-14 15:22:54 +0000)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>-------------------------------------------------------=
---------<o:p></o:p></p><p class=3DMsoNormal>Simon Trimmer =
(3):<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus Amps for some HP =
laptops<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Add =
firmware for Cirrus CS35L56 for some ASUS laptops<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Add =
firmware for Cirrus CS35L56 for a Lenovo Laptop<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
82 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7680 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7648 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7680 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7648 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7684 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7656 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7684 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7656 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7104 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7100 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7108 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7108 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7108 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7108 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7100 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7096 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7108 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7108 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7168 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7172 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7172 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7172 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 8980 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 9020 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 9024 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 8988 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431f43-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7952 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431f43-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7960 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431f43-amp3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7964 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431f43-amp4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7956 bytes<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampl.bin =
| Bin 0 -&gt; 8628 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampr.bin | Bin 0 -&gt; 8628 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampl.bin | Bin 0 -&gt; 8628 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampr.bin | Bin 0 -&gt; 8628 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56/CS35L56_Rev3.11.11.1.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 30520 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56/CS35L56_Rev3.11.20.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 33388 =
bytes<o:p></o:p></p><p class=3DMsoNormal> 37 files changed, 82 =
insertions(+)<o:p></o:p></p><p class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431f43-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431f43-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431f43-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431f43-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid0-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.11.11.1.wmfw<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.11.20.wmfw<o:p></o:p></p></div></body></html>
------=_NextPart_000_0023_01DB1E56.8C3B2A30--
