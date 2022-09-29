Return-Path: <SRS0=MwDS=2A=eventattendee.com=christina.lanier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84958C433FE
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Sep 2022 17:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46186C433D7; Thu, 29 Sep 2022 17:15:24 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFB2FC433C1
	for <linux-firmware@kernel.org>; Thu, 29 Sep 2022 17:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EFB2FC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=eventattendee.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=eventattendee.com
Received: by mail-pj1-f66.google.com with SMTP id d1-20020a17090a6a4100b002095b319b9aso671022pjm.0
        for <linux-firmware@kernel.org>; Thu, 29 Sep 2022 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eventattendee-com.20210112.gappssmtp.com; s=20210112;
        h=content-language:thread-index:importance:mime-version:message-id
         :date:subject:in-reply-to:references:to:from:from:to:cc:subject:date;
        bh=mG9J3cs78rXspXPkokS6RwDDhdtmJ3+aHrkKyPXxqI4=;
        b=0i8uaBlKqNdvSwdpsPuvtarMbXY5BqD8Yj98Uj8M3+erq1SWvngn/PqfTgPNC+GVYB
         MqqWsXTGZq0D4bib1p5rYQcbif4us97uNIeLuiBNW/E596t9P07SjhGkq7zZmMheGzn1
         EyqINdi6DUDOvxwku89ePhl8XmqqlVr6bHUY224MWxywZNzFooENJZKb5xR7D75jm9sf
         wl0zsDrHL0dy6KXOsmVI94/VTwexgGI3onNiqgxrwb6k9lkpU3ObRNMY6bM71utzASI6
         dXhp7nOCDjp6VzEOP3jnLHPcWlz4PSY7/fypHmCTCPlPzn/6EGoIM30aCyhU5oOI4I6A
         duKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:thread-index:importance:mime-version:message-id
         :date:subject:in-reply-to:references:to:from:x-gm-message-state:from
         :to:cc:subject:date;
        bh=mG9J3cs78rXspXPkokS6RwDDhdtmJ3+aHrkKyPXxqI4=;
        b=ykIUqWyQw6R4hFfWnkObJlZ9SvjpBDPvqE8V19US031MdgXm2E5Wx3LWv4s9mH33aZ
         xmQoDrMgA8BuVDW+JdaZVNeenV7bkPUv36gKkZT181yj04BjPLMCxpKbar1IVhPtc/vh
         JJcdmhsC7ucvkNlOn4371JvwSspsPCHxzm2ehCrfISLk7rMCyetuVh5wwfIv31zeUt7M
         sOoJNsyAPnSgdUCTr1S2QV2JSUDrKg1DEsPcTnYdoQTpqK98g54vryNM6SgVTjjQsA/Q
         pePSUoe1beyGxXEKvWYzzdQS8w/NvULxPTAEZiaKq3ip4tT/kEZg+qhtOYLyUpRRTRr5
         RDbQ==
X-Gm-Message-State: ACrzQf3d4sG3XfDucFK7pUVsvrl6onMLRlKh0d0I8o77p3dda8C3Y6h5
	vYGheLqKGDz3rUs0LyqQKm0KiKUrwrLyMg==
X-Google-Smtp-Source: AMsMyM7CJBX/R92bH54U29p3aGGZ8bF7w9wekygWGsc1qNjeUAi0NCM8Lk3/uwQQhtVfk3Qgs7sAiQ==
X-Received: by 2002:a17:90b:4c10:b0:203:bef9:987b with SMTP id na16-20020a17090b4c1000b00203bef9987bmr4823712pjb.9.1664471722117;
        Thu, 29 Sep 2022 10:15:22 -0700 (PDT)
Received: from GMAADMINPC ([49.207.193.201])
        by smtp.gmail.com with ESMTPSA id h7-20020a628307000000b00553d5920a29sm6354836pfe.101.2022.09.29.10.15.20
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Sep 2022 10:15:21 -0700 (PDT)
From: "Christina Lanier" <christina.lanier@eventattendee.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
References: 
In-Reply-To: 
Subject: NAB Attendees Database
Date: Thu, 29 Sep 2022 13:15:06 -0400
Message-ID: <094b01d8d427$0fb20e50$2f162af0$@eventattendee.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_094C_01D8D405.88A17FC0"
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 15.0
Importance: High
Thread-Index: AdjUIyQRPU/fFnG6S4GpjAyHK3DJ1wAAL6MQAADCWUAAAAAU4AAAAAOgAAAAB9AAAAAIcAAAAAjQAAAACGAAAAAIMAAAAAgAAAAACMAAAAAJkAAAAAmQAAAACYAAAAAIgAAAAAlQAAAACEAAAAAJ4AAAAAnQAAAACdAAAAAJ0AAAAAnQAAAACgAAAAAKkAAAAArwAAAAC1AAAAAJsAAAAAsQAAAAC+AAAAALcAAAAAsQAAAAC9AAAAALYAAAAAsw
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_094C_01D8D405.88A17FC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

Would you be Interested in acquiring attendees database of National
Association of Broadcasters Show New York & Expo 2022?

 

Attendees: Distributor/ Dealer, Representatives, Industry innovators, Tech
visionaries, Broadcasters, Educators, Manufacturers, Sales & Marketing
Corporate Leader, Technical Engineers, and more....

                

Could you please let me know your thoughts? In turn, I'll get back with
precise counts and pricing details for your consideration.

 

Looking forward for your response.

 

Best Regards,

Christina Lanier

Marketing Executive

 

If you do not wish to hear from us again, please respond back with "Cancel"
and we will honour your request.

 

 


------=_NextPart_000_094C_01D8D405.88A17FC0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.xxmsonormal, li.xxmsonormal, div.xxmsonormal
	{mso-style-name:x_xmsonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'>Hi,</span><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'>Would you be Interested in acquiring attendees =
database of<b> </b></span><b><span style=3D'color:black'>National =
Association of Broadcasters Show New York &amp; Expo =
2022?<o:p></o:p></span></b></p><p class=3DMsoNormal><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%;mso-fareast-language:EN-IN'><o:p>&nbsp;</o:p></s=
pan></p><p class=3DMsoNormal><b><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%;mso-fareast-language:EN-IN'>Attendees:</span></b=
> Distributor/ Dealer, Representatives, Industry innovators, Tech =
visionaries, Broadcasters, Educators, Manufacturers, Sales &amp; =
Marketing Corporate Leader, Technical Engineers, and more....<b><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%;mso-fareast-language:EN-IN'><o:p></o:p></span></=
b></p><p class=3DMsoNormal><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%;mso-fareast-language:EN-IN'>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<b><o:p></o:p></b></span></p><p class=3DMsoNormal><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'>Could you please let me know your thoughts? In =
turn, I'll get back with precise counts and pricing details for your =
consideration.</span><b><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%;mso-fareast-language:EN-IN'><o:p></o:p></span></=
b></p><p class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'>Looking forward for your =
response.<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><b><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'>Best Regards,<o:p></o:p></span></b></p><p =
class=3DMsoNormal style=3D'text-autospace:none'>Christina =
Lanier<o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><b><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'>Marketing =
Executive<o:p></o:p></span></b></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#262626;mso-style-textfill-fill-color:#262626;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt;color:gray'>If you do =
not wish to hear from us again, please respond back with =
&#8220;<b>Cancel</b>&#8221;<b> </b>and we will honour your =
request.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:gray'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></p></div></body></htm=
l>
------=_NextPart_000_094C_01D8D405.88A17FC0--

