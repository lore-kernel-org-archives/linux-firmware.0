Return-Path: <SRS0=io7e=ZZ=tradeshowvisitors.com=diana.christopher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6EFC6FA82
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Sep 2022 16:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D94B4C433D7; Thu, 22 Sep 2022 16:40:19 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08B8BC433D6
	for <linux-firmware@kernel.org>; Thu, 22 Sep 2022 16:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08B8BC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tradeshowvisitors.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=tradeshowvisitors.com
Received: by mail-lj1-f177.google.com with SMTP id l12so11661863ljg.9
        for <linux-firmware@kernel.org>; Thu, 22 Sep 2022 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tradeshowvisitors-com.20210112.gappssmtp.com; s=20210112;
        h=content-language:thread-index:importance:mime-version:message-id
         :date:subject:in-reply-to:references:to:from:from:to:cc:subject:date;
        bh=naajRW/PRh5iEYm/HDKsUzPMqDRBTF7TOeO4ACBGR28=;
        b=NFRjlJyiygo/qDBGcCt8R17QhQ+/jfonWxvN8FST8vFe34vvQazXCw2T3Wi4NAW1OD
         0hVF+bRC0bOxB05vW7kj4hPPRiM/CVtobT1T+E37WeFyq3P6zCxyyaMrcNdAAeOQgBnu
         jl6TglAb+MAX+9E2Brrk1zaW1ett/rRgzxVk/MwLU34wswEbEB33pUZuyN0ntm/yZQRj
         u2Ga1rHWqLp1Fu0SbCkfmil0fowrq1BPMZkgLuDqnjUnUYVTvT0/AH6JelSqkkKt0XbD
         DvGtZNDxGoDpKyVb/DF7vOgHW/MlAgX8IPTYbPPuw22JjAxAnp+YArnGJpyzLtMD2evu
         6o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:thread-index:importance:mime-version:message-id
         :date:subject:in-reply-to:references:to:from:x-gm-message-state:from
         :to:cc:subject:date;
        bh=naajRW/PRh5iEYm/HDKsUzPMqDRBTF7TOeO4ACBGR28=;
        b=H917FEPoyalhmFwU56Jkcajnx+iCjY6Tinfq2sHrdYx6TZw2o3Cu6li/Ya7/FxuC/y
         mipg9SPSi2yFamceiZCtrFmhxezIwUXRnx6r5k53/VvI6o2TTxapNR11LVGuZHPbap8n
         FzLDrebfMLASfXX63+iGxkqwcKJVm3nREyzaQ2Qa5LzQOpPu052XPtCPTnX1ZlrIyVoK
         ZZaC+dMRAKzooHXzX/jDTYGQ0raHo+v8zjKPrvAjVKTNkBXRS2Un2RFU38njnJj4NsPh
         W2otwtTj4VFWXn1qJr4m1tvlsWp8FFuYl22RStzljcI5huqLfDp+Oh+xVqx+oN6Ts/DK
         136g==
X-Gm-Message-State: ACrzQf0vEql5s8h25E3Laz7zmA/zKCBfYBL818L1NqA5l+K6XC86mRqG
	VRIu+4P19Vd0dHa7/F8VdHxe3Q/qjYi/wg==
X-Google-Smtp-Source: AMsMyM66gzoKu1utBQHu7uKd+NhM6jQfzLkkxEdaCBeDYjSgURyZ66nhvYLxMtEk/RADaPWQ7ow3tQ==
X-Received: by 2002:a05:651c:383:b0:26c:4e23:a4bb with SMTP id e3-20020a05651c038300b0026c4e23a4bbmr1430473ljp.530.1663864816597;
        Thu, 22 Sep 2022 09:40:16 -0700 (PDT)
Received: from UserPC ([49.207.204.37])
        by smtp.gmail.com with ESMTPSA id d2-20020a056512368200b00494a603953dsm1013334lfs.89.2022.09.22.09.40.14
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Sep 2022 09:40:15 -0700 (PDT)
From: "Diana Christopher" <diana.christopher@tradeshowvisitors.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
References: 
In-Reply-To: 
Subject: NAB Show 2022 Attendees Info
Date: Thu, 22 Sep 2022 11:40:16 -0500
Message-ID: <15a601d8cea1$ff0eb4c0$fd2c1e40$@tradeshowvisitors.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_15A7_01D8CE78.16399720"
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 15.0
Importance: High
Thread-Index: AdjN5IfA+7IF+jt5QCqj68NzJvyJJgAvEcXAAAAAE3AAAAAMcAAAAAswAAAACwAAAAAMwAAAAAuQAAAAC4A=
Content-Language: en-in

This is a multipart message in MIME format.

------=_NextPart_000_15A7_01D8CE78.16399720
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

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

 


------=_NextPart_000_15A7_01D8CE78.16399720
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
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Would you be interested in acquiring the =
pre-registered attendee mailing list from </span><b><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%;mso-fareast-language:EN-IN'>National =
Association of Broadcasters Show 2022?</span></b><span =
style=3D'color:black;mso-fareast-language:EN-IN'><o:p></o:p></span></p><p=
 class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Attendees:</span></b><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'> </span><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%;mso-fareast-language:EN-IN'>Distributor/ =
Dealer, Representatives, Industry innovators, Tech visionaries, =
Broadcasters, Educators, Manufacturers, Sales &amp; Marketing Corporate =
Leader, Technical Engineers, and more....</span><span =
style=3D'color:black;mso-fareast-language:EN-IN'><o:p></o:p></span></p><p=
 class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Please pick the number which describes =
you:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>1. Yes Interested, send me pricing and other =
data information.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>2. Opt-out<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Thanks,<o:p></o:p></span></b></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Diana Christopher | Marketing =
Coordinator<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_15A7_01D8CE78.16399720--

