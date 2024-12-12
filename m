Return-Path: <SRS0=WcmP=TF=opensource.cirrus.com=prvs=9076dc06ea=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AC2E7717F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Dec 2024 16:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A73A9C4CED0; Thu, 12 Dec 2024 16:27:25 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40CAEC4CECE
	for <linux-firmware@kernel.org>; Thu, 12 Dec 2024 16:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40CAEC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGHNPm020333
	for <linux-firmware@kernel.org>; Thu, 12 Dec 2024 10:27:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=phHqX2wfWkVeE02Jt8EBrHkImVSvxwx999CYggZE6+M=; b=
	ProXac/MVb6KIWeTA+8lxxrmVfULs2k/0oB5Ir2iyYOBXHqaTpiyOyaCQmAUelh1
	IMweM81O7D076N8dvlptu+FfTyS//Oad2x2N+q3YfARrjZWuZC8AKCqz+bsWXEQG
	NDaSIV+N2DYR6fdg3wt3mVJREW+xcjoed3dmGTnw/7jFuLepfmJPmd/QR8s+02oU
	f5K3WAXkX3kPdRQ0tZGi72grQVy3sCldIbAcST9pY6DvIY4/ciBA00RHU4GX7o7H
	XUhIBDfYaE8pI87n2LFdnES0svQkA1++DgxtktHHH2o/gkIrasudowMwWaYp89ku
	FsRLJ4LT2gjWUOVU5ZTQww==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43cknkf31k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 12 Dec 2024 10:27:21 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 12 Dec
 2024 16:27:20 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 12 Dec 2024 16:27:20 +0000
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 418EE822541;
	Thu, 12 Dec 2024 16:27:20 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Update firmware for Cirrus CS35L56 Amps
Date: Thu, 12 Dec 2024 16:27:20 +0000
Message-ID: <007201db4cb2$b77d6660$26783320$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0073_01DB4CB2.B77E50C0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdtMsatOPY2u8WrMTDuUTrzKqT3UiA==
X-Proofpoint-ORIG-GUID: mjw2Hu8XKlfQkIUOZ0D9qt1p9xocTwRs
X-Proofpoint-GUID: mjw2Hu8XKlfQkIUOZ0D9qt1p9xocTwRs
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0073_01DB4CB2.B77E50C0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to update the firmware for the Cirrus CS35L56 smart amplifier.

 

There are two patches today, one correcting the order of SSIDs in the WHENCE

file to be saner and another that updates support for several products from

Lenovo, HP and ASUS.

Thanks,

-Simon

 

 

The following changes since commit bac8330ecc98a91b2e6d92b2311fbe11138d31e7:

 

  Merge branch 'robot/patch-0-1733885393' into 'main' (2024-12-11 03:00:28
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241212

 

for you to fetch changes up to 9c46d10f8ea7a72d910ba5f5ebed7fcd2de31c71:

 

  cirrus: cs35l56: Add and update firmware for various Cirrus CS35L54 and
CS35L56 laptops (2024-12-12 16:14:14 +0000)

 

----------------------------------------------------------------

Simon Trimmer (2):

      cirrus: cs35l56: Correct SSID order for 103c8d01 103c8d08 10431f43

      cirrus: cs35l56: Add and update firmware for various Cirrus CS35L54
and CS35L56 laptops

 

WHENCE                                               |  53
++++++++++++++++++++++++++++++++++++++---------------

cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp1.bin        | Bin 7036 -> 7056
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp2.bin        | Bin 7036 -> 7056
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp1.bin        | Bin 7036 -> 7056
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp2.bin        | Bin 7036 -> 7056
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin        | Bin 7036 -> 7056
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin        | Bin 7040 -> 7060
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp1.bin        | Bin 7036 -> 7052
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp2.bin        | Bin 7036 -> 7056
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp1.bin        | Bin 7040 -> 7060
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp2.bin        | Bin 7036 -> 7056
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin        | Bin 7100 -> 7124
bytes

cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin        | Bin 7100 -> 7124
bytes

cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp1.bin        | Bin 7100 -> 7124
bytes

cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp2.bin        | Bin 7100 -> 7124
bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin        | Bin 7896 -> 8240
bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin        | Bin 7900 -> 8248
bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin        | Bin 7896 -> 8248
bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin        | Bin 7896 -> 8236
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin | Bin 8196 -> 8220
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin | Bin 8196 -> 8220
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin | Bin 8192 -> 8344
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin | Bin 8192 -> 8344
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin | Bin 8196 -> 8348
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin | Bin 8196 -> 8348
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin | Bin 8192 -> 8344
bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin | Bin 8192 -> 8344
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampl.bin | Bin 0 -> 12892 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampr.bin | Bin 0 -> 12896 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampl.bin | Bin 0 -> 12872 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampr.bin | Bin 0 -> 12872 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp1.bin        | Bin 0 -> 11480 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp2.bin        | Bin 0 -> 11484 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin | Bin 0 -> 8700 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin | Bin 0 -> 8700 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin | Bin 0 -> 8756 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin | Bin 0 -> 8752 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin        | Bin 0 -> 7456 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin        | Bin 0 -> 7456 bytes

cirrus/cs35l56/CS35L56_Rev3.11.26.wmfw               | Bin 0 -> 34716 bytes

cirrus/cs35l56/CS35L56_Rev3.11.28.wmfw               | Bin 0 -> 34964 bytes

41 files changed, 38 insertions(+), 15 deletions(-)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampr.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.26.wmfw

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.28.wmfw


------=_NextPart_000_0073_01DB4CB2.B77E50C0
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
class=3DMsoNormal>We&#8217;d like to update the firmware for the Cirrus =
CS35L56 smart amplifier.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>There are =
two patches today, one correcting the order of SSIDs in the =
WHENCE<o:p></o:p></p><p class=3DMsoNormal>file to be saner and another =
that updates support for several products from<o:p></o:p></p><p =
class=3DMsoNormal>Lenovo, HP and ASUS.<o:p></o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>-Simon<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>The =
following changes since commit =
bac8330ecc98a91b2e6d92b2311fbe11138d31e7:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; Merge =
branch 'robot/patch-0-1733885393' into 'main' (2024-12-11 03:00:28 =
+0000)<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>are available in the Git repository =
at:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> cs35l56-20241212<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>for you to =
fetch changes up to =
9c46d10f8ea7a72d910ba5f5ebed7fcd2de31c71:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
cirrus: cs35l56: Add and update firmware for various Cirrus CS35L54 and =
CS35L56 laptops (2024-12-12 16:14:14 +0000)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>-------------------------------------------------------=
---------<o:p></o:p></p><p class=3DMsoNormal>Simon Trimmer =
(2):<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l56: Correct SSID order for 103c8d01 103c8d08 =
10431f43<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Add =
and update firmware for various Cirrus CS35L54 and CS35L56 =
laptops<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
53 =
++++++++++++++++++++++++++++++++++++++---------------<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7036 -&gt; 7056 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7036 -&gt; 7056 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7036 -&gt; 7056 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7036 -&gt; 7056 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7036 -&gt; 7056 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7040 -&gt; 7060 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7036 -&gt; 7052 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7036 -&gt; 7056 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7040 -&gt; 7060 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7036 -&gt; 7056 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7100 -&gt; 7124 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7100 -&gt; 7124 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7100 -&gt; 7124 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7100 -&gt; 7124 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7896 -&gt; 8240 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7900 -&gt; 8248 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7896 -&gt; 8248 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 7896 -&gt; 8236 bytes<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin =
| Bin 8196 -&gt; 8220 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin | Bin 8196 -&gt; =
8220 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin | Bin 8192 -&gt; =
8344 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin | Bin 8192 -&gt; =
8344 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin | Bin 8196 -&gt; =
8348 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin | Bin 8196 -&gt; =
8348 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin | Bin 8192 -&gt; =
8344 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin | Bin 8192 -&gt; =
8344 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampl.bin | Bin 0 -&gt; 12892 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampr.bin | Bin 0 -&gt; 12896 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampl.bin | Bin 0 -&gt; 12872 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampr.bin | Bin 0 -&gt; 12872 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11480 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11484 bytes<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin =
| Bin 0 -&gt; 8700 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin | Bin 0 -&gt; 8700 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin | Bin 0 -&gt; 8756 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin | Bin 0 -&gt; 8752 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7456 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7456 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56/CS35L56_Rev3.11.26.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 34716 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56/CS35L56_Rev3.11.28.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 34964 =
bytes<o:p></o:p></p><p class=3DMsoNormal> 41 files changed, 38 =
insertions(+), 15 deletions(-)<o:p></o:p></p><p class=3DMsoNormal> =
create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampl.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampr.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.11.26.wmfw<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.11.28.wmfw<o:p></o:p></p></div></body></html>
------=_NextPart_000_0073_01DB4CB2.B77E50C0--
