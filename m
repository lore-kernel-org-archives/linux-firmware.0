Return-Path: <SRS0=w4+M=3L=tradeshowvisitors.com=diana.christopher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E24C433FE
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Nov 2022 13:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70EE3C433D7; Fri, 11 Nov 2022 13:12:31 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C7BDC433C1
	for <linux-firmware@kernel.org>; Fri, 11 Nov 2022 13:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C7BDC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tradeshowvisitors.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=tradeshowvisitors.com
Received: by mail-pj1-f47.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so7733625pjk.2
        for <linux-firmware@kernel.org>; Fri, 11 Nov 2022 05:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tradeshowvisitors-com.20210112.gappssmtp.com; s=20210112;
        h=thread-index:content-language:mime-version:message-id:date:subject
         :in-reply-to:references:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0KEhtwm8ioImzMlIlFzUfdFOHSNrBfxtTcdXKiQ73Y=;
        b=JjrO8a6szeEivZgMXJ/ueQcVLdEWjFyHHUsiaTvP4LXFYi2Ntr5oaGfYbZyzfZepsZ
         zQ51BgRDnJQo9nyJkStTZTWDRnRiPSsz0LbzCA3h/XRkHcHlUw+dqV6e9XWhmiZw0aOb
         NX5ONki+BWWOTTmhg3ECJf4DduF4l3Xk3RHj9ceVE9zct0m/gEUGrsVL7xJDmQuWDnak
         5NcFAdGVzNyO38ksoyUy5Xpxh+UYD41VB8XijKK7eiMog6N0PPsQs92K+Ntaf6d9g7En
         586LurFRf0cHWWmx/UV5GdifwroLf8Qz/VNbJmkk8tK7eq1Oh9foAmuHSyoFJbPC0Wb0
         3nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=thread-index:content-language:mime-version:message-id:date:subject
         :in-reply-to:references:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0KEhtwm8ioImzMlIlFzUfdFOHSNrBfxtTcdXKiQ73Y=;
        b=dTvdY+vW6oAB5Mf3/ynsKiZXv7meEZZh14u+tU46f/FPAdKUHxrmlWiGjSpShxvflz
         q9ICq52aftWAD6hvpdngZjj95RXGbYSniPOtt0J5YHon/bTDx4fgps55WMLHTTGKw/86
         8VtBeEiLa93HKU1S+Xf11QJynANsSQAf1CHUyMKL5fVTedRGHdPHMQ/9K6EmCpPVQG3w
         xzG5o4yxvsLawBcGd8HfrTrzjTvEX2F4YlqKQnzmkRzkOtz9Dc5y9ibwCVoMcilfDwqn
         rTeKoqzBIY2qba5MFQ5Ozgb/LLx4hbtS5m0deNnFTFplRz1rXqe0H4sJqdqmwbgMPdCe
         P66w==
X-Gm-Message-State: ANoB5pmez4VePcsmhvkcx6rLUpH6IWQ5O/Wh3bf/gXl6UobgcFXZSw0q
	qMX3yuzugH8vUPk67h+RFdLkIh7DIXqjefGZ
X-Google-Smtp-Source: AA0mqf6K/qB1KgVgUkP/61Oz1Vz9xMYIH7KnLqUL7F6RGLxbYIs7z7yo3UZUmZvfLEaeTpPWUBtKLA==
X-Received: by 2002:a17:90a:4e8a:b0:20a:75ae:8276 with SMTP id o10-20020a17090a4e8a00b0020a75ae8276mr1917717pjh.51.1668172337732;
        Fri, 11 Nov 2022 05:12:17 -0800 (PST)
Received: from ZenBrightTech11 ([115.99.213.186])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a5ac500b00200461cfa99sm4808494pji.11.2022.11.11.05.12.16
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Nov 2022 05:12:16 -0800 (PST)
From: "Diana Christopher" <diana.christopher@tradeshowvisitors.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
References: 
In-Reply-To: 
Subject: RE: NAB Show 2022 Attendees Info
Date: Fri, 11 Nov 2022 08:12:00 -0500
Message-ID: <018301d8f5cf$3a6cbdb0$af463910$@tradeshowvisitors.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0184_01D8F5A5.5197C720"
X-Mailer: Microsoft Outlook 15.0
Content-Language: en-in
Thread-Index: AdjN5IfA+7IF+jt5QCqj68NzJvyJJgAvEcXAAAAAE3AAAAAMcAAAAAswAAAACwAAAAAMwAAAAAuQAAAAC4AJy5ZUIA==

This is a multipart message in MIME format.

------=_NextPart_000_0184_01D8F5A5.5197C720
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

Hi,

 

I'm sorry to trouble you. I would love to hear your thoughts with the
follow-up request.

 

Hi,

 

Shall I get back Counts and Cost for your review to make a decision?

 

We currently have Thanksgiving offer, make best use of it.

 

Await your swift response

 

Regards,

Diana

 

From: Diana Christopher [mailto:diana.christopher@tradeshowvisitors.com] 
Sent: 22 September 2022 12:40
To: 'linux-firmware@kernel.org' <linux-firmware@kernel.org>
Subject: NAB Show 2022 Attendees Info
Importance: High

 

Hi,

 

Would you be interested in acquiring the pre-registered attendee mailing
list from National Association of Broadcasters Show 2022?

 

Attendees: Distributor/ Dealer, Representatives, Industry innovators, Tech
visionaries, Broadcasters, Educators, Manufacturers, Sales & Marketing
Corporate Leader, Technical Engineers, and more....

 

Please pick the number which describes you:

 

1. Yes Interested, send me pricing and other data information.

2. Opt-out

 

Thanks,

Diana Christopher | Marketing Coordinator

 


------=_NextPart_000_0184_01D8F5A5.5197C720
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-IN =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><div><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>Hi,<o:p></o:p></span><=
/p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'><o:p>&nbsp;</o:p></spa=
n></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>I'm sorry to trouble =
you. I would love to hear your thoughts with the follow-up =
request.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'><o:p>&nbsp;</o:p></spa=
n></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>Hi,<o:p></o:p></span><=
/p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'><o:p>&nbsp;</o:p></spa=
n></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>Shall I get back =
Counts and Cost for your review to make a =
decision?<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'><o:p>&nbsp;</o:p></spa=
n></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>We currently have =
<b>Thanksgiving offer</b>, make best use of it.<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'><o:p>&nbsp;</o:p></spa=
n></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>Await your swift =
response<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'><o:p>&nbsp;</o:p></spa=
n></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>Regards,<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>Diana<o:p></o:p></span=
></p></div><p class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><div><div =
style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm'><p class=3DMsoNormal><b><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-IN'>From:</span></b><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-IN'> Diana Christopher =
[mailto:diana.christopher@tradeshowvisitors.com] <br><b>Sent:</b> 22 =
September 2022 12:40<br><b>To:</b> 'linux-firmware@kernel.org' =
&lt;linux-firmware@kernel.org&gt;<br><b>Subject:</b> NAB Show 2022 =
Attendees Info<br><b>Importance:</b> =
High<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'color:#1F4E79'>Would you be interested =
in acquiring the pre-registered attendee mailing list from =
</span><b><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>National Association =
of Broadcasters Show 2022?</span></b><span =
style=3D'color:black;mso-fareast-language:EN-IN'><o:p></o:p></span></p><p=
 class=3DMsoNormal><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span =
style=3D'color:#1F4E79'>Attendees:</span></b><span =
style=3D'color:#1F4E79'> </span><span =
style=3D'color:#1F4E79;mso-fareast-language:EN-IN'>Distributor/ Dealer, =
Representatives, Industry innovators, Tech visionaries, Broadcasters, =
Educators, Manufacturers, Sales &amp; Marketing Corporate Leader, =
Technical Engineers, and more....</span><span =
style=3D'color:black;mso-fareast-language:EN-IN'><o:p></o:p></span></p><p=
 class=3DMsoNormal><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'color:#1F4E79'>Please pick the number =
which describes you:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'color:#1F4E79'>1. Yes Interested, send =
me pricing and other data information.<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'color:#1F4E79'>2. =
Opt-out<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span =
style=3D'color:#1F4E79'>Thanks,<o:p></o:p></span></b></p><p =
class=3DMsoNormal><span style=3D'color:#1F4E79'>Diana Christopher | =
Marketing Coordinator<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0184_01D8F5A5.5197C720--

