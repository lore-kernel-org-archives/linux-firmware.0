Return-Path: <SRS0=0A6a=HN=filin321.com=cindy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05623C982DE
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Sep 2026 08:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BDD121F00893; Mon, 21 Sep 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.251.236.138
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789978087;
	b=Nc9sUmk7gSsP79H0w3eF8i0P4JKFwkQocIf/9/4FbZPoI3IiRWhcvTGalYO8r7jCo7P8
	 xlRWAuUehkEoZIbQ8ZISboWX6KgPpwvQfBOUFe8+nz0F4TnyDab22Fm4DKwAVSGJkKQkz
	 ov8kXOeVcYo5HW8H3z7oC5ZQfMSt8BbmGu8dnXIyu6slU0/+uxnVkNkD4RoYjVaItXzXu
	 WgNZd8FCnnTh3K//8fDrWM+JdaZz4tKr2yo8OIjPKJasLMmRFXD23mCv7Ls/p/QHHDDnD
	 KFR+rFc8XO3oimXIWaugQNDnC1iV0UoqJ71P/I/6VtmsKFIE6R1ZkU/6g7Q9TxzkF2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789978087;
	h=DMARC-Filter:Received:Received:Date:From:List-Id:To:Subject:
	 X-Priority:X-GUID:X-Has-Attach:X-Mailer:Mime-Version:Message-ID:
	 Content-Type;
	bh=CKhqr5EY32WjYmk6cgddmROILCOiJZo3dwayjGUHxbE=;
	b=XwAcjvjXAO40bysHSzXcumHqabo3ZcLTyOXlA1dF274S80+ZSWWED5n1zthN8EFVV8LE
	 IveMWhf+Tjuv8dqwCTpX3Tx4858qgJsyZVE+l16mQp1TFl2vTKHosEqEwpUNe78mn5MvR
	 ATcHURvXlvoTxTY+R/H6s8zGs8m8GsD15sJLe+W7dEYwN1UE3/vLzrag3uZuqFeumgumd
	 8a6fOV69pL+G0U+a1M9Ty9j+MUe+IZg1XBxBh/UGVlDGZaR/cklElC8caQeABrGgR1o1Y
	 Wax+yNpihqPbTj5r7dgxJeAWnoNcjAmMqkfcl2ekIVwjq8Bz2KHNHwkPOMtGw76tStg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=none header.from=filin321.com;
	spf=pass smtp.mailfrom=filin321.com;
	arc=none smtp.remote-ip=103.251.236.138
Received: from email1.8lian.cn.communilink.net (mail.filin321.com [103.251.236.138])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A53471F000FF
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 08:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A53471F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=filin321.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=filin321.com
Received: (qmail 25069 invoked by uid 0); 21 Sep 2026 07:49:44 -0000
Received: from unknown (HELO DESKTOP-EUB5OK8) (cindy@filin321.com@14.127.13.52)
  by 0 with ESMTPA; 21 Sep 2026 07:49:44 -0000
Date: Mon, 21 Sep 2026 16:07:48 +0800
From: "cindy@filin321.com" <cindy@filin321.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware <linux-firmware@kernel.org>
Subject: Stable Transit | Updated China-Spain Rail & Trucking Rates
X-Priority: 3
X-GUID: 3EAC5B3D-06C7-4724-803E-E2F092461523
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.542[cn]
Mime-Version: 1.0
Message-ID: <20260921160748058981182@filin321.com>
Content-Type: multipart/related;
	boundary="----=_001_NextPart708070222146_=----"

This is a multi-part message in MIME format.

------=_001_NextPart708070222146_=----
Content-Type: multipart/alternative;
	boundary="----=_002_NextPart844473052161_=----"


------=_002_NextPart844473052161_=----
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64

RGVhciBQYXJ0bmVyLA0KDQpIb3BlIGV2ZXJ5dGhpbmcgZ29lcyB3ZWxsIHdpdGggeW91Lg0KDQpP
dXIgY29tcGFueSBzcGVjaWFsaXplcyBpbiByYWlsICYgc2VhIG11bHRpbW9kYWwgc2VydmljZXMg
ZnJvbSBDaGluYSB0byBFdXJvcGUuIFdlIGN1cnJlbnRseSBwcm92aWRlIHN0YWJsZSB0cmFuc3Bv
cnRhdGlvbiBzZXJ2aWNlcyB0byBTcGFpbiwgYmFja2VkIGJ5IGd1YXJhbnRlZWQgc3BhY2UgYW5k
IHJlbGlhYmxlIHRyYW5zaXQgdGltZXMuIFNlYSBhbmQgQWlyIGZyZWlnaHQgc29sdXRpb25zIGFy
ZSBhbHNvIGF2YWlsYWJsZSB1cG9uIHlvdXIgcmVxdWVzdC4NCg0KRm9yIHlvdXIgcmVmZXJlbmNl
LCBvdXIgY3VycmVudCBzdGFuZGFyZCByYXRlcyBhcmU6DQoNCg0KDQpJZiB0aGVzZSByYXRlcyBh
bGlnbiB3aXRoIHlvdXIgdGFyZ2V0LCBvciBpZiB5b3UgbmVlZCBhIGNvbXBhcmlzb24gZm9yIG90
aGVyIHBvcnRzLCBmZWVsIGZyZWUgdG8gcmVwbHkgdG8gdGhpcyBlbWFpbC4NCg0KU2hvdWxkIHlv
dSBubyBsb25nZXIgd2lzaCB0byByZWNlaXZlIG91ciBlbWFpbHMsIHlvdSBtYXkgcmVwbHkgdG8g
dGhpcyBtZXNzYWdlIHRvIHVuc3Vic2NyaWJlLiBUaGFuayB5b3UhDQoNCg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpKb3llIFpob3UNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQrJ7tvauLvN+rTvuanTpsG0udzA7dPQz965q8u+DQpTaGVuemhlbiBGb3J3
YXJkIFN1cHBseSBDaGFpbiBNYW5hZ2VtZW50IEx0ZA0KUm0gMTAwNiBKaW5ydW4gQmxkZywgNjAx
OSBTaGVubmFuIEF2ZSwgRnV0aWFuIERpc3RyaWN0LCBTaGVuemhlbiwgQ2hpbmENClRlbKO6ICgr
ODYpIDA3NTUgODMzMiA5NDY5ICBGYXg6ICgrODYpIDA3NTUgODMzMiA5NDY5DQpNb2I6ICAoKzg2
KSAxNTk4NjcwOTY3NCANCkUtbWFpbDogam95ZS16aG91QGZ3ZC1sb2cuY29tIA0KUVE6ICAgIDEw
MjY0Nzc3MDIgICAgICAgICBXRSBDSEFUOnp6enpfMjIzDQpXaGF0c2FwcDooKzg2KTE1OTg2NzA5
Njc0DQpOVk9DQyBOTy4gOiBHRDIwMjIwNjA4MzEzNg0K

------=_002_NextPart844473052161_=----
Content-Type: text/html;
	charset="GB2312"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DGB2312"><style>body { line-height: 1.5; }p { margin-top: 0px; margin-b=
ottom: 0px; }.fox_html_content_dummy_textarea { position: absolute; overfl=
ow: hidden; width: 1px; height: 1px; opacity: 0; }body { font-size: 14px; =
font-family: "Microsoft YaHei UI"; color: rgb(0, 0, 0); line-height: 1.5; =
}</style></head><body>=0A<div><font face=3D"Microsoft JhengHei"><span></sp=
an></font><div><div><font face=3D"Microsoft JhengHei UI"><span style=3D"te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-dec=
oration-color: initial;"><b>Dear Partner,</b></span></font></div><div><fon=
t face=3D"Microsoft JhengHei UI"><span style=3D"text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;"=
><b><br></b></span></font></div><div><font face=3D"Microsoft JhengHei UI">=
<span style=3D"text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial;"><b>Hope everything goes well wit=
h you.</b></span></font></div><div><font face=3D"Microsoft JhengHei UI"><s=
pan style=3D"text-decoration-thickness: initial; text-decoration-style: in=
itial; text-decoration-color: initial;"><b><br></b></span></font></div><di=
v><font face=3D"Microsoft JhengHei UI"><span style=3D"text-decoration-thic=
kness: initial; text-decoration-style: initial; text-decoration-color: ini=
tial;"><b>Our company specializes in rail &amp; sea multimodal services fr=
om China to Europe. We currently provide stable transportation services to=
&nbsp;</b></span></font><font face=3D"Microsoft JhengHei UI"><span style=
=3D"text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial;"><b>Spain, backed by guaranteed space and re=
liable transit times.&nbsp;</b></span></font><b style=3D"background-color:=
 transparent; font-family: &quot;Microsoft JhengHei UI&quot;;">Sea</b><fon=
t face=3D"Microsoft JhengHei UI" style=3D"background-color: transparent;">=
<b>&nbsp;and&nbsp;</b></font><b style=3D"background-color: transparent; fo=
nt-family: &quot;Microsoft JhengHei UI&quot;;">Air</b><b style=3D"backgrou=
nd-color: transparent; font-family: &quot;Microsoft JhengHei UI&quot;;">&n=
bsp;freight solutions are also available upon your request.</b></div><div>=
<font face=3D"Microsoft JhengHei UI"><span style=3D"text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initi=
al;"><b><br></b></span></font></div><div><font face=3D"Microsoft JhengHei =
UI"><span style=3D"text-decoration-thickness: initial; text-decoration-sty=
le: initial; text-decoration-color: initial;"><b>For your reference, our c=
urrent standard rates are:</b></span></font></div><div><font style=3D"text=
-decoration-thickness: initial; text-decoration-style: initial; text-decor=
ation-color: initial;" face=3D"Microsoft JhengHei UI"><b><br></b></font></=
div><div><img src=3D"cid:_Foxmail.1@89638738-6bb6-dd12-291e-5e1f0aa86aa1" =
border=3D"0"></div><div><font face=3D"Microsoft JhengHei"><br></font></div=
><div><img src=3D"cid:_Foxmail.1@2691ab64-70e2-1d49-cd64-1252b0d760dc" bor=
der=3D"0"></div><div><font face=3D"Microsoft JhengHei"><br></font></div><d=
iv><div><font face=3D"Microsoft JhengHei UI"><b>If these rates align with =
your target, or if you need a comparison for other ports, feel free to rep=
ly to this email.</b></font></div></div><div><font face=3D"Microsoft Jheng=
Hei UI"><b><br></b></font></div></div></div><div><font face=3D"Microsoft J=
hengHei UI"><span style=3D"text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial;"><b>Should you no lon=
ger wish to receive our emails, you may reply to this message to unsubscri=
be. Thank you!</b></span></font></div><div><br></div><hr style=3D"width: 2=
10px; height: 1px;" color=3D"#b5c4df" size=3D"1" align=3D"left">=0A<div><s=
pan><div style=3D"MARGIN: 10px; FONT-FAMILY: verdana; FONT-SIZE: 10pt"><!-=
-[if gte mso 9]><xml>=0A <w:WordDocument>=0A  <w:View>Normal</w:View>=0A  =
<w:Zoom>0</w:Zoom>=0A  <w:TrackMoves></w:TrackMoves>=0A  <w:TrackFormattin=
g></w:TrackFormatting>=0A  <w:PunctuationKerning></w:PunctuationKerning>=
=0A  <w:DrawingGridVerticalSpacing>7.8 =B0=F5</w:DrawingGridVerticalSpacin=
g>=0A  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingG=
ridEvery>=0A  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawi=
ngGridEvery>=0A  <w:ValidateAgainstSchemas></w:ValidateAgainstSchemas>=0A =
 <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>=0A  <w:IgnoreMixedContent>=
false</w:IgnoreMixedContent>=0A  <w:AlwaysShowPlaceholderText>false</w:Alw=
aysShowPlaceholderText>=0A  <w:DoNotPromoteQF></w:DoNotPromoteQF>=0A  <w:L=
idThemeOther>EN-US</w:LidThemeOther>=0A  <w:LidThemeAsian>ZH-CN</w:LidThem=
eAsian>=0A  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>=0A  =
<w:Compatibility>=0A   <w:SpaceForUL></w:SpaceForUL>=0A   <w:BalanceSingle=
ByteDoubleByteWidth></w:BalanceSingleByteDoubleByteWidth>=0A   <w:DoNotLea=
veBackslashAlone></w:DoNotLeaveBackslashAlone>=0A   <w:ULTrailSpace></w:UL=
TrailSpace>=0A   <w:DoNotExpandShiftReturn></w:DoNotExpandShiftReturn>=0A =
  <w:AdjustLineHeightInTable></w:AdjustLineHeightInTable>=0A   <w:BreakWra=
ppedTables></w:BreakWrappedTables>=0A   <w:SnapToGridInCell></w:SnapToGrid=
InCell>=0A   <w:WrapTextWithPunct></w:WrapTextWithPunct>=0A   <w:UseAsianB=
reakRules></w:UseAsianBreakRules>=0A   <w:DontGrowAutofit></w:DontGrowAuto=
fit>=0A   <w:SplitPgBreakAndParaMark></w:SplitPgBreakAndParaMark>=0A   <w:=
EnableOpenTypeKerning></w:EnableOpenTypeKerning>=0A   <w:DontFlipMirrorInd=
ents></w:DontFlipMirrorIndents>=0A   <w:OverrideTableStyleHps></w:Override=
TableStyleHps>=0A   <w:UseFELayout></w:UseFELayout>=0A  </w:Compatibility>=
=0A  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>=0A  <m:ma=
thPr>=0A   <m:mathFont m:val=3D"Cambria Math"></m:mathFont>=0A   <m:brkBin=
 m:val=3D"before"></m:brkBin>=0A   <m:brkBinSub m:val=3D"&#45;-"></m:brkBi=
nSub>=0A   <m:smallFrac m:val=3D"off"></m:smallFrac>=0A   <m:dispDef></m:d=
ispDef>=0A   <m:lMargin m:val=3D"0"></m:lMargin>=0A   <m:rMargin m:val=3D"=
0"></m:rMargin>=0A   <m:defJc m:val=3D"centerGroup"></m:defJc>=0A   <m:wra=
pIndent m:val=3D"1440"></m:wrapIndent>=0A   <m:intLim m:val=3D"subSup"></m=
:intLim>=0A   <m:naryLim m:val=3D"undOvr"></m:naryLim>=0A  </m:mathPr></w:=
WordDocument>=0A</xml><![endif]--><!--[if gte mso 9]><xml>=0A <w:LatentSty=
les DefLockedState=3D"false" DefUnhideWhenUsed=3D"false"=0A  DefSemiHidden=
=3D"false" DefQFormat=3D"false" DefPriority=3D"99"=0A  LatentStyleCount=3D=
"376">=0A  <w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true=
" Name=3D"Normal"></w:LsdException>=0A  <w:LsdException Locked=3D"false" P=
riority=3D"9" QFormat=3D"true" Name=3D"heading 1"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   Unh=
ideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=
=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=
=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" Sem=
iHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"hea=
ding 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=
=3D"heading 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"tru=
e" Name=3D"heading 7"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=
=3D"true" Name=3D"heading 8"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true"=
 QFormat=3D"true" Name=3D"heading 9"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D=
"index 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidde=
n=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"index 3"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"inde=
x 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"=
true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 5"></w:LsdException>=0A  =
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tru=
e"=0A   Name=3D"index 6"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 7"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" U=
nhideWhenUsed=3D"true"=0A   Name=3D"index 8"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A  =
 Name=3D"index 9"></w:LsdException>=0A  <w:LsdException Locked=3D"false" P=
riority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"to=
c 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"39=
" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 2"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=
=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 3"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A =
  UnhideWhenUsed=3D"true" Name=3D"toc 4"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenU=
sed=3D"true" Name=3D"toc 5"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true=
" Name=3D"toc 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pr=
iority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc=
 7"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"39"=
 SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 8"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=
=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 9"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"=0A   Name=3D"Normal Indent"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"foo=
tnote text"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"annotation text"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"header"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"footer"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index heading"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=
=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"=0A   Name=3D"table of figures"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"envelope address"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Nam=
e=3D"envelope return"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"footnote refer=
ence"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D=
"true" UnhideWhenUsed=3D"true"=0A   Name=3D"annotation reference"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideW=
henUsed=3D"true"=0A   Name=3D"line number"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   N=
ame=3D"page number"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"endnote referenc=
e"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"endnote text"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"table of authorities"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A  =
 Name=3D"macro"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Sem=
iHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"toa heading"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"List"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D=
"List Bullet"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiH=
idden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Number"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWh=
enUsed=3D"true"=0A   Name=3D"List 2"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D=
"List 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List 4"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"List 5"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List =
Bullet 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidde=
n=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Bullet 3"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhen=
Used=3D"true"=0A   Name=3D"List Bullet 4"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Na=
me=3D"List Bullet 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Number 2">=
</w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true"=
 UnhideWhenUsed=3D"true"=0A   Name=3D"List Number 3"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"=0A   Name=3D"List Number 4"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List=
 Number 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"10" QFormat=3D"true" Name=3D"Title"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Closing"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHi=
dden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Signature"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"tr=
ue"=0A   UnhideWhenUsed=3D"true" Name=3D"Default Paragraph Font"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWh=
enUsed=3D"true"=0A   Name=3D"Body Text"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Body Text Indent"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Continue"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true=
" UnhideWhenUsed=3D"true"=0A   Name=3D"List Continue 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"List Continue 3"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"List Continue 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Continue 5=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tru=
e" UnhideWhenUsed=3D"true"=0A   Name=3D"Message Header"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" Nam=
e=3D"Subtitle"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Semi=
Hidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Salutation"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWh=
enUsed=3D"true"=0A   Name=3D"Date"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"B=
ody Text First Indent"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text Fir=
st Indent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHi=
dden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Note Heading"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWh=
enUsed=3D"true"=0A   Name=3D"Body Text 2"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Na=
me=3D"Body Text 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text Indent =
2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text Indent 3"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"Block Text"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D=
"Hyperlink"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"FollowedHyperlink"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"22" QFormat=
=3D"true" Name=3D"Strong"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" Priority=3D"20" QFormat=3D"true" Name=3D"Emphasis"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Document Map"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D=
"Plain Text"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHi=
dden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"E-mail Signature"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhi=
deWhenUsed=3D"true"=0A   Name=3D"HTML Top of Form"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
"=0A   Name=3D"HTML Bottom of Form"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"=
Normal (Web)"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiH=
idden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Acronym"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideW=
henUsed=3D"true"=0A   Name=3D"HTML Address"></w:LsdException>=0A  <w:LsdEx=
ception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   =
Name=3D"HTML Cite"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Code"></w:Ls=
dException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhid=
eWhenUsed=3D"true"=0A   Name=3D"HTML Definition"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"HTML Keyboard"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML P=
reformatted"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHi=
dden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Sample"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhe=
nUsed=3D"true"=0A   Name=3D"HTML Typewriter"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A  =
 Name=3D"HTML Variable"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Normal Table=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tru=
e" UnhideWhenUsed=3D"true"=0A   Name=3D"annotation subject"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"No List"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Out=
line List 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHi=
dden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Outline List 2"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"Outline List 3"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A=
   Name=3D"Table Simple 1"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Sim=
ple 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Simple 3"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhen=
Used=3D"true"=0A   Name=3D"Table Classic 1"></w:LsdException>=0A  <w:LsdEx=
ception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   =
Name=3D"Table Classic 2"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Class=
ic 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D=
"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Classic 4"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"Table Colorful 1"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   N=
ame=3D"Table Colorful 2"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Color=
ful 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Columns 1"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhe=
nUsed=3D"true"=0A   Name=3D"Table Columns 2"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A  =
 Name=3D"Table Columns 3"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Colu=
mns 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Columns 5"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhe=
nUsed=3D"true"=0A   Name=3D"Table Grid 1"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Na=
me=3D"Table Grid 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Grid 3"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" U=
nhideWhenUsed=3D"true"=0A   Name=3D"Table Grid 4"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"Table Grid 5"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table =
Grid 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Grid 7"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"Table Grid 8"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table List 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" S=
emiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table List 2"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unh=
ideWhenUsed=3D"true"=0A   Name=3D"Table List 3"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"Table List 4"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table =
List 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table List 6"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"Table List 7"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table List 8"></w:LsdException>=0A  <w:LsdException Locked=3D"false" S=
emiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table 3D effects 1=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tru=
e" UnhideWhenUsed=3D"true"=0A   Name=3D"Table 3D effects 2"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"Table 3D effects 3"></w:LsdException>=0A  <w:LsdEx=
ception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   =
Name=3D"Table Contemporary"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table =
Elegant"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Professional"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"Table Subtle 1"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A=
   Name=3D"Table Subtle 2"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Web=
 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"t=
rue" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Web 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Table Web 3"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"=
Balloon Text"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prior=
ity=3D"39" Name=3D"Table Grid"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table=
 Theme"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" Name=3D"Placeholder Text"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" Priority=3D"1" QFormat=3D"true" Name=3D"No Spacing"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"=
Light Shading"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"61" Name=3D"Light List"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" Priority=3D"62" Name=3D"Light Grid"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"64" Name=
=3D"Medium Shading 2"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"65" Name=3D"Medium List 1"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium =
Grid 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"68" Name=3D"Medium Grid 2"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"69" Name=3D"Medium Grid 3"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Col=
orful Shading"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"72" Name=3D"Colorful List"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" Priority=3D"73" Name=3D"Colorful Grid"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shadin=
g Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"61" Name=3D"Light List Accent 1"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent 1"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Mediu=
m Shading 1 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"64" Name=3D"Medium Shading 2 Accent 1"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 A=
ccent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" Name=3D"Revision"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"34" QFormat=3D"true"=0A   Name=3D"List Paragraph"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"29" QFor=
mat=3D"true" Name=3D"Quote"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"30" QFormat=3D"true"=0A   Name=3D"Intense Quote"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"66" Name=
=3D"Medium List 2 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Accent 1"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Gri=
d 2 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prior=
ity=3D"69" Name=3D"Medium Grid 3 Accent 1"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 1"></w:Ls=
dException>=0A  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"C=
olorful Shading Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" Priority=3D"72" Name=3D"Colorful List Accent 1"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"60" Name=3D"Light Shading Accent 2"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent 2"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Li=
ght Grid Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"63" Name=3D"Medium Shading 1 Accent 2"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"65" Name=3D"Medium List 1 Accent 2"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Accent 2"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"=
Medium Grid 1 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" Priority=3D"68" Name=3D"Medium Grid 2 Accent 2"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Ac=
cent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"70" Name=3D"Dark List Accent 2"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"71" Name=3D"Colorful Shading Accent 2"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colo=
rful List Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"73" Name=3D"Colorful Grid Accent 2"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Accent=
 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"61"=
 Name=3D"Light List Accent 3"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"62" Name=3D"Light Grid Accent 3"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shadi=
ng 1 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"64" Name=3D"Medium Shading 2 Accent 3"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Accent 3=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"66" N=
ame=3D"Medium List 2 Accent 3"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Accent 3"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Gr=
id 2 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"69" Name=3D"Medium Grid 3 Accent 3"></w:LsdException>=0A  <w:LsdEx=
ception Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 3"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"=
Colorful Shading Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"72" Name=3D"Colorful List Accent 3"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"60" Name=3D"Light Shading Accent 4"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent 4"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Li=
ght Grid Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"63" Name=3D"Medium Shading 1 Accent 4"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"65" Name=3D"Medium List 1 Accent 4"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Accent 4"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"=
Medium Grid 1 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" Priority=3D"68" Name=3D"Medium Grid 2 Accent 4"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Ac=
cent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"70" Name=3D"Dark List Accent 4"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"71" Name=3D"Colorful Shading Accent 4"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colo=
rful List Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"73" Name=3D"Colorful Grid Accent 4"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Accent=
 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"61"=
 Name=3D"Light List Accent 5"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"62" Name=3D"Light Grid Accent 5"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shadi=
ng 1 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"64" Name=3D"Medium Shading 2 Accent 5"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Accent 5=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"66" N=
ame=3D"Medium List 2 Accent 5"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Accent 5"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Gr=
id 2 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"69" Name=3D"Medium Grid 3 Accent 5"></w:LsdException>=0A  <w:LsdEx=
ception Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 5"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"=
Colorful Shading Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"72" Name=3D"Colorful List Accent 5"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Gri=
d Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"60" Name=3D"Light Shading Accent 6"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent 6"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Li=
ght Grid Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"63" Name=3D"Medium Shading 1 Accent 6"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"65" Name=3D"Medium List 1 Accent 6"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Accent 6"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"=
Medium Grid 1 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" Priority=3D"68" Name=3D"Medium Grid 2 Accent 6"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Ac=
cent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"70" Name=3D"Dark List Accent 6"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"71" Name=3D"Colorful Shading Accent 6"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colo=
rful List Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"73" Name=3D"Colorful Grid Accent 6"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true"=0A   Name=
=3D"Subtle Emphasis"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"21" QFormat=3D"true"=0A   Name=3D"Intense Emphasis"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"=
true"=0A   Name=3D"Subtle Reference"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"32" QFormat=3D"true"=0A   Name=3D"Intense Re=
ference"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"33" QFormat=3D"true" Name=3D"Book Title"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" Priority=3D"37" SemiHidden=3D"true"=0A   UnhideW=
henUsed=3D"true" Name=3D"Bibliography"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUse=
d=3D"true" QFormat=3D"true" Name=3D"TOC Heading"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table 1"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"=
Plain Table 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"43" Name=3D"Plain Table 3"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" Priority=3D"44" Name=3D"Plain Table 4"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table =
5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"40" =
Name=3D"Grid Table Light"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" Priority=3D"46" Name=3D"Grid Table 1 Light"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D=
"Grid Table 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"49" Name=3D"Grid Table 4"></w:LsdException>=0A  <w:LsdException Lo=
cked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table =
6 Colorful"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"52" Name=3D"Grid Table 7 Colorful"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"46"=0A   Name=3D"Grid Table 1 Light Accen=
t 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"47=
" Name=3D"Grid Table 2 Accent 1"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accent 1"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Tab=
le 4 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"50" Name=3D"Grid Table 5 Dark Accent 1"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table 6 Col=
orful Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pri=
ority=3D"52"=0A   Name=3D"Grid Table 7 Colorful Accent 1"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=0A   Name=3D"Grid T=
able 1 Light Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"47" Name=3D"Grid Table 2 Accent 2"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"49=
" Name=3D"Grid Table 4 Accent 2"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark Accent 2"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=0A   Name=
=3D"Grid Table 6 Colorful Accent 2"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" Priority=3D"52"=0A   Name=3D"Grid Table 7 Colorful Accent=
 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=
=0A   Name=3D"Grid Table 1 Light Accent 3"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accent 3"></w=
:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=
=3D"Grid Table 3 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"49" Name=3D"Grid Table 4 Accent 3"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5=
 Dark Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pri=
ority=3D"51"=0A   Name=3D"Grid Table 6 Colorful Accent 3"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   Name=3D"Grid T=
able 7 Colorful Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" Priority=3D"46"=0A   Name=3D"Grid Table 1 Light Accent 4"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid=
 Table 2 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"48" Name=3D"Grid Table 3 Accent 4"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accent 4"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Na=
me=3D"Grid Table 5 Dark Accent 4"></w:LsdException>=0A  <w:LsdException Lo=
cked=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table 6 Colorful Accent 4=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=
=0A   Name=3D"Grid Table 7 Colorful Accent 4"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"46"=0A   Name=3D"Grid Table 1 Light=
 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"47" Name=3D"Grid Table 2 Accent 5"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accent 5"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Gr=
id Table 4 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"50" Name=3D"Grid Table 5 Dark Accent 5"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table=
 6 Colorful Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"52"=0A   Name=3D"Grid Table 7 Colorful Accent 5"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=0A   Name=3D"=
Grid Table 1 Light Accent 6"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accent 6"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table =
3 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"49" Name=3D"Grid Table 4 Accent 6"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark Accent 6"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=0A  =
 Name=3D"Grid Table 6 Colorful Accent 6"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"52"=0A   Name=3D"Grid Table 7 Colorful A=
ccent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"46" Name=3D"List Table 1 Light"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" Priority=3D"47" Name=3D"List Table 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" N=
ame=3D"List Table 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"50" Name=3D"List Table 5 Dark"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Colorful"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"52" Name=
=3D"List Table 7 Colorful"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"46"=0A   Name=3D"List Table 1 Light Accent 1"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Lis=
t Table 2 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"48" Name=3D"List Table 3 Accent 1"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accent 1=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" N=
ame=3D"List Table 5 Dark Accent 1"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" Priority=3D"51"=0A   Name=3D"List Table 6 Colorful Accent =
1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=
=0A   Name=3D"List Table 7 Colorful Accent 1"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"46"=0A   Name=3D"List Table 1 Light=
 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"47" Name=3D"List Table 2 Accent 2"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accent 2"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Li=
st Table 4 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"50" Name=3D"List Table 5 Dark Accent 2"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"51"=0A   Name=3D"List Table=
 6 Colorful Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"52"=0A   Name=3D"List Table 7 Colorful Accent 2"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=0A   Name=3D"=
List Table 1 Light Accent 3"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"47" Name=3D"List Table 2 Accent 3"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table =
3 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"49" Name=3D"List Table 4 Accent 3"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark Accent 3"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=0A  =
 Name=3D"List Table 6 Colorful Accent 3"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"52"=0A   Name=3D"List Table 7 Colorful A=
ccent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"46"=0A   Name=3D"List Table 1 Light Accent 4"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accent=
 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"48"=
 Name=3D"List Table 3 Accent 4"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" Priority=3D"49" Name=3D"List Table 4 Accent 4"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Tabl=
e 5 Dark Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"51"=0A   Name=3D"List Table 6 Colorful Accent 4"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   Name=3D"Lis=
t Table 7 Colorful Accent 4"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"46"=0A   Name=3D"List Table 1 Light Accent 5"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"=
List Table 2 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"48" Name=3D"List Table 3 Accent 5"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50=
" Name=3D"List Table 5 Dark Accent 5"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" Priority=3D"51"=0A   Name=3D"List Table 6 Colorful Acce=
nt 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"5=
2"=0A   Name=3D"List Table 7 Colorful Accent 5"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" Priority=3D"46"=0A   Name=3D"List Table 1 Lig=
ht Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priori=
ty=3D"47" Name=3D"List Table 2 Accent 6"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accent 6"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"=
List Table 4 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"50" Name=3D"List Table 5 Dark Accent 6"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=0A   Name=3D"List Ta=
ble 6 Colorful Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" Priority=3D"52"=0A   Name=3D"List Table 7 Colorful Accent 6"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"Mention"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Smart Hyperlink"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Hashtag"></w:Ls=
dException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhid=
eWhenUsed=3D"true"=0A   Name=3D"Unresolved Mention"></w:LsdException>=0A  =
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tru=
e"=0A   Name=3D"Smart Link"></w:LsdException>=0A </w:LatentStyles>=0A</xml=
><![endif]-->=0A<!--[if gte mso 10]>=0A<style>=0A /* Style Definitions */=
=0A table.MsoNormalTable=0A	{mso-style-name:=C6=D5=CD=A8=B1=ED=B8=F1;=0A	m=
so-tstyle-rowband-size:0;=0A	mso-tstyle-colband-size:0;=0A	mso-style-nosho=
w:yes;=0A	mso-style-priority:99;=0A	mso-style-parent:"";=0A	mso-padding-al=
t:0cm 5.4pt 0cm 5.4pt;=0A	mso-para-margin:0cm;=0A	mso-pagination:widow-orp=
han;=0A	font-size:10.0pt;=0A	font-family:"Times New Roman",serif;}=0A</sty=
le>=0A<![endif]-->=0A<!--StartFragment-->=0A<p class=3D"MsoNormal" align=
=3D"left" style=3D"text-align: justify; background-image: initial; backgro=
und-position: initial; background-size: initial; background-repeat: initia=
l; background-attachment: initial; background-origin: initial; background-=
clip: initial; margin: 0px 0cm; font-size: 10.5pt; font-family: =B5=C8=CF=
=DF;"><b><span lang=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;=
Calibri&quot;,sans-serif;color:#333399;=0Amso-ligatures:none">Best regards=
,<br>=0AJoye Zhou</span></b><span lang=3D"EN-US" style=3D"font-family:&quo=
t;Microsoft YaHei UI&quot;,sans-serif;=0Acolor:#333399;mso-ligatures:none"=
><br>=0A-----------------------------------------------------<br>=0A</span=
><span style=3D"font-family:&quot;Microsoft YaHei UI&quot;,sans-serif;colo=
r:#333399;=0Amso-ligatures:none">=C9=EE=DB=DA=B8=BB=CD=FA=B4=EF=B9=A9=D3=
=A6=C1=B4=B9=DC=C0=ED=D3=D0=CF=DE=B9=AB=CB=BE<span lang=3D"EN-US"><br>=0A<=
b>Shenzhen Forward Supply Chain Management Ltd</b><br>=0A<b>Rm 1006 Jinrun=
 Bldg, 6019 Shennan Ave, Futian District, Shenzhen, China</b><br>=0A</span=
></span><span lang=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;=0Acolor:#333399;mso-ligatures:none">Tel</span><sp=
an style=3D"font-size:11.5pt;=0Afont-family:&quot;Microsoft YaHei UI&quot;=
,sans-serif;color:#333399;mso-ligatures:none">=A3=BA</span><span lang=3D"E=
N-US" style=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sans-serif=
;color:#333399;=0Amso-ligatures:none"> (+86) 0755 8332 9469&nbsp; Fax: (+8=
6) 0755 8332 9469<br>=0AMob:&nbsp; (+86) 15986709674&nbsp;</span><span lan=
g=3D"EN-US" style=3D"font-family: &quot;Microsoft YaHei UI&quot;, sans-ser=
if;"><o:p></o:p></span></p>=0A<p class=3D"MsoNormal" align=3D"left" style=
=3D"text-align: justify; background-image: initial; background-position: i=
nitial; background-size: initial; background-repeat: initial; background-a=
ttachment: initial; background-origin: initial; background-clip: initial; =
margin: 0px 0cm; font-size: 10.5pt; font-family: =B5=C8=CF=DF;"><span lang=
=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sans-=
serif;color:#333399;=0Amso-ligatures:none">E-mail:&nbsp;<a href=3D"mailto:=
joye-zhou@fwd-log.com" style=3D"color: rgb(5, 99, 193);"><span style=3D"co=
lor:blue">joye-zhou@fwd-log.com</span></a>&nbsp;</span><span lang=3D"EN-US=
" style=3D"font-family: &quot;Microsoft YaHei UI&quot;, sans-serif;"><o:p>=
</o:p></span></p>=0A<p class=3D"MsoNormal" align=3D"left" style=3D"text-al=
ign: justify; background-image: initial; background-position: initial; bac=
kground-size: initial; background-repeat: initial; background-attachment: =
initial; background-origin: initial; background-clip: initial; margin: 0px=
 0cm; font-size: 10.5pt; font-family: =B5=C8=CF=DF;"><span lang=3D"EN-US" =
style=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sans-serif;color=
:#333399;=0Amso-ligatures:none">QQ:&nbsp;&nbsp;&nbsp;=0A1026477702&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WE CHAT:zzzz_223<br>=0AWhatsapp:(=
+86)15986709674<br>=0ANVOCC NO. : GD202206083136</span><span lang=3D"EN-US=
" style=3D"font-family: &quot;Microsoft YaHei UI&quot;, sans-serif;"><o:p>=
</o:p></span></p>=0A<!--EndFragment--></div></span></div>=0A</body></html>
------=_002_NextPart844473052161_=------

------=_001_NextPart708070222146_=----
Content-Type: image/png;
	name="InsertPic_(09-21(09-21-16-07-38).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@89638738-6bb6-dd12-291e-5e1f0aa86aa1>

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

------=_001_NextPart708070222146_=----
Content-Type: image/png;
	name="InsertPic_9BF0(0(09-21-16-07-38).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@2691ab64-70e2-1d49-cd64-1252b0d760dc>

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
AACgKv4f3rv+/kyHXzgAAAAASUVORK5CYII=

------=_001_NextPart708070222146_=------

