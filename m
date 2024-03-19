Return-Path: <SRS0=CbNc=KZ=opensource.cirrus.com=prvs=08081d59ee=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25E0CD11C2
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Mar 2024 15:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1BC1C433C7; Tue, 19 Mar 2024 15:05:56 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A928C433F1
	for <linux-firmware@kernel.org>; Tue, 19 Mar 2024 15:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A928C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J7MT0l005337
	for <linux-firmware@kernel.org>; Tue, 19 Mar 2024 10:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	PODMain02222019; bh=wysjG6j0OxUV9YxD8Tl3tLpH94kTcpG6ktwsoWJNXwk=; b=
	pDlnHHjJBVX4asrIYeV52prhYTpLQRUV7kAwhDKcb8x+k1k8u70r9kiWF2p4fvaU
	QhVkagPNAywLclcN4BcikA5y2SZbrlH5nSDl2oGhz0OFN6Jqg7IVYgiyZdJhSin8
	3+VuoARTVFdvFYXoWUEnfBNPEfPhHX7iT3ewrNlB+WKMmXIEFEHL6IPR+ZMVgWIv
	MXPBu7rRiDiDv1AoIayfvhCTCu2nQp/PJfzeaBpTtEhqMWAOzbF8Gb7oSx+LxoBp
	N7x67NgZrkebbJUr7pWp39m31LZO/X+bS4yibk1f74bsnGkE+p/IioOYgoVGchcr
	JDLssLVIg4szAQWaW/sQIA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ww8txudgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 19 Mar 2024 10:05:47 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 19 Mar
 2024 15:05:45 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Tue, 19 Mar 2024 15:05:45 +0000
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.64.100])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 27084820243;
	Tue, 19 Mar 2024 15:05:45 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add CS35L56 firmware for DELL XPS laptops
Date: Tue, 19 Mar 2024 15:05:45 +0000
Message-ID: <000c01da7a0e$eb0e6190$c12b24b0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01DA7A0E.EB0E6190"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Adp6DqST5aNUd0V7SqCXUEpAPsLLrw==
X-Proofpoint-GUID: RdRZlx1qxrQBlf8phUGYiCy0t-eXrLZB
X-Proofpoint-ORIG-GUID: RdRZlx1qxrQBlf8phUGYiCy0t-eXrLZB
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_000D_01DA7A0E.EB0E6190
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We would like to add firmware files to support Cirrus Logic Smart Amp

CS35L56 for Dell XPS laptops

 

Thanks,

 -Simon

 

The following changes since commit 37d26b9bbd46c656f9f56badb460b4886ecabdc7:

 

  Merge branch 'tsse_fw' into 'main' (2024-03-19 12:08:19 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56

 

for you to fetch changes up to 57077702373e7ef40f0ca197724428d614bd92f8:

 

  linux-firmware: Add firmware for Cirrus CS35L56 for Dell laptops
(2024-03-19 15:00:16 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      linux-firmware: Add firmware for Cirrus CS35L56 for Dell laptops

 

WHENCE                                               |  44
++++++++++++++++++++++++++++++++++++++++++++

cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin | Bin 0 -> 11204 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp2.bin | Bin 0 -> 11192 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp3.bin | Bin 0 -> 11204 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp4.bin | Bin 0 -> 11192 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp1.bin | Bin 0 -> 11196 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp2.bin | Bin 0 -> 11184 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp3.bin | Bin 0 -> 11196 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp4.bin | Bin 0 -> 11184 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp1.bin | Bin 0 -> 11208 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp2.bin | Bin 0 -> 11192 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp3.bin | Bin 0 -> 11208 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp4.bin | Bin 0 -> 11192 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp1.bin | Bin 0 -> 11200 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp2.bin | Bin 0 -> 11184 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp3.bin | Bin 0 -> 11200 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp4.bin | Bin 0 -> 11184 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp1.bin | Bin 0 -> 11180 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp2.bin | Bin 0 -> 11180 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp3.bin | Bin 0 -> 11180 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp4.bin | Bin 0 -> 11180 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp1.bin | Bin 0 -> 11188 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp2.bin | Bin 0 -> 11184 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp3.bin | Bin 0 -> 11188 bytes

cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp4.bin | Bin 0 -> 11184 bytes

cirrus/cs35l56/CS35L56_Rev3.11.11.wmfw               | Bin 0 -> 30516 bytes

26 files changed, 44 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp4.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.11.wmfw


------=_NextPart_000_000D_01DA7A0E.EB0E6190
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" =
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
class=3DWordSection1><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>We would =
like to add firmware files to support Cirrus Logic Smart =
Amp<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>CS35L56 for =
Dell XPS laptops<o:p></o:p></span></p><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;<o:p></=
o:p></span></p><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>Thanks,<o:p><=
/o:p></span></p><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;-Simon<=
o:p></o:p></span></p><p style=3D'margin:0cm'><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'><o:p>&nbsp;</=
o:p></span></p><p class=3DMsoNormal>The following changes since commit =
37d26b9bbd46c656f9f56badb460b4886ecabdc7:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; Merge =
branch 'tsse_fw' into 'main' (2024-03-19 12:08:19 =
+0000)<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>are available in the Git repository =
at:<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> cs35l56<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>for you to =
fetch changes up to =
57077702373e7ef40f0ca197724428d614bd92f8:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
linux-firmware: Add firmware for Cirrus CS35L56 for Dell laptops =
(2024-03-19 15:00:16 +0000)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>-------------------------------------------------------=
---------<o:p></o:p></p><p class=3DMsoNormal>Simon Trimmer =
(1):<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
linux-firmware: Add firmware for Cirrus CS35L56 for Dell =
laptops<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
44 ++++++++++++++++++++++++++++++++++++++++++++<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin =
| Bin 0 -&gt; 11204 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp2.bin | Bin 0 -&gt; 11192 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp3.bin | Bin 0 -&gt; 11204 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp4.bin | Bin 0 -&gt; 11192 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp1.bin | Bin 0 -&gt; 11196 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp2.bin | Bin 0 -&gt; 11184 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp3.bin | Bin 0 -&gt; 11196 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp4.bin | Bin 0 -&gt; 11184 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp1.bin | Bin 0 -&gt; 11208 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp2.bin | Bin 0 -&gt; 11192 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp3.bin | Bin 0 -&gt; 11208 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp4.bin | Bin 0 -&gt; 11192 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp1.bin | Bin 0 -&gt; 11200 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp2.bin | Bin 0 -&gt; 11184 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp3.bin | Bin 0 -&gt; 11200 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp4.bin | Bin 0 -&gt; 11184 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp1.bin | Bin 0 -&gt; 11180 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp2.bin | Bin 0 -&gt; 11180 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp3.bin | Bin 0 -&gt; 11180 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp4.bin | Bin 0 -&gt; 11180 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp1.bin | Bin 0 -&gt; 11188 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp2.bin | Bin 0 -&gt; 11184 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp3.bin | Bin 0 -&gt; 11188 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp4.bin | Bin 0 -&gt; 11184 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56/CS35L56_Rev3.11.11.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 30516 =
bytes<o:p></o:p></p><p class=3DMsoNormal> 26 files changed, 44 =
insertions(+)<o:p></o:p></p><p class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid1-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid0-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c63-spkid1-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid0-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280c6b-spkid1-amp4.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.11.11.wmfw<o:p></o:p></p></div></body></html>
------=_NextPart_000_000D_01DA7A0E.EB0E6190--
