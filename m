Return-Path: <SRS0=g8FY=5M=arrowmarketing360.com=parul@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F30CCFA00
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Nov 2025 10:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25C36C116D0; Tue,  4 Nov 2025 10:10:38 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11580C116B1
	for <linux-firmware@kernel.org>; Tue,  4 Nov 2025 10:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11580C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arrowmarketing360.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=arrowmarketing360.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so5215564b3a.1
        for <linux-firmware@kernel.org>; Tue, 04 Nov 2025 02:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arrowmarketing360-com.20230601.gappssmtp.com; s=20230601; t=1762251035; x=1762855835; darn=kernel.org;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GipolwxmVXE9MkPxGjrf+gCK+qTh6QFbEZC7Niiizxs=;
        b=wPNWuDNPYykOBwF7KZjnOIJ1K4jDkcLtrih1ileAYpRDR93IyBUlYyNymXJqqYYfS6
         TUT3OgOpmhQoIFKcgF0WwA8ZvA0hCtLTJauiKPdA0GwjJQFhnB8VeAk1oRU/vbwuYAQF
         uyaSXO78vTINfCo51k3849GXW+8tpD1Fr5PwPaPDlLSP96DHc85k56iq+5IPAGOGszem
         /1z1FXDb170G0+hjc99eEC81lSguJYRl/DsEqRcNQhrrWC6Nq/FQuD/940dkwoG/IzR4
         oouWprrCjtlrOIrXjvmCkIrrJR2tF/a9cye6SttPvvyp1CUHEn+HxYbx+rUYe4RyHO6T
         xPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251035; x=1762855835;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :cc:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GipolwxmVXE9MkPxGjrf+gCK+qTh6QFbEZC7Niiizxs=;
        b=mzn5ero+heJwrQ8bG7Xyt7rP051HR/EE4VlLjsWRQn8jvBXW2P+jbGSaUEAUb1V0tg
         Sw9bgQJKWSiXtChFAbLyYpYJCxtjNLkyNofPXD6DvNFQzKLu8RxYFK3wCz7JQk7yewrT
         fiPGYKFh1FFkfKyDHjnrfNBHoKdNrgr2vy8RgZ3gTm1dKOuGOc1IgwVqIF3AkXSSpC/V
         G80E6bwS1B1FEATgUNc0qqBB9ta92KTTbPu9l2D1wHcJAgEKwzOf678MB253s0d3GTOP
         tonka5WnD30xSfFCHdwNMMDVDEw+dHjwd8C5iO5rIkba92hMe6nEBL7A7oU0fe/SxMwj
         R1ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVT6dcr/5MMldm5baqXDKcSZL+bL/pbjOMq+R0vWt18utdPoK6iw/IXR8nDS3lECCps9sbm/n9/eVQ1biLlxQ==@kernel.org
X-Gm-Message-State: AOJu0YyGacExv2VWu8Si2dTRblg3zwJDBO1LNU9rl/1PMX4QxCYhi0tQ
	Kk3ZaQETcpZqEEXU1KYzx757F82ghjdhRQBFm7kSnyJ6CIlKLmmkSq5Hb1ymZbmJTdk=
X-Gm-Gg: ASbGncttA/yKhW8BeyKGkw+d0pU9LdrP5c2QByZrsz/pMXZv+ZvPEWVQlhv1192xQqt
	LznC9lmfbexaEeTGnL2l1h0b6aRhlsFTEj76WfSFubr1d/wGGBbM2stFt21dpcoYeJJltz2NM80
	HgYxXCnqua+Pat9XoS7CMvdZ5S32Cmzw/+6RqF9Z9LUS1AjcOlew0VTJrHP7DZEd1Q7i4Oxcn5l
	Vs3aFCN08wFW5+OdU+Reg3ZoT9BB7jj9oZ7sNM/e6KsbdbqoRpZxFo/smTdoIwBlnM6zjf6cbX0
	6dGmkFMtcan0/00UO5PEiYg6zW/hNPsQad5jCm853PdHA9GIBXno6HtEGukYa1mU+o92loITYq6
	TrKbUN9enJqgK/4uIYnxDAuaXuOEIuj4K0uPxJfxMxRNIjK9kJy9fhzeDNTidYkKaSUccxeidYw
	6gW+fsIpdxy4Bi9JpJEEegS6M=
X-Google-Smtp-Source: AGHT+IHmcNkd1J8iaG7JKhpekNa3ZWgtStHXO33WOaFEU4i6FiBLOOjYBEFsA4CSxFbFoEgcuWCV2Q==
X-Received: by 2002:a05:6a21:6d9a:b0:34e:be9b:b67f with SMTP id adf61e73a8af0-34ebe9be4eemr1138019637.49.1762251034942;
        Tue, 04 Nov 2025 02:10:34 -0800 (PST)
Received: from DESKTOPA7UFVO5 ([2405:201:4030:20da:ecb7:24cd:bbd7:dd13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd62428dfsm2299499b3a.60.2025.11.04.02.10.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Nov 2025 02:10:34 -0800 (PST)
From: <parul@arrowmarketing360.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <garekarsmd@gmail.com>,
	<jstory76@naver.com>,
	<eureka_skin@naver.com>,
	<emily@urbanedgebeauty.co.nz>,
	<kiran.k@intel.com>,
	<linux-firmware@kernel.org>,
	<ravishankar.srivatsa@intel.com>
Cc: <info@arrowmarketing360.com>
Subject: Inside our 90-day Patient Growth System for Dermatologists
Date: Tue, 4 Nov 2025 15:31:27 +0530
Message-ID: <0b0701dc4d73$43cba6b0$cb62f410$@arrowmarketing360.com>
MIME-Version: 1.0
Content-Type: multipart/related;
	boundary="----=_NextPart_000_0B08_01DC4DA1.5D8430D0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdxNcadHqHPCFaFWQJSLeX6EpNeMkg==
Content-Language: en-in

This is a multipart message in MIME format.

------=_NextPart_000_0B08_01DC4DA1.5D8430D0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0B09_01DC4DA1.5D8430D0"


------=_NextPart_001_0B09_01DC4DA1.5D8430D0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Garekars Md Llp,

Here=E2=80=99s a quick overview of how our 90-day Patient Growth System =
works for dermatologists and skin specialists:

1=EF=B8=8F=E2=83=A3   Targeted Ad Campaigns =E2=80=94 We run precision =
ads on Meta & Google to attract local patients actively searching for =
skin, acne, or hair treatments.

2=EF=B8=8F=E2=83=A3   WhatsApp Automation Funnel =E2=80=94 Converts =
inquiries into confirmed appointments automatically.

3=EF=B8=8F=E2=83=A3   Follow-up Nurturing =E2=80=94 Our system =
re-engages lost leads until they book.

4=EF=B8=8F=E2=83=A3   Performance Guarantee =E2=80=94 If we =
don=E2=80=99t deliver measurable results, you don=E2=80=99t pay.

=F0=9F=91=89 Watch this video that explains exactly how it works:

=F0=9F=8E=A5 =
https://arrowmarketing360.com/skin-care-marketing-growth-system/=20

We=E2=80=99re currently onboarding 2 new dermatology clinics this week =
=E2=80=94 one slot is still open.

=20

--



Parul Saini | Client Acquisition Manager

Mobile: +91 9821418148=20

Website:  <http://www.arrowmarketing360.com/> www.arrowmarketing360.com



 <https://www.linkedin.com/company/arrow-marketing-360/>  =
<https://www.facebook.com/arrowmarketing360/>  =
<https://www.instagram.com/arrowmarketing360/>=20

=20


------=_NextPart_001_0B09_01DC4DA1.5D8430D0
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUTF-8">
<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta name=3DGenerator =
content=3D"Microsoft Word 15 (filtered medium)"><!--[if =
!mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Calibri Light";
	panose-1:2 15 3 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI Emoji";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:595.3pt 841.9pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-IN link=3Dblue =
vlink=3D"#954F72"><div class=3DWordSection1><p class=3DMsoNormal>Hi =
Garekars Md Llp,<o:p></o:p></p><p class=3DMsoNormal>Here=E2=80=99s a =
quick overview of how our 90-day Patient Growth System works for =
dermatologists and skin specialists:<o:p></o:p></p><p =
class=3DMsoNormal>1=EF=B8=8F<span =
style=3D'font-family:"Tahoma",sans-serif'>=E2=83=A3</span> =
=C2=A0=C2=A0Targeted Ad Campaigns =E2=80=94 We run precision ads on Meta =
&amp; Google to attract local patients actively searching for skin, =
acne, or hair treatments.<o:p></o:p></p><p class=3DMsoNormal> =
2=EF=B8=8F<span =
style=3D'font-family:"Tahoma",sans-serif'>=E2=83=A3</span> =
=C2=A0=C2=A0WhatsApp Automation Funnel =E2=80=94 Converts inquiries into =
confirmed appointments automatically.<o:p></o:p></p><p =
class=3DMsoNormal> 3=EF=B8=8F<span =
style=3D'font-family:"Tahoma",sans-serif'>=E2=83=A3</span> =
=C2=A0=C2=A0Follow-up Nurturing =E2=80=94 Our system re-engages lost =
leads until they book.<o:p></o:p></p><p class=3DMsoNormal> =
4=EF=B8=8F<span style=3D'font-family:"Tahoma",sans-serif'>=E2=83=A3 =
</span>=C2=A0=C2=A0Performance Guarantee =E2=80=94 If we don=E2=80=99t =
deliver measurable results, you don=E2=80=99t pay.<o:p></o:p></p><p =
class=3DMsoNormal><span style=3D'font-family:"Segoe UI =
Emoji",sans-serif'>=F0=9F=91=89</span> Watch this video that explains =
exactly how it works:<o:p></o:p></p><p class=3DMsoNormal><span =
style=3D'font-family:"Segoe UI Emoji",sans-serif'>=F0=9F=8E=A5</span> <a =
href=3D"https://arrowmarketing360.com/skin-care-marketing-growth-system/"=
>https://arrowmarketing360.com/skin-care-marketing-growth-system/</a> =
<o:p></o:p></p><p class=3DMsoNormal>We=E2=80=99re currently onboarding 2 =
new dermatology clinics this week =E2=80=94 one slot is still =
open.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><span =
style=3D'font-size:12.0pt;line-height:107%;font-family:"Arial",sans-serif=
;color:#222222;mso-fareast-language:EN-IN'>--</span><span =
style=3D'mso-fareast-language:EN-IN'><o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:26.0pt;line-height:107%;font-family:"Arial",sans-serif=
;color:black;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN'><img border=3D0 width=3D90 =
height=3D89 id=3D"Picture_x0020_5" =
src=3D"cid:image001.png@01DC4D9F.C1372DF0" =
alt=3D"https://lh7-rt.googleusercontent.com/docsz/AD_4nXe2n_EWUaUSJrPyZin=
su5Qx5Z3wOfEqIYisg-nzF8lXD7NISpimO5C19Pb7T6KPMGHXZX1ZwP5KHpGVHiP9SMiQP62A=
lCcJnm35KJvF9CavQfoadX_nBrEAX1Vx8TsE5WpZafeO9A?key=3Da0vaFB5nszSZlLEqJJEo=
gj3R"></span><span =
style=3D'color:#222222;mso-fareast-language:EN-IN'><o:p></o:p></span></p>=
<p class=3DMsoNormal><b><span =
style=3D'font-size:12.0pt;line-height:107%;font-family:"Calibri =
Light",sans-serif;color:black;mso-fareast-language:EN-IN'>Parul =
Saini</span></b><span =
style=3D'font-size:12.0pt;line-height:107%;font-family:"Calibri =
Light",sans-serif;color:black;mso-fareast-language:EN-IN'>&nbsp;</span><s=
pan style=3D'font-size:12.0pt;line-height:107%;font-family:"Calibri =
Light",sans-serif;color:#222222;mso-fareast-language:EN-IN'>| Client =
Acquisition Manager</span><span =
style=3D'color:#222222;mso-fareast-language:EN-IN'><o:p></o:p></span></p>=
<p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;line-height:107%;font-family:"Calibri =
Light",sans-serif;color:#222222;mso-fareast-language:EN-IN'>Mobile: +91 =
9821418148&nbsp;</span><span =
style=3D'color:#222222;mso-fareast-language:EN-IN'><o:p></o:p></span></p>=
<p class=3DMsoNormal style=3D'mso-line-height-alt:11.75pt'><span =
style=3D'font-size:12.0pt;font-family:"Calibri =
Light",sans-serif;color:#222222;mso-fareast-language:EN-IN'>Website</span=
><span =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222;ms=
o-fareast-language:EN-IN'>:</span><span =
style=3D'color:#222222;mso-fareast-language:EN-IN'>&nbsp;<a =
href=3D"http://www.arrowmarketing360.com/" target=3D"_blank"><span =
style=3D'font-family:"Tahoma",sans-serif;color:#1155CC'>www.arrowmarketin=
g360.com</span></a><o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;line-height:107%;font-family:"Arial",sans-serif=
;color:#222222;mso-fareast-language:EN-IN'><img border=3D0 width=3D334 =
height=3D91 id=3D"Picture_x0020_4" =
src=3D"cid:image002.png@01DC4D9F.C1372DF0"><o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'margin-bottom:3.0pt'><a =
href=3D"https://www.linkedin.com/company/arrow-marketing-360/" =
target=3D"_blank"><span =
style=3D'font-size:12.0pt;line-height:107%;font-family:"Arial",sans-serif=
;color:#1155CC;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN;text-decoration:none'><img =
border=3D0 width=3D32 height=3D32 id=3D"Picture_x0020_3" =
src=3D"cid:image003.png@01DC4D9F.C1372DF0" =
alt=3D"https://lh7-rt.googleusercontent.com/docsz/AD_4nXfZAWnZSt3KjWaKpPM=
7Co5VYGoXCMbIXP3Mt7B7mnAP20RvnPBVJSl9TQJqEINJ6QAudhdno-q-9hHsFfhVjL9hxJY3=
H4AcJD7XYOGbPuBj7YHRnN2IQtXih0j9kDZ56NWT48-B8w?key=3Da0vaFB5nszSZlLEqJJEo=
gj3R"></span></a><a href=3D"https://www.facebook.com/arrowmarketing360/" =
target=3D"_blank"><span =
style=3D'font-size:12.0pt;line-height:107%;font-family:"Arial",sans-serif=
;color:#1155CC;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN;text-decoration:none'><img =
border=3D0 width=3D32 height=3D32 id=3D"Picture_x0020_2" =
src=3D"cid:image004.png@01DC4D9F.C1372DF0" =
alt=3D"https://lh7-rt.googleusercontent.com/docsz/AD_4nXdkUOueygmMCPIfYCB=
Jb1zH3z59ro7XXlaWTSN46J-VXtpYy5VbqP67b9BR3yC5NJd8duSPS6GcHFMGParvjAj6-Fd6=
CK6F0kBd8cZmxEILzYJz-_fTmcNTt4MNzBILRntoQwyY?key=3Da0vaFB5nszSZlLEqJJEogj=
3R"></span></a><a href=3D"https://www.instagram.com/arrowmarketing360/" =
target=3D"_blank"><span =
style=3D'font-size:12.0pt;line-height:107%;font-family:"Arial",sans-serif=
;color:#1155CC;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN;text-decoration:none'><img =
border=3D0 width=3D32 height=3D32 id=3D"Picture_x0020_1" =
src=3D"cid:image005.png@01DC4D9F.C1372DF0" =
alt=3D"https://lh7-rt.googleusercontent.com/docsz/AD_4nXf6-Cb7iO7kpu_l9BL=
QaF0UAxfFeySKpJJpGJ1eyQbaw5pH4rNCvZsoUSBYkWTTI7xrE27p5V47rCOJVAsQPZmWm9j5=
CxYHfs_cqO4OeV5fd8sTFmr075NVj-HTU6eOobZJ-143Uw?key=3Da0vaFB5nszSZlLEqJJEo=
gj3R"></span></a><span =
style=3D'font-size:12.0pt;line-height:107%;font-family:"Arial",sans-serif=
;color:#222222;mso-fareast-language:EN-IN'><o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_001_0B09_01DC4DA1.5D8430D0--

------=_NextPart_000_0B08_01DC4DA1.5D8430D0
Content-Type: image/png;
	name="image001.png"
Content-Transfer-Encoding: base64
Content-ID: <image001.png@01DC4D9F.C1372DF0>

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

------=_NextPart_000_0B08_01DC4DA1.5D8430D0
Content-Type: image/png;
	name="image002.png"
Content-Transfer-Encoding: base64
Content-ID: <image002.png@01DC4D9F.C1372DF0>

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
ISH/EmSe/QwAAAAASUVORK5CYII=

------=_NextPart_000_0B08_01DC4DA1.5D8430D0
Content-Type: image/png;
	name="image003.png"
Content-Transfer-Encoding: base64
Content-ID: <image003.png@01DC4D9F.C1372DF0>

iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAPiSURBVFhH
zVdLTxNRFP5mmDIFyksUNQSVoAsDS3ShceEjmmhUEjdq4h5jgtG409iMP4AVKCQuXGjiggX4iCxI
3LjBxBBNVIyBID6pSlvoazrTGc+ZacsUmFJaEzjpJe3ce8/5zncec5AURcF6irSextn2xgXgr6uT
ED9W818YqhidV0IhfSVdKzKgyKeviFplFwStCaZJ93gVIwIg0NJOfFfkWL9ffdq3VMsyAIrceRnV
m3uRjJNdoxiry++USfWoaOxV0Gn41aF7zgM5APx158vFWPw6tASgRq1zTIBp0B+RPuxNMZLSbCaA
a2TjvhJ6TA9syWUgqFfBiy3QVHuXjacMbKryYC6RgpEyIZYVCcLSaTYiqPsgILgyAOupYPFuRZ2M
3zq0Dd0dmzE+G8eFoS8IEhBBLBJEWrdrCJwbJnlbW+nB7YNb4SGvj7dU4witwbdzELxlxQRixTuu
fYC9jCV0vJyJWMZD5PmH35QbxYbABbI7AK4eCsaJx1M4vNOHD39VzAZViOS9odIGMWQJARLKRZh8
OPNMEiFKhYXJFQBnv5cUH9vlg0qK922vwDtS+vWPigP0rLnGY9mfDicxNhVBe3MV9jbIiOsG3vyK
4+ecSsDK0snvHjF3AFR6PlLw5FxLVsmlZzN4OB3FzQNbcbK12tI6/HkeYzt8UChZOVdYAjEdd17N
om8sADCIPBmT913ALITUFOrTSZdkiklblOlOy2EyfnZPbsdurJTQe7wJk6EkRiZCEGT3pC35ZVQj
i3j9M4bnE2HsJzCn0swwvu6OBox8ClvNzI2FkgF8olgffTSJCHkLypnhi604s9tmpK3Bi0piI5ak
3rHWKii00Mcp4SILGoRqD0yK/SAxkQHgI+q9lBexPO+ykhkQuSvSYg9N6vcJqoKMWF6vUo0lA1iq
f61dumQAhYbK7dzGB1Du6P0ZeiUHz87v7KUzBM67RTHA9Tsb1VGXbkQJ3S5ofjHxfMDC37OJRnt8
xrlnTXRr64QmzT7kCXkepi7Y8eBzthVzBxRry3F19DtuvPxhqdV4SKF2a92hsnsxtYA9AxPWbzY+
TzoWhxhbt1Nyc6BeipILAXjkWtAYxeCDVNtZIX6Z4gVSmp1TuQozvKcZSCQX72SNe2R6W2oB1EsR
hBZV5gCgWS1JQ2kPAbAHRxqjROtEbrEtc8PhUu4ez3S0ycZ5JSI9znmQry2rAppa+xWjU4Qsd9FA
2AQeSFcLpFuMeRDlZejfEA4P+LWn/flDkN71a0N3/eN7B9DW9n/+MXn/dl5p/2hnbd4ccGzaFz5m
p1c3Jwt63u5+auM3ooI8LOHQP5G4Zj12+hddAAAAAElFTkSuQmCC

------=_NextPart_000_0B08_01DC4DA1.5D8430D0
Content-Type: image/png;
	name="image004.png"
Content-Transfer-Encoding: base64
Content-ID: <image004.png@01DC4D9F.C1372DF0>

iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAUBSURBVFhH
1VdLbxtVFD53Zjx+pnZC2jwoEmyALErTFAPlJcGGHRs2wKIlSksIhQWIDYvUmkYsWMGmeTaxYJV/
gISqqqqgkVKaRIlUo1YFodLUaZLGSZz4Nb6X744p9jgzdtJNxLEUxXPvfOc753zn3GvNMAzaT9P2
07n0/f8jMPBM33Fe4FGF8w4hxEEZBWNsmStKQvEo182Th2ZQVrHbzO4qA7HIS14lfPwU43SaTB5l
/gMk8Hlk8j+Gj8hskjbxYMZg/CJfWogbuWvZekTqEhho7X5T0/3fCW+oi8w8UT5DtLXmjKuoJDy+
Lqbpg1pL58cD2ee+6H8Qv1KLRE0CRmv3aeYLXSBN1yn9sF4wRLxIlE1b+0TgQCcp6s9Ge/fZ2GJ8
zO1lVwJw3sOCkTEyC4g4JQvtiFEsogBmVclVRur2OpHH52H+yCiwRCwZv+gE4EgAaX+VeQMjVsoL
KKODc+mS5zkdbNDojTadng6ppGLflslpaqlAc8t5UqgkAWANA/NmfzJ+rZrEDgKxyPteTVGHwV6t
Fbl0/t6zAfr+RJgOB1Ub7oWbW/TZYo5IVaAZkAhGVCrkhoEdNVKTWCjbDgJKIHhKhJqOWDV3S3tB
UGeLTpNvN5EGH9VmK5bEQDkkpqKwk5Qimx5sBGId5xQlda/PSn0tQ93PdARtzv/cLNLlv7MEJ3QF
0TOtSjNFYBb5p7GOjgkjkYBaS2YjoG3ePypUrdNqNReTmmM6o2NPeP7bkUI53vlplW7fR3alYynC
agK5DDGJvfz6C0SJWUcCnPMTUL57n8u3QEAHeMRbzv3sSoFurxaIBVRCApxNtmiwkRT+8BVscCaA
afa85cHBLNVz/AWOCS+VjjahCUJqBDhZucUikuCIolg+ymYXoaBmt9TLeMNoDMGJfHirkoAXTRD2
I3oPsyqQBZltScqBhGB2H3VHsSQkh00LWu3Xd5sprCtWjpoqSvBWm5dufdhiNY0k8PX0Bo3Mp0mt
2OMWmJ0AoxW3jTKlT4KEzyG3Op4d8pfDXcoiTS7GhN2HjYAglpCnmqPhsZNzp713NkyrE3Yakzr6
3VUDCqaoyGygwCiqVO2/Jnt7PSfog8trFq6O799EG6gNqpc2hw74djZNGr7KY0ESUKoJSExgc1Km
XAmYjW3zGERzLNDQSZnSqSbNGmZAnkxsgRgeoNBfHQ2BQGn9r7RJkwvYDxHKBDLoZEc7egPyvjBL
je3zlCxTsJXASJznOD4HSdVHq9NnAUJURRDwg0BlgB656INTPHeZ3iiJHFzFIenDNQNygR9+6gft
7r3PRTBypNZh5CwUh6cCNcFwY5urC8VM5sfqHTva0Jg+nx9oPdOLY/gq6X6NCnIsu423ejTk2PTj
SM+ZmFK91SehfNtxDvQnx6ZQil7mi4xbLh6HhIxcOkfqRTb1yblk3Ca+R9RdBxGuURNGew8EFRik
QMQrj9Q9mTxTzHxebKfO4jZUCsTBak7C2OL4BG4yt8iLS2mo8UUqor8z21Ipzmiy1XylqFlu6wbl
Ml8i8qu1iNcdxbhG/YJr+WvKgWMf4VreA7AoCzaycLj8akPEZwmNzLRg+dwNLjLjxfTshJGarnOx
2OUvIwsoNS1bczTW2tdlZtZe/mOpOdrc4sFNkGhpJbdO6Y3fuE+7Hrs7NLOXUtXNQDWYkbQczFwa
oaFLFYuP+xN3zwT2Et1u9u47gX8ASXvOyOSHuUwAAAAASUVORK5CYII=

------=_NextPart_000_0B08_01DC4DA1.5D8430D0
Content-Type: image/png;
	name="image005.png"
Content-Transfer-Encoding: base64
Content-ID: <image005.png@01DC4D9F.C1372DF0>

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

------=_NextPart_000_0B08_01DC4DA1.5D8430D0--

