Return-Path: <SRS0=1QCu=MD=opensource.cirrus.com=prvs=2850df1570=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3359DC10F16
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Apr 2024 14:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9563C4AF1A; Tue, 30 Apr 2024 14:31:58 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10F6DC4AF18
	for <linux-firmware@kernel.org>; Tue, 30 Apr 2024 14:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10F6DC4AF18
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U7jT5c007047
	for <linux-firmware@kernel.org>; Tue, 30 Apr 2024 09:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	PODMain02222019; bh=6GoPDlpUNK7SDGuPxqL0n9j9lIKpxH7TAgDbz2rWjno=; b=
	QiO590ENuJcn4Ct+bl4erZmAVtZ/r+d8fXXU0z+L7OTVLVi8FkdPXCJto2q1vK/R
	kYEH6H1pfewQsTzfQUVQ7edSqevDy8aliQnBXckZNzLCZZ4G5h+n4sboaWL4DLs2
	cK8CNXnTlkGuBkc+FZ6jg5uApce+T0wUotRia2D4MDlTSrGyMk01mITJGxy+64Xg
	y1+3vFEB+eMd/ggKJqsWufjc/lXDuawMz0fm2vC2+Qt5Gnvantp2UgYqlmnpPdgw
	Bh+s/HDkHae1ZUSt4imeHb1Bp6VOMoJ345o3B2SdHXjAwYfFHA8OR20DgOTKim1H
	65BtODyFxJpmqmjgUc5RdA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xrwsjkkrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 30 Apr 2024 09:31:49 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 15:31:48 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 30 Apr 2024 15:31:48 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.64.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0D958820249;
	Tue, 30 Apr 2024 14:31:48 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add Cirrus Logic firmware for some ASUS and Lenovo laptops
Date: Tue, 30 Apr 2024 15:31:47 +0100
Message-ID: <001701da9b0b$223057b0$66910710$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0018_01DA9B13.83F534E0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdqbCs9j9QY9eJmiTICzHCSyAn8Qlg==
X-Proofpoint-ORIG-GUID: x3-8eNRgh0yCvFvgsX7ekJfkBn_2YndD
X-Proofpoint-GUID: x3-8eNRgh0yCvFvgsX7ekJfkBn_2YndD
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0018_01DA9B13.83F534E0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

A couple of changes this week - we'd like to add firmware to support Cirrus
Logic Smart amps

on some ASUS and Lenovo laptops.

 

Thanks,

-Simon

 

 

The following changes since commit fc21f475fee3f3e48a0e4c504df50ea488df906d:

 

  Merge branch 'robot/pr-0-1714105941' into 'main' (2024-04-26 04:55:58
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ 2004-04-30

 

for you to fetch changes up to d3a655e22101d79c75cdc0c5b0e9e888de848d07:

 

  cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various ASUS laptops
(2024-04-30 14:15:07 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various ASUS
laptops

 

Stefan Binding (1):

      linux-firmware: Add firmware and tuning for Lenovo Y770S

 

WHENCE                                               |  34
++++++++++++++++++++++++++++++++++

cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-l0.bin  | Bin 0 -> 5680 bytes

cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-r0.bin  | Bin 0 -> 5680 bytes

cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-l0.bin  | Bin 0 -> 5704 bytes

cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-r0.bin  | Bin 0 -> 5704 bytes

cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin | Bin 0 -> 8196 bytes

cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin | Bin 0 -> 8196 bytes

cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp1.bin | Bin 0 -> 8192 bytes

cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp2.bin | Bin 0 -> 8192 bytes

cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp1.bin | Bin 0 -> 8192 bytes

cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp2.bin | Bin 0 -> 8192 bytes

cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp1.bin | Bin 0 -> 8196 bytes

cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp2.bin | Bin 0 -> 8192 bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin        | Bin 0 -> 7812 bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin        | Bin 0 -> 7816 bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin        | Bin 0 -> 7812 bytes

cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin        | Bin 0 -> 7808 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin | Bin 0 -> 8196 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin | Bin 0 -> 8196 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin | Bin 0 -> 8192 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin | Bin 0 -> 8192 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin | Bin 0 -> 8196 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin | Bin 0 -> 8196 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin | Bin 0 -> 8192 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin | Bin 0 -> 8192 bytes

25 files changed, 34 insertions(+)

create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-l0.bin

create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-r0.bin

create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-l0.bin

create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-r0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin


------=_NextPart_000_0018_01DA9B13.83F534E0
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
lang=3DEN-GB>A couple of changes this week &#8211; we&#8217;d like to =
add firmware to support Cirrus Logic Smart amps<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>on some ASUS and Lenovo =
laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Thanks,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>-Simon<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>The following changes since commit =
fc21f475fee3f3e48a0e4c504df50ea488df906d:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; Merge branch =
'robot/pr-0-1714105941' into 'main' (2024-04-26 04:55:58 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>are available in the Git repository =
at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> 2004-04-30<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>for you to fetch changes up to =
d3a655e22101d79c75cdc0c5b0e9e888de848d07:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp; cirrus: cs35l56: Add =
firmware for Cirrus CS35L56 for various ASUS laptops (2024-04-30 =
14:15:07 +0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>------------------------------------------------------------=
----<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB>Simon =
Trimmer (1):<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Add =
firmware for Cirrus CS35L56 for various ASUS =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Stefan Binding (1):<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
linux-firmware: Add firmware and tuning for Lenovo =
Y770S<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
34 ++++++++++++++++++++++++++++++++++<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-l0.bin&nbsp; | Bin 0 -&gt; =
5680 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-r0.bin&nbsp; | Bin 0 -&gt; =
5680 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-l0.bin&nbsp; | Bin 0 -&gt; =
5704 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-r0.bin&nbsp; | Bin 0 -&gt; =
5704 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin | Bin 0 -&gt; 8196 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin | Bin 0 -&gt; 8196 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp1.bin | Bin 0 -&gt; 8192 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp2.bin | Bin 0 -&gt; 8192 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp1.bin | Bin 0 -&gt; 8192 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp2.bin | Bin 0 -&gt; 8192 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp1.bin | Bin 0 -&gt; 8196 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp2.bin | Bin 0 -&gt; 8192 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7812 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7816 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7812 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 7808 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin | Bin 0 -&gt; 8196 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin | Bin 0 -&gt; 8196 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin | Bin 0 -&gt; 8192 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin | Bin 0 -&gt; 8192 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin | Bin 0 -&gt; 8196 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin | Bin 0 -&gt; 8196 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin | Bin 0 -&gt; 8192 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin | Bin 0 -&gt; 8192 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB> 25 =
files changed, 34 insertions(+)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100755 =
cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-l0.bin<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-GB> create mode 100755 =
cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-r0.bin<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-GB> create mode 100755 =
cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-l0.bin<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-GB> create mode 100755 =
cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-r0.bin<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin<o:p></o:p></span></p=
></div></body></html>
------=_NextPart_000_0018_01DA9B13.83F534E0--
