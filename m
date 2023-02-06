Return-Path: <SRS0=0xrh=6C=opensource.cirrus.com=prvs=7401b76335=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A366C05027
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Feb 2023 14:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3319C433EF; Mon,  6 Feb 2023 14:47:07 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91D6DC433D2
	for <linux-firmware@kernel.org>; Mon,  6 Feb 2023 14:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91D6DC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316COZvl019482
	for <linux-firmware@kernel.org>; Mon, 6 Feb 2023 08:47:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=i76jWYfzxV0IJGb4iZdCifZQJvj8EJE7vQLVcPnRcG0=;
 b=nH2CqTcmuqRolG2LOnJz038BaUb4g2aE9449VB+DKNrKjMnGTyhfqu+up3LXVX79KiAh
 OWo4i6nz+dDltj0bbrODVCpPX6yMGEiTIW2e3GHjgKmYdJcZPlDYGEHy+QmNI3Nf7oFZ
 SSshVP/qBN4+VJG6ywQZm/CBx3ta3aWCq/yYgb3lCEwHSX21szAfUNIBhVadlyfm8a1R
 CdfZ/zh6wlMqUCh0rHoCc2+euWDDjFWywxzFTC+3EXgTGtmuBFCUCNacPuD2QyK8mEGY
 hauJBIa+b39fa7UW70nxqjvg+uUPfBZPOwmMRI5C5g0aOxlj2rkS/zyrQKOIEzQuQoen IQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nhnn7tkp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 06 Feb 2023 08:47:00 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Mon, 6 Feb
 2023 08:46:57 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Mon, 6 Feb 2023 08:46:57 -0600
Received: from LONN2DGDQ73 (LONN2DGDQ73.ad.cirrus.com [198.90.238.52])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C1C911CC;
	Mon,  6 Feb 2023 14:46:57 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41 for additional laptops
Date: Mon, 6 Feb 2023 14:46:57 +0000
Message-ID: <004601d93a39$dcb02ae0$961080a0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0047_01D93A39.DCB1D890"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adk6ObIaq7tfxGuBTduAlJwuE2XynA==
Content-Language: en-gb
X-Proofpoint-GUID: Zug3xOLCoVPmlEOeCd0mJjdrfHvSdYsK
X-Proofpoint-ORIG-GUID: Zug3xOLCoVPmlEOeCd0mJjdrfHvSdYsK
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_0047_01D93A39.DCB1D890
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
 
We would like to add firmware files to support Cirrus Logic Smart Amp
CS35L41 for an ASUS Laptop UM3402.
Additionally, we have also added missing tuning files for 2 existing
HP laptops.
 
Thanks,
Stefan Binding
 
The following changes since commit
5c11a3742947810ee8bffbd476eb5a1b0c7999f2:
 
  amdgpu: Add VCN 4.0.2 firmware (2023-01-25 07:40:41 -0500)
 
are available in the Git repository at:
 
  https://github.com/CirrusLogic/linux-firmware.git for-upstream
 
for you to fetch changes up to
2fd61bc5d6d33e6804810418da96b58a0f00a41a:
 
  linux-firmware: Add firmware for Cirrus CS35L41 on UM3402 ASUS
Laptop (2023-02-06 14:34:10 +0000)
 
----------------------------------------------------------------
Stefan Binding (2):
      linux-firmware: Add missing tuning files for HP Laptops using
Cirrus Amps
      linux-firmware: Add firmware for Cirrus CS35L41 on UM3402 ASUS
Laptop
 
WHENCE                                              |  14
++++++++++++++
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin | Bin 0 -> 2012
bytes
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin | Bin 0 -> 2012
bytes
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin | Bin 0 -> 2012
bytes
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin | Bin 0 -> 2012
bytes
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin | Bin 0 -> 5532
bytes
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin | Bin 0 -> 5532
bytes
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin | Bin 0 -> 5532
bytes
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin | Bin 0 -> 5532
bytes
9 files changed, 14 insertions(+)
create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin
create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin
create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin
create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin
create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin
create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin
create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin
create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin

------=_NextPart_000_0047_01D93A39.DCB1D890
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DProgId content=3DWord.Document><meta =
name=3DGenerator content=3D"Microsoft Word 15"><meta name=3DOriginator =
content=3D"Microsoft Word 15"><link rel=3DFile-List =
href=3D"cid:filelist.xml@01D93A39.DC7EE1B0"><!--[if gte mso 9]><xml>
<o:OfficeDocumentSettings>
<o:AllowPNG/>
<o:DoNotRelyOnCSS/>
</o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:WordDocument>
<w:SpellingState>Clean</w:SpellingState>
<w:GrammarState>Clean</w:GrammarState>
<w:TrackMoves/>
<w:TrackFormatting/>
<w:EnvelopeVis/>
<w:PunctuationKerning/>
<w:ValidateAgainstSchemas/>
<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
<w:IgnoreMixedContent>false</w:IgnoreMixedContent>
<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
<w:DoNotPromoteQF/>
<w:LidThemeOther>EN-US</w:LidThemeOther>
<w:LidThemeAsian>X-NONE</w:LidThemeAsian>
<w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
<w:Compatibility>
<w:BreakWrappedTables/>
<w:SnapToGridInCell/>
<w:WrapTextWithPunct/>
<w:UseAsianBreakRules/>
<w:DontGrowAutofit/>
<w:SplitPgBreakAndParaMark/>
<w:EnableOpenTypeKerning/>
<w:DontFlipMirrorIndents/>
<w:OverrideTableStyleHps/>
</w:Compatibility>
<m:mathPr>
<m:mathFont m:val=3D"Cambria Math"/>
<m:brkBin m:val=3D"before"/>
<m:brkBinSub m:val=3D"&#45;-"/>
<m:smallFrac m:val=3D"off"/>
<m:dispDef/>
<m:lMargin m:val=3D"0"/>
<m:rMargin m:val=3D"0"/>
<m:defJc m:val=3D"centerGroup"/>
<m:wrapIndent m:val=3D"1440"/>
<m:intLim m:val=3D"subSup"/>
<m:naryLim m:val=3D"undOvr"/>
</m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"false" =
DefSemiHidden=3D"false" DefQFormat=3D"false" DefPriority=3D"99" =
LatentStyleCount=3D"376">
<w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" =
Name=3D"Normal"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" =
Name=3D"heading 1"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 8"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 9"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 1"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 2"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 3"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 4"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 5"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 6"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 7"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 8"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Normal Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"footnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"annotation text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"header"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"footer"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index heading"/>
<w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"table of figures"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"envelope address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"envelope return"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"footnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"annotation reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"line number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"page number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"endnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"endnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"table of authorities"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"macro"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toa heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 5"/>
<w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true" =
Name=3D"Title"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Closing"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Signature"/>
<w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Default Paragraph Font"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Message Header"/>
<w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" =
Name=3D"Subtitle"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Salutation"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Date"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text First Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text First Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Note Heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text Indent 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Block Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Hyperlink"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"FollowedHyperlink"/>
<w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" =
Name=3D"Strong"/>
<w:LsdException Locked=3D"false" Priority=3D"20" QFormat=3D"true" =
Name=3D"Emphasis"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Document Map"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Plain Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"E-mail Signature"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Top of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Bottom of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Normal (Web)"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Acronym"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Cite"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Code"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Definition"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Keyboard"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Preformatted"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Sample"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Typewriter"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Variable"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Normal Table"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"annotation subject"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"No List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Outline List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Outline List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Outline List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Simple 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Simple 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Simple 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Colorful 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Colorful 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Colorful 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table 3D effects 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table 3D effects 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table 3D effects 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Contemporary"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Elegant"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Professional"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Subtle 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Subtle 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Web 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Web 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Web 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Balloon Text"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Table Grid"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Theme"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Placeholder =
Text"/>
<w:LsdException Locked=3D"false" Priority=3D"1" QFormat=3D"true" =
Name=3D"No Spacing"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light =
Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful =
List"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful =
Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revision"/>
<w:LsdException Locked=3D"false" Priority=3D"34" QFormat=3D"true" =
Name=3D"List Paragraph"/>
<w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" =
Name=3D"Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"30" QFormat=3D"true" =
Name=3D"Intense Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true" =
Name=3D"Subtle Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"true" =
Name=3D"Intense Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"true" =
Name=3D"Subtle Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"32" QFormat=3D"true" =
Name=3D"Intense Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" =
Name=3D"Book Title"/>
<w:LsdException Locked=3D"false" Priority=3D"37" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Bibliography"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"TOC Heading"/>
<w:LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"44" Name=3D"Plain Table =
4"/>
<w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table =
5"/>
<w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table =
Light"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Mention"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Smart Hyperlink"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Hashtag"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Unresolved Mention"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Smart Link"/>
</w:LatentStyles>
</xml><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536869121 1107305727 33554432 0 415 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-469750017 -1073732485 9 0 511 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-ansi-font-size:11.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 10]><style>/* Style Definitions */
table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
</style><![endif]--><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" =
style=3D'tab-interval:36.0pt;word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt;mso-bidi-font-family:Calibri'>Hi,<o:p></o:p></s=
pan></font></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt;mso-bidi-font-family:Calibri'><o:p>&nbsp;</o:p>=
</span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt;mso-bidi-font-family:Calibri'>We would like to =
add firmware files to support Cirrus Logic Smart Amp CS35L41 for an ASUS =
Laptop </span>UM3402</font><span =
style=3D'mso-bidi-font-family:Calibri'>.<o:p></o:p></span></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt;mso-bidi-font-family:Calibri'>Additionally, we =
have also added missing tuning files for 2 existing HP =
laptops.<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt;mso-bidi-font-family:Calibri'><o:p>&nbsp;</o:p>=
</span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt;mso-bidi-font-family:Calibri'>Thanks,<o:p></o:p=
></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt;mso-bidi-font-family:Calibri'>Stefan =
Binding<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>The following changes since commit =
5c11a3742947810ee8bffbd476eb5a1b0c7999f2:<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-spacerun:yes'>&nbsp; =
</span><span class=3DSpellE>amdgpu</span>: Add VCN 4.0.2 firmware =
(2023-01-25 07:40:41 -0500)<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>are available in the Git repository =
at:<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-spacerun:yes'>&nbsp; =
</span><a =
href=3D"https://github.com/CirrusLogic/linux-firmware.git">https://github=
.com/CirrusLogic/linux-firmware.git</a> =
for-upstream<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>for you to fetch changes up to =
2fd61bc5d6d33e6804810418da96b58a0f00a41a:<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-spacerun:yes'>&nbsp; =
</span><span class=3DSpellE>linux</span>-firmware: Add firmware for =
Cirrus CS35L41 on UM3402 ASUS Laptop (2023-02-06 14:34:10 =
+0000)<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'>Stefan Binding =
(2):<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;</span><span =
class=3DSpellE>linux</span>-firmware: Add missing tuning files for HP =
Laptops using Cirrus Amps<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
class=3DSpellE>linux</span>-firmware: Add firmware for Cirrus CS35L41 on =
UM3402 ASUS Laptop<o:p></o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> WHENCE<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; </span><span class=3DGramE>|<span =
style=3D'mso-spacerun:yes'>&nbsp; </span>14</span> =
++++++++++++++<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin | Bin 0 -&gt; 2012 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin | Bin 0 -&gt; 2012 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin | Bin 0 -&gt; 2012 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin | Bin 0 -&gt; 2012 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin | Bin 0 -&gt; 5532 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin | Bin 0 -&gt; 5532 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin | Bin 0 -&gt; 5532 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> =
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin | Bin 0 -&gt; 5532 =
bytes<o:p></o:p></span></font></p><p class=3DMsoNormal><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'> 9 files changed, 14 =
insertions(+)<o:p></o:p></span></font></p><p class=3DMsoNormal><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'> create mode =
100755 =
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100755 =
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100755 =
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100755 =
cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100755 =
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100755 =
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100755 =
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin<o:p></o:p></span></fo=
nt></p><p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'> create mode 100755 =
cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin<o:p></o:p></span></fo=
nt></p></div></body></html>
------=_NextPart_000_0047_01D93A39.DCB1D890--
