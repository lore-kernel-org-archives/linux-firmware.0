Return-Path: <SRS0=ZH7z=GV=filin321.com=cindy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDDFC61DB9
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Aug 2026 08:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C1E81F00A3A; Fri, 28 Aug 2026 08:48:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.251.236.138
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787906930;
	b=HKuohPQHR0GZ/03ybzxWuim6kAaZ17p1QxBtQCP/rkOnjtLNl91IABVPApRKKP3uY4Sf
	 UoUBzjZfclKpDkcZ08VdCeb2LDLzZUUZky59h1c9LAfRJc0nWtpPBijZwLH+Cw1+wnvlP
	 b8ZBMrrrhXnV2tfwHqV9gTp/1mPLyk/q3fLyXL5Ulx/JEMUh2Nuq+G6dtVLibxKnl7Ywt
	 i5/D8R31+UXW9pxFdtupX7wawPsUJSUxu86aADBQEKt/4vjufYci813g0KTjYaZnRw/uU
	 VdsLIh3Rvn94bM92WAecEOVAejne0wO+JOJVCR2oqOU1ycySLoXenQFiVVMt8CZmNgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787906930;
	h=DMARC-Filter:Received:Received:Date:From:List-Id:To:Subject:
	 X-Priority:X-GUID:X-Has-Attach:X-Mailer:Mime-Version:Message-ID:
	 Content-Type;
	bh=lUaGZ/5Kk3mJCQom3QLmPSK0RjbkBzNgXiOlZ42haRU=;
	b=a3cfFXc2MfvYRkATJg/UVDzwGxQtWK36mWcynFOiB5EcsAaycgpmb4QadNxojIEAa0Vd
	 H3ejj635B5TYGMW9+a1zXsWTzAtttbCkRiAj7sHI8vO6aA5IQeHltSxmuLz/9yPn+Puzd
	 9a87MVpkD3/8zB5qMqsh2VKsP717R7L69iSyY+1R6JpmTwgDhCFjvXgy9oCLMDH+WHygh
	 rBSLiNO4wlbO+gxJnmVmIT9PWt/VCqG+qT+xcouyBeeXLJA9dy56whYnEu4dnyqA7g4t0
	 tV0lDhlnazB1gVqnVRCIcqrBmexzyzeaA4ViCzcYCL+N8oZDpL38lzMwGOtgdOJfvCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=none header.from=filin321.com;
	spf=pass smtp.mailfrom=filin321.com;
	arc=none smtp.remote-ip=103.251.236.138
Received: from email1.8lian.cn.communilink.net (mail.filin321.com [103.251.236.138])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49DBB1F000E9
	for <linux-firmware@kernel.org>; Fri, 28 Aug 2026 08:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 49DBB1F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=filin321.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=filin321.com
Received: (qmail 17732 invoked by uid 0); 28 Aug 2026 08:31:21 -0000
Received: from unknown (HELO DESKTOP-EUB5OK8) (cindy@filin321.com@14.154.19.175)
  by 0 with ESMTPA; 28 Aug 2026 08:31:21 -0000
Date: Fri, 28 Aug 2026 16:48:21 +0800
From: "cindy@filin321.com" <cindy@filin321.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware <linux-firmware@kernel.org>
Subject: =?UTF-8?B?VXBkYXRlZCBDaGluYeKAkVNwYWluIFJhaWwgJiBUcnVja2luZyBSYXRlcw==?=
X-Priority: 3
X-GUID: DDA8C46C-A617-4930-B1D2-BF5DAEAFAF1F
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.542[cn]
Mime-Version: 1.0
Message-ID: <2026082816482148527476@filin321.com>
Content-Type: multipart/related;
	boundary="----=_001_NextPart504488373864_=----"

This is a multi-part message in MIME format.

------=_001_NextPart504488373864_=----
Content-Type: multipart/alternative;
	boundary="----=_002_NextPart665582704756_=----"


------=_002_NextPart665582704756_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RGVhciBQYXJ0bmVyLA0KDQpIb3BlIHlvdXIgYnVzaW5lc3MgZ29lcyBzbW9vdGhseS4NCg0KV2Ug
c3BlY2lhbGl6ZSBpbiBDaGluYeKAkUV1cm9wZSBtdWx0aW1vZGFsIGxvZ2lzdGljcy4gQmVsb3cg
cGxlYXNlIGZpbmQgb3VyIGxhdGVzdCByYWlsICYgZGlyZWN0IHRydWNraW5nIHJhdGVzIHRvIFNw
YWluLCBlZmZlY3RpdmUgMTUtQXVnLg0KDQrinIUgQ2hpbmEgUmFpbHdheSB0byBTcGFpbg0KWWl3
dSBkZXBhcnR1cmVzIHRvIE1hZHJpZA0KUmF0ZSByYW5nZTogVVNEIDIwMCBwZXIgQ0JNLCB0cmFu
c2l0OjMwIGRheXMNCg0K4pyFIERpcmVjdCBUcnVja2luZyBmcm9tIFVydW1xaQ0KVG8gRHVpc2J1
cmc6IFVTRDIwMCBwZXIgQ0JNLCB0cmFuc2l0OjE4IGRheXMNClRvIEhhbWJ1cmc6IFVTRDE3MCBw
ZXIgQ0JNLHRyYW5zaXQ6MTcgZGF5cw0KDQpXZSBndWFyYW50ZWUgc3RhYmxlIGJvb2tpbmcgc3Bh
Y2UgYW5kIHByZWRpY3RhYmxlIHRyYW5zaXQgdGltZS4gU2VhIC8gQWlyIHNlcnZpY2VzIGFyZSBh
bHNvIGF2YWlsYWJsZSB1cG9uIHJlcXVlc3QuDQoNCklmIHRoZXNlIHJhdGVzIGFsaWduIHdpdGgg
eW91ciB0YXJnZXQsIG9yIGlmIHlvdSBuZWVkIGEgY29tcGFyaXNvbiBmb3Igb3RoZXIgZGVzdGlu
YXRpb24sIGZlZWwgZnJlZSB0byByZXBseSB0byB0aGlzIGVtYWlsLg0KDQoNCg0KU2hvdWxkIHlv
dSBubyBsb25nZXIgd2lzaCB0byByZWNlaXZlIG91ciBlbWFpbHMsIHlvdSBtYXkgcmVwbHkgdG8g
dGhpcyBtZXNzYWdlIHRvIHVuc3Vic2NyaWJlLiBUaGFuayB5b3UhDQoNCg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpKb3llIFpob3UNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQrmt7HlnLPlr4zml7rovr7kvpvlupTpk77nrqHnkIbmnInpmZDlhazlj7gN
ClNoZW56aGVuIEZvcndhcmQgU3VwcGx5IENoYWluIE1hbmFnZW1lbnQgTHRkDQpSbSAxMDA2IEpp
bnJ1biBCbGRnLCA2MDE5IFNoZW5uYW4gQXZlLCBGdXRpYW4gRGlzdHJpY3QsIFNoZW56aGVuLCBD
aGluYQ0KVGVs77yaICgrODYpIDA3NTUgODMzMiA5NDY5ICBGYXg6ICgrODYpIDA3NTUgODMzMiA5
NDY5DQpNb2I6ICAoKzg2KSAxNTk4NjcwOTY3NCANCkUtbWFpbDogam95ZS16aG91QGZ3ZC1sb2cu
Y29tIA0KUVE6ICAgIDEwMjY0Nzc3MDIgICAgICAgICBXRSBDSEFUOnp6enpfMjIzDQpXaGF0c2Fw
cDooKzg2KTE1OTg2NzA5Njc0DQpOVk9DQyBOTy4gOiBHRDIwMjIwNjA4MzEzNg0K

------=_002_NextPart665582704756_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }p { margin-top: 0px; margin-bo=
ttom: 0px; }.fox_html_content_dummy_textarea { position: absolute; overflo=
w: hidden; width: 1px; height: 1px; opacity: 0; }body { font-size: 14px; f=
ont-family: "Microsoft YaHei UI"; color: rgb(0, 0, 0); line-height: 1.5; }=
</style></head><body>=0A<div><span></span><div><div>Dear Partner,</div><di=
v><br></div><div>Hope your business goes smoothly.</div><div><br></div><di=
v><div>We specialize in China=E2=80=91Europe multimodal logistics. Below p=
lease find our latest rail &amp; direct trucking rates to Spain, effective=
 15-Aug.</div><div><br></div><div><div>=E2=9C=85 China Railway to Spain</d=
iv><div>Yiwu departures to Madrid</div><div>Rate range: USD 200 per CBM, t=
ransit:30 days</div><div><br></div><div>=E2=9C=85 Direct Trucking from Uru=
mqi</div><div>To Duisburg: USD200&nbsp;per&nbsp;CBM, transit:18 days</div>=
<div>To Hamburg: USD170&nbsp;per&nbsp;CBM,transit:17 days</div></div><div>=
<br></div><div><div>We guarantee stable booking space and predictable tran=
sit time. Sea / Air services are also available upon request.</div><div><b=
r></div><div><span style=3D"text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial;">If these rates alig=
n with your target, or if you need a comparison for other destination, fee=
l free to reply to this email.</span></div></div></div></div></div><div><b=
r></div><div><img src=3D"cid:_Foxmail.1@3c565a5f-b037-eda1-48dc-5b70cf8baf=
01" border=3D"0"></div><div><br></div><div><img src=3D"cid:_Foxmail.1@9b46=
1f8b-f6a0-38c4-85fc-829e4107e411" border=3D"0"></div><div><br></div><div><=
b style=3D"font-family: &quot;Microsoft JhengHei UI&quot;;">Should you no =
longer wish to receive our emails, you may reply to this message to unsubs=
cribe. Thank you!</b></div><div><br></div><hr style=3D"width: 210px; heigh=
t: 1px;" color=3D"#b5c4df" size=3D"1" align=3D"left">=0A<div><span><div st=
yle=3D"MARGIN: 10px; FONT-FAMILY: verdana; FONT-SIZE: 10pt"><!--[if gte ms=
o 9]><xml>=0A <w:WordDocument>=0A  <w:View>Normal</w:View>=0A  <w:Zoom>0</=
w:Zoom>=0A  <w:TrackMoves></w:TrackMoves>=0A  <w:TrackFormatting></w:Track=
Formatting>=0A  <w:PunctuationKerning></w:PunctuationKerning>=0A  <w:Drawi=
ngGridVerticalSpacing>7.8 =E7=A3=85</w:DrawingGridVerticalSpacing>=0A  <w:=
DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>=
=0A  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEve=
ry>=0A  <w:ValidateAgainstSchemas></w:ValidateAgainstSchemas>=0A  <w:SaveI=
fXMLInvalid>false</w:SaveIfXMLInvalid>=0A  <w:IgnoreMixedContent>false</w:=
IgnoreMixedContent>=0A  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPl=
aceholderText>=0A  <w:DoNotPromoteQF></w:DoNotPromoteQF>=0A  <w:LidThemeOt=
her>EN-US</w:LidThemeOther>=0A  <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>=
=0A  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>=0A  <w:Comp=
atibility>=0A   <w:SpaceForUL></w:SpaceForUL>=0A   <w:BalanceSingleByteDou=
bleByteWidth></w:BalanceSingleByteDoubleByteWidth>=0A   <w:DoNotLeaveBacks=
lashAlone></w:DoNotLeaveBackslashAlone>=0A   <w:ULTrailSpace></w:ULTrailSp=
ace>=0A   <w:DoNotExpandShiftReturn></w:DoNotExpandShiftReturn>=0A   <w:Ad=
justLineHeightInTable></w:AdjustLineHeightInTable>=0A   <w:BreakWrappedTab=
les></w:BreakWrappedTables>=0A   <w:SnapToGridInCell></w:SnapToGridInCell>=
=0A   <w:WrapTextWithPunct></w:WrapTextWithPunct>=0A   <w:UseAsianBreakRul=
es></w:UseAsianBreakRules>=0A   <w:DontGrowAutofit></w:DontGrowAutofit>=0A=
   <w:SplitPgBreakAndParaMark></w:SplitPgBreakAndParaMark>=0A   <w:EnableO=
penTypeKerning></w:EnableOpenTypeKerning>=0A   <w:DontFlipMirrorIndents></=
w:DontFlipMirrorIndents>=0A   <w:OverrideTableStyleHps></w:OverrideTableSt=
yleHps>=0A   <w:UseFELayout></w:UseFELayout>=0A  </w:Compatibility>=0A  <w=
:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>=0A  <m:mathPr>=
=0A   <m:mathFont m:val=3D"Cambria Math"></m:mathFont>=0A   <m:brkBin m:va=
l=3D"before"></m:brkBin>=0A   <m:brkBinSub m:val=3D"&#45;-"></m:brkBinSub>=
=0A   <m:smallFrac m:val=3D"off"></m:smallFrac>=0A   <m:dispDef></m:dispDe=
f>=0A   <m:lMargin m:val=3D"0"></m:lMargin>=0A   <m:rMargin m:val=3D"0"></=
m:rMargin>=0A   <m:defJc m:val=3D"centerGroup"></m:defJc>=0A   <m:wrapInde=
nt m:val=3D"1440"></m:wrapIndent>=0A   <m:intLim m:val=3D"subSup"></m:intL=
im>=0A   <m:naryLim m:val=3D"undOvr"></m:naryLim>=0A  </m:mathPr></w:WordD=
ocument>=0A</xml><![endif]--><!--[if gte mso 9]><xml>=0A <w:LatentStyles D=
efLockedState=3D"false" DefUnhideWhenUsed=3D"false"=0A  DefSemiHidden=3D"f=
alse" DefQFormat=3D"false" DefPriority=3D"99"=0A  LatentStyleCount=3D"376"=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" Nam=
e=3D"Normal"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priori=
ty=3D"9" QFormat=3D"true" Name=3D"heading 1"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   UnhideWh=
enUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"></w:LsdException>=0A  =
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   U=
nhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=
=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=
=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" Sem=
iHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"hea=
ding 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=
=3D"heading 7"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"tru=
e" Name=3D"heading 8"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=
=3D"true" Name=3D"heading 9"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index =
1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"index 2"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"index 3"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 4"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unh=
ideWhenUsed=3D"true"=0A   Name=3D"index 5"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   N=
ame=3D"index 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Sem=
iHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 7"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhen=
Used=3D"true"=0A   Name=3D"index 8"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"=
index 9"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 1"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiH=
idden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 2"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true=
"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 3"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   Unhide=
WhenUsed=3D"true" Name=3D"toc 4"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"t=
rue" Name=3D"toc 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"=
toc 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"=
39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 7"></w:Ls=
dException>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidde=
n=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 8"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=
=0A   UnhideWhenUsed=3D"true" Name=3D"toc 9"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A  =
 Name=3D"Normal Indent"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"footnote tex=
t"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"annotation text"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"header"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"foote=
r"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"index heading"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true"=
=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhe=
nUsed=3D"true"=0A   Name=3D"table of figures"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A =
  Name=3D"envelope address"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"envelo=
pe return"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidd=
en=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"footnote reference"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhi=
deWhenUsed=3D"true"=0A   Name=3D"annotation reference"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"line number"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"=
page number"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHi=
dden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"endnote reference"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unh=
ideWhenUsed=3D"true"=0A   Name=3D"endnote text"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"table of authorities"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"=
macro"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"toa heading"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"List"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List B=
ullet"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Number"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"List 2"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List=
 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"t=
rue" UnhideWhenUsed=3D"true"=0A   Name=3D"List 4"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"List 5"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Bullet 2"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true=
" UnhideWhenUsed=3D"true"=0A   Name=3D"List Bullet 3"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"=0A   Name=3D"List Bullet 4"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Lis=
t Bullet 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Number 2"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWh=
enUsed=3D"true"=0A   Name=3D"List Number 3"></w:LsdException>=0A  <w:LsdEx=
ception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   =
Name=3D"List Number 4"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Number 5=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"10" Q=
Format=3D"true" Name=3D"Title"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Closi=
ng"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"t=
rue" UnhideWhenUsed=3D"true"=0A   Name=3D"Signature"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true"=0A   =
UnhideWhenUsed=3D"true" Name=3D"Default Paragraph Font"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Body Text"></w:LsdException>=0A  <w:LsdException Lo=
cked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Bo=
dy Text Indent"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Sem=
iHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Continue"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhi=
deWhenUsed=3D"true"=0A   Name=3D"List Continue 2"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"List Continue 3"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List =
Continue 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Continue 5"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"Message Header"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"11" QFormat=3D"true" Name=3D"Subti=
tle"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"=
true" UnhideWhenUsed=3D"true"=0A   Name=3D"Salutation"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Date"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body T=
ext First Indent"></w:LsdException>=0A  <w:LsdException Locked=3D"false" S=
emiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text First In=
dent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Note Heading"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"Body Text 2"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Body Text 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Se=
miHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text Indent 2"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true=
" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text Indent 3"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Block Text"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"H=
yperlink"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidde=
n=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"FollowedHyperlink"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D=
"true" Name=3D"Strong"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"20" QFormat=3D"true" Name=3D"Emphasis"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
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
=0A table.MsoNormalTable=0A	{mso-style-name:=E6=99=AE=E9=80=9A=E8=A1=A8=E6=
=A0=BC;=0A	mso-tstyle-rowband-size:0;=0A	mso-tstyle-colband-size:0;=0A	mso=
-style-noshow:yes;=0A	mso-style-priority:99;=0A	mso-style-parent:"";=0A	ms=
o-padding-alt:0cm 5.4pt 0cm 5.4pt;=0A	mso-para-margin:0cm;=0A	mso-paginati=
on:widow-orphan;=0A	font-size:10.0pt;=0A	font-family:"Times New Roman",ser=
if;}=0A</style>=0A<![endif]-->=0A<!--StartFragment-->=0A<p class=3D"MsoNor=
mal" align=3D"left" style=3D"text-align: justify; background-image: initia=
l; background-position: initial; background-size: initial; background-repe=
at: initial; background-attachment: initial; background-origin: initial; b=
ackground-clip: initial; margin: 0px 0cm; font-size: 10.5pt; font-family: =
=E7=AD=89=E7=BA=BF;"><b><span lang=3D"EN-US" style=3D"font-size:11.5pt;fon=
t-family:&quot;Calibri&quot;,sans-serif;color:#333399;=0Amso-ligatures:non=
e">Best regards,<br>=0AJoye Zhou</span></b><span lang=3D"EN-US" style=3D"f=
ont-family:&quot;Microsoft YaHei UI&quot;,sans-serif;=0Acolor:#333399;mso-=
ligatures:none"><br>=0A---------------------------------------------------=
--<br>=0A</span><span style=3D"font-family:&quot;Microsoft YaHei UI&quot;,=
sans-serif;color:#333399;=0Amso-ligatures:none">=E6=B7=B1=E5=9C=B3=E5=AF=
=8C=E6=97=BA=E8=BE=BE=E4=BE=9B=E5=BA=94=E9=93=BE=E7=AE=A1=E7=90=86=E6=9C=
=89=E9=99=90=E5=85=AC=E5=8F=B8<span lang=3D"EN-US"><br>=0A<b>Shenzhen Forw=
ard Supply Chain Management Ltd</b><br>=0A<b>Rm 1006 Jinrun Bldg, 6019 She=
nnan Ave, Futian District, Shenzhen, China</b><br>=0A</span></span><span l=
ang=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sa=
ns-serif;=0Acolor:#333399;mso-ligatures:none">Tel</span><span style=3D"fon=
t-size:11.5pt;=0Afont-family:&quot;Microsoft YaHei UI&quot;,sans-serif;col=
or:#333399;mso-ligatures:none">=EF=BC=9A</span><span lang=3D"EN-US" style=
=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sans-serif;color:#333=
399;=0Amso-ligatures:none"> (+86) 0755 8332 9469&nbsp; Fax: (+86) 0755 833=
2 9469<br>=0AMob:&nbsp; (+86) 15986709674&nbsp;</span><span lang=3D"EN-US"=
 style=3D"font-family: &quot;Microsoft YaHei UI&quot;, sans-serif;"><o:p><=
/o:p></span></p>=0A<p class=3D"MsoNormal" align=3D"left" style=3D"text-ali=
gn: justify; background-image: initial; background-position: initial; back=
ground-size: initial; background-repeat: initial; background-attachment: i=
nitial; background-origin: initial; background-clip: initial; margin: 0px =
0cm; font-size: 10.5pt; font-family: =E7=AD=89=E7=BA=BF;"><span lang=3D"EN=
-US" style=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sans-serif;=
color:#333399;=0Amso-ligatures:none">E-mail:&nbsp;<a href=3D"mailto:joye-z=
hou@fwd-log.com" style=3D"color: rgb(5, 99, 193);"><span style=3D"color:bl=
ue">joye-zhou@fwd-log.com</span></a>&nbsp;</span><span lang=3D"EN-US" styl=
e=3D"font-family: &quot;Microsoft YaHei UI&quot;, sans-serif;"><o:p></o:p>=
</span></p>=0A<p class=3D"MsoNormal" align=3D"left" style=3D"text-align: j=
ustify; background-image: initial; background-position: initial; backgroun=
d-size: initial; background-repeat: initial; background-attachment: initia=
l; background-origin: initial; background-clip: initial; margin: 0px 0cm; =
font-size: 10.5pt; font-family: =E7=AD=89=E7=BA=BF;"><span lang=3D"EN-US" =
style=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sans-serif;color=
:#333399;=0Amso-ligatures:none">QQ:&nbsp;&nbsp;&nbsp;=0A1026477702&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WE CHAT:zzzz_223<br>=0AWhatsapp:(=
+86)15986709674<br>=0ANVOCC NO. : GD202206083136</span><span lang=3D"EN-US=
" style=3D"font-family: &quot;Microsoft YaHei UI&quot;, sans-serif;"><o:p>=
</o:p></span></p>=0A<!--EndFragment--></div></span></div>=0A</body></html>
------=_002_NextPart665582704756_=------

------=_001_NextPart504488373864_=----
Content-Type: image/png;
	name="InsertPic_(08-28(08-28-16-48-13).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@3c565a5f-b037-eda1-48dc-5b70cf8baf01>

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
AAAAAElFTkSuQmCC

------=_001_NextPart504488373864_=----
Content-Type: image/png;
	name="InsertPic_DF55(0(08-28-16-48-13).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@9b461f8b-f6a0-38c4-85fc-829e4107e411>

iVBORw0KGgoAAAANSUhEUgAAA/oAAABpCAIAAAAFns+GAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAg
AElEQVR4nO3dbUgc6Zo38GuW+XBkw4KB7bNxnahpJiJJTmiiSGcmzkQzve0aaHBg2jiHRDyoMHkR
jOImZCJmQuaIRnAyORBlRMOOSQ+M0GxcXSeaGXNOekWD5CQhmNDRzridc/pAfHhwcb48+Hyot7uq
q6qrX7S7q/8/8iFdXV1Vfd1VV191113lWxsbGwQAAAAAAGb0NhFVts0nezMyznh3McKeFIh8WkAz
JQXCnnRogqRDE8QMoUtlf5fsDQAAAAAAgM2Cch8AAAAAwLRQ7gMAAAAAmBbKfQAAAAAA00K5DwAA
AABgWij3AQAAAABMC+U+AAAAAIBpodwHAAAAADAtlPsAAAAAAKaFch8AAAAAwLRQ7gMAAAAAmBbK
fQAAAAAA00K5DwAAAABgWm8naDlZdW173BbZJN/I/KUFjXefvKwcXldODAVPdQf9zASrc8/XFVny
Ramua7W7zT+ttg3Cu6vvd++y07qn9+nQa27i9ovSFK0Fam35mygCk0gxBPmN8E0FoeCp7tVDmoEK
7mzb47bIwyL7ytzSxPiQRjPptAW7CrWZZaszug2bRueLxLl2jW+xI2egJSc3Md8ubOPDDjE9Rrdk
K5sjTrpHUCIjr2X7xe5d9lDov8jyLxZamXraMLHOv8Ovfd3T+5J+qzhAtDKheZSfKG7bK77ivjub
ornp4hQuROGLUW07A+lFpJoeozpqzC/8h2bFY8nVzfayqWbdhxPEyC+OLI3ozpku+G+tkRL5DKBb
EMoSpnyikcJJJ6v8X1/oH+yyIiQ8NUUsz3gxFUvMtPjqz03s3bfXFo+35ViNf8CS87Vs/qxD+7L4
Rf1mu+4ns9u6reWxbueWLHCzRAqyvNaPzd5dF206bxtvJjU7cga65Tv03l3j4cGPsA2QkmzW8e7i
AWdWsrdDT9RpyiC172517rAT+e6++o/H60SUuy9bWu8/ZeUS0ZPXzO+HKL5DLMXtyBnoZmv9hC/c
QHqBLbRZR1zGENLI3/5PsrckcdbvR06JiUyD0eyE/++Pd1eJiPZmc3mDi79GrtZfS5IzeaJ693ni
KQvfW2PJ+dQWFE5ilCdDsok263htNlmyD+0I+rl5dmS/ZyEKra9YsnL3ZpfTG/kJq/BB/hTwVzt3
rA91zw+R6rnX9vcjb3v4Aoleq255kkURZJvVTrLT/XJnDpFOoLLq1NZor7WWL2h0GKg3k8FVZNX9
NidX1n/GzZ/ddmL7tPwsVm8bNpHOF9kcr4MNbcGELjHWbY57S6y//lU8H988GkdQIiOv9t25XL/6
xwXy71hdqcjKtWTlEXHdxuW/ySYi35/fCImRESETpjUhAzA5yuq0HorwKYNHpcH0ovxhOqQyERQU
8fmLfrbX/c0CVsR9W0wj69MLW/vbtJn8j3RSIlEi0mCknVCvaNl5JNttyT7mzJqeyPq0Ioto3TOp
3suut5YYi6WEtexm9e5PD893P6EoTmIWVn3yCdb92blEK49f3npCRNnHtPoIuVNA+uVVonb0hC9w
0xgOshS96Ylor0qv+56sE2W3nVBfhdFmUmXLcVuIaLVbulb+5tKI7EzayDYkyfaL3cXj3dZysR93
R85At3Q2b3XuYfp3s+raise7uX976nbIl8R9kJ9ZWCy7CmEGpquAe0vaAMN9FWGbrdw8se+T3RID
a5RvZPmJYu6qZW7FHpWvnBrkR5Ba5CNHSaVx1b+7LcdtoZWp4DQRvV79U4iIst/nr1ltf38vcWcC
4eI6xFKcmAGY4Qf+CX9iqhaj6QW2TtSFASiwacRMIqXEBKbB6HfC9aG7q0SUW5FTZ7hrP3wtSc/k
mziYZ/rPq0REll8JNUGWu4X/UVS5vm/LthNbZHOnsOt/erTOLUd2lYddWm02EflGEjDQWXuBulue
VBGCvODndrjcij3j3cXjMZXLryZfekJaw2kiNpMevgf0yaqs7f6yvkJE3NUVQ9uQXL86diQ70jxa
g/OEd3+bk0vyYYuKVfA9oESWnH/jTwnEMVrZbbX6G6C697Kbvf2ibMBDdpvKmUPENco28tOUayZN
YUcQy0iU9BtXUv6bbO5IIZJ+P/hfAi77KQ4EXlyHWIpTzwCbunCV9KJ6gKRuzk8NscdH94iDCORp
xEz0U2KC02DUO+FC0BMiomx3RRbRarexAfTytcT8FRKWi5L+ZB5ZkS2ds3IdM6HV+6+Fjn9L9iGN
DsKE3/pjpnuJpofnK7kOLW7caiyDJteH/j24wg2nUbwTTTPFR3sbkizr57vzlW3zGpU6kawLc76y
bb6y9/Ur5s2dzl3cvcjaS+BXwZ+5/TpLODfmF3hqKobUz2w2t7RQ8FTbfGXbU09IrREjr1G2ke/8
Omt6mJ9tZeppZVuaXmU2ECW1xlX57jtyju2V9wlxx8ve7PLwy9asrTvEACC1hacRM9FJiclPg/zZ
iKxMjUryv0Kix+6zuAaj0C9+Im4spuJ+asX8bO8m/1lLztfdOeL87+3PGnot1Rm+kflLf8kZaMmx
1+6p+4t+PbH+KkR2S9bOfxKH43NkI3Z0FpiyJwCRgkxERAv+ygXhnoTYBk2+Dv5+Kvvriuy2E8SO
uTLSTDr8f/2FKIsU4/C0BlNpbEOyqQ/AYHG9jFKOeM0OOsx2V5DOQEB2FYG/rtPerPBuSz6M2tSO
O+YiKbc0WSOqfwXdNSo3Ml2wR1CYyFHSbVxmLY6cXGUrv/njk132vdnv27JeWTR3pDgPsRSnngF4
hpJ21AtXSy+qP0wpm/NTRMzx0T3iQI9aGjETzZSY8DQYXjhFthD0HMl2W6K4tMKuJZ6vkKhctFm9
+8KD1SLvmr6R+co2Rf8oN2xLSeXax+vgrSdElOX+rX6n9fqrEBGR/Yg4rnqHnYhC64EYF5gSIgfZ
ZpVGv7z+5ec41uWf4IbTZDPP+THcTFr4GzbYQfnbLyqu80TYhtRjycoj2T34/r/+wg37469L2HKY
geyr3SOrRFnuluivWgjjj/k8Eitu84R+a+6fxslzgtaYOoynKa0o6TauaPv7e4V+HQZ3Sdd+ZNd7
Fq0BLXEfYilOzADMVUer01q3I5qkHXHhxtILbAHjRxyEUU8jZqKREhOcBrdmJ5SvJSUyeYJ79+21
xeO10suVqZds3cC8u9qt8xAMaeSAMICe75lmntsjmB5++X73LnukTuvpP6+27c1WdM757qrct6q6
QPmWJ/mhtlEEeUQ5s5HeaA3rQ/8efK9FGJ8dZTNpeHNpJHu8Npv27hrv3iVNDgV/rz6yJWwbUsrr
X34myqXstu7iNqKV0DrfU7iw6qvNtgvTidY9vczOv+Dv/k1x216VhxFp4R9iIC0wPtzmMYdG+F0E
8awxt2LPeEVqPTVC/whSpxUl3cblvvvEf5NdNdvwy8zK1RzJE/8hluKEDCDLzOueRxRV0o6wcKPp
BaIQ1W9iLEccyAnP3zT1n4BQTYmG0mCWu6XYzX9Avbzcmp1QfS3xZfJE1Z+bN3Z/tVt/QLM2vu+Q
7e4SO90d4Tebvvl2ap2I7LW6T/9Y8Ff2BleYCdrXR4wtMCVECrLieUeh4Kl4zlVeB3/PDNqOspm0
ttBf2faS3ciVqaeVOn/URr4NKUZ47gcRPXn5+8fMdNl3VI5GmB5+6ePurDB4L/XrYIO4olDwFPf/
2C+OKzYvYWv0T7xOpWFXqoynKa0oqTcu893femd3lsZp9ps/PuE3Q28kT5yHWIoLywBS/2UUSdvo
wiOkF9h0sRcGmU16jK+pqaTETUiDW7MTSmtJkUz+1sbGRmXb/JatDzjj3cUIe1KYLvL8M3O0H+yT
lms0TzPZrOO12VvYOnExT9jTFpog6VKxCdIkjaRi6ECwibfqAsDmCH/44+qtzf0Z2Po1mgV3ozwA
QMyQRiBuKPcB0pz0R0PNu0YAAACIFcp9gLQj/tltE68RAAAAEiPpf2YLAAAAAAA2C8p9AAAAAADT
QrkPAAAAAGBaKPcBAAAAAEwL5T4AAAAAgGmh3AcAAAAAMC2U+wAAAAAApoVyHwAAAADAtFDuAwAA
AACYFsp9AAAAAADTemtjYyPZ2wAAAAAAAJsCvfsAAAAAAKaFch8AAAAAwLTeJqL/9P0t2ZuRcf7V
/o8Ie1Ig8mkBzZQUCHvSoQmSDk0QM4QulaF3HwAAAADAtFDuAwAAAACYFsp9AAAAAADTQrkPAAAA
AGBaKPcBAAAAAEwL5T4AAAAAgGmh3AcAAAAAMC2U+wCpKOipuuZL9kYAAABA+tvKcn/J22Rp9Syx
k+a7xClL3iZL1UHxX5V3xfinxJklQU9V1UGLvGCaunaQWUXXlP62pSdFGBVfKnIwmXeZRUmxUiy/
dd7wktUaV5pTY4Mz05K3ydLQNzdxVr6XrvS3au+90UwH4/QPqKlryiQDicRmhrB8ztFqgqlrar8L
oGGLc0UGt85Kf2tTf1A2KWLw9bNQulN+O/Fw5g9/IVyKlzFJUMYOa0Su4NSqcFT4WjUS2iZKrd79
oubZsQehsQehgWbq/0QsJSOa6/9WcZAszU1T0T5mwkp/68FjAWH5Yw9mG18ei2+/SV1FzNc8NF3K
FOXGLXmbSu+XC8spG2f3S3H5na6bHYZjqNG4U9cOWjrolrDBoRY6Za5cFrX5rtL+XbcGmkucV0MD
+ePSee8Xz2v4KN1yeo+JUeLmNz4dopWIA0pT0FNl1kSUEEzwQ6ftyd4ac9LL9uGwx8Ys6Kmq+uTC
M/lEJlHPNr7UTNSbmoWSTuUw97V2eI93PgiN3WjMCX9pWMJ3V9VGJCJyiWXMmCs3wkLmZ24W7SuZ
mNnSbrjUKvdFOe4WJz37H2Nn/0Wu40Xecdmu77vev8t1SHq95P3iAjXP9rgLhCkFrhuzjXSh1+Q1
UIHrRqjTdbMj2g6blR/uPz5eI4bL3qP6Q1tcdjyGbWIbd77r2ITr1lh7BfPuGNNMGWjK5yVnGR+Q
HHePkDgKXDd6ivl5Kj5uLnm2/JKIaKX/trek8dMKafr0D0Gd6RAXxQFVcRo1aJKhCeJmLNtDnOa7
LA3LLWNXFT+abMIvKCkXErueWH/W00rw1TPatztH42Ws4k0XGo0YrSmf93jN564ib+9WXuNK0XI/
Ovkna1w3b7OjUIZuOss+kmZQpDNeQUl5RtRAxZ9ejmmvuumLcKVpyTt0s6j8o9iPQFlJCpxdO/dR
xJP+4PIc/7+fnz/b5yoR+hJydhbR4+dBnekQN+aAEi8NL3mbLNd83HBBrtdN/QK9ODqF68Ob77I0
9M3R4wsNZrtAv3kUoWavzksxb/X4mY9IwzhbPUv8bIpGMXXlZIBWtleELnyPlY+O8LWy+7/WEZGZ
rVPcHmI7tgQVdpeY8Ke+75sryt9laGmyn3XDMfS1psXwTsVuppYnY0uw/O6q2KmYlxEGVmk0IgWX
jTYcEQU9vROuyuLcjw7tm7v/JzHtax1Ksva95ot9IFyKlvvzXccmmGIlouKy48/6rvOhWfnh/uPj
dvYE7ufnz9TOCzOlBsq15kX9kcaW5pKJs+olyLO+0qqDlqqDpf10uSX6nnipceUlKRARUYHr88tF
3mMNfXOas/haO4TTpOAr+UXFd3YXEelMhwTQOKAmzo7bH4TGHvQU05K3KfwC/ZK3ydLx8vIAP2jt
h3mi4vbQQHMJ7bs88CCU2Re1NAnZRjYilgm1iI15qGb5woTwxnwXN3No7OrxZ32nvCsFrrrjJF0Q
nvJleKeDdrYPC110e6zGEYHWkSluD3XSsaqDlqqDxwKyMQi6mCxkNIYr/a1nnzV+xw3Z8qfUvRPM
Yd4anhjD9rp4E2xxGRMfqdtRdbFRf4VIn1qam55zllUQFbjqjhvocV7yNh2bEEYK2WeOTUSYX1Nq
lftivG7nz0Y3Qst+snEf3z8x/+0Faj5ZHPkzRESJuDxkTjnusbGrx7kWUQzllEbhl3sbDI8gjNS4
uK9UkNvY8yA00FwycVbltqSgp6rq7E3n1cijA2GLFYlpx3e9//Hxznb5BfqVH+4/Pt4p7Pk57kaj
OSqzMYN6pX2+KDzDc+EVOt6K2285hXeK24WzAnulU/qP0J/tG4+qa8mUtLK9SuiiITUTWkfTkrfJ
cjt/VhyUH8NVvmhiOPfqZ26GxpT6BWEO857IiTH+BMvEJ/gnL9/tqLpYY4rb+RsPxr67TH2lene/
sP3R9krn4wvf6w+jUBw7n16Ouefu7Vg/uCmKuFNbX2vV2VPe96IqaApKykv6h/o/tlt93pJD3xUQ
McfMO7uLHj8PEilKzOCrZ0S7E7f5qWrFH6AiewzHtr1n7EEP+VqrzlpUex1y3F83Tpf6fD3FBgbD
qTSurF0KXDdCLqKgp6phOfpNNSPn1dmdQ6UNXVbh6uGSt6m0//HxzgdjYiLL2Sk/9n9+/kx3OiSA
xgGVt5M9QG52HLwpvdrnD2pcY4QYyENNpH0Jl7tS3+GVXjp/Jsqt+Li5pGFm6rR9l3foprMuhHZR
zfZqoYtikVIzoXW0cCXmDS5QBa7PL9//5Pq820DJy2QhozHMbey5+rzqrGVC/DlOY3EmWCk+c9Nz
zrox4YNhi6WK6Ha/3MYa14WOmanT9gqiqWsHhc74fZcHbjTmcGcXNCdbCz+zBsX3imGwhmAre/cL
/nkXyc+Wlv7npVritvd0uub6v+D6NY1+Ksfd4nzs/b6rd8LVojxPyP3o0D52cD+/nLnpOWdddHd5
p6P5by88c1UWUzRNwLL3DDRrnea+fPWY+09MjaveLiAqKCkvoZd+4TFk3HVG+S/BO7uLHnvnhMuy
wVfPiGtrrekQN+aA0nG8U3jQxJj4NIlMGDqYRGx4V/wB7j/iAz24R1QJ7+e85yryjs+Hj/zMcGy2
1whdjNA6CSVloahiaO8x1AOdBuJNsBr7mNpiY1dxWrmoqe/75pxXmVVcZYddaVA9dqK3pYN5isuO
k/eYuJMFPaf6NQ7m4vZb4jUOw5+qsLvmJrxz4lNNGAWuzy9TX6n8ofKl/XT5Y5OnEmE0m3glyGAw
V/pbmWftz02r34YS9PROEP/xmBo3vF1gydsk/TWDuek5/mZorduacz86tE98EO3U933C/q81HeKi
PKDU2SudJJ3H8n8xzX6ycZ/0MI2gp99Mz9FLPlnMl7xfqDwpL+jplYa95jbWuG7e/sIbxchPszKQ
7WWhk2EfLbDkHbqpPhdaR0t4ZCJ3JWhmoQgx9LXyP9C5Hx3aR2ksIQmW6238wisFXHWxhiwFxRsh
fK0dzLP1lHzjYskU9l00DiUDx45BWzuYx94zdpW4a0lE3ImU1kWrio+bSxrOVu38bsxl+FPFn14u
eknqFXxuY88D67WDpVV90rSi5jieKpPCnvVJX7OoeXaMvWZnMJi5jT1lrVUHj/EvXbfYhTDLZz4e
W+OqtEtJ43eZXJgWuD7f3XrQ8oyIqFR+yXWu/xNLvzQnF+EC141brw4eq/ISETmvik8Z05oOUdM7
oNRVnH5wS9yri5pne+z8w3+pqbTqoDCRiL8s2Xes4eCF9L+8nlwVp7+73PoJH3Pn1VvOs73EX060
cJfOi5ovO0m6A7647HiH91nj5xkfc61srxE6xR7r+vzy/U+4PFPS2HycHquuA62jRZYraJ9mV4Jm
FjIeQ/vJnU2WqrNEXCun0i+C4ttFyoQxJ1h2IQUl5SX9fdT4eYXuYo0oCH5raeDHU5U0fhfSGog+
P3OTXLfkdVGF3UUT0z8E3Y0ahxJ77JQ0fnfL+Umvwc1SeGtjY+M/fX+L7cPpbaW/lftbCfLnvm+N
f7X/Y4aGPdnSJfJBT9X3O8cytkZPl2YymYwKe9BT1TDtGoj3en2CZVQT6Ehi65imCbY+hqYJXepa
6W/95HmNkRuaw6TWrbpbKrex50FjsjcCQF2Oe+x0srcBwLy4QbRjKVXrgwCtEz/E0ByWvE3X/5n/
I5vccK9bsY1wy+ByHwAAMg/3JJNoLtbD1kHrxA8xNBF+fG8H9yqO0Sgo9wEAIIMUt4fG2pO9EaAB
rRM/xNBUEjQUJbX+zBYAAAAAACQQyn0AAAAAANNCuQ8AAAAAYFoo9wEAAAAATAvlPgAAAACAaaHc
BwAAAAAwLZT7AAAAAACm9dbGxkaytwEAAAAAADbF20T0/NX/JnszMs7unX+PsCcFIp8W0ExJgbAn
HZog6dAEMUPoUhkG8wAAAAAAmBbKfQAAAAAA00K5DwAAAABgWij3AQAAAABMC+U+AAAAAIBpodwH
AAAAADAtlPsAAAAAAKaFch8AAAAAwLRQ7gOkosBgxcV7yd4IAAAASH9bWe77h6u31Qz62Ukz58Qp
/uHqbYV54r+K4WXjnxJnlgQGKwrztskLpsmLecwqzk3qb1t6UvkigcGKwurrAXbSvTNhwTEYSUUz
nZnRXq+BxpXmFN81RSvEyT9cvc3ROeupU+ylRES0fL2GaU2udeT/ZI2itreDcYpdV7F/Tl5UHkcQ
CzYDiP8SHdjJi2r5LXPMnNsm/yGYvCjfnwODFUz20LdJwcyANooigYv0s1C6U3478cDn04IQLsXL
mCQoY8sbMawdDezDKjXYpkut3n1bx6PFwNpiYG2yg658YDDvENHslRuKasb/4x2yHWAmLF+vyat+
Lix/MfDo/GJ1fPtNGpuZHLQdKPVMhpeABiLJNNNA7WCD4RhqNO7kxbxtDTQqtMtaFzWaK5dFbebc
/iuFo5Mdpe6htcl377CJIzBYUfhB+wIzc179lBi6xcDaQC3ZOprLmOUsBtYWA6PukeoMj2o8bEze
qLyz33BJZIjK2XjmKftSSMsHyD3E78yXDid7s8ylzFFPDxelPe3eHQ/Rwp0JqfR8MUu1R8uStX0Z
IKoErrCpWSjpmG8nHPj3zjSM1A8E1hZHT+aFvzQs4Qk2vBF5tWIZM3UiP8JCtGuwTZRa5b4or77d
TU+XjJ3l22rrbSN3ZLv+vb4rhdWV0mv/cEs7dTy6XW8VplhPjD46T+3tmVgDTd4dqf+st9o20qU4
BzUQSZkyR30Mq2cbd+Zctad2dPFLB/PuFNNMGWjy7gi5HXxA8uq/EhPHzLltjhfti0PaMb93pmGx
q4uL3vL1P4yUnm/iluP4XUcp+7sOsbKeGF0bqB1s4K+WOC6hKoV0UVBoo8G7QodiYOkpETEnALLM
AwkXXQLXo8hC5hRYekoHCvM0XsYq3owduREN0azBNlWKlvvRebf5s9rBP0iFu3/42qDb4ZRmWJ4Y
f1j/mfIosn54NBNroMBgl6f2aFm+s/LA7Pi0/GwnYiRl/MPXBm1HnbEfgbKSFDhW6wFSPekv+3KN
PS8K4x++Nug+LfR8LC0uHKj+UDhVyCvYI+vYgziUNXUJaVq8NOwfrt528R43XJDrdVMfSSWOWuEu
tsyc2+bonKWH7Q6zXaBPCPmV93tnIgxUu3cmLODSbDWDLxRLZhrCP1wd1kzmq6XynZUH6PkSP8Dy
xzuz7qFRt3gCsPziOZVaC7hZVfde1WBye774FjuMAW0kE10Cj7g0KQtFEyuV+KciRWJUy5OxJVg+
pSh2HuZlhBGwWo0YeDFre9doN6VGDaaT7qT2vXgv9gFvKVruz5yr9jDFSkRljvqFzj4+NMsT4w/r
j7AncEuLC2rnhWatgRY697Mj4Ryds8yb/h/vzLodDiLridP14Wc7ESIpW/7+K2SkK0JJalx5SQpE
RGQ90dtlG6mWt5oB9/quUNfvhMbiu+5EBYW2xG1ipst/d7faZE/dnSOBtcXAV2XkH64WR1I9Or9Y
Lf4GNyx2TfKD1iZmiMq+XJvsKKUDXZOBtcy+qBUVtfAuX6+pe3r+p7XFwNqi48XwsmK2tc9etHuE
z8+c41pqbXGofqGzcXjZeuJ0PUkXNifvmrMbgu3h8vsflloLHEdqhRMAKRtr7b3qwSQiT10j9XJj
UWavtHADJ9BGUZIn8MiYLGQ0VirxTxVM0XImPDGG5cl4E2yZg4mP1O2outiov0KkT0WowcLnH66u
9ggjhY5MVnsizK8ptcp9MV5/ePdRdCO0DjefP8D3UszcaCeN0W8qEnB5KOWww+AWA2uTHaXSe2wF
f/io+2H7N4qbRQxEUhqFf3TUYXgEYaTGxX2lgvyTtwNrkx2lnjrjtyXFfaUF4iYNur3Xd+Vh/QDf
CWT98Gjpwgs/d+gNCHt+Xv1JDJKOkWp4iYhm/UtERHT45Il8PtcJs1HZl6NuYQFlX37FB//wUbf0
H6Gf+96dqDqb0kheebWN6+ESvmPeu/wJwMykkEB09l61YBKRraOfG3NY1tQlLB9tFJW4Eng0sZLH
P2UwRctXkRNj/AmWiU9gepQ/0dXcaSMT7j5aW/ypizr3692DG7EGU5tfOkaaumLuuUutcp9vcv4M
NaqPWj88Wuq5dj1Ak3dHSivL5f1kBYU2tV58ZQ9oBghMjy7QYAN/Gl3tofBxI7qRlMur7xfPDSJS
aVxZu1hPjIadnGQ299Cj89TuMHLyszwx/lDWWHkFe2QzLC2q3FoEsVl+8Zz2FIT9WO4uYA8W8Sjb
5uicpcUXAY1rjBCTsPDmn7w9VO+pY3rXtAPOPAio2sMXQI7fdXB3zkU3piLN5L+7mwbv3pOKe+EE
wL+0yO7A0e298j1fhDYyLCyBG/iIlIWMxio8/mkszgQrxefHO7PMvhS22Gi3K//kZ7ViWcU8DVLo
uTNQg8kpvpfGtWUjtrLctxYUkvxsSZFiBIe/Yq4JGv1UXn27++HoN+e6PLXtytPWfGflAXZIOr8c
eTNngslvOmfFB19wxTcp7s3Vj6SS3/+Q+09MjaveLiCyfni01EjGCUyPLigaq6DQ9nD0R+GcObD0
FM/cSJSZG+0LkYNZP8BcYeMvZ5lx6GCSqIX38FfK3jU24MsvnnP/ER/xwT20Sng/r7zaNnJnRmME
o1lwo3cmpeSc76w8MHh3UPGtI+29YjD1oI2MUkngkUhZKKpYhcc/XcWbYDX2JUTdG5UAAAOkSURB
VLXFxs5xSbkoQzWYUtSHnrot7d0vc9TTSLW4kwUGG69oHLRlX46K1zgMf8pxpHbWMzKr9mwB64ne
LurcX8PehFq9P7qhciZw746H5KE7fNRN4QW3TiRlAoNd4gJjatzwdgH/cLV0P+KPd2YNXOH1/3gn
7D6hfGflAfGxqpPfdEZuTTBAGB6qd8ud8rDi/2La4ebzB6SHaQQGr5vpOXqbg71t3T98bZCfrBre
e2f45JPvrDwQPpt/uEXl2XmBwS5pIGz+yc9qB//QMhrFWNA0VOaoX+isZpKztaCQnt8Zlc5g1ffe
yMGUQRtFQS2B686vlYUixCo8/mkqIQmW621sibTnG+IPiKNR7p1p0HnClV4NZiTdGTj0tL0d6wdj
cvirxSEqrNsm7JH1A5rjtBy/6yh11FVYf5o6YfhTZU1dtkVSr+DzT94OvHsxb39hpzTN1pFZY51n
JgepdlQeOseRWvLcmQjUyx6/oxdJbhQ+H0amLWJrXJV2KT3/UyYXptYTvYU1edsWiIj222RPj9Xi
9z+k3aeVD546MTrqz6suHCEicg/heZGxY3Z4snU8WozcIo5LgVFxr7Z1PLp9mH/4L1Xv567L2joe
3SbiL6Z1Vjvy2o21dUaxnujtGv+A24dLz3fUE38tUTW8zdbqbYV1RNwDsA8TkePST101H/CzuYdG
3XVdxF9g3NaQN0hEto4uN0n3xJc56htGnp7vNXUrHD7qpkEPc3mqzFHfMDJoOyp+a9XwagRTE9rI
ONUErqSZhYzH6nB4/FOF4ttFyoQxJ1h2IdYPj5Ze6aTzvQ7dxRphDdzY5hjh/l96/qc1rQs1ujXY
Sc10Jx0jped/GnV/oH/oaXprY2Pj+av/je3D6W35eg33txLkz33fGrt3/n2Ghj3Z0iXygcGKbwqm
MrZGT5dmMpkMD3tgsMJxp3oy3iv4ccnwJohoC9rINE2w9fuzaUKXupav13yw+JmRG5rDbG3vfkrJ
P3k7cDLZGwGgLq9+6lKytwEgk3DDaqcy6pJvukEbGYdYmYN/uLqvYJSr7/3DLe0LyusDRmVwuQ8A
AEA0c25bw0hUl+9hq6GNjEOsTIQf39vAvYpjNEoGD+ZJKlzzShZEPi2gmZICYU86NEHSoQlihtCl
stR67j4AAAAAACQQyn0AAAAAANNCuQ8AAAAAYFoo9wEAAAAATAvlPgAAAACAaaHcBwAAAAAwLZT7
AAAAAACmhXIfAAAAAMC0/j8ukRC/G5neQQAAAABJRU5ErkJggg==

------=_001_NextPart504488373864_=------

