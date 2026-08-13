Return-Path: <SRS0=puHF=GG=filin321.com=Cindy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA948C5CFDB
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Aug 2026 09:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1D1A1F00A3A; Thu, 13 Aug 2026 09:14:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.251.236.138
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786612497;
	b=sVRt/7plUFtpa3wQm7s5d/fQbQf8nSFLmGDuZLLUT0hPWqS+W/rdBMUTBN0ZYAwiafgM
	 R6cnQPluS8bneeKC3FAK+aeAzOLKeL3GtuSMBoojVDnkImss1kxcNoj2VmReixBQtxRNC
	 wcTPTuNkMOx+TyrjSe1UzOihhvlZ/zSkuCiHtRUK9sGyO+6Pvpi6CBpk2K8h7j3Oel4lS
	 4XzCuC1mWvPh82z0wopAUN5rSXXXNar/oWaG68zCBfsJarGB48xpq4+Zah2YRnNkzH49V
	 7I4Qb5iGabQQQ4A3pZEnwnXL8ig94VRGEmP0NRpXVDqRTM7mxmKqyDwkawtYRmnYgpA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786612497;
	h=DMARC-Filter:Received:Received:Date:From:List-Id:To:Subject:
	 X-Priority:X-GUID:X-Has-Attach:X-Mailer:Mime-Version:Message-ID:
	 Content-Type;
	bh=bIlG0qbb0ehB/1xu1vVDnqTqQXqdb95+v3CXlueg1ZQ=;
	b=1WDCcuFybkDURJ8upSXI7f9X1nyGF7mbro/NxePSP1L9LfUgRCIblzV9FAndJhSKpGYw
	 //uEtXwkQNnNVAlP7HAX9AGknxS21r1oh5A1E86Po9gAwKAr8SMswunNizpbsccysQKss
	 dKjhUGSVBMVzfU8T3SZFxzNVFD24KnDhIh1nNoNTKabgH9PQB6prNPb1NurEfvq2CrWzU
	 sD7UcuRWp5VP97Pypxu59wOpA+4d7Gq8Z+tKYBdi88zyGlB+9Xr28df2PYUql2VBTeaf+
	 5ew4Jgz0+QMHpJD/7d/4gFyhJbEhHIQiWZXWcXHsfwtNxQNkIDF/9qMHMTc9R+poxwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=none header.from=filin321.com;
	spf=pass smtp.mailfrom=filin321.com;
	arc=none smtp.remote-ip=103.251.236.138
Received: from email1.8lian.cn.communilink.net (mail.filin321.com [103.251.236.138])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 695061F000E9
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 09:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 695061F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=filin321.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=filin321.com
Received: (qmail 24981 invoked by uid 0); 13 Aug 2026 08:56:49 -0000
Received: from unknown (HELO Foxmail) (Cindy@filin321.com@14.154.31.241)
  by 0 with ESMTPA; 13 Aug 2026 08:56:48 -0000
Date: Thu, 13 Aug 2026 17:13:21 +0800
From: "Cindy@filin321.com" <Cindy@filin321.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware <linux-firmware@kernel.org>
Subject: =?UTF-8?B?U3RhYmxlIFRyYW5zaXQgfCBVcGRhdGVkIENoaW5h4oCRU3BhaW4gUmFpbCAmIFRydWNraW5nIEZyZWlnaHQgVXBkYXRl?=
X-Priority: 3
X-GUID: 699914E7-9B2A-4310-B69F-83E519AB0ECE
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.563[cn]
Mime-Version: 1.0
Message-ID: <20260813171317892542172@filin321.com>
Content-Type: multipart/related;
	boundary="----=_001_NextPart061671513844_=----"

This is a multi-part message in MIME format.

------=_001_NextPart061671513844_=----
Content-Type: multipart/alternative;
	boundary="----=_002_NextPart210640643684_=----"


------=_002_NextPart210640643684_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkhvcGUgZXZlcnl0aGluZyBnb2VzIHdlbGwgd2l0aCB5b3UuDQoNCldlIHNwZWNp
YWxpemUgaW4gQ2hpbmHigJFFdXJvcGUgbXVsdGltb2RhbCBsb2dpc3RpY3MuIEJlbG93IHBsZWFz
ZSBmaW5kIG91ciBsYXRlc3QgcmFpbCAmIGRpcmVjdCB0cnVja2luZyByYXRlcyB0byBTcGFpbiwg
ZWZmZWN0aXZlIDEtQXVnLg0KDQrinIUgQ2hpbmEgUmFpbHdheSB0byBTcGFpbg0KWWl3dSBkZXBh
cnR1cmVzIHRvIE1hZHJpZA0KUmF0ZSByYW5nZTogVVNEIDIwMCBwZXIgQ0JNLCB0cmFuc2l0OjMw
IGRheXMNCg0K4pyFIERpcmVjdCBUcnVja2luZyBmcm9tIFVydW1xaQ0KVG8gRHVpc2J1cmc6IFVT
RDIwMCBwZXIgQ0JNLCB0cmFuc2l0OjE4IGRheXMNClRvIEhhbWJ1cmc6IFVTRDE3MCBwZXIgQ0JN
LHRyYW5zaXQ6MTcgZGF5cw0KDQpXZSBndWFyYW50ZWUgc3RhYmxlIGJvb2tpbmcgc3BhY2UgYW5k
IHByZWRpY3RhYmxlIHRyYW5zaXQgdGltZS4gU2VhIC8gQWlyIHNlcnZpY2VzIGFyZSBhbHNvIGF2
YWlsYWJsZSB1cG9uIHJlcXVlc3QuDQoNCklmIHlvdSBoYXZlIHVwY29taW5nIGNhcmdvIG1vdmlu
ZyB0byBTcGFpbiwgd2VsY29tZSB0byBzZW5kIHVzIHlvdXIgc2hpcG1lbnQgZGV0YWlscyBmb3Ig
YSBmb3JtYWwgb2ZmZXIuDQoNCg0KDQoNCg0KQmVzdCByZWdhcmRzLA0KSm95ZSBaaG91DQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K5rex5Zyz
5a+M5pe66L6+5L6b5bqU6ZO+566h55CG5pyJ6ZmQ5YWs5Y+4DQpTaGVuemhlbiBGb3J3YXJkIFN1
cHBseSBDaGFpbiBNYW5hZ2VtZW50IEx0ZA0KUm0gMTAwNiBKaW5ydW4gQmxkZywgNjAxOSBTaGVu
bmFuIEF2ZSwgRnV0aWFuIERpc3RyaWN0LCBTaGVuemhlbiwgQ2hpbmENClRlbO+8miAoKzg2KSAw
NzU1IDgzMzIgOTQ2OSAgRmF4OiAoKzg2KSAwNzU1IDgzMzIgOTQ2OQ0KTW9iOiAgKCs4NikgMTU5
ODY3MDk2NzQgDQpFLW1haWw6IGpveWUtemhvdUBmd2QtbG9nLmNvbSANClFROiAgICAxMDI2NDc3
NzAyICAgICAgICAgV0UgQ0hBVDp6enp6XzIyMw0KV2hhdHNhcHA6KCs4NikxNTk4NjcwOTY3NA0K
TlZPQ0MgTk8uIDogR0QyMDIyMDYwODMxMzYNCg==

------=_002_NextPart210640643684_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }p { margin-top: 0px; margin-bo=
ttom: 0px; }.fox_html_content_dummy_textarea { position: absolute; overflo=
w: hidden; width: 1px; height: 1px; opacity: 0; }body { font-size: 14px; f=
ont-family: "Microsoft YaHei UI"; color: rgb(0, 0, 0); line-height: 1.5; }=
</style></head><body>=0A<div><span></span><div><div>Hello,</div><div><br><=
/div><div>Hope everything goes well with you.</div><div><br></div><div><sp=
an style=3D"text-decoration-thickness: initial; text-decoration-style: ini=
tial; text-decoration-color: initial;">We specialize in China=E2=80=91Euro=
pe multimodal logistics. Below please find our latest rail &amp; direct tr=
ucking rates to Spain, effective 1-Aug.</span></div><div><span style=3D"te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-dec=
oration-color: initial;"><br></span></div><div><div><span style=3D"text-de=
coration-thickness: initial; text-decoration-style: initial; text-decorati=
on-color: initial;">=E2=9C=85 China Railway to Spain</span></div><div><spa=
n style=3D"text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial;">Yiwu departures to Madrid</span></di=
v><div><span style=3D"text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial;">Rate range: USD 200 per C=
BM, transit:30 days</span></div><div><span style=3D"text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initi=
al;"><br></span></div><div><span style=3D"text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">=E2=
=9C=85 Direct Trucking from Urumqi</span></div><div><span style=3D"text-de=
coration-thickness: initial; text-decoration-style: initial; text-decorati=
on-color: initial;">To Duisburg: USD200&nbsp;per&nbsp;CBM, transit:18 days=
</span></div><div><span style=3D"text-decoration-thickness: initial; text-=
decoration-style: initial; text-decoration-color: initial;">To Hamburg: US=
D170&nbsp;per&nbsp;CBM,transit:17 days</span></div></div><div><span style=
=3D"text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial;"><br></span></div><div><div><span style=3D"t=
ext-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;">We guarantee stable booking space and predictabl=
e transit time. Sea / Air services are also available upon request.</span>=
</div><div><span style=3D"text-decoration-thickness: initial; text-decorat=
ion-style: initial; text-decoration-color: initial;"><br></span></div><div=
><span style=3D"text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial;">If you have upcoming cargo movi=
ng to Spain, welcome to send us your shipment details for a formal offer.<=
/span></div></div></div></div><div><br></div><div><img src=3D"cid:_Foxmail=
.1@fd882404-9a0c-6129-b6ca-5dc313585560" border=3D"0"></div><div><br></div=
><div><img src=3D"cid:_Foxmail.1@0c576572-8853-a8fe-0c3b-3a6e871c6a1c" bor=
der=3D"0"></div><div><br></div><hr style=3D"width: 210px; height: 1px;" co=
lor=3D"#b5c4df" size=3D"1" align=3D"left">=0A<div><span><div style=3D"MARG=
IN: 10px; FONT-FAMILY: verdana; FONT-SIZE: 10pt"><!--[if gte mso 9]><xml>=
=0A <w:WordDocument>=0A  <w:View>Normal</w:View>=0A  <w:Zoom>0</w:Zoom>=0A=
  <w:TrackMoves></w:TrackMoves>=0A  <w:TrackFormatting></w:TrackFormatting=
>=0A  <w:PunctuationKerning></w:PunctuationKerning>=0A  <w:DrawingGridVert=
icalSpacing>7.8 =E7=A3=85</w:DrawingGridVerticalSpacing>=0A  <w:DisplayHor=
izontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>=0A  <w:Dis=
playVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>=0A  <w:=
ValidateAgainstSchemas></w:ValidateAgainstSchemas>=0A  <w:SaveIfXMLInvalid=
>false</w:SaveIfXMLInvalid>=0A  <w:IgnoreMixedContent>false</w:IgnoreMixed=
Content>=0A  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderTe=
xt>=0A  <w:DoNotPromoteQF></w:DoNotPromoteQF>=0A  <w:LidThemeOther>EN-US</=
w:LidThemeOther>=0A  <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>=0A  <w:LidTh=
emeComplexScript>X-NONE</w:LidThemeComplexScript>=0A  <w:Compatibility>=0A=
   <w:SpaceForUL></w:SpaceForUL>=0A   <w:BalanceSingleByteDoubleByteWidth>=
</w:BalanceSingleByteDoubleByteWidth>=0A   <w:DoNotLeaveBackslashAlone></w=
:DoNotLeaveBackslashAlone>=0A   <w:ULTrailSpace></w:ULTrailSpace>=0A   <w:=
DoNotExpandShiftReturn></w:DoNotExpandShiftReturn>=0A   <w:AdjustLineHeigh=
tInTable></w:AdjustLineHeightInTable>=0A   <w:BreakWrappedTables></w:Break=
WrappedTables>=0A   <w:SnapToGridInCell></w:SnapToGridInCell>=0A   <w:Wrap=
TextWithPunct></w:WrapTextWithPunct>=0A   <w:UseAsianBreakRules></w:UseAsi=
anBreakRules>=0A   <w:DontGrowAutofit></w:DontGrowAutofit>=0A   <w:SplitPg=
BreakAndParaMark></w:SplitPgBreakAndParaMark>=0A   <w:EnableOpenTypeKernin=
g></w:EnableOpenTypeKerning>=0A   <w:DontFlipMirrorIndents></w:DontFlipMir=
rorIndents>=0A   <w:OverrideTableStyleHps></w:OverrideTableStyleHps>=0A   =
<w:UseFELayout></w:UseFELayout>=0A  </w:Compatibility>=0A  <w:BrowserLevel=
>MicrosoftInternetExplorer4</w:BrowserLevel>=0A  <m:mathPr>=0A   <m:mathFo=
nt m:val=3D"Cambria Math"></m:mathFont>=0A   <m:brkBin m:val=3D"before"></=
m:brkBin>=0A   <m:brkBinSub m:val=3D"&#45;-"></m:brkBinSub>=0A   <m:smallF=
rac m:val=3D"off"></m:smallFrac>=0A   <m:dispDef></m:dispDef>=0A   <m:lMar=
gin m:val=3D"0"></m:lMargin>=0A   <m:rMargin m:val=3D"0"></m:rMargin>=0A  =
 <m:defJc m:val=3D"centerGroup"></m:defJc>=0A   <m:wrapIndent m:val=3D"144=
0"></m:wrapIndent>=0A   <m:intLim m:val=3D"subSup"></m:intLim>=0A   <m:nar=
yLim m:val=3D"undOvr"></m:naryLim>=0A  </m:mathPr></w:WordDocument>=0A</xm=
l><![endif]--><!--[if gte mso 9]><xml>=0A <w:LatentStyles DefLockedState=
=3D"false" DefUnhideWhenUsed=3D"false"=0A  DefSemiHidden=3D"false" DefQFor=
mat=3D"false" DefPriority=3D"99"=0A  LatentStyleCount=3D"376">=0A  <w:LsdE=
xception Locked=3D"false" Priority=3D"0" QFormat=3D"true" Name=3D"Normal">=
</w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" QFor=
mat=3D"true" Name=3D"heading 1"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"tru=
e" QFormat=3D"true" Name=3D"heading 2"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=
=3D"true" QFormat=3D"true" Name=3D"heading 3"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true=
"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=
=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" Sem=
iHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"hea=
ding 8"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=
=3D"heading 9"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Semi=
Hidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 1"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenU=
sed=3D"true"=0A   Name=3D"index 2"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"i=
ndex 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 4"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"index 5"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"inde=
x 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"=
true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 7"></w:LsdException>=0A  =
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tru=
e"=0A   Name=3D"index 8"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 9"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiH=
idden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 1"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true=
"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 2"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   Unhide=
WhenUsed=3D"true" Name=3D"toc 3"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"t=
rue" Name=3D"toc 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"=
toc 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"=
39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 6"></w:Ls=
dException>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidde=
n=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 7"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=
=0A   UnhideWhenUsed=3D"true" Name=3D"toc 8"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   UnhideW=
henUsed=3D"true" Name=3D"toc 9"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Norm=
al Indent"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidd=
en=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"footnote text"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhe=
nUsed=3D"true"=0A   Name=3D"annotation text"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A  =
 Name=3D"header"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Se=
miHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"footer"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhen=
Used=3D"true"=0A   Name=3D"index heading"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" Priority=3D"35" SemiHidden=3D"true"=0A   UnhideWhen=
Used=3D"true" QFormat=3D"true" Name=3D"caption"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"table of figures"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"enve=
lope address"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiH=
idden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"envelope return"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhi=
deWhenUsed=3D"true"=0A   Name=3D"footnote reference"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"=0A   Name=3D"annotation reference"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"line number"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Se=
miHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"page number"></w:Ls=
dException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhid=
eWhenUsed=3D"true"=0A   Name=3D"endnote reference"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
"=0A   Name=3D"endnote text"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"table =
of authorities"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Sem=
iHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"macro"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"toa heading"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"List"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidde=
n=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Bullet"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"List Number"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"List 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List 3"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"List 4"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List =
5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"List Bullet 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"List Bullet 3"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"List Bullet 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Bullet 5"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" U=
nhideWhenUsed=3D"true"=0A   Name=3D"List Number 2"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
"=0A   Name=3D"List Number 3"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List N=
umber 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Number 5"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true=
" Name=3D"Title"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Se=
miHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Closing"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhe=
nUsed=3D"true"=0A   Name=3D"Signature"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"1" SemiHidden=3D"true"=0A   UnhideWhenUsed=
=3D"true" Name=3D"Default Paragraph Font"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Na=
me=3D"Body Text"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Se=
miHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text Indent"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"=0A   Name=3D"List Continue"></w:LsdException>=0A  =
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tru=
e"=0A   Name=3D"List Continue 2"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Lis=
t Continue 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiH=
idden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Continue 4"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhi=
deWhenUsed=3D"true"=0A   Name=3D"List Continue 5"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"Message Header"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"11" QFormat=3D"true" Name=3D"Subtitle"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenU=
sed=3D"true"=0A   Name=3D"Salutation"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Date"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidde=
n=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text First Indent"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" U=
nhideWhenUsed=3D"true"=0A   Name=3D"Body Text First Indent 2"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenU=
sed=3D"true"=0A   Name=3D"Note Heading"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Body Text 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Se=
miHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text 3"></w:Ls=
dException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhid=
eWhenUsed=3D"true"=0A   Name=3D"Body Text Indent 2"></w:LsdException>=0A  =
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tru=
e"=0A   Name=3D"Body Text Indent 3"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"=
Block Text"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Hyperlink"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"FollowedHyperlink"></w:LsdException>=0A  <w:LsdEx=
ception Locked=3D"false" Priority=3D"22" QFormat=3D"true" Name=3D"Strong">=
</w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"20" QFo=
rmat=3D"true" Name=3D"Emphasis"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Docu=
ment Map"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidde=
n=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Plain Text"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"E-mail Signature"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Na=
me=3D"HTML Top of Form"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Bottom =
of Form"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Normal (Web)"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"HTML Acronym"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"HTML Address"></w:LsdException>=0A  <w:LsdException Locked=3D"false" S=
emiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Cite"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"HTML Code"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Na=
me=3D"HTML Definition"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Keyboard=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tru=
e" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Preformatted"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"HTML Sample"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"=
HTML Typewriter"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Se=
miHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Variable"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unh=
ideWhenUsed=3D"true"=0A   Name=3D"Normal Table"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"annotation subject"></w:LsdException>=0A  <w:LsdException Lo=
cked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"No=
 List"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Outline List 1"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhen=
Used=3D"true"=0A   Name=3D"Outline List 2"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   N=
ame=3D"Outline List 3"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Simple =
1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Simple 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Table Simple 3"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table Classic 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Classic 2=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tru=
e" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Classic 3"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Table Classic 4"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table Colorful 1"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Colorful=
 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"t=
rue" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Colorful 3"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"Table Columns 1"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Nam=
e=3D"Table Columns 2"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Columns =
3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Columns 4"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Table Columns 5"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table Grid 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" S=
emiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Grid 2"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unh=
ideWhenUsed=3D"true"=0A   Name=3D"Table Grid 3"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"Table Grid 4"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table =
Grid 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Grid 6"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"Table Grid 7"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table Grid 8"></w:LsdException>=0A  <w:LsdException Locked=3D"false" S=
emiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table List 1"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unh=
ideWhenUsed=3D"true"=0A   Name=3D"Table List 2"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"Table List 3"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table =
List 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table List 5"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"Table List 6"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table List 7"></w:LsdException>=0A  <w:LsdException Locked=3D"false" S=
emiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table List 8"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unh=
ideWhenUsed=3D"true"=0A   Name=3D"Table 3D effects 1"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"=0A   Name=3D"Table 3D effects 2"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table 3D effects 3"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Contem=
porary"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Elegant"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenU=
sed=3D"true"=0A   Name=3D"Table Professional"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A =
  Name=3D"Table Subtle 1"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Subt=
le 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D=
"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Web 1"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Table Web 2"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"=
Table Web 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHi=
dden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Balloon Text"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Tabl=
e Grid"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Theme"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Place=
holder Text"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priori=
ty=3D"1" QFormat=3D"true" Name=3D"No Spacing"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"60" Name=3D"Light Shading"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Lig=
ht List"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"62" Name=3D"Light Grid"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"63" Name=3D"Medium Shading 1"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"65" N=
ame=3D"Medium List 1"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"66" Name=3D"Medium List 2"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium =
Grid 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"69" Name=3D"Medium Grid 3"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"70" Name=3D"Dark List"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"=
Colorful List"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"73" Name=3D"Colorful Grid"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" Priority=3D"60" Name=3D"Light Shading Accent 1"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light=
 List Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pri=
ority=3D"62" Name=3D"Light Grid Accent 1"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 Accent 1">=
</w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"64" Nam=
e=3D"Medium Shading 2 Accent 1"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" Priority=3D"65" Name=3D"Medium List 1 Accent 1"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revi=
sion"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"3=
4" QFormat=3D"true"=0A   Name=3D"List Paragraph"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" Name=3D"Quo=
te"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"30"=
 QFormat=3D"true"=0A   Name=3D"Intense Quote"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Accent 1"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"67" Na=
me=3D"Medium Grid 1 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Accent 1"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Gri=
d 3 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prior=
ity=3D"70" Name=3D"Dark List Accent 1"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading Accent 1"></w=
:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"72" Name=
=3D"Colorful List Accent 1"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"73" Name=3D"Colorful Grid Accent 1"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shad=
ing Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prior=
ity=3D"61" Name=3D"Light List Accent 2"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent 2"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Med=
ium Shading 1 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" Priority=3D"64" Name=3D"Medium Shading 2 Accent 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"66" Name=3D"Medium List 2 Accent 2"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Accent 2"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D=
"Medium Grid 2 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" Priority=3D"69" Name=3D"Medium Grid 3 Accent 2"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accen=
t 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"71=
" Name=3D"Colorful Shading Accent 2"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Accent 2"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Col=
orful Grid Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"60" Name=3D"Light Shading Accent 3"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent 3=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"62" N=
ame=3D"Light Grid Accent 3"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 Accent 3"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"65" Name=3D"Medium List 1 Accent 3"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Accent=
 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"67"=
 Name=3D"Medium Grid 1 Accent 3"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Accent 3"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium =
Grid 3 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pr=
iority=3D"70" Name=3D"Dark List Accent 3"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading Accent 3">=
</w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"72" Nam=
e=3D"Colorful List Accent 3"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"73" Name=3D"Colorful Grid Accent 3"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shad=
ing Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prior=
ity=3D"61" Name=3D"Light List Accent 4"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent 4"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Med=
ium Shading 1 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" Priority=3D"64" Name=3D"Medium Shading 2 Accent 4"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"66" Name=3D"Medium List 2 Accent 4"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Accent 4"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D=
"Medium Grid 2 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" Priority=3D"69" Name=3D"Medium Grid 3 Accent 4"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accen=
t 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"71=
" Name=3D"Colorful Shading Accent 4"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Accent 4"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Col=
orful Grid Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"60" Name=3D"Light Shading Accent 5"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent 5=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"62" N=
ame=3D"Light Grid Accent 5"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 Accent 5"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"65" Name=3D"Medium List 1 Accent 5"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Accent=
 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"67"=
 Name=3D"Medium Grid 1 Accent 5"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Accent 5"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium =
Grid 3 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pr=
iority=3D"70" Name=3D"Dark List Accent 5"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading Accent 5">=
</w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"72" Nam=
e=3D"Colorful List Accent 5"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"73" Name=3D"Colorful Grid Accent 5"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shad=
ing Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prior=
ity=3D"61" Name=3D"Light List Accent 6"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent 6"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Med=
ium Shading 1 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" Priority=3D"64" Name=3D"Medium Shading 2 Accent 6"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"66" Name=3D"Medium List 2 Accent 6"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Accent 6"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D=
"Medium Grid 2 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" Priority=3D"69" Name=3D"Medium Grid 3 Accent 6"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accen=
t 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"71=
" Name=3D"Colorful Shading Accent 6"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Accent 6"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Col=
orful Grid Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"19" QFormat=3D"true"=0A   Name=3D"Subtle Emphasis"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"t=
rue"=0A   Name=3D"Intense Emphasis"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" Priority=3D"31" QFormat=3D"true"=0A   Name=3D"Subtle Refe=
rence"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"=
32" QFormat=3D"true"=0A   Name=3D"Intense Reference"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" Name=3D=
"Book Title"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priori=
ty=3D"37" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"Bibliog=
raphy"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"=
39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=
=3D"TOC Heading"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pr=
iority=3D"41" Name=3D"Plain Table 1"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"42" Name=3D"Plain Table 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table =
3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"44" =
Name=3D"Plain Table 4"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"45" Name=3D"Plain Table 5"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" Priority=3D"40" Name=3D"Grid Table Light"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Gri=
d Table 1 Light"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pr=
iority=3D"47" Name=3D"Grid Table 2"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" N=
ame=3D"Grid Table 5 Dark"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" Priority=3D"51" Name=3D"Grid Table 6 Colorful"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Co=
lorful"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"46"=0A   Name=3D"Grid Table 1 Light Accent 1"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accent 1"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Na=
me=3D"Grid Table 3 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accent 1"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table =
5 Dark Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pr=
iority=3D"51"=0A   Name=3D"Grid Table 6 Colorful Accent 1"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   Name=3D"Grid =
Table 7 Colorful Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"46"=0A   Name=3D"Grid Table 1 Light Accent 2"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Gri=
d Table 2 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"48" Name=3D"Grid Table 3 Accent 2"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accent 2=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" N=
ame=3D"Grid Table 5 Dark Accent 2"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table 6 Colorful Accent =
2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=
=0A   Name=3D"Grid Table 7 Colorful Accent 2"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"46"=0A   Name=3D"Grid Table 1 Light=
 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"47" Name=3D"Grid Table 2 Accent 3"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accent 3"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Gr=
id Table 4 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"50" Name=3D"Grid Table 5 Dark Accent 3"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table=
 6 Colorful Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"52"=0A   Name=3D"Grid Table 7 Colorful Accent 3"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=0A   Name=3D"=
Grid Table 1 Light Accent 4"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accent 4"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table =
3 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"49" Name=3D"Grid Table 4 Accent 4"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark Accent 4"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=0A  =
 Name=3D"Grid Table 6 Colorful Accent 4"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"52"=0A   Name=3D"Grid Table 7 Colorful A=
ccent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"46"=0A   Name=3D"Grid Table 1 Light Accent 5"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accent=
 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"48"=
 Name=3D"Grid Table 3 Accent 5"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accent 5"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Tabl=
e 5 Dark Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"51"=0A   Name=3D"Grid Table 6 Colorful Accent 5"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   Name=3D"Gri=
d Table 7 Colorful Accent 5"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"46"=0A   Name=3D"Grid Table 1 Light Accent 6"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"=
Grid Table 2 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"48" Name=3D"Grid Table 3 Accent 6"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50=
" Name=3D"Grid Table 5 Dark Accent 6"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table 6 Colorful Acce=
nt 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"5=
2"=0A   Name=3D"Grid Table 7 Colorful Accent 6"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=
=3D"List Table 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" P=
riority=3D"48" Name=3D"List Table 3"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"49" Name=3D"List Table 4"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5=
 Dark"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"=
51" Name=3D"List Table 6 Colorful"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" Priority=3D"52" Name=3D"List Table 7 Colorful"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=0A   Name=3D"L=
ist Table 1 Light Accent 1"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"47" Name=3D"List Table 2 Accent 1"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table =
3 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"49" Name=3D"List Table 4 Accent 1"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark Accent 1"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=0A  =
 Name=3D"List Table 6 Colorful Accent 1"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"52"=0A   Name=3D"List Table 7 Colorful A=
ccent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"46"=0A   Name=3D"List Table 1 Light Accent 2"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accent=
 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"48"=
 Name=3D"List Table 3 Accent 2"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" Priority=3D"49" Name=3D"List Table 4 Accent 2"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Tabl=
e 5 Dark Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"51"=0A   Name=3D"List Table 6 Colorful Accent 2"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   Name=3D"Lis=
t Table 7 Colorful Accent 2"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"46"=0A   Name=3D"List Table 1 Light Accent 3"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"=
List Table 2 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"48" Name=3D"List Table 3 Accent 3"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50=
" Name=3D"List Table 5 Dark Accent 3"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" Priority=3D"51"=0A   Name=3D"List Table 6 Colorful Acce=
nt 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"5=
2"=0A   Name=3D"List Table 7 Colorful Accent 3"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" Priority=3D"46"=0A   Name=3D"List Table 1 Lig=
ht Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priori=
ty=3D"47" Name=3D"List Table 2 Accent 4"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accent 4"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"=
List Table 4 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"50" Name=3D"List Table 5 Dark Accent 4"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=0A   Name=3D"List Ta=
ble 6 Colorful Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" Priority=3D"52"=0A   Name=3D"List Table 7 Colorful Accent 4"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=0A   Name=
=3D"List Table 1 Light Accent 5"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accent 5"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Tab=
le 3 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"49" Name=3D"List Table 4 Accent 5"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark Accent 5=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=
=0A   Name=3D"List Table 6 Colorful Accent 5"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"52"=0A   Name=3D"List Table 7 Color=
ful Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prior=
ity=3D"46"=0A   Name=3D"List Table 1 Light Accent 6"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Acc=
ent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"=
48" Name=3D"List Table 3 Accent 6"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accent 6"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List T=
able 5 Dark Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"51"=0A   Name=3D"List Table 6 Colorful Accent 6"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   Name=3D"=
List Table 7 Colorful Accent 6"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Ment=
ion"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"=
true" UnhideWhenUsed=3D"true"=0A   Name=3D"Smart Hyperlink"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"Hashtag"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Unr=
esolved Mention"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Se=
miHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Smart Link"></w:Lsd=
Exception>=0A </w:LatentStyles>=0A</xml><![endif]-->=0A<!--[if gte mso 10]=
>=0A<style>=0A /* Style Definitions */=0A table.MsoNormalTable=0A	{mso-sty=
le-name:=E6=99=AE=E9=80=9A=E8=A1=A8=E6=A0=BC;=0A	mso-tstyle-rowband-size:0=
;=0A	mso-tstyle-colband-size:0;=0A	mso-style-noshow:yes;=0A	mso-style-prio=
rity:99;=0A	mso-style-parent:"";=0A	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;=
=0A	mso-para-margin:0cm;=0A	mso-pagination:widow-orphan;=0A	font-size:10.0=
pt;=0A	font-family:"Times New Roman",serif;}=0A</style>=0A<![endif]-->=0A<=
!--StartFragment-->=0A<p class=3D"MsoNormal" align=3D"left" style=3D"text-=
align: justify; background-image: initial; background-position: initial; b=
ackground-size: initial; background-repeat: initial; background-attachment=
: initial; background-origin: initial; background-clip: initial; margin: 0=
px 0cm; font-size: 10.5pt; font-family: =E7=AD=89=E7=BA=BF;"><b><span lang=
=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sans-=
serif;color:#333399;=0Amso-ligatures:none">Best regards,<br>=0AJoye Zhou</=
span></b><span lang=3D"EN-US" style=3D"font-family:&quot;Microsoft YaHei U=
I&quot;,sans-serif;=0Acolor:#333399;mso-ligatures:none"><br>=0A-----------=
------------------------------------------<br>=0A</span><span style=3D"fon=
t-family:&quot;Microsoft YaHei UI&quot;,sans-serif;color:#333399;=0Amso-li=
gatures:none">=E6=B7=B1=E5=9C=B3=E5=AF=8C=E6=97=BA=E8=BE=BE=E4=BE=9B=E5=BA=
=94=E9=93=BE=E7=AE=A1=E7=90=86=E6=9C=89=E9=99=90=E5=85=AC=E5=8F=B8<span la=
ng=3D"EN-US"><br>=0A<b>Shenzhen Forward Supply Chain Management Ltd</b><br=
>=0A<b>Rm 1006 Jinrun Bldg, 6019 Shennan Ave, Futian District, Shenzhen, C=
hina</b><br>=0A</span></span><span lang=3D"EN-US" style=3D"font-size:11.5p=
t;font-family:&quot;Calibri&quot;,sans-serif;=0Acolor:#333399;mso-ligature=
s:none">Tel</span><span style=3D"font-size:11.5pt;=0Afont-family:&quot;Mic=
rosoft YaHei UI&quot;,sans-serif;color:#333399;mso-ligatures:none">=EF=BC=
=9A</span><span lang=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:#333399;=0Amso-ligatures:none"> (+86) 0755=
 8332 9469&nbsp; Fax: (+86) 0755 8332 9469<br>=0AMob:&nbsp; (+86) 15986709=
674&nbsp;</span><span lang=3D"EN-US" style=3D"font-family: &quot;Microsoft=
 YaHei UI&quot;, sans-serif;"><o:p></o:p></span></p>=0A<p class=3D"MsoNorm=
al" align=3D"left" style=3D"text-align: justify; background-image: initial=
; background-position: initial; background-size: initial; background-repea=
t: initial; background-attachment: initial; background-origin: initial; ba=
ckground-clip: initial; margin: 0px 0cm; font-size: 10.5pt; font-family: =
=E7=AD=89=E7=BA=BF;"><span lang=3D"EN-US" style=3D"font-size:11.5pt;font-f=
amily:&quot;Calibri&quot;,sans-serif;color:#333399;=0Amso-ligatures:none">=
E-mail:&nbsp;<a href=3D"mailto:joye-zhou@fwd-log.com" style=3D"color: rgb(=
5, 99, 193);"><span style=3D"color:blue">joye-zhou@fwd-log.com</span></a>&=
nbsp;</span><span lang=3D"EN-US" style=3D"font-family: &quot;Microsoft YaH=
ei UI&quot;, sans-serif;"><o:p></o:p></span></p>=0A<p class=3D"MsoNormal" =
align=3D"left" style=3D"text-align: justify; background-image: initial; ba=
ckground-position: initial; background-size: initial; background-repeat: i=
nitial; background-attachment: initial; background-origin: initial; backgr=
ound-clip: initial; margin: 0px 0cm; font-size: 10.5pt; font-family: =E7=
=AD=89=E7=BA=BF;"><span lang=3D"EN-US" style=3D"font-size:11.5pt;font-fami=
ly:&quot;Calibri&quot;,sans-serif;color:#333399;=0Amso-ligatures:none">QQ:=
&nbsp;&nbsp;&nbsp;=0A1026477702&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; WE CHAT:zzzz_223<br>=0AWhatsapp:(+86)15986709674<br>=0ANVOCC NO. : G=
D202206083136</span><span lang=3D"EN-US" style=3D"font-family: &quot;Micro=
soft YaHei UI&quot;, sans-serif;"><o:p></o:p></span></p>=0A<!--EndFragment=
--></div></span></div>=0A</body></html>
------=_002_NextPart210640643684_=------

------=_001_NextPart061671513844_=----
Content-Type: image/png;
	name="InsertPic_31D3(0(08-13-17-13-11).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@fd882404-9a0c-6129-b6ca-5dc313585560>

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
gg==

------=_001_NextPart061671513844_=----
Content-Type: image/png;
	name="InsertPic_99D7(0(08-13-17-13-11).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@0c576572-8853-a8fe-0c3b-3a6e871c6a1c>

iVBORw0KGgoAAAANSUhEUgAAA/oAAABuCAIAAAAYm/8+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAg
AElEQVR4nO3df0xTeb438M88mT9s1n9KcjtLt1Kgz0gMOIYIIcUVR+qQcjEhYROruEHCBkxW0QQh
rMYLgZk4Q0ATR91EyBIwO2jNvSTkkQvpDrjiSEPEEEcJQZ8Kdbh1tzeB5w9v8D+fP86PnnN6Tnv6
A9qevl/xD1vacw6f7/l++un3+z2HTz5+/EgAAAAAAKBFnxJRZdt8og8j7Uz0FiHsCYHIpwQ0U0Ig
7AmHJkg4NEHUELpk9r8SfQAAAAAAALBVUO4DAAAAAGgWyn0AAAAAAM1CuQ8AAAAAoFko9wEAAAAA
NAvlPgAAAACAZqHcBwAAAADQLJT7AAAAAACahXIfAAAAAECzUO4DAAAAAGgWyn0AAAAAAM1CuQ8A
AAAAoFko9wEAAAAANAvlPgAAAACAZn0av01ldPTmWgWP1176vhv2eeR+RETk953t/XBS8rx/o/ev
nul3/GNdfVu+w0D08k3l8LrSjog23SNvuhc2y08VtRUEHdfLN5XD1NGba/X7zvYyx0MWe/5Nm849
Mt+9oLg15cNmN5I4UYTa5yGiTGPH741Wg+gtikFz7RhoMZrYyDOb3XReWxx6R+IAMm+QaSl1WyYi
shQaTx5hD4z8m+4fmfiTiv1uH+Wza1329epkSM5M5Sej3bj4qUhCp+Yw4nWo2yxcD4r/b6Srb8s/
8OL/Ptn7vx2GwPnMn9JrU4uNz/WSfqGQALVGoftLG4Lv+z99obYnhkssIgofBxF1mXQg/xEz5DfW
h/jwFTwn6GsgL+RnDZNJFu9+lr8Fn0cJxOQ6hdw4uSl4jVxBGJyxM41BBUxA4CQUvEwp7L2U21ZA
wdWOODOE+EwRvUtVjRTUaygexWccy30iUWWZ0dGSe7ONAscnc6wZ4rcYB1qMbb83evmXZeoPMJm6
QF9O69OyOyJd+an8ttrc+n8sDg3PT5Ns82eoPWzh1t4pHXZyiCzURJTR0WK0+n1n23yeQstErfHm
qQ+Vw+vTSkHLNAbtUueoyBiSzSZyLaV2y4WWm7X6tZdvzvaue5geXps/8Bnfw0Pudxsp/jpJLlGH
mpnRUbHjh2T+XA/Rg+JCGIFM/QHD5pPn/+8xbTpsugP7dEPv2A+wg3t1RJtPnm8S6YO2oJwANYPp
/lOLlZObRLpye24b2/0V36G2J4ZNLErvTaHenSgyIfI5SfnDd6v7mraEOsPZTLI5/S41P48UbT5+
ESI3EsWeD8OdhMoVy44TBUZrraV8wTNNRIVGpmqXGQUIsYuIaiRJr4mTLVvM8269e2SDDMY/2XWq
3+K7+5LIoD+YyT5h2ac3EblfbhDpTyhuZ3P65w0i3YF9qncUSny3ti1Uhjpzxy4i8n/wENGCp7Jt
PpphgILcjkKZp9W1lKyMjlo9+X3fDa8zp7VncrH3JZlsufWZglcp7Fej1rvb5isTn75jOYyMjpZc
dlQ1+Yl6ULyCL47Ar3Um+vD2HXmeb6wRmT7j+4guy0Dk33j8TmYTMXSrVJHRUaunl2+4EnxzenKx
sm1e8FU/ti2HTSywzaIoDECIyyTaEzY3xi0fRnoSvvN9N7XJ7VRXf0RPtOl0hSyfgnaRDMl8K9fu
L2y4RY0XKea73cZPwxtuItNevSW+h6cl6kNdkDtwKiOWSFqPGIPeHkNLFeqtRGsvNkRfsn/eINJl
/TrsfpNERkdv0USbpaOtaKI3vz6Tecgcra6+rWii11LOvDAzo6OtaKK3aKK3aOCU9Nex2PMneosG
7Dpug8wL2I3Xn8qf6C2a6M0PfO0ptAywm2J2ze0l4gMmyjRyB5bfUagTv4w7zlC705/k3l6fyfzW
uVYiMhhvss8kvUAPkgl+uEAFt6w0ApbPdpB/00tE7z78wg7wEHHnP/slXCoNEiDT/f8Ze3GvsGUV
iQW2W6yFQVoLZBLtCZMb45oPIzwJPZPv3EQmm7Henusw0NrUm6Gw37hEu0iKZL71l+oadrC/mMF4
s5f9ROTKGrFM44kCwZc5Zu7j5cY0rf8kHvUX05V/oRfN+MQkaGthDzt5hA41M3lCZCrIvSkpVlTy
+5wviQzGk5KBdrUtJcPy2Q4i+kXu834X3xWV9ptUDDve/nW+sm1ROQtkdLTkWsl3tm2+8pqPCow3
TwnWmBVabtp0gmFO6cbJtVh5zecmHfe1J6OjVm/y+862zX/3M0Uzjs4fMBkHWoxW/5uzbfNnp8ha
Kzv8GXJ3Bnr71/nKtjdu0jl+b7TQ5lDvGzczFxkqIMmH70HiJ8MFKrhldeII6A7u1XGl5/pPL4lI
/9tCIqLyL/RE5P5ZeYFcVN0qVYTo/lu35V0oNGMX+8eibF+DMISZRHtC5satyIcRnITr3SMbRHqH
TUe0cVf99COzi+gOPt7FZ7zX7ocgsw5JR+yvxC7mXnvpO8st9mXnPn5eJyLvPzepQLioS/Qu8m84
r3liqipCbC0VV8UpHPP08LzXbvmTTW8inVW6Pl6Vx8NvsnpzrbWWt1OBJ8O0VDzI7je5KKzHCBAO
N77zNbb5iLglegbjzVoiv++s0vIqduMbb/1Gq0FnJvIIt7bgcx7RO5QqftG5LTgxuAPmm89DRM83
1mxGmeYLvTt2U5tv/cQenqqQpYiwgQrRsixdliFQek7/vNFWoLd+kUEL9NsCItr4Se5K0G3oVulO
qWsoPQ88hCUxRJlEe0LkxsTnQ+6Dzz3iifSygSgPPt69bOvLffl5auELZH8lbu5jgdhFXTadaa/e
MrkpvBqVuRiLiGJdyhbfrSVK2FATeSY9jZO68lO5bQU6k81YPhnpibv+w1Sm1aZ32PhnwrVU6OP5
5wci3a7PdEShT/3g/aaY8AOZBv3BTJ9H3bkXwbCoupRhrS2aqOUeBDXH1o3CJhcVPSg4UOGDk7lj
F20++Qf3cGHDXau3GnZYMmkXMUM+wWLqVqlCdfffmi3jUt0EUtHXQEqSSbRHMTduTT70f/DQDtWv
3nzrJzJsvo0o/v4PHtLVJ0cy38pyP7AuM/I5CPYqZn1bb1Eb/2RQPeRZ8PR+UdRWoG87lTEd6sLT
zbd+kt7VKIjqrSWfyEK9OT38Jou5J1TkPJPv3DbBLaLUtZQipnuLT33BeqrAryPdb6oJWX9s9F7b
PNFiVH8DorjXSaHvNrh1ZVmyUN2DggMVNjiWfXrx1XXrP73MtRboT1aQKfRKnqi7Vapgur986FQl
7TBbVpFYYLtt3QUbWheUSbRHITfGPR8GTkL15X60u0iaZL5la/czM+qP6CNb5CTAzH2sTS1Wts0z
/85ObcreMGd6+I07/J1bNh+/2CSD8SSzYD0zQ/hNMfKtJRl1oRZcCUqUyVzzHt0VP8wiNm6zqlsq
1NYMxj+xFxDryu35bQWyl8KI9pvEmDEAnVl47y3+wh3mGh3mcl5+7b5/08tcWaH+xBNszcLcFyxa
zP0QrF9kWLiTROYYIt7d5lt/9Ie03dT1IMVAybdsIALmz3SSIXzmmlFrgXwWike3ShXr3SMbVJDL
LUvVlQfSlNqkHWrLqhILbKPYCoM0F5xJtEc2N8Y5H27DSSjYRfIk83iP7ksW4gunRIULIomINnrb
lKq3oPutimZAPohfvN49op+o1QfuiirHM7l4lix/qs1nJ+L9G73XZF8s3NqGwmFHvHJrS0QWas80
EwFb/oSNJJdJRCywejt0S6mbq1rwnCXjySO5N3tziflrOCOL3F/DUdpvMtsc+nHjQK2+rbfoxEvf
Ez9xB7zefY06fp/LNM3aS2alfmCF9/Twm9/25lqPGC0LH5Q3zlvvHtEP1Bpv9hrXXvrcfn30d718
52tkDyyXaNM9tSg3zB/p7pibKBtv9uqFfzYluYToQbIUAyXbssRFIGNxndYk5zMz9hxmJU9s3SpV
sN2fzUvC7q86aYfesorEApGK9GMx0r4GMnRZBlp7ofUTWCY3qigIxSfk2tRi4/OgLW/DSSizC2Yl
T1TJPN7F5ycfP36sbJuPYQsQjYneIoQ9IbQYeV19W76Dtu1DdDt2p8VmSgEIe8KhCRIOTRA1hC6Z
bf2NOAEg7jKNA73cze8z9VmGLb70bZt3BwAAAPGDch8gBb3zfTe1sUb6tt6iiRbjrpfKN/FMxd0B
AABA/GzjffcBIH48k57GSc3uDgAAAOIFo/sAAAAAAJqFch8AAAAAQLNQ7gMAAAAAaBbKfQAAAAAA
zUK5DwAAAACgWSj3AQAAAAA0C+U+AAAAAIBmodwHAAAAANAslPsAAAAAAJqFch8AAAAAQLM++fjx
Y6KPAQAAAAAAtgRG9wEAAAAANAvlPgAAAACAZn1KRP/p/u9EH0ba+VfrvyDsCYHIpwQ0U0Ig7AmH
Jkg4NEHUELpkhtF9AAAAAADNQrkPAAAAAKBZKPcBAAAAADQL5T4AAAAAgGah3AcAAAAA0CyU+wAA
AAAAmoVyHwAAAABAs1DuAwAAAABoFsp9AAAAAADN2vZyf62/tbRqbE3umbX+1lJDlegf98oQ76Kp
G6WGqtP9PvF+fM6qKuFbhBsXvjh4y6lOJoyt84EfhQg+/6OpG4K333DHvmWFZqWQu0tz7lY+Jq3O
FfbJQDCFMeQDyDWH4pMQuTCnPcK7ZWQiH5QfFJtg6obGEvuW27Y8jKYRRyCQ6uXCEiL/aJ5cBhDW
b/M97DOuHumPItlFjPEMcz5La9HE+TTRByBR3HR/vNrEPvA5qxq/7i++3WQM+74XY0/Xmvg3Eq08
nX5KVMw+crdWXVhquu/vM3GbLX3VNdtXtDW/QxIICmNpVdP98WpV7526UXrCe35u3JFDTGc4Zrhx
1d9sVdpyq4pIKjfrWn/rscvmq/5xZvvS3aWrtf7WC3fsV+eyhm795nalu/Ts2IHxatPUjWOXzVf9
fVYid2vVsdbfzPYVEc33sO0132Po7Kkcb7eRwpMQLYUOZWrqm41ls1M3Sq9lCbYMQUSRlxFrEwAj
dNqXfT1O3ehM3Sg9MUnFTfzDC3fsV/3NVvI5qxq5rC6mlH+298ATQzkDrPXfGytuuj9eTf2tx8Il
ChHB2RuHHC5szWArT6fJXk39P0xVJ/pTOKkX8xgdLfYXY0/DfysqtlfT4ycrgSfct/pz6+zsA6Y7
BU4Fo2O8q/pOZ8/U1hx10jE6xruqn/b/oO73XfN4qe44k/SJyNTUcr54ckb+vcYD1XuiOR6+WVfG
vr5M5+cCHyqmpr6rdZNDkX9H15hfXi3t/eZ3bFhszbPj1SYi98Qk/6S10k5L/7VGRFPuseKDB3KI
qOjkN3vGJuZJ6UmIj8g6FEDyiyTtQ9R8zqqq0hPe6rrA56Z7YpLqrFZiPxnZrB4K8o/Ant+YJP/Z
PjKtGcx9q5+qf1e2h5LgUzipy31a83jVvTCrrJqm/xaY4pm5Yy+rZB8IiyROUVldMkR/20Tw+5os
ZrrjFszkGh3jSmPDvidjdP5MxJMkfLOu/e3xC8FnDMPaN65mPkfbdu3e8+KV9DuPbGTWPF4+05ks
ZubTQvZJiB+2Q/ETwWv9radbb5zmV0GsjJ0OsbyKWZ3FDAs97T+WFPO8qUQY7f8jmotnJ/dLDa1O
D/tU0KK4+R5DVWCsBwtLiMKmfWkMxaeucDmEYo9A0xARUVbLwKy/7+TuwDPWSjsXeZ/z2uTe6mIV
ZWvgA119DAULY7SwYnatv/XY5SW601lqOMn954Y78sTLnbHzPYJFs2zcZLcmENyaQeZn7uwp/8oo
aGUihS7DvD7QTfrjfv4ndbk//8PlJXVnP+366iDx8wBT7jH26zIR+d4uyb1+dxTD0iksgt/X1ny1
bvKCUl542n8ssIqu8frTKI4l0Ky/vFrauzvdK3tZpqaW80udpSX9L+7cc64E/3y+54TKDwbYEsEd
6sUdb/nc+Ky/2UrzPSX9uXfHZ/0D55e4WcSVsdMnvOfnxmf947N3zddLbrhtzbN37WEXq6Q7UcIJ
fB7z0S4MvHS+x9BJd8dn/eOz/uOrlycpsFJifNY/frVu6fqtecnYh3sC/YgodNoPjqG6U1fUI9A0
RERGqy3o887WPHuXLhiqSg2N09UDKoe62PyjPoYrY1+PHbzPvjKl5s9FGSBwcpqa+u5/s4fqumb9
P3D/sc5En3iLyuqW+CFj98Tk3mrdD8FbE5FrTQl+mt32u/PFYcPuc1Z1vvlmQNRN4inZyn1R03aO
1XWpHejNKS7n1vO4JyarK7W7Ln/rWfuYvNxVTcwHgCD7FzcxKWNWlGLCUdWs/PfaJLmuJbGMjvHx
2bmmvXXm1RJJQHzOqs6x4qZ/S/s5kOTCrp5iUnzTSRu72o356BVNZNmaZ9P+6hS1RAmnLzATyEeb
Fwg7u4aNxKHmv6FZzzTtZUfa2LG3bfttkpli2peLoSoyPQJNE4S7amLWP17/qjGyy0YjiiG3/ifF
5s/FJUeozBlb4rWeaeKGjOdn7uwp/9Vy8NYiJJyuMR6o3hNmafrUf1x/aq9nm6ao/a49xGujsu3l
vslilnmWX3fFNe39b/YQ7eEXioR5FzHRZNbzzM/csZcFFp8Ys+QS1C+v5Mb8tYsZR1cRRqGidv/4
rH/gfPHkBYUcxK8gj65ZxUtWmN0xrwGetd3fVf2UvzTF56xqvE4YEk4wmYkpYT/ivt8eu7zEdBBM
ZMVZUNaSrPwMZCRuRv7YZS7n5xSXMwvTA5e4AE8u7QfHUA2ujdA0IQivmpAs+QghkE9UxjCn+vZd
+9gJ6SyZ1sSSePkhYyZuv5bZWjg+Z5Xg7kkrT6ef0ovLjaX8Rp6KLjGVUZy1S+2vGoWEjO4/ffuL
4JFs5W1q6rtat3S9RDCuHO5dJmY9j2glDzFd6MXl/2C3M3WDWac1c4fSaQZgfuYO5VqMpCKM7lbJ
3axUX48bebOavjq4V36xSprzOaskrbC0+ka+1hcuzeeX7Ms+CfEj6FCyhCNS49UmhYsxII5kRxz+
0d9aWvK2XjqOwA7XaXG5SJRCpP01+RhGAE2jVm7WXlWvY/OPQtMoxNDWHNmcfCqKKfGyQ8buicnq
lmqT3NbCbsExzr2+r2jtb49f1HUJ5iUGzheHi7y4iIq37S/3JWuYVsaG7uyRvdzT2tdVTdwAg5p3
5RSX0+OvrwWt5GFWJTLLIWzNV6mz1NApmFvUPJ+zqnOsrqvdpiqM1kr7i8uNgpVq8z9cXlL4auRz
XuM6RnTNmlP9b9+Q6EvdytjXEQ0gaZPxQPUe/jvqWv+9MbKX2Wit/5rMuL7Nyt2lQdBSsk9CfAg6
lKxA8Mndyl7mJfpmuzJ2WsMDbIlis1Y/7f+aTUHzPScmiejdqyXutifzPwiG6ExfHdx7p/NCmiwX
USFE2v9FIYY8wWW+vidjctkbTaNMmBnct/pfiAcr5QTyj1LTyMRQfN2zNmcaY068pq8O0ti1IWZ5
iNzWIhH8yWt0tLCzN/JdRlREsd0krhJw332jY7xr1dBYepl9XH133CE/Z1fUftc+dqLz9O6B201q
3mU8UE3XL9vrgz6GrX3j9/tbjxn6A0897T9meHvV37yVUyeJ87Rf9MvW8bfGVxFGW/PsXNbpkqpS
9vEe/mbMwVve+83AbTbaUTarqalv9qux04aqC4Ld3U6DOdzQTE19V19VXSghIjpGe87PNVtpvufy
EtGSIP7M3ZqL2u/aS09UjTENzS2QlXsSoqXYoWQJgl/cdH+8iNjJ9LelJVXXiQS9I2svl4iwlD9m
Re3+rh42Be05/42dxqjwTNPeks7SO0RkvzrX9KaEu/t1TnF5cf+LPdLbgqUv5bRvlY1hruDUtf3u
fHHjBcMkG/ZXwVtH0ygTZgY+XUgo5B/5ppGNoa356kQVu5Hipvt9qVPuS373UOk3msQrqgBzisup
/3rdcavS1tSbco8VN92XfPLarNXUOTOl1GWERRTbTeLqk48fP/6n+7/ju9HU4J4a25VbbUpMTvlX
67+kadgTLaUivzJ2+tZvbmv478EpSqlm0o40Cru7tWomGf/8XBo1gZJEN40WmiBBMdRC6JJF/P+S
XbLdmWcbWW2JqvUB1MmpTstaH2CrSe7oAMkDTRM7xDAFidYaqf8jDOolYDEPAABAYrhbqy7coeq7
41hAlWzQNLFDDFOVeN0R1XXNxvl+qSj3AQAgbVj7xmf7En0QIAdNEzvEMIXZmmf9zVu29TRezAMA
AAAAoHUo9wEAAAAANAvlPgAAAACAZqHcBwAAAADQLJT7AAAAAACahXIfAAAAAECzUO4DAAAAAGgW
yn0AAAAAAM365OPHj4k+BgAAAAAA2BKfEtGrt/+T6MNIO7uzfoWwJwQinxLQTAmBsCccmiDh0ARR
Q+iSGRbzAAAAAABoFsp9AAAAAADNQrkPAAAAAKBZKPcBAAAAADQL5T4AAAAAgGah3AcAAAAA0CyU
+wAAAAAAmoVyHwAAAABAs1DuAwAAAABoFsp9AAAAAADN2vZyf/XWcbNteFXumdVbx80780T/uFeG
eBe5Osw782puecX78Q7a8oRvEW5c+OLgLae6ULFiSYNDKsIo0zrnZsLuMUSbCvfL/et4GM9IpLaH
5/iwHB/0iH/m6uDDKHgZ+++ii3uNuJkgOmHOfIQ3HmSCHJwrYifoOGlp5qIomcxclOQHz3CN+vhs
RTDTpIHUJHBOiPyjebJpQVClzFxkn/n3i9IfRbKLGOMZ5qSVK7cSI9lG90suPXq/7GX/uTrpSou6
9ns2+ndRND1/fzAXePTwXN6h0Upuy66joxXp02FkeP7+gBy1dOW2S/qT0GGUts5io6owKrfp6q3j
5hoa4n76qOdVPSp+IiYy9YOOoeeX9jcMeEd3dzUJkoWrw1zj5B8d/p6P7fKjnkIquXS6gohmLta8
6ny+7H0/UDvYeDGooSEywWe+bXiVKPvMPe/3ZdFvNk2KGxWyz9wTnsNstKdOZSf6wLTF/HnJwoNJ
7iPVs7JcUrh/8Ec+5a5OTlDNl4j51lKVwMUU8k9aEP3uy973y6NnzMxPVm/9eaTk0qP3y9fo35n/
8D8KQ5B445DDBa0pQ7nc2nbJVu6LmBvaHdICVFaJo5YmpgUjoA+vX8lrcLAPXB31g46hwCeHuWEq
rWugh9evUM0fKvJp5IG4WA8dRilzeU1h5DsXtKlnuKWdOp93H+Z+ln3m3lCD80bkX9C1Z2V5YX/P
H9jIVHRzdY930JZnrnlV2yAXeSae/aeyicj140hJZbmFiMpO9xRKGxpiYm6YGqidS4b0DRARc3lN
4bNlbrRlcoJq/ni0xOnizuSVZTpqV1cwQTRUJ/BQkH8E8nOyJf/ZPiFbk6NYbiVAUpf7tPr6lboX
WipqKDBoQTOuQUfFUfbBwwfOQOXEKqtoSIboJ8SMa7DwqN18+KiDBOM6RGHCGMQ7PUqd5yP+Wsy3
6erkxLOGPzZYRD89/L3qL+ialpMX+FQWPd/u8r6/dzpP5i0Pr1/h47n6+hWf/rI/302LK+kyFLRN
2ATCTwSv3jpec66jhl+Q5hmuCZ52D6xbOz7o4YaF5q4cSp+BusgJp9pF0+5yERZM/QsnCdkZf/PO
44Ov2aeCVsrNXBQuotDurIswG6wsL+R9XlZeU7j8mkk1M67B3Tl8QpY9h4OCuXbruPnc8KAtaNkh
GkiOygQeTqCAUR8oheCnqtVbxw+1L9Bgo3nnAe4/HQ8jT7xcVhGvc2PiJt8FAkK0Jke+3FJMa8K+
cCvuJ3lSl/szt9sX9qubW8yxVxI/D+D6caThCFffe1cW5V6fF8XIdOqYu3JIsNbtUPtC4Ef8uG/F
HzpLpEPpymEM3mxFl3Cdj1qBNl1ZXtifh8peXvaZns7FRvO+K88G/yxYa2s+XKEQMc/wjcHCKL59
QXSCE8izwVdHny9733cfppmL+67kjbLT7uxHr2e4hl1etewd3d21r+NhRbd31EEllx5hyUrE5CPc
wq3YFEwSzlzc2UijzDKAP75udxI/38u+cqHr+oxkAOjhA6fKz53UU3Gkdo6Zwp1xDToqKiibz/me
leVAwpeLsGwwiWhwgvqFwUQDKYlbAmfzj/pAyQc/FYiLGf67SvaZe496CqlhwPv+CfefI67oE29Z
RUNgndvDB879Nb+6LdMFhJRbkxey3AriHbQ1Lve4pP0rbpKt3Bc1beNIw4DasV7Ll0e5hSgPHzhr
j6Z33SNe7vaohy9NvIM9fKI0l9cUStdKhQ6jeLOC5B6Sqjblv9QmyUUtCWdumFr2Pr+0v2H3633h
Y7I6OfGMXb0DCcLH3/XjCLsA11xew66kEs1lVXR733cfDrM5UCYXYSIiboVDYJIw8Ep2YRuJ489/
bTt8/hK3ip0dkEvA77UdzJ+XLLz2MAv3LTlEZMnJm/OsMGt7+PEX2QjLBlNw5ge+A6OBIhRlAo8o
UMHBTwnStfvKmTO2xHv4/CVurHPGNVh4dOfP8udwBMKVW9Lj/0vXnKOZbZqyb0eV1lFHbdvL/ezP
d8s8y6+74pr2UU8hUeDLbph3ERNNZiEKO2jBP5+TL/PWleUFmWc1z/P3B3P0rL0iMOo/J1qsrxxG
GYePOph54ejaVLxepexb6TcTYBz59v1ArbSZpFaW1c6DQVzIzE0J0xH3FfdQ+wLTRzCXFWdBESbL
qdFRx0iNaFWJZDloIFNx0/SBmU/Ll+wq9sB1L5pkZlbvCK7KLatocLpcQQv3gyKsGEzZZdNooEhE
msAD+URloOSCr0GxJF5+rJOJW6bcORyGl1vVlmc+N6Oi3ArCfAPfKgkZ3Z/zrAgeyVbe2WfuDTUs
dO0TLDIL9y52UjJoCcrho45n7X9ht+PqYNZpuQYpDWcAVicnnjUMeIXX+JdIR+iVwhhG5G2aba/c
L1qpAjzvoE1yT7GF16ECNeMapLzPA0lNuEJXuI4f4kQacCnhiNTUqWzlizEgSkERJnb0TjTxKDsS
sXbruHmfp1k6vsCO4aXsQhG1su2VNPqX26ML/Amck1c48qDDtSiuoYMiLD+so5ckkmwAAAPJSURB
VAQNFIFw+UTh9asRBSoo+BoUU+JlxzofPnDWtp/KVjqHQ26hYYp7/fdlasotKXEdFW/bX+5L1jAp
L1k7/P1ALTnrmYsY1LzL8uVRmmjpCVqCUtE91OCsZ5ZDVHQPUaN5Z+OI7O2uNG7mdvuCODjmhvag
C3aVwijlHezhekV0bWo5da2HRN/oPMMt7Wk56yJlLq8p5L+jrt768wiFnGnxrCxLXlBxhLt1Q3Cj
Q4y8g7bGkYaBb5VaJBB8eniOvcxL9OXWM1yj4QG2uMr+fDeXoLzTo1xykIuw5PJNdkiv4kjtHH/n
35mLNU4i+q/lBWLHMmZuC8btsu2V+wcb6zW3UETKkpM35xyZC2SMbHvl/kHniHBQQDbCcsGUhwaK
SHACDyWQf1bUB0o2+BoTc+LNtlfSaPsNZl2D7DkcgVDllkJaE9ZRIftXlD6N9wbDMzdMDbzeWWFu
Zx/Xji4rXI1e9u2oY6SmsSbPNXpGzbvM5TXU1e5oDuo2h79ffnTr+KGdVwJPzV05tNMz9L57K6dO
kozrx5GSS48kwak4UkuNLpdwQZtiGGnuijCG+3tco+xromzT7DP3vPbhmp159exPCzufL49qa5Y2
Otln7g0t59XvIyI6RIXC25XK8HieSZ8q+3bUYa7JGyGihgFv2n2zjTfxmU8NAyFv1SwIfsmlR1Nl
xE6me8z78rqIBB3Esp9LRFjKL6/iD50lFfU7nUSFnT0OWmaelYtwRffQgzy2mUouPfqeWwL7fuAi
m5oKO3scNEol5y/t39doHiQix9DzS8v7rtx2nfq2glkFceVZvsq7o6SusooGGlkULBuw5OQR5YlK
E7kIywVTaRdooAjIJHAxhfxzWH2g5IOfCiS/e6j0G03iFVWAli+P0pWuhj8eVtqaeqHLLfm0Jqyj
Qvev6Hzy8ePHV2//J74bTQ0PXcM5llPZiUkcu7N+laZhT7SUirxnuOZ6zmgsfwQkVaVUM2lHuof9
4bk819FlxXmb7ZDuTRDatjSQFpogQWeyFkKXLFwd5h5LXO/blmx35tlGhysSVesDqGM5lZa1PkBC
hL8/ASQUGkglBCoFidYaCe/qEy8JWMwDAACQRB6ey6sfpNrRZayqSk5oIJUQqFQlXndEDQPeON8v
NY0X8yQU5rwSBZFPCWimhEDYEw5NkHBogqghdMksjRfzAAAAAABoHcp9AAAAAADNQrkPAAAAAKBZ
KPcBAAAAADQL5T4AAAAAgGah3AcAAAAA0CyU+wAAAAAAmoVyHwAAAABAs1DuAwAAAABo1v8HMOiL
gy6ION0AAAAASUVORK5CYII=

------=_001_NextPart061671513844_=------

