Return-Path: <SRS0=VS9e=H5=exact-estimating.com=juan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1192ACA5FFF
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Oct 2026 19:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB5B81F00893; Wed,  7 Oct 2026 19:28:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791401318;
	b=N5OCBqgy8eOGIsI+lBHkWikep7h4opL6EZi48LGLDj0juHEKA5HTkszP0YCcDcTx9Xq9
	 EVhNiXBFh7o50Itt2UJk8H52pIbIF+oGdkCXMqUKXPiUk/+XY0AyvDkTQ+TtYvopQ2erw
	 vrJDiMEASUTg7U/UTUHNrjP1MEHbqThmUtHi8EyjYUacftJSKI5nljPPcOJZZewmLSZlD
	 Jfkxrr4tfkhGbBBXbtX6/g+WH2LUVSvGDuM/rTaLbJ6I1qvzzYj17xhNFTc8NAHkCa8FH
	 KlPjj2Bf9Gm/T7h1rBm9eXZmiSUUz13CgeZZxsS1hQ3ltZSIZnvdkij8ihXlQR355Vg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791401318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:List-Id:To:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:X-Mailer:
	 Thread-Index:Content-Language;
	bh=ert8J628lokL99l9pkAT5WLShyjvbVtNLz1B4Y+NXco=;
	b=vgiSS4H0Akm3BHM3GnYsPlS86ELn6N0zVlc/NKeK5lKYEP3NK+CVBmc0jDYjN8JEcjkz
	 8Net/GxEjr27QjhPHPIBj+r0a6++Q2JG928UlYEt0XHBhu21Qbfd0JebJM0Vg7N0JIsJJ
	 fTcyusdkigFElKhLVyPhA9bp+Wdv3OKALQer3EFDUmQ++8UDcQs3UoJMv8vQOXSx0GsSs
	 2eBTU2LkovRXLlxXzKZErzAfJ57Eglt4kmgzYexMyW2GTSFuasSbB18MaywNcdZco4qKx
	 jVte+MZM3Xv7gxWs/uCn2BIown5yto3v4gvaN6yJWVWDhLuNwdp0LjCjehM1f0zglZg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=exact-estimating.com header.i=@exact-estimating.com header.a=rsa-sha256 header.s=google header.b=gRYCMilN;
	dmarc=pass header.from=exact-estimating.com;
	spf=pass smtp.mailfrom=exact-estimating.com;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5120C1F000FF
	for <linux-firmware@kernel.org>; Wed,  7 Oct 2026 19:28:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=exact-estimating.com header.i=@exact-estimating.com header.a=rsa-sha256 header.s=google header.b=gRYCMilN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5120C1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=exact-estimating.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=exact-estimating.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49e73611928so16431145e9.1
        for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 12:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exact-estimating.com; s=google; t=1791401317; x=1792006117; darn=kernel.org;
        h=content-language:thread-index:content-type:mime-version:message-id
         :date:subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ert8J628lokL99l9pkAT5WLShyjvbVtNLz1B4Y+NXco=;
        b=gRYCMilNkcjU1xCxY9lDHZNDfavrN4r/4UQvoEV1ay+g90wn4DJ1Wa5uMmqNQl3Gle
         8Qbr5R4dyPELZslnYZ0dbGRsSokvH14WQ0T82R16VE/gGJHqDzXa+mFb5uoca+jTz1tb
         s+r4sB0N2d40vPan5yj166kqosQ4i/jJ9doi7xWYK1wXNrWoOkokGgu2/p3Jru98gbAn
         Nyf40fFK7hdnyxVpuo6hQEVlHC0L0ui+/EY18bxPnvDIlaGnwLtq6ilzEBHbzqZ8loMR
         MxYfQBaQGjwnTyHbrgHo5fJPwf9um8u9Dcr6rbgcL7+giMXOQJpv2Q/KaM0eXNeTSi2Z
         3r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791401317; x=1792006117;
        h=content-language:thread-index:content-type:mime-version:message-id
         :date:subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ert8J628lokL99l9pkAT5WLShyjvbVtNLz1B4Y+NXco=;
        b=ppFk58PRPoMmNkTgKh+SKK74y2E0mvaY8ePg+2bt9laShtCkQIGcuUFz4my98FWP5O
         oCvPvA9rIKRnTHJl9p3eIxGSzblQ5e+J0Qpzu5uxAtqcFYBz0d1X6kTRj9JKIFLcYHan
         KOHWGkCBrDnRfexVqnh5hK7256qBDEg/xYXWJ660tXvo5CVln/vmtcFiN6yOZJCytDyu
         5X2M4IC3fWsUto9PG9Ko97fNeHIAQUrZ7QgP6iBjR+4St6Vhf6bRRUBXm5vZoXUek3dx
         z3axHidcSY2a0O1QxF9HEjGymvdw9aG0EtpP/3WJ5xGURx1GU865eciidQVrBux+jhGp
         veTA==
X-Gm-Message-State: AFuF++kjNFcEqMEwJbgU8i2XWotF15r07S6NdcC1vTa2QVlBkD6wc9wS
	waUcXedpQelSFQjILlEv0D/mG3B7m0ivfw1nYJHVqB8vEPAFh1TnjJoL1radTIei2+pBZ7s+tfU
	eVQUSwXpkwT4g
X-Gm-Gg: AYBFou3ppGCBrJaZkA3H+SsxIhHtvbS8OxiwMVsBaGOvxnXKDjkp1/EnTgb+GuC99g8
	KSnilmAQenTWCrmnydRLAG2jEn6404/OR7U7/lTAnB/ag9tVmW4SYopXTIMo9k3KLEO3+nXEAFG
	53ItebA6eCZu+rKOQ/OeIF9GaybJc9b2v5HgLdIbKo95BiGx9w+LtZR0TCjkcY29SepaymqM9Kk
	CSKy3jqJwFTnC+LZ1EHgB2hnhdjkbN0h3eJt56Bo2pRvTXh29RiEWpD5M5H9YUVyiDrKaFXzlz7
	8j8c5hi4gIzvTN26Kk5U3Mpr5qXkgrz9PT2IfxZj8sqdZjjVf9wlRwRddvRroc3jxvTUlZ4O87Q
	6h1oV5ECZ+f38NJu1gRWnd5KoP+KseLgXI4WkMmgoNJ+i7XIIQBBbpDhap6M7K27+aJJigw+3Ki
	bL+AIbNhyYDKQCbb9CPrb73WAals7VkKqusnr5dSdnjhtsyh3MvmRxkUDQTlgi/zMdObjKl+zo7
	kVTtZuflxX15NcmKV3zUuO0jZS704ikLmIzr36+6IgxI78hultz9maw2FOSHRUYU25rm07S2oay
	ih1pYyCbMvi9y/2TIg==
X-Received: by 2002:a05:600c:3f08:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a1851acda1mr3386285e9.7.1791401316336;
        Wed, 07 Oct 2026 12:28:36 -0700 (PDT)
Received: from ADMINRG4BBHOOS ([147.90.103.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842a3f55sm13120985e9.2.2026.10.07.12.28.34
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 12:28:35 -0700 (PDT)
From: <juan@exact-estimating.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: Detailed Plumbing Estimates to Support Your Upcoming Bids
Date: Thu, 8 Oct 2026 00:20:28 +0500
Message-ID: <044801dd5692$0bd252d0$2376f870$@exact-estimating.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0449_01DD56BB.F4A8D000"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad1WiiE8BkJccGaZTUGa+T7gsjXFuw==
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_0449_01DD56BB.F4A8D000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I'm Juan Meraza from Exact Estimating. We specialize in preparing accurate,
trade-specific plumbing estimates that help contractors like you stay
competitive and efficient.

Our deliverables include:



*	A clear breakdown of materials and labor
*	Detailed estimate sheets tailored to the project scope
*	Colored drawings with references to ensure accuracy


We've supported numerous plumbing contractors with timely, dependable
estimates that simplify the bidding process and save valuable time.

For your review, you can view a sample project here:
[Plumbing Sample
<https://docs.google.com/spreadsheets/d/1D6lMI43NFKVNK59QdA7TkdN0pFzT0KIj/ed
it?usp=drive_link&ouid=116615654309393890495&rtpof=true&sd=true> ]

The sample highlights our format, level of detail, and attention to
accuracy. If you have an upcoming project, we'd be glad to provide a quote.

Looking forward to the opportunity to work with you.

Best regards,

Juan Meraza
Business Development Manager
Phone: +1(215)789-9104 | Exact Estimating

To opt out please reply back


------=_NextPart_000_0449_01DD56BB.F4A8D000
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:115%;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	line-height:115%;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:856701281;
	mso-list-type:hybrid;
	mso-list-template-ids:130694768 67698689 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal>Hello,<br><br>I&#8217;m =
<b>Juan Meraza</b> from <b>Exact Estimating</b>. We specialize in =
preparing accurate, trade-specific plumbing estimates that help =
contractors like you stay competitive and efficient.<br><br><b>Our =
deliverables include:<br><br></b></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li class=3DMsoNormal style=3D'mso-list:l0 level1 lfo1'>A =
clear breakdown of materials and labor</li><li class=3DMsoNormal =
style=3D'mso-list:l0 level1 lfo1'>Detailed estimate sheets tailored to =
the project scope</li><li class=3DMsoNormal style=3D'mso-list:l0 level1 =
lfo1'>Colored drawings with references to ensure accuracy</li></ul><p =
class=3DMsoNormal><br>We&#8217;ve supported numerous plumbing =
contractors with timely, dependable estimates that simplify the bidding =
process and save valuable time.<br><br><b>For your review, you can view =
a sample project here:</b><br>[<a =
href=3D"https://docs.google.com/spreadsheets/d/1D6lMI43NFKVNK59QdA7TkdN0p=
FzT0KIj/edit?usp=3Ddrive_link&amp;ouid=3D116615654309393890495&amp;rtpof=3D=
true&amp;sd=3Dtrue" target=3D"_blank">Plumbing Sample</a>]<br><br>The =
sample highlights our format, level of detail, and attention to =
accuracy. If you have an upcoming project, we&#8217;d be glad to provide =
a quote.<br><br>Looking forward to the opportunity to work with =
you.<br><br>Best regards,<br><br><b><span =
style=3D'font-size:16.0pt;line-height:115%;color:#ED7D31'>Juan =
Meraza</span></b><br><b>Business Development Manager</b><br><b>Phone: =
</b>+1(215)789-9104 |&nbsp;<b><span =
style=3D'font-size:13.0pt;line-height:115%;color:#4472C4'>Exact =
Estimating</span></b><br><br><span =
style=3D'font-size:7.0pt;line-height:115%'>To opt out please reply =
back</span></p></div></body></html>
------=_NextPart_000_0449_01DD56BB.F4A8D000--

