Return-Path: <SRS0=JwlF=H6=filin321.com=cindy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9707CA6007
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Oct 2026 08:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D53FC1F00893; Thu,  8 Oct 2026 08:44:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.251.236.138
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791449056;
	b=KHNT8Bsm9TcqfdUA5+NM+pqj9L4wfNuyfgVm2ej4n3BdbCOgytwDwWaoYaTpe8fYVdu8
	 qLFhW1pHPHEWIpjYKYi9DpJ6K4LzXD2h5U1F/18f6LhepIXchs3hYOh/8+IaJMhHGSvU3
	 Nl55CkQb0arlCrULo5znBvB8lEU4pcgc8Os9nNXN5jlUt7lKOrLzTWyQGojPxUKGhrfc+
	 U461ab4BCES3/WeJWYLpZ/3OQyD29nDQAGcBCiEdTNoG8eiL/GFNrMxNHv0PysOd0vF5D
	 n3VR5cGpA9QYYwuUPjCFsERX8DWWfPXtI2EbDkLpLu+ZM8oUH9fYy3Xa6Ft5b0X2Znw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791449056;
	h=DMARC-Filter:Received:Received:Date:From:List-Id:To:Subject:
	 X-Priority:X-GUID:X-Has-Attach:X-Mailer:Mime-Version:Message-ID:
	 Content-Type;
	bh=KpTP1BpB5EDC567En3jOKwzU7fZsmM7srLeKbSA6kEM=;
	b=ODnTYpH6+mg9pzIBsWyiokvJmdpTGTo7EzMqaOEuQ17WyX4t2opxtTvfZrpKn1tF0Uvs
	 IeUKCIl/NzLI2DQUCxrB1JYwDVzNTAjHlX3DZ5C41bNPvGognOKIEQ5MVhy+KZL6RAXyn
	 BnKwaqcMDyQy9SAbjKVkDbSCWBXNrEBdlGcawxMHwFiSXTqLlbIOdUA9hFhpdP6WYdWly
	 CAVoTRe0KXrpkKtnstUj00rq0feij12BbCI7E62LK+EXL1ZnqSAcjZXh50VHnmVTZba7A
	 c+LV1urgFgfQvCdZixOrfE3rTq4PD5a4J9cfeOf/cbQ5CrJvA7wZHBlzlp0PYCUvtMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=none header.from=filin321.com;
	spf=pass smtp.mailfrom=filin321.com;
	arc=none smtp.remote-ip=103.251.236.138
Received: from email1.8lian.cn.communilink.net (mail.filin321.com [103.251.236.138])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C45F21F000FF
	for <linux-firmware@kernel.org>; Thu,  8 Oct 2026 08:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C45F21F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=filin321.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=filin321.com
Received: (qmail 26519 invoked by uid 0); 8 Oct 2026 08:25:15 -0000
Received: from unknown (HELO DESKTOP-EUB5OK8) (cindy@filin321.com@14.154.15.69)
  by 0 with ESMTPA; 8 Oct 2026 08:25:15 -0000
Date: Thu, 8 Oct 2026 16:43:50 +0800
From: "cindy@filin321.com" <cindy@filin321.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware <linux-firmware@kernel.org>
Subject: Stable Transit | Updated China-Spain Rail & Trucking Rates
X-Priority: 3
X-GUID: 6E761F25-584F-4F52-859A-9E2DE4DCB6F3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.542[cn]
Mime-Version: 1.0
Message-ID: <2026100816435022953715@filin321.com>
Content-Type: multipart/related;
	boundary="----=_001_NextPart446847311164_=----"

This is a multi-part message in MIME format.

------=_001_NextPart446847311164_=----
Content-Type: multipart/alternative;
	boundary="----=_002_NextPart551318667421_=----"


------=_002_NextPart551318667421_=----
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64

RGVhciBQYXJ0bmVyLA0KDQpIb3BlIGV2ZXJ5dGhpbmcgZ29lcyB3ZWxsIHdpdGggeW91Lg0KDQpP
dXIgY29tcGFueSBzcGVjaWFsaXplcyBpbiByYWlsICYgdHJ1Y2tpbmcgbXVsdGltb2RhbCBzZXJ2
aWNlcyBmcm9tIENoaW5hIHRvIEV1cm9wZS4gV2UgY3VycmVudGx5IHByb3ZpZGUgc3RhYmxlIHRy
YW5zcG9ydGF0aW9uIHNlcnZpY2VzIHRvIFNwYWluLCBiYWNrZWQgYnkgZ3VhcmFudGVlZCBzcGFj
ZSBhbmQgcmVsaWFibGUgdHJhbnNpdCB0aW1lcy4gU2VhIGFuZCBhaXIgZnJlaWdodCBzb2x1dGlv
bnMgYXJlIGFsc28gYXZhaWxhYmxlIHVwb24geW91ciByZXF1ZXN0Lg0KDQpGb3IgeW91ciByZWZl
cmVuY2UsIG91ciBjdXJyZW50IHN0YW5kYXJkIHJhdGVzIGFyZToNCg0KDQoNCklmIHRoZXNlIHJh
dGVzIGFsaWduIHdpdGggeW91ciB0YXJnZXQsIG9yIGlmIHlvdSBuZWVkIGEgY29tcGFyaXNvbiBm
b3Igb3RoZXIgcG9ydHMsIGZlZWwgZnJlZSB0byByZXBseSB0byB0aGlzIGVtYWlsLg0KDQpTaG91
bGQgeW91IG5vIGxvbmdlciB3aXNoIHRvIHJlY2VpdmUgb3VyIGVtYWlscywgeW91IG1heSByZXBs
eSB0byB0aGlzIG1lc3NhZ2UgdG8gdW5zdWJzY3JpYmUuIFRoYW5rIHlvdSENCg0KDQoNCkJlc3Qg
cmVnYXJkcywNCkpveWUgWmhvdQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCsnu29q4u836tO+5qdOmwbS53MDt09DP3rmry74NClNoZW56aGVu
IEZvcndhcmQgU3VwcGx5IENoYWluIE1hbmFnZW1lbnQgTHRkDQpSbSAxMDA2IEppbnJ1biBCbGRn
LCA2MDE5IFNoZW5uYW4gQXZlLCBGdXRpYW4gRGlzdHJpY3QsIFNoZW56aGVuLCBDaGluYQ0KVGVs
o7ogKCs4NikgMDc1NSA4MzMyIDk0NjkgIEZheDogKCs4NikgMDc1NSA4MzMyIDk0NjkNCk1vYjog
ICgrODYpIDE1OTg2NzA5Njc0IA0KRS1tYWlsOiBqb3llLXpob3VAZndkLWxvZy5jb20gDQpRUTog
ICAgMTAyNjQ3NzcwMiAgICAgICAgIFdFIENIQVQ6enp6el8yMjMNCldoYXRzYXBwOigrODYpMTU5
ODY3MDk2NzQNCk5WT0NDIE5PLiA6IEdEMjAyMjA2MDgzMTM2DQo=

------=_002_NextPart551318667421_=----
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
v><b style=3D"font-family: &quot;Microsoft JhengHei UI&quot;;">Our company=
 specializes in rail &amp; trucking multimodal services from China to Euro=
pe. We currently provide stable transportation services to&nbsp;</b><font =
face=3D"Microsoft JhengHei UI"><b>Spain</b></font><b style=3D"font-family:=
 &quot;Microsoft JhengHei UI&quot;;">, backed by guaranteed space and reli=
able transit times. Sea and air freight solutions are also available upon =
your request.</b></div><div><font face=3D"Microsoft JhengHei UI"><span sty=
le=3D"text-decoration-thickness: initial; text-decoration-style: initial; =
text-decoration-color: initial;"><b><br></b></span></font></div><div><font=
 face=3D"Microsoft JhengHei UI"><span style=3D"text-decoration-thickness: =
initial; text-decoration-style: initial; text-decoration-color: initial;">=
<b>For your reference, our current standard rates are:</b></span></font></=
div><div><font style=3D"text-decoration-thickness: initial; text-decoratio=
n-style: initial; text-decoration-color: initial;" face=3D"Microsoft Jheng=
Hei UI"><b><br></b></font></div><div><img src=3D"cid:_Foxmail.1@17247db5-f=
d93-aad0-7b21-7042a2b0693f" border=3D"0"></div><div><font face=3D"Microsof=
t JhengHei"><br></font></div><div><img src=3D"cid:_Foxmail.1@758798e3-dabe=
-0385-1ab5-9bdf3649a8e5" border=3D"0"></div><div><br></div><div><div><font=
 face=3D"Microsoft JhengHei UI"><b>If these rates align with your target, =
or if you need a comparison for other ports, feel free to reply to this em=
ail.</b></font></div></div><div><font face=3D"Microsoft JhengHei UI"><b><b=
r></b></font></div></div></div><div><font face=3D"Microsoft JhengHei UI"><=
span style=3D"text-decoration-thickness: initial; text-decoration-style: i=
nitial; text-decoration-color: initial;"><b>Should you no longer wish to r=
eceive our emails, you may reply to this message to unsubscribe. Thank you=
!</b></span></font></div><div><br></div><hr style=3D"width: 210px; height:=
 1px;" color=3D"#b5c4df" size=3D"1" align=3D"left">=0A<div><span><div styl=
e=3D"MARGIN: 10px; FONT-FAMILY: verdana; FONT-SIZE: 10pt"><!--[if gte mso =
9]><xml>=0A <w:WordDocument>=0A  <w:View>Normal</w:View>=0A  <w:Zoom>0</w:=
Zoom>=0A  <w:TrackMoves></w:TrackMoves>=0A  <w:TrackFormatting></w:TrackFo=
rmatting>=0A  <w:PunctuationKerning></w:PunctuationKerning>=0A  <w:Drawing=
GridVerticalSpacing>7.8 =B0=F5</w:DrawingGridVerticalSpacing>=0A  <w:Displ=
ayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>=0A  <=
w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>=0A=
  <w:ValidateAgainstSchemas></w:ValidateAgainstSchemas>=0A  <w:SaveIfXMLIn=
valid>false</w:SaveIfXMLInvalid>=0A  <w:IgnoreMixedContent>false</w:Ignore=
MixedContent>=0A  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlacehol=
derText>=0A  <w:DoNotPromoteQF></w:DoNotPromoteQF>=0A  <w:LidThemeOther>EN=
-US</w:LidThemeOther>=0A  <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>=0A  <w:=
LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>=0A  <w:Compatibilit=
y>=0A   <w:SpaceForUL></w:SpaceForUL>=0A   <w:BalanceSingleByteDoubleByteW=
idth></w:BalanceSingleByteDoubleByteWidth>=0A   <w:DoNotLeaveBackslashAlon=
e></w:DoNotLeaveBackslashAlone>=0A   <w:ULTrailSpace></w:ULTrailSpace>=0A =
  <w:DoNotExpandShiftReturn></w:DoNotExpandShiftReturn>=0A   <w:AdjustLine=
HeightInTable></w:AdjustLineHeightInTable>=0A   <w:BreakWrappedTables></w:=
BreakWrappedTables>=0A   <w:SnapToGridInCell></w:SnapToGridInCell>=0A   <w=
:WrapTextWithPunct></w:WrapTextWithPunct>=0A   <w:UseAsianBreakRules></w:U=
seAsianBreakRules>=0A   <w:DontGrowAutofit></w:DontGrowAutofit>=0A   <w:Sp=
litPgBreakAndParaMark></w:SplitPgBreakAndParaMark>=0A   <w:EnableOpenTypeK=
erning></w:EnableOpenTypeKerning>=0A   <w:DontFlipMirrorIndents></w:DontFl=
ipMirrorIndents>=0A   <w:OverrideTableStyleHps></w:OverrideTableStyleHps>=
=0A   <w:UseFELayout></w:UseFELayout>=0A  </w:Compatibility>=0A  <w:Browse=
rLevel>MicrosoftInternetExplorer4</w:BrowserLevel>=0A  <m:mathPr>=0A   <m:=
mathFont m:val=3D"Cambria Math"></m:mathFont>=0A   <m:brkBin m:val=3D"befo=
re"></m:brkBin>=0A   <m:brkBinSub m:val=3D"&#45;-"></m:brkBinSub>=0A   <m:=
smallFrac m:val=3D"off"></m:smallFrac>=0A   <m:dispDef></m:dispDef>=0A   <=
m:lMargin m:val=3D"0"></m:lMargin>=0A   <m:rMargin m:val=3D"0"></m:rMargin=
>=0A   <m:defJc m:val=3D"centerGroup"></m:defJc>=0A   <m:wrapIndent m:val=
=3D"1440"></m:wrapIndent>=0A   <m:intLim m:val=3D"subSup"></m:intLim>=0A  =
 <m:naryLim m:val=3D"undOvr"></m:naryLim>=0A  </m:mathPr></w:WordDocument>=
=0A</xml><![endif]--><!--[if gte mso 9]><xml>=0A <w:LatentStyles DefLocked=
State=3D"false" DefUnhideWhenUsed=3D"false"=0A  DefSemiHidden=3D"false" De=
fQFormat=3D"false" DefPriority=3D"99"=0A  LatentStyleCount=3D"376">=0A  <w=
:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" Name=3D"Nor=
mal"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"9"=
 QFormat=3D"true" Name=3D"heading 1"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=
=3D"true" QFormat=3D"true" Name=3D"heading 2"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"=0A   =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true=
"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=
=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"9" Sem=
iHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"hea=
ding 7"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=
=3D"heading 8"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"9" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D"tru=
e" Name=3D"heading 9"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 1"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhi=
deWhenUsed=3D"true"=0A   Name=3D"index 2"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Na=
me=3D"index 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Semi=
Hidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 4"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenU=
sed=3D"true"=0A   Name=3D"index 5"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"i=
ndex 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"index 7"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"index 8"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"inde=
x 9"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"39=
" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 1"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=
=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 2"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A =
  UnhideWhenUsed=3D"true" Name=3D"toc 3"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenU=
sed=3D"true" Name=3D"toc 4"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true=
" Name=3D"toc 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pr=
iority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc=
 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"39"=
 SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 7"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=
=3D"true"=0A   UnhideWhenUsed=3D"true" Name=3D"toc 8"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"=0A =
  UnhideWhenUsed=3D"true" Name=3D"toc 9"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Nam=
e=3D"Normal Indent"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"footnote text"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"=0A   Name=3D"annotation text"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"t=
rue"=0A   Name=3D"header"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"footer"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" U=
nhideWhenUsed=3D"true"=0A   Name=3D"index heading"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true"=0A   U=
nhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"table of figures"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Nam=
e=3D"envelope address"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"envelope retu=
rn"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"t=
rue" UnhideWhenUsed=3D"true"=0A   Name=3D"footnote reference"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenU=
sed=3D"true"=0A   Name=3D"annotation reference"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"line number"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"page numb=
er"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"t=
rue" UnhideWhenUsed=3D"true"=0A   Name=3D"endnote reference"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"endnote text"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"table of authorities"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"macro"></w=
:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Un=
hideWhenUsed=3D"true"=0A   Name=3D"toa heading"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"List"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Bullet"></w=
:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Un=
hideWhenUsed=3D"true"=0A   Name=3D"List Number"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"List 2"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List 3"></w:Ls=
dException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhid=
eWhenUsed=3D"true"=0A   Name=3D"List 4"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"List 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Bullet 2"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWh=
enUsed=3D"true"=0A   Name=3D"List Bullet 3"></w:LsdException>=0A  <w:LsdEx=
ception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   =
Name=3D"List Bullet 4"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Bullet 5=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tru=
e" UnhideWhenUsed=3D"true"=0A   Name=3D"List Number 2"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"List Number 3"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"List Number 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Number 5"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"10" QForm=
at=3D"true" Name=3D"Title"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Closing">=
</w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true"=
 UnhideWhenUsed=3D"true"=0A   Name=3D"Signature"></w:LsdException>=0A  <w:=
LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true"=0A   Unhi=
deWhenUsed=3D"true" Name=3D"Default Paragraph Font"></w:LsdException>=0A  =
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tru=
e"=0A   Name=3D"Body Text"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text=
 Indent"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Continue"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenU=
sed=3D"true"=0A   Name=3D"List Continue 2"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   N=
ame=3D"List Continue 3"></w:LsdException>=0A  <w:LsdException Locked=3D"fa=
lse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Continu=
e 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"=
true" UnhideWhenUsed=3D"true"=0A   Name=3D"List Continue 5"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"Message Header"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"11" QFormat=3D"true" Name=3D"Subtitle"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" U=
nhideWhenUsed=3D"true"=0A   Name=3D"Salutation"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"Date"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text First =
Indent"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text First Indent 2"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true"=0A   Name=3D"Note Heading"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
"=0A   Name=3D"Body Text 2"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body T=
ext 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Body Text Indent 2"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"Body Text Indent 3"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
"=0A   Name=3D"Block Text"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Hyperlink=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tru=
e" UnhideWhenUsed=3D"true"=0A   Name=3D"FollowedHyperlink"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" N=
ame=3D"Strong"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"20" QFormat=3D"true" Name=3D"Emphasis"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A=
   Name=3D"Document Map"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Plain Text"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true=
" UnhideWhenUsed=3D"true"=0A   Name=3D"E-mail Signature"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"HTML Top of Form"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Nam=
e=3D"HTML Bottom of Form"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Normal (We=
b)"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"t=
rue" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Acronym"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"HTML Address"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D=
"HTML Cite"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Code"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"HTML Definition"></w:LsdException>=0A  <w:LsdExce=
ption Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Na=
me=3D"HTML Keyboard"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Preformatt=
ed"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"t=
rue" UnhideWhenUsed=3D"true"=0A   Name=3D"HTML Sample"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"HTML Typewriter"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"HTML Variable"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Normal Table"></w=
:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Un=
hideWhenUsed=3D"true"=0A   Name=3D"annotation subject"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"No List"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Outl=
ine List 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHid=
den=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Outline List 2"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideW=
henUsed=3D"true"=0A   Name=3D"Outline List 3"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A =
  Name=3D"Table Simple 1"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Simp=
le 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D=
"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Simple 3"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"Table Classic 1"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Nam=
e=3D"Table Classic 2"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Classic =
3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Classic 4"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Table Colorful 1"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Nam=
e=3D"Table Colorful 2"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Colorfu=
l 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"=
true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Columns 1"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUse=
d=3D"true"=0A   Name=3D"Table Columns 2"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Nam=
e=3D"Table Columns 3"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Columns =
4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"tr=
ue" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Columns 5"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Table Grid 1"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D=
"Table Grid 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Semi=
Hidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Grid 3"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"Table Grid 4"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A  =
 Name=3D"Table Grid 5"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Grid 6"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true=
" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Grid 7"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"=0A   Name=3D"Table Grid 8"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table=
 List 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table List 2"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUs=
ed=3D"true"=0A   Name=3D"Table List 3"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table List 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" S=
emiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table List 5"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unh=
ideWhenUsed=3D"true"=0A   Name=3D"Table List 6"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"Table List 7"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table =
List 8"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=
=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table 3D effects 1"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true"=0A   Name=3D"Table 3D effects 2"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
"=0A   Name=3D"Table 3D effects 3"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"T=
able Contemporary"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Elegant"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" U=
nhideWhenUsed=3D"true"=0A   Name=3D"Table Professional"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=
=3D"true"=0A   Name=3D"Table Subtle 1"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=
=3D"Table Subtle 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Web 1"></w=
:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Un=
hideWhenUsed=3D"true"=0A   Name=3D"Table Web 2"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"Table Web 3"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Balloon T=
ext"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"39=
" Name=3D"Table Grid"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Table Theme"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" =
Name=3D"Placeholder Text"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" Priority=3D"1" QFormat=3D"true" Name=3D"No Spacing"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shad=
ing"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"61=
" Name=3D"Light List"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"62" Name=3D"Light Grid"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium =
Shading 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"65" Name=3D"Medium List 1"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"66" Name=3D"Medium List 2"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1"></w=
:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" Name=
=3D"Medium Grid 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"69" Name=3D"Medium Grid 3"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"70" Name=3D"Dark List"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Sha=
ding"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"7=
2" Name=3D"Colorful List"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" Priority=3D"73" Name=3D"Colorful Grid"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Accent 1"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"61" Na=
me=3D"Light List Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"62" Name=3D"Light Grid Accent 1"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1=
 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"64" Name=3D"Medium Shading 2 Accent 1"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Accent 1"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"true" N=
ame=3D"Revision"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pr=
iority=3D"34" QFormat=3D"true"=0A   Name=3D"List Paragraph"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" =
Name=3D"Quote"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"30" QFormat=3D"true"=0A   Name=3D"Intense Quote"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"67" Name=3D"Medium Grid 1 Accent 1"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Accent 1"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D=
"Medium Grid 3 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" Priority=3D"70" Name=3D"Dark List Accent 1"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading Ac=
cent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"72" Name=3D"Colorful List Accent 1"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Accent 1"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Lig=
ht Shading Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"61" Name=3D"Light List Accent 2"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent 2"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"63" Name=
=3D"Medium Shading 1 Accent 2"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 Accent 2"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium=
 List 1 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" P=
riority=3D"66" Name=3D"Medium List 2 Accent 2"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Accent 2=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" N=
ame=3D"Medium Grid 2 Accent 2"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Accent 2"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List=
 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"71" Name=3D"Colorful Shading Accent 2"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Accent 2"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"73" Name=
=3D"Colorful Grid Accent 2"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"60" Name=3D"Light Shading Accent 3"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List=
 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"62" Name=3D"Light Grid Accent 3"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 Accent 3"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"=
Medium Shading 2 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"65" Name=3D"Medium List 1 Accent 3"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"67" Name=3D"Medium Grid 1 Accent 3"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Accent 3"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D=
"Medium Grid 3 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" Priority=3D"70" Name=3D"Dark List Accent 3"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading Ac=
cent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"72" Name=3D"Colorful List Accent 3"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Accent 3"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Lig=
ht Shading Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"61" Name=3D"Light List Accent 4"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent 4"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"63" Name=
=3D"Medium Shading 1 Accent 4"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 Accent 4"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium=
 List 1 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" P=
riority=3D"66" Name=3D"Medium List 2 Accent 4"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Accent 4=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" N=
ame=3D"Medium Grid 2 Accent 4"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Accent 4"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List=
 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"71" Name=3D"Colorful Shading Accent 4"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Accent 4"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"73" Name=
=3D"Colorful Grid Accent 4"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"60" Name=3D"Light Shading Accent 5"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List=
 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"62" Name=3D"Light Grid Accent 5"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 Accent 5"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"=
Medium Shading 2 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"65" Name=3D"Medium List 1 Accent 5"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"67" Name=3D"Medium Grid 1 Accent 5"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Accent 5"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D=
"Medium Grid 3 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"f=
alse" Priority=3D"70" Name=3D"Dark List Accent 5"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading Ac=
cent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D=
"72" Name=3D"Colorful List Accent 5"></w:LsdException>=0A  <w:LsdException=
 Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Accent 5"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Lig=
ht Shading Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"61" Name=3D"Light List Accent 6"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent 6"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"63" Name=
=3D"Medium Shading 1 Accent 6"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 Accent 6"></w:LsdExce=
ption>=0A  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium=
 List 1 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" P=
riority=3D"66" Name=3D"Medium List 2 Accent 6"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Accent 6=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"68" N=
ame=3D"Medium Grid 2 Accent 6"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Accent 6"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List=
 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"71" Name=3D"Colorful Shading Accent 6"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Accent 6"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"73" Name=
=3D"Colorful Grid Accent 6"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"19" QFormat=3D"true"=0A   Name=3D"Subtle Emphasis">=
</w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"21" QFo=
rmat=3D"true"=0A   Name=3D"Intense Emphasis"></w:LsdException>=0A  <w:LsdE=
xception Locked=3D"false" Priority=3D"31" QFormat=3D"true"=0A   Name=3D"Su=
btle Reference"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pri=
ority=3D"32" QFormat=3D"true"=0A   Name=3D"Intense Reference"></w:LsdExcep=
tion>=0A  <w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true=
" Name=3D"Book Title"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"37" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" Name=
=3D"Bibliography"></w:LsdException>=0A  <w:LsdException Locked=3D"false" P=
riority=3D"39" SemiHidden=3D"true"=0A   UnhideWhenUsed=3D"true" QFormat=3D=
"true" Name=3D"TOC Heading"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"41" Name=3D"Plain Table 1"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table 2"></w:=
LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"43" Name=3D=
"Plain Table 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pri=
ority=3D"44" Name=3D"Plain Table 4"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" Priority=3D"45" Name=3D"Plain Table 5"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table L=
ight"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"4=
6" Name=3D"Grid Table 1 Light"></w:LsdException>=0A  <w:LsdException Locke=
d=3D"false" Priority=3D"47" Name=3D"Grid Table 2"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"=
Grid Table 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prior=
ity=3D"50" Name=3D"Grid Table 5 Dark"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Colorful"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Gri=
d Table 7 Colorful"></w:LsdException>=0A  <w:LsdException Locked=3D"false"=
 Priority=3D"46"=0A   Name=3D"Grid Table 1 Light Accent 1"></w:LsdExceptio=
n>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table=
 2 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priori=
ty=3D"48" Name=3D"Grid Table 3 Accent 1"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accent 1"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"=
Grid Table 5 Dark Accent 1"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table 6 Colorful Accent 1"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   =
Name=3D"Grid Table 7 Colorful Accent 1"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"46"=0A   Name=3D"Grid Table 1 Light Accen=
t 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"47=
" Name=3D"Grid Table 2 Accent 2"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accent 2"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Tab=
le 4 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"50" Name=3D"Grid Table 5 Dark Accent 2"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table 6 Col=
orful Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pri=
ority=3D"52"=0A   Name=3D"Grid Table 7 Colorful Accent 2"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=0A   Name=3D"Grid T=
able 1 Light Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"47" Name=3D"Grid Table 2 Accent 3"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"49=
" Name=3D"Grid Table 4 Accent 3"></w:LsdException>=0A  <w:LsdException Loc=
ked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark Accent 3"></w:LsdE=
xception>=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=0A   Name=
=3D"Grid Table 6 Colorful Accent 3"></w:LsdException>=0A  <w:LsdException =
Locked=3D"false" Priority=3D"52"=0A   Name=3D"Grid Table 7 Colorful Accent=
 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=
=0A   Name=3D"Grid Table 1 Light Accent 4"></w:LsdException>=0A  <w:LsdExc=
eption Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accent 4"></w=
:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=
=3D"Grid Table 3 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"49" Name=3D"Grid Table 4 Accent 4"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5=
 Dark Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pri=
ority=3D"51"=0A   Name=3D"Grid Table 6 Colorful Accent 4"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   Name=3D"Grid T=
able 7 Colorful Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" Priority=3D"46"=0A   Name=3D"Grid Table 1 Light Accent 5"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid=
 Table 2 Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"48" Name=3D"Grid Table 3 Accent 5"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accent 5"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Na=
me=3D"Grid Table 5 Dark Accent 5"></w:LsdException>=0A  <w:LsdException Lo=
cked=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table 6 Colorful Accent 5=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=
=0A   Name=3D"Grid Table 7 Colorful Accent 5"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"46"=0A   Name=3D"Grid Table 1 Light=
 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"47" Name=3D"Grid Table 2 Accent 6"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accent 6"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Gr=
id Table 4 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"50" Name=3D"Grid Table 5 Dark Accent 6"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"51"=0A   Name=3D"Grid Table=
 6 Colorful Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"52"=0A   Name=3D"Grid Table 7 Colorful Accent 6"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List =
Table 1 Light"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Prio=
rity=3D"47" Name=3D"List Table 2"></w:LsdException>=0A  <w:LsdException Lo=
cked=3D"false" Priority=3D"48" Name=3D"List Table 3"></w:LsdException>=0A =
 <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=
=3D"List Table 5 Dark"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"51" Name=3D"List Table 6 Colorful"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"46=
"=0A   Name=3D"List Table 1 Light Accent 1"></w:LsdException>=0A  <w:LsdEx=
ception Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accent 1"></=
w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=
=3D"List Table 3 Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D=
"false" Priority=3D"49" Name=3D"List Table 4 Accent 1"></w:LsdException>=
=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5=
 Dark Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Pri=
ority=3D"51"=0A   Name=3D"List Table 6 Colorful Accent 1"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   Name=3D"List T=
able 7 Colorful Accent 1"></w:LsdException>=0A  <w:LsdException Locked=3D"=
false" Priority=3D"46"=0A   Name=3D"List Table 1 Light Accent 2"></w:LsdEx=
ception>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List=
 Table 2 Accent 2"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"48" Name=3D"List Table 3 Accent 2"></w:LsdException>=0A  <w:Ls=
dException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accent 2"=
></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Na=
me=3D"List Table 5 Dark Accent 2"></w:LsdException>=0A  <w:LsdException Lo=
cked=3D"false" Priority=3D"51"=0A   Name=3D"List Table 6 Colorful Accent 2=
"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=
=0A   Name=3D"List Table 7 Colorful Accent 2"></w:LsdException>=0A  <w:Lsd=
Exception Locked=3D"false" Priority=3D"46"=0A   Name=3D"List Table 1 Light=
 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"47" Name=3D"List Table 2 Accent 3"></w:LsdException>=0A  <w:LsdExcepti=
on Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accent 3"></w:Lsd=
Exception>=0A  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Li=
st Table 4 Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"false=
" Priority=3D"50" Name=3D"List Table 5 Dark Accent 3"></w:LsdException>=0A=
  <w:LsdException Locked=3D"false" Priority=3D"51"=0A   Name=3D"List Table=
 6 Colorful Accent 3"></w:LsdException>=0A  <w:LsdException Locked=3D"fals=
e" Priority=3D"52"=0A   Name=3D"List Table 7 Colorful Accent 3"></w:LsdExc=
eption>=0A  <w:LsdException Locked=3D"false" Priority=3D"46"=0A   Name=3D"=
List Table 1 Light Accent 4"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"47" Name=3D"List Table 2 Accent 4"></w:LsdException=
>=0A  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table =
3 Accent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priorit=
y=3D"49" Name=3D"List Table 4 Accent 4"></w:LsdException>=0A  <w:LsdExcept=
ion Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark Accent 4"><=
/w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"51"=0A  =
 Name=3D"List Table 6 Colorful Accent 4"></w:LsdException>=0A  <w:LsdExcep=
tion Locked=3D"false" Priority=3D"52"=0A   Name=3D"List Table 7 Colorful A=
ccent 4"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=
=3D"46"=0A   Name=3D"List Table 1 Light Accent 5"></w:LsdException>=0A  <w=
:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accent=
 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"48"=
 Name=3D"List Table 3 Accent 5"></w:LsdException>=0A  <w:LsdException Lock=
ed=3D"false" Priority=3D"49" Name=3D"List Table 4 Accent 5"></w:LsdExcepti=
on>=0A  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Tabl=
e 5 Dark Accent 5"></w:LsdException>=0A  <w:LsdException Locked=3D"false" =
Priority=3D"51"=0A   Name=3D"List Table 6 Colorful Accent 5"></w:LsdExcept=
ion>=0A  <w:LsdException Locked=3D"false" Priority=3D"52"=0A   Name=3D"Lis=
t Table 7 Colorful Accent 5"></w:LsdException>=0A  <w:LsdException Locked=
=3D"false" Priority=3D"46"=0A   Name=3D"List Table 1 Light Accent 6"></w:L=
sdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"=
List Table 2 Accent 6"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" Priority=3D"48" Name=3D"List Table 3 Accent 6"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"50=
" Name=3D"List Table 5 Dark Accent 6"></w:LsdException>=0A  <w:LsdExceptio=
n Locked=3D"false" Priority=3D"51"=0A   Name=3D"List Table 6 Colorful Acce=
nt 6"></w:LsdException>=0A  <w:LsdException Locked=3D"false" Priority=3D"5=
2"=0A   Name=3D"List Table 7 Colorful Accent 6"></w:LsdException>=0A  <w:L=
sdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=
=0A   Name=3D"Mention"></w:LsdException>=0A  <w:LsdException Locked=3D"fal=
se" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"Smart Hyperli=
nk"></w:LsdException>=0A  <w:LsdException Locked=3D"false" SemiHidden=3D"t=
rue" UnhideWhenUsed=3D"true"=0A   Name=3D"Hashtag"></w:LsdException>=0A  <=
w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
"=0A   Name=3D"Unresolved Mention"></w:LsdException>=0A  <w:LsdException L=
ocked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true"=0A   Name=3D"S=
mart Link"></w:LsdException>=0A </w:LatentStyles>=0A</xml><![endif]-->=0A<=
!--[if gte mso 10]>=0A<style>=0A /* Style Definitions */=0A table.MsoNorma=
lTable=0A	{mso-style-name:=C6=D5=CD=A8=B1=ED=B8=F1;=0A	mso-tstyle-rowband-=
size:0;=0A	mso-tstyle-colband-size:0;=0A	mso-style-noshow:yes;=0A	mso-styl=
e-priority:99;=0A	mso-style-parent:"";=0A	mso-padding-alt:0cm 5.4pt 0cm 5.=
4pt;=0A	mso-para-margin:0cm;=0A	mso-pagination:widow-orphan;=0A	font-size:=
10.0pt;=0A	font-family:"Times New Roman",serif;}=0A</style>=0A<![endif]-->=
=0A<!--StartFragment-->=0A<p class=3D"MsoNormal" align=3D"left" style=3D"t=
ext-align: justify; background-image: initial; background-position: initia=
l; background-size: initial; background-repeat: initial; background-attach=
ment: initial; background-origin: initial; background-clip: initial; margi=
n: 0px 0cm; font-size: 10.5pt; font-family: =B5=C8=CF=DF;"><b><span lang=
=3D"EN-US" style=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sans-=
serif;color:#333399;=0Amso-ligatures:none">Best regards,<br>=0AJoye Zhou</=
span></b><span lang=3D"EN-US" style=3D"font-family:&quot;Microsoft YaHei U=
I&quot;,sans-serif;=0Acolor:#333399;mso-ligatures:none"><br>=0A-----------=
------------------------------------------<br>=0A</span><span style=3D"fon=
t-family:&quot;Microsoft YaHei UI&quot;,sans-serif;color:#333399;=0Amso-li=
gatures:none">=C9=EE=DB=DA=B8=BB=CD=FA=B4=EF=B9=A9=D3=A6=C1=B4=B9=DC=C0=ED=
=D3=D0=CF=DE=B9=AB=CB=BE<span lang=3D"EN-US"><br>=0A<b>Shenzhen Forward Su=
pply Chain Management Ltd</b><br>=0A<b>Rm 1006 Jinrun Bldg, 6019 Shennan A=
ve, Futian District, Shenzhen, China</b><br>=0A</span></span><span lang=3D=
"EN-US" style=3D"font-size:11.5pt;font-family:&quot;Calibri&quot;,sans-ser=
if;=0Acolor:#333399;mso-ligatures:none">Tel</span><span style=3D"font-size=
:11.5pt;=0Afont-family:&quot;Microsoft YaHei UI&quot;,sans-serif;color:#33=
3399;mso-ligatures:none">=A3=BA</span><span lang=3D"EN-US" style=3D"font-s=
ize:11.5pt;font-family:&quot;Calibri&quot;,sans-serif;color:#333399;=0Amso=
-ligatures:none"> (+86) 0755 8332 9469&nbsp; Fax: (+86) 0755 8332 9469<br>=
=0AMob:&nbsp; (+86) 15986709674&nbsp;</span><span lang=3D"EN-US" style=3D"=
font-family: &quot;Microsoft YaHei UI&quot;, sans-serif;"><o:p></o:p></spa=
n></p>=0A<p class=3D"MsoNormal" align=3D"left" style=3D"text-align: justif=
y; background-image: initial; background-position: initial; background-siz=
e: initial; background-repeat: initial; background-attachment: initial; ba=
ckground-origin: initial; background-clip: initial; margin: 0px 0cm; font-=
size: 10.5pt; font-family: =B5=C8=CF=DF;"><span lang=3D"EN-US" style=3D"fo=
nt-size:11.5pt;font-family:&quot;Calibri&quot;,sans-serif;color:#333399;=
=0Amso-ligatures:none">E-mail:&nbsp;<a href=3D"mailto:joye-zhou@fwd-log.co=
m" style=3D"color: rgb(5, 99, 193);"><span style=3D"color:blue">joye-zhou@=
fwd-log.com</span></a>&nbsp;</span><span lang=3D"EN-US" style=3D"font-fami=
ly: &quot;Microsoft YaHei UI&quot;, sans-serif;"><o:p></o:p></span></p>=0A=
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align: justify; backgr=
ound-image: initial; background-position: initial; background-size: initia=
l; background-repeat: initial; background-attachment: initial; background-=
origin: initial; background-clip: initial; margin: 0px 0cm; font-size: 10.=
5pt; font-family: =B5=C8=CF=DF;"><span lang=3D"EN-US" style=3D"font-size:1=
1.5pt;font-family:&quot;Calibri&quot;,sans-serif;color:#333399;=0Amso-liga=
tures:none">QQ:&nbsp;&nbsp;&nbsp;=0A1026477702&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; WE CHAT:zzzz_223<br>=0AWhatsapp:(+86)15986709674<br>=
=0ANVOCC NO. : GD202206083136</span><span lang=3D"EN-US" style=3D"font-fam=
ily: &quot;Microsoft YaHei UI&quot;, sans-serif;"><o:p></o:p></span></p>=
=0A<!--EndFragment--></div></span></div>=0A</body></html>
------=_002_NextPart551318667421_=------

------=_001_NextPart446847311164_=----
Content-Type: image/png;
	name="InsertPic_28F5(1(10-08-16-43-42).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@17247db5-fd93-aad0-7b21-7042a2b0693f>

iVBORw0KGgoAAAANSUhEUgAAA/oAAAA/CAIAAADfSSRsAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAW
PUlEQVR4nO3dT0wTaR8H8N++2QM9lmSrjAVf2sSkEdyQ0JDC4oHqpiyHHjaxC27QC/WwEBOk0QMr
QT2sKZIQ3YP1ouRVrMkeeuCFrFsOoDSGJmQF08SksEK3uH0Teiw33sP8bTvTTlugZfr9ZA/bofPM
M33+zG+eeZ7xi/39fQIAAAAAAC36koi6PeFyZ6PqzHlb8bMDKEEDgeqEml92KALQnjlv67/KnQcA
AAAAADgsCPcBAAAAADQL4T4AAAAAgGYh3AcAAAAA0CyE+wAAAAAAmoVwHwAAAABAsxDuAwAAAABo
FsJ9AAAAAADNQrgPAAAAAKBZCPcBAAAAADTry4NLqva212STfI6tx395Fo/K/YmIKBEf9O5dztie
SHr/E13YET7rrnrOugxE6xvdz3aVDkSUCr3YuLOa6rrS6mnKytf6Rvczuu012RLxQS+bHzI7zj6y
60IvwndWFVNTzjaXSPUpoojjUSKqY27/yNgMabsoFtbvNU+GGSNX4myyKf/kh6c7lF5w7A4yNURd
ykRE5hbm8gUuY5RIhf5gy51UHFeioLPjDl0B2QblnoT/KNf/1DGZ9TOzT2D3Sno90QXJUWLBDwPz
Kb6gxTLKURmy63l6Uco0uiL7tP/QrfQ6RnW1t380cXWMUrH15Mzv8YUdyj5loY69OZejzuuues66
Erm7Yu7nzW5NOXse7sfpWON+XoXWIfebBDfuzKe4Ak3r2/kSYZvSSfNcX42kvCB3/8YVx8yJszn7
QDh6bMWWdj5cAxR6p1xBV3bwk90ZSv4oNlLJ15RqjpdMRfR46f1AgRdWti/K2K7pAO8Aw32itAiv
9vaw6ZGHxN9O5nesTd+FeTLMeH5kPglfq9N3sL12k76LdhdkD0S6ritnPX2mq58/PH0WFq+vaYer
VZttaWo7StmuboUVMRHV3h5mbIn4oCcebTHP9TGPrux1P9tdUCqsOibrkDrXt7VPZS8ScjVEbcot
5kd9+tj6xqB3N8r2en1nn5wQer2cxy367Col28DL0fZz9D+5pLYSRIaahjqiHaIWPXtFMZ7QEaWI
dA0GItrbEmJH2crwe7y3ibH1mbtWowtE1MKw1zCZ2zalDqqgPi2rjs1J6hjb0j1NOuJuYOTlqvMt
jMtAoT9283XF8q0p84wyep46fYch9fbPFAmtI/ihez5FpOtymDxc65D7Texnb/8TvvOZP7hBd5oo
Ki0R1moy1GdCm5LKVdZ8cSzs5OwDoQxSS2spl13X8bXu6Q4X3Hc264j45lN8p8fLER4Q5bzM1RTc
42UfoqALa0b8WQUObTLPzu6dF0kyMLccOtW7xGfWiQz6zjpug/lrvZEotJ4k0vcqppNaeJ8k0nV8
rfpAuRxsapqmsojrauqJKLEXJaLVaLcnXMzoTpPpdovMZnU1RFbt7T49JeK/PNtlm3p0/oN3nYx2
09U6ybcUjisq6uzKn22Qkdn2iy6mT/+khHTMJ2q4rYYas3BBSqQ+8V+WP8pO/Jdgit+iu3pBT5Ty
/15cuFlon5ZZx2hn944n3J0z1s+t65yeKPkm7yMmla0po+c5qTNyt0+1t/v0tL7B3/qmFuY/dHvC
kjthAfubUP0J6W+i/4ZtNSd1RkrFEsL23TfrbAABKojFARUn+mcyxg09sHQNBqJEckkY7C/+2pSu
0AiwiB4v6xAHlnmNOsy5+6vJUFrFKhR735l88ywZIjI2680Hmz0onfoibjI9uVJbSgnaLjBZu5dQ
Q1r0NqLYWjJt4OF9kkjXcDLvcbMUdnYVk23IpfhiklxTdZ3NOkrE/cJAxkmdMa0EFY8Snd8JERnt
zFWHyWWgWHDjiCaTyNWx0tR+00S0nlR7t6CmNUl6HvOJGu72ic35P9nBfTZd1zl92qDmejLER/9d
5/REe9tiuM/ev/E3A5CTWBxQgXb2tkly78o+e2RvsOmgg64CI8Biery0QyBizOOgJ/NkM9SYaY+I
yMA88oqPjGNB/gGroI7pbZLcaLLDYOvJBdqldZOtSd9ZF4/KFH9Wx10SaWo6hWwfyIE0JFcRp2gn
PrPOeJrI2GR65K1LnxutTiLuTzCuJuZyS/y5dLvaGiKDHXPdlosMxAE/peNKFXF2lZBtkJHek5RQ
TOw11WioMRM1GIjW956+T7qa9A0ns0ow11F277zQz/XpXXYiSs4U3+2o6NP+FL+do46J0lPIo66m
XmUUXmhrMtSYSdfZrIutbUTV5DzjxNd3lnaIuMdiqa2E3tasN8+zRZZ8Q3phXm/0nz0iXT03HQty
EIsDKtLum3WTrUn/TQstrLJ3thR6L6zYKaHTU8I+1VSXtyJ7PEONmShaXOarKcA7/HBfIDNHKvPa
E1uPD/ILL7jnMu93ucGVJumEs/RCSiT9k9GShr5ypFZNU7tKpfBbLTwLf3KYb9n1RtLZMieaq7L0
bKPBa7L1mbeC4sY8NeQgyB43Q6FnVyHZBo5C2y+tmFJbCbIZdKdbdDY2kc81MdLbztW+IZ10Wkue
o6zG/Rf0LgOFXihPpEnLv6QBFtSn1ekVUhcWrRK/DjgzBXapX64fg32gkesbosL7Cl2DId/NiSAz
26ZHV6j7d/Zve0trKZdd39lCHQaKraXohGTHz6kY6Y0I9/MrpDigHBbeJz1Netu5Wlqlb5qogO7o
CKjp8RQUmflqCvAO/0Wc4nMipS/EBz3hbk+42xMekLxsgXsus0riw3Hp05lEfNATHnyRZD+VOlPw
YFOrNnmLmCg6Hx3wfPCup4jIaGcKnwW7+zyYItK7xMAiXw3JnZ9/9rJm7qo8rlxqBZxdBWUbSLHt
l1RM7JI4In3vhRqi1NZnop3k2wSRoa63STpxP+9RUlsJ4lLImX+2/+yWXreK7dPS61jqqTfc7QkP
Bo/ukl9Aa0rsRetq6vnfR3XrIGHmgHTokR3C77igNx7Ys+LqIykOqFCrSa7ms0tlxFl2JXZ6ClSE
BxIqejz5QxxO5rXlMMP9AmZSZuFWWOs93tY5b+sc+6I0ySpeVnQ16l0nMug9V3K/8IGtQ3moTg14
hRVxauHZhl9FQcjiLs8CdTVE0arM9D7ZWWGZx1Wk7uwqLttAMm2/xGLiQ0+jQcfPTmRf16MzSq9/
JR+l4PNSYzXuTxzelVJVV5y/NfE9j/lrvbgwtMTVYuzuBh1hpWmx0ooDKtTum3Uig/7yt+JwOB1G
d1RKBFjoIQ6/L9WAQwv362qvXtAXPeWUfS4TC37o5geuBoMp2ZdLLDzbCOV/FUlqaS1FBuZyi47N
m/RGsPDUgEh1EZsdZ+e8rU/YZfJ17HsAilvItXuHH6osqIbkSs3A3OIWBeq6HGc9TbLLg9KOW+LZ
VUi2IZu07ZdcTOz0DyJJcM++CkY6U/YAjlLgeamTevpHMibWMTK3mG+V8phI+CkoT1estjVJep7T
J3SS4cndOy+S1GTiUiBdlzTBdGZHXdaKZP5WJHtVMTsfCXNU8kkvDqhQ7NsdbE0yEwsPrDsqLQIs
9BBH05cedwc9dz9jIr704XLm6q6k16MUjmS9C5Z9OmPXGZv15vm99C9zyzvEN7bKic5/GCTzrb6z
c31E7L/nNSn7ZWlqSYVsF/9COi0orIijC+wvbz87Z6eM5RkF4yf25ashKVXpr0YHibl8wfTIayL2
X+R58UF+aaB43EzRws6uUrINcoS2f4YSysX0Z9Z+8ivUk28TjMsgGTxj53+Lz6kPojIUdl7Kfdpk
ev1ZjQ58rr39Yx1Xx4hiiaT/j/hScf9Y287eNpGNn/ieoyvO05pkeh7dVXaevSTng8RcvsClIGkd
cmuU2Vd2iusWuLeSZ4f1qpYvA+kaMooDKtNqMtSnt8nM5MkZdOVc4s/JER4cFNl+oOi+tJoCvC/2
9/e7PeFyZ6PqzHlb8bMDKEED0ZKuK62epmN8HT3K/KPmlx2KALRnztt6+Et1AQCgii28TxLVNBzX
ebQF/rsBAACVB+E+AAAcptW4P6FzfXs8X4HQorcV/08aAwBUhCN87z4AAFSj1FNv+Gm5M1Gk1Wh3
cYsWAAAqBkb3AQAAAAA0C+E+AAAAAIBmIdwHAAAAANAshPsAAAAAAJqFcB8AAAAAQLMQ7gMAAAAA
aNYX+/v75c4DAAAAAAAcCozuAwAAAABoFsJ9AAAAAADN+pKI/hv6X7mzUXW+s32Fnx1ACRoIVCfU
/LJDEYD2fGf7CqP7AAAAAACahXAfAAAAAECzEO4DAAAAAGgWwn0AAAAAAM1CuA8AAAAAoFkI9wEA
AAAANAvhPgAAAIBWbQauGXraxf8ehrg/hO8betoNPdd8cbmPRQk+lKRfam7vBzP/GPONqMpe8KHk
fGXSqT4VFO6H72dXss3ANcOIf5NivpH2nkCMwvcNI/7NtF3aR8Jp3+8JxEj4vih7C2hB8KFc3xT3
9/SkF3f2For5RtrTekCxLsn8id9XqEg5dgeoQKERoa6KvahYjaWtQ7hSSqu07EbQFrGS5K0PPPSE
x4Tl+rvZ5QT735CNiIhCI2OB/vHlxOxjN5P9UbW4v6e0O4Q04fttPtPM7HJidnnGEeiVhnxxf0/P
pdFI3iRivpH23k/i+b5zb/TmzeHBnkUFqqBwv/XmOzeN/ia5KYz7B32mmQlXo7CF+bc1svCaL4/N
vzeslubpkLBL7PUSOa3GI802lN9aYCXtRm5zZWEl/RubKwvkcJLvecYtvtX9KiH0gE+uR8bEi1zG
n8h3N7sjyLE7QCWJ+UZuTDsevHM3948vz5yeGgzEiCj48NLo6QeJ2eXE7AOL7xIXpYXvc1fKcef0
GD8qJrsRNCXmG7lB48uq6kM69ITHUnwrQs1nGIWPxbIPCbcTRYj5Xgas7st2Nqnvr4shX/i+YeCv
4dkH/fmS2AzcHaXr7yShY6Pz8Ts3jU5K7hyqUAWF+0SNzp/vfbohjrBOTlnGb9ql32A6nJa1j1zU
FXu9RM4fuqzzi3wHtP2Rui6WXFnheLE6nLT0VtKMQ7/6TP0O6VdCv/rI+f15CwXmcgw7Ma7ZcedK
1i0B+6dhR+ZNRQG7A5TZ9sdI873vuWuwfWh51mkkCs3NCxtt3Q6K/B0jomAoYO3saCSi1sv3LFyT
kd0I2mJ0TyxPtLL/n6c+5IKe8FgI3zcMTK3Q2uhAu2HEv5nxkUhxUg034Yf/WtaO3GSe8P2svbiP
OefqbH+MNIuDtkyDhfiQr/VmYjY9IJQXe7201v+DZJiYiIgarV3SweK8Z6FBFRXuExndP/DjB+Hn
o3T9p9bML5hPc30Q0fbHiMnc2uG0bES5m7/F6dMNjTLJgqY1nHeStBkvTjvOd0u/EF6ctnRdZGzd
DpI8C5LTer5f/pYgFv2kIieKuwOUV/0ZcaBEYJuQeWofi34iyyn2civ0t7IbQbvi/sl5tsSLKnqx
J8yaQpYeBQYfps2TzJxZDgcoMtUmnW3VejPx5LqVmu89WU5MuBozPhJtBq4Jk2reuTfYSTWbgWuG
sY17T5YTs8uJYXqdnY5wuLSroThmL5usKL6VPlWn/oyl0PPc/hiRe0YhuXMo4Cy0pMLCfaLWmzOO
wGTAPzK2cW9Y5ke325wr7FBueHHacd5OxoudxA67bv690W8r+hESHF/1Qh1gx6IyqoEwOmX//rp1
/mnOyXkKnUv4+ah0yKHQ3QHKzOgevh4Za2/zrU2/lBu7Ct/vnVdTw0HzYr6RdsPAFLlfTWQOt6nH
9YTBhzemHdxssf7I1K/hjCgwNMfXus3A3UDnK+6beXppKIpk7r6Kkg396lvr56dXNFq7rJG/NtiB
83F+jIBxuXOlIxlfi78NcBdQ2WSPDHsbUNBZaEjFhftE9qEHFt9UxP2z/GIR5t9s/dj8e8PaUE9E
jadMK1vb7Nye0qedwXHUaO3i5/OE5uad3dLWG/dPCnEM0+G05JuTw1vxXRIXn40FxN4B4DhiXLOz
y+/czf2n/2rLXsg+FrAqdblQXYzuCXa10qXSV9xKpnELQyG2n9z8ijvuuSv3ZX7+j+xDJyiD6TH+
CjgwtUIb0bjCwLkC+/fX2bnWmysLK46rQplmJSvZh2lIHzHb/phvYa7kDTzsQlvZJ5nS5waFnYV2
fFnuDMipP2MhOqUwzsR0OC0L0XgsukTOYSOxz4zGFoND5z9S109cERrNp2V2tSilCccd0+Gku6/j
Lnd8cdpxfoJIeFi8ubKwQmsrA+2j4rffbjqVntaJHYHV/WrWaSSK+UYuyc0ry7M7QIWy3UzYyPCS
bwVxf8/AFHG1HYCIW600Nfl3jIoc+BR7ws3AtTbfGruVXWTZaO2y+haDQzYKBaydr9iuuNH5eGar
vbcnQOw4tFYnVBwr/eMZzwFCI+x8GJXXOKbDaZmaC18+s7TW/4P4yD0rWan6M5a1wErMzXZH8a0I
OYdzVkL70HJiSLrBeLGzefSl/6fWtCrE3nLMcjkv5Cw0owJH9/MxXuykwG/PAxGTmSut+jOWwNzD
xQi7nIi3srUt+ZT/HhGOM25OV9ZMHvax3bL0rRFW9pmyrPDiNAn1ikvZPfGgPzLVpmY6qczuABUg
+x1z7DN0mVhfOj9bmLctuxGqQVFFz/WEMd9Ie9vW1cTscmL21T1h2JbpcFoCc2FxJg/LPrScNu0H
ysnW7SBx4l/c3/MwxD2ZEd7OFPf78hST8WJn8/TLu4GI8MhdNtnMXYR13sHfplYc51Usz03T6Pz5
Hk21SVYFbAautflIeC1BgWehFccw3KfGU6aV+YCkEhgvdjZPzwek3VDGLO3NwNNpi8oBWjiWGq1d
tHR3MmMmT/j5aCR9C+MaVlqwG/f3jAX6x7PX/tsmxp00fyPPo23F3QHKjelwWtb41xzHfC8D5Dhv
p5hvUmZc327jX6siaT6yG0FbQiPCK/MlcyALLnqxJ9z+GCFu/CX8fDQi3DYYL3Y2T4/dkM7kkazZ
FeZYw4GSLNVV8/IZ+9DyzGl+l0l6NGTj32i50ctvvMhWBsY17JB/p02jtcsaWSP+xZpKyabt4nw8
4wiwh+ilB0W909PonpAcpae9banrnWSGWKFnoREVOZknn9bz/RSINNQLGxpPmYhMGVHd7PhfBnEK
h3NmFg8HNY3pcNLUqOOqNNoOhgJW96uM+Ntuc9LYYnDoMjdB3yf+SfEhY+vNGUegd+zamSc/Szer
3R2gzIzuiQcfe260ERFdIsv1d0M2Ct8fjRBFJHXY8SAxZKPWmzMOblpF//gy13xkN4Km2CaeXO8Z
aDcQsaXMhUcqil6hJ7T95G5uG2ufJiLHg3fujTbf86Dzpp2bz7Nmkbwt0T70YK6HS8TqfjWBcP9A
NTofJ5xZWxnX7KxL8aPMPBnFpKTfbBxaTiinqZSs6i/YJmZV3QDkPkres9CgL/b39/8b+l+5s1F1
vrN9hZ8dQAkayOHYDFz79dRj3JRWrmqp+aGRnsVuVa9RP3LVUgRQTb6zfXUsR/cBAKBwjc7HE+XO
AwD7Hm1URYCjcxzn7gMAAMAxFBrpaTeM0Uwxc7IBoFgY3QcAAIAjYZuYXca4PsBRw+g+AAAAAIBm
IdwHAAAAANAshPsAAAAAAJqFcB8AAAAAQLMQ7gMAAAAAaNYX+/v75c4DAAAAAAAciv8Do88cfHTX
GNoAAAAASUVORK5CYII=

------=_001_NextPart446847311164_=----
Content-Type: image/png;
	name="InsertPic_C4E3(1(10-08-16-43-42).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@758798e3-dabe-0385-1ab5-9bdf3649a8e5>

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
AABQF/8PvbLwk99qkdAAAAAASUVORK5CYII=

------=_001_NextPart446847311164_=------

