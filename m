Return-Path: <SRS0=bI2Y=YH=opensource.cirrus.com=prvs=12140d0f1b=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0034CC19F28
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Aug 2022 15:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4A31C433D7; Wed,  3 Aug 2022 15:49:05 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B364C433D6
	for <linux-firmware@kernel.org>; Wed,  3 Aug 2022 15:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B364C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2736JDba000674
	for <linux-firmware@kernel.org>; Wed, 3 Aug 2022 10:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=UDL0DCfjPWqzspSkOZZe3nOj5S2ZKuJ8b+UIIOrdee0=;
 b=m7+bMMvs2dfWUvmTkLNYmAFnZkbWJ4GteoZoLt3v0iY50TfOHY9nlftwzpsHixxnF01D
 i7VGAC8EXKtNCwasHK3gn5DDymL8j9447Xzxmm+6zxY53FnQHMsfbxozOoTn6lcZI+At
 VTwwAj0vPZoHYhE9+H+d7qMHRXETncy3/8ma3vlE5UcMIWapIj8vDt31GSXLCXNIh+HN
 2FvoglTL8CTH+EW1mSgMAZQKmoPmo4sVMBQFCyRs7kY5MypHZFyaA81pKRWA7/gi7juW
 ZsgJotMJpikurYEXV9rVdoV8CcqvP+JFHB9URYKLhO0rZK1nn74tDh9UFm85JCCBDflI yA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hn222nsyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 03 Aug 2022 10:48:58 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 3 Aug 2022
 10:48:56 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Wed, 3 Aug 2022 10:48:56 -0500
Received: from LONN2DGDQ73 (unknown [198.90.238.229])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E17807C;
	Wed,  3 Aug 2022 15:48:55 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL v3 linux-firmware] Add firmware for Cirrus CS35L41
Date: Wed, 3 Aug 2022 16:48:56 +0100
Message-ID: <00a301d8a750$8a20fe70$9e62fb50$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00A4_01D8A758.EBE56670"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdinQYW0tmD1saodS9Wns1GbKR+LSg==
X-Proofpoint-GUID: 1-0T8du3d7IQyIxXhawtTlOoSE-p6bn9
X-Proofpoint-ORIG-GUID: 1-0T8du3d7IQyIxXhawtTlOoSE-p6bn9
X-Proofpoint-Spam-Reason: safe

------=_NextPart_000_00A4_01D8A758.EBE56670
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
 
We are adding firmware files to support Cirrus Logic smart amplifier 
CS35L41
 
Please, let me know if there are any problems.
 
Thanks,
 
Stefan Binding
 
changes since version 1:
 
Corrected LICENSE.cirrus
 
changes since version 2:
 
Updated LICENSE.cirrus
 
 
The following changes since commit
150864a4d73e8c448eb1e2c68e65f07635fe1a66:
 
  amdgpu partially revert "amdgpu: update beige goby to release 22.20"
(2022-07-25 14:16:04 -0400)
 
are available in the Git repository at:
 
  https://github.com/CirrusLogic/linux-firmware.git for-upstream
 
for you to fetch changes up to
feda1996d56d501a287fb6aa09cc1d46490a211a:
 
  linux-firmware: Add firmware for Cirrus CS35L41 (2022-08-03 16:14:51
+0100)
 
----------------------------------------------------------------
Vitaly Rodionov (1):
      linux-firmware: Add firmware for Cirrus CS35L41
 
LICENSE.cirrus                    | 182
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++
WHENCE                            |  17 ++++++++++++++++
cirrus/cs35l41-dsp1-spk-prot.bin  | Bin 0 -> 948 bytes
cirrus/cs35l41-dsp1-spk-prot.wmfw | Bin 0 -> 34056 bytes
4 files changed, 199 insertions(+)
create mode 100644 LICENSE.cirrus
create mode 100644 cirrus/cs35l41-dsp1-spk-prot.bin
create mode 100644 cirrus/cs35l41-dsp1-spk-prot.wmfw

------=_NextPart_000_00A4_01D8A758.EBE56670
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DProgId content=3DWord.Document><meta =
name=3DGenerator content=3D"Microsoft Word 15"><meta name=3DOriginator =
content=3D"Microsoft Word 15"><link rel=3DFile-List =
href=3D"cid:filelist.xml@01D8A758.EBB75190"><!--[if gte mso 9]><xml>
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.5pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
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
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:"Plain Text";
	mso-bidi-font-size:10.5pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-hansi-font-family:Calibri;}
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
class=3DWordSection1><p class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>Hi,<o:p></o:p></span></span></font></=
p><p class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>We are adding firmware files to =
support Cirrus Logic smart amplifier =
<o:p></o:p></span></span></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>CS35L41<o:p></o:p></span></span></fon=
t></p><p class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>Please, let me know if there are any =
problems.<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>Thanks,<o:p></o:p></span></span></fon=
t></p><p class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>Stefan =
Binding<o:p></o:p></span></span></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><o:p>&nbsp;</o:p></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>changes since version =
1:<o:p></o:p></span></span></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><o:p>&nbsp;</o:p></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>Corrected <span =
class=3DSpellE>LICENSE.cirrus</span><o:p></o:p></span></span></font></p><=
p class=3DMsoNormal><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>changes since version =
2:<o:p></o:p></span></span></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><o:p>&nbsp;</o:p></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>Updated <span =
class=3DSpellE>LICENSE.cirrus</span><o:p></o:p></span></span></font></p><=
p class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><o:p>&nbsp;</o:p></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-bidi-font-size:10.5pt'>The =
following changes since commit =
150864a4d73e8c448eb1e2c68e65f07635fe1a66:<o:p></o:p></span></span></font>=
</p><p class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'><span =
style=3D'mso-spacerun:yes'>&nbsp; </span><span =
class=3DSpellE>amdgpu</span> partially revert &quot;<span =
class=3DSpellE>amdgpu</span>: update beige goby to release 22.20&quot; =
(2022-07-25 14:16:04 -0400)<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>are available in the Git repository =
at:<o:p></o:p></span></span></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><o:p>&nbsp;</o:p></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'><span =
style=3D'mso-spacerun:yes'>&nbsp; </span><a =
href=3D"https://github.com/CirrusLogic/linux-firmware.git">https://github=
.com/CirrusLogic/linux-firmware.git</a> =
for-upstream<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>for you to fetch changes up to =
feda1996d56d501a287fb6aa09cc1d46490a211a:<o:p></o:p></span></span></font>=
</p><p class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'><span =
style=3D'mso-spacerun:yes'>&nbsp; </span><span =
class=3DSpellE>linux</span>-firmware: Add firmware for Cirrus CS35L41 =
(2022-08-03 16:14:51 +0100)<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 =
face=3DCalibri><o:p>&nbsp;</o:p></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>-------------------------------------=
---------------------------<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'>Vitaly Rodionov =
(1):<o:p></o:p></span></span></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
class=3DSpellE>linux</span>-firmware: Add firmware for Cirrus =
CS35L41<o:p></o:p></span></span></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><o:p>&nbsp;</o:p></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-bidi-font-size:10.5pt'> =
<span class=3DSpellE>LICENSE.cirrus</span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>| 182 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-bidi-font-size:10.5pt'> =
WHENCE<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
class=3DGramE>|<span style=3D'mso-spacerun:yes'>&nbsp; </span>17</span> =
++++++++++++++++<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-bidi-font-size:10.5pt'> =
<span class=3DGramE>cirrus/cs35l41-dsp1-spk-prot.bin<span =
style=3D'mso-spacerun:yes'>&nbsp; </span>|</span> Bin 0 -&gt; 948 =
bytes<o:p></o:p></span></span></font></p><p class=3DMsoPlainText><font =
size=3D2 face=3DCalibri><span style=3D'font-size:11.0pt'><span =
style=3D'mso-bidi-font-size:10.5pt'> cirrus/cs35l41-dsp1-spk-prot.wmfw | =
Bin 0 -&gt; 34056 bytes<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-bidi-font-size:10.5pt'> 4 =
files changed, 199 insertions(+)<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-bidi-font-size:10.5pt'> =
create mode 100644 <span =
class=3DSpellE>LICENSE.cirrus</span><o:p></o:p></span></span></font></p><=
p class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-bidi-font-size:10.5pt'> =
create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot.bin<o:p></o:p></span></span></font></p><p =
class=3DMsoPlainText><font size=3D2 face=3DCalibri><span =
style=3D'font-size:11.0pt'><span style=3D'mso-bidi-font-size:10.5pt'> =
create mode 100644 =
cirrus/cs35l41-dsp1-spk-prot.wmfw</span></span></font><span =
style=3D'mso-bidi-font-size:11.0pt;mso-ascii-font-family:Calibri;mso-hans=
i-font-family:Calibri'><o:p></o:p></span></p></div></body></html>
------=_NextPart_000_00A4_01D8A758.EBE56670--
