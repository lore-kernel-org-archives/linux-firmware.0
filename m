Return-Path: <SRS0=RbjI=3I=tradeshowvisitors.com=diana.christopher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD41C4332F
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Nov 2022 20:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D3BCC433B5; Tue,  8 Nov 2022 20:19:47 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E2D2C433D7
	for <linux-firmware@kernel.org>; Tue,  8 Nov 2022 20:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7E2D2C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tradeshowvisitors.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=tradeshowvisitors.com
Received: by mail-pg1-f175.google.com with SMTP id b62so14385348pgc.0
        for <linux-firmware@kernel.org>; Tue, 08 Nov 2022 12:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tradeshowvisitors-com.20210112.gappssmtp.com; s=20210112;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :in-reply-to:references:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAyHT/7eD7Pps5BnUI6dDNc8F9aV7IezWR0lhGr/a9U=;
        b=P21O3n64XbO8MPFYa1slQBQrGMGuEfwKE+kIZJ8qRFsK5bCwrFJtB6+tbWt0gsG51F
         8QV2Aec3r5DkKEwxGgk19jA5wLoC8j9FCXa1YPzfQj+oFqKVgQkAEmWRI0QTd5dMP93t
         JqCZyzS0vqzj3qP9KhFcmvarJErIfrpEx21ef1QNzYztar+DCfJu5Uw3LU+rYcn9zq2a
         soehfKOY63wqw7fnCjuigGfXtaMieOd06Vu10YK1rRBBO5Y4ubI2zHPr53CUCPj5EOHY
         4fOlfuQSGG9U0vO+9RJ1VFSBCjysCLCcp+ymM6n+2Rls6/be9LMo25PPpWt0W+vhX5Y9
         B8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :in-reply-to:references:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAyHT/7eD7Pps5BnUI6dDNc8F9aV7IezWR0lhGr/a9U=;
        b=66x/RmVkwLsVyqRvKTGF0N/aofNCVJyHKDWjOZdaNIuhkBFIuWuX7NROV1dmpXzCPm
         BkFMyeHo1pZ0NkUP5yNuIhg9QzrP3L2lx8pNeL0BxScB6oUDjuOxfH0i1xkensqT0IfQ
         lGp+203U4ba/LJ4RetWpSVh88/E3KG7571e9kc+enftQX7/GK6rVemzumbNj7zgbzE6c
         wY7S0p5BwVY4vBhpPfYeot9SEsic37aCkKG/8AMuGmVi6XvleS+a9ZO/nryG/FQfSrCo
         GfKAv6Qr1QA2rY7GAFDU9nh0drmrw2Cj5bgsVIjWH/UNel6KSd6MYvBC7Ucli8qjeaB8
         M1cg==
X-Gm-Message-State: ACrzQf2im23gOhwq1ehQnryEfj3JRY0UyBjAMyuuJhqsEW0zYuhjlMdX
	5r+jDt0FXXNHiyoVBxASCxa8GI4sbIXZpw==
X-Google-Smtp-Source: AMsMyM66sSNeNXibwHyYvpOQy389vy2IdTcezEuOBJ7oJsVL2/Us34jQbDZuQkEze8aN+Ydb1bfXqA==
X-Received: by 2002:a65:6c08:0:b0:448:c216:fe9 with SMTP id y8-20020a656c08000000b00448c2160fe9mr48158743pgu.243.1667938785748;
        Tue, 08 Nov 2022 12:19:45 -0800 (PST)
Received: from ZenBrightTech11 ([27.7.97.71])
        by smtp.gmail.com with ESMTPSA id f14-20020a63100e000000b0041ae78c3493sm6133661pgl.52.2022.11.08.12.19.44
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Nov 2022 12:19:44 -0800 (PST)
From: "Diana Christopher" <diana.christopher@tradeshowvisitors.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
References: 
In-Reply-To: 
Subject: RE: NAB Show 2022 Attendees Info
Date: Tue, 8 Nov 2022 15:18:56 -0500
Message-ID: <192701d8f3af$70ff5e40$52fe1ac0$@tradeshowvisitors.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_1928_01D8F385.882A8EC0"
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdjN5IfA+7IF+jt5QCqj68NzJvyJJgAqGC/QAAAAE1AAAAANQAAAAA7QAAAADXAAAAANkAAAAA0wAAAADlAAAAAMgAAAAAtQAAAADBAAAAAMEAAAAAsQAAAADNAAAAAL0AAAAAygAAAAC2AAAAAMIAAAAAsgAAAADSAAAAALEAAAAAwQAAAADqAAAAAQcAAAAA1gAAAADjAAAAAO8AAAAA6AAAAAD1AAAAAOEAAAAA7gAAAADqAAAAAMoAAAAAygAAAADMAAAAANwAAAAAzAAAAADPAAAAANEAAAAAxAAAAADEAAAAAMQAAAAA2gAAAADzAAAAAMwAAAABjAAAAAExAAAAATsAAAABVwAAAAFDAAAAAVYAAAABYgAAAAFIAAAAAVcAAAABRwAAAAFTAAAAATkAAAABQgAAAAFeAAAAAUoAAAABRwAAAAFWAAAAAVYAAAABWACUiTSzA=
Content-Language: en-in

This is a multipart message in MIME format.

------=_NextPart_000_1928_01D8F385.882A8EC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

Hi,

 

I'm sorry to trouble you. I would love to hear your thoughts with the
follow-up request.

 

Await your swift response

 

Regards,

Diana

 

From: Diana Christopher [mailto:diana.christopher@tradeshowvisitors.com] 
Sent: 22 September 2022 10:16
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

 


------=_NextPart_000_1928_01D8F385.882A8EC0
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
September 2022 10:16<br><b>To:</b> 'linux-firmware@kernel.org' =
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
------=_NextPart_000_1928_01D8F385.882A8EC0--

