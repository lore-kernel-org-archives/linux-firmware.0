Return-Path: <SRS0=20D9=TC=gmail.com=yourdomainbroker.anne1075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1013E7717D
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Dec 2024 12:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA708C4CEDD; Mon,  9 Dec 2024 12:44:36 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA735C4CED1
	for <linux-firmware@kernel.org>; Mon,  9 Dec 2024 12:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA735C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so5116340e87.1
        for <linux-firmware@kernel.org>; Mon, 09 Dec 2024 04:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733748272; x=1734353072; darn=kernel.org;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9G6vsUBQRGgSvHzrhl1snpjGv5NdelPa9e50uqSqCU=;
        b=OlBJjQZmTvVnDm0toKQgv1oEniigXCIxiw0quPT98sD1YXznEaOYjZ4ndqNPdJuwDo
         1SHMfVNYEeN7RMUvtD8AbRBc0VF4B1TPTmEU+yFSDZTZ7V+Se8IXS2JUxYH0WiyS0d3T
         ajZdsiAbnnfQ4Gb29cOx7l2jjH6MLYbEagw+y3akBX35UyZqsYANu1L3FVpKPr2vrkAI
         5R2gAQEv39crOEUXKCfog7eNR92J2XVvahDnPts2FF/+/eLkizTtOyyy2RxWMO9ltqjp
         ctGXH5aMNLlaymVv7UldgbuHGlKdKhR7FzD+AJrLG1fFrRjUNaNvzbSwbpZf/AAqTyMr
         3PtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733748272; x=1734353072;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9G6vsUBQRGgSvHzrhl1snpjGv5NdelPa9e50uqSqCU=;
        b=lj1QUMPmVH/5tK3r9k0Vo7MWnbTVmjGLR03ZGOJuJSwYPahouWPjWEzL//W3SEIons
         t2iSNGL44sp6Xy0DJx6pamjLUkbGoTDPu2ZOkIFYWuPEYhb/8GmhPv94gH0iYGHTuHOe
         uzdEEw3DutztNGTVIB6kzQsJ8FVcx/cp9d+Ynvy4S0jjmmEEXMelcLQ+PqwEwJZHpnoP
         DMDHL444f43uYWU/djFP/N/Zavpkl9f0v3/Vqq/wnqKN3/wXxiD7zi4t9bGBMzBXq94a
         1ZUgMCXElQNmO7Wk6UpoiqAm53/IDEM8UMB2kaBavt8Xw+atco5ap1bLe28NpTwiuR7X
         7RLg==
X-Gm-Message-State: AOJu0YzrZ+BZ4dikY4HJmNmqTlwJmKrBYC0/zIRktd+NUsBoamKbn42x
	dQuRVDAry8dWAwkX91SlVsv70Q0QKEYCOYdrcO5DfxDII6Bd9RdMWVjdcncFVKbbsfYHb7y+Xm7
	v0O3Y2TmCSEj+cQOa2UptcbtPKbvi/A==
X-Gm-Gg: ASbGncse/moi2v+o1zruCtcjOnV0IjVMieBRjFbljrflmusCLYeRIFoFRMOGW3Fpw+H
	UELDVAkaWPhETngKn7jpL3Z1Hc2KBBbJxeXzRiImOvkGnfNIHuFr+RFiRUTkNdvCHBQ==
X-Google-Smtp-Source: AGHT+IGmRiQ9djuTC/WpRFkBULGh9FeU4zI02xllbAfIgerqVUGdAf9hxXObxce1cCcr1dJGQrDgZwJIrt56Z0Fgd3o=
X-Received: by 2002:a05:6512:e84:b0:53f:232e:31db with SMTP id
 2adb3069b0e04-53f232e3726mr2592725e87.16.1733748272324; Mon, 09 Dec 2024
 04:44:32 -0800 (PST)
Received: from 52669349336 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Dec 2024 04:44:31 -0800
Received: from 52669349336 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Dec 2024 04:44:31 -0800
MIME-Version: 1.0
Sender: Anne Kim Manahan <yourdomainbroker.anne1075@gmail.com>
From: Anne Kim Manahan <yourdomainbroker.anne1075@gmail.com>
Date: Mon, 9 Dec 2024 04:44:31 -0800
X-Google-Sender-Auth: i6klU47RCzQjuR-1j2kCpwjMv08
Message-ID: <CAB9YgJJaE2MSnMtArP8OfuHUXA51TVwsZgX06i_r9XjV6=+dGg@mail.gmail.com>
Subject: Arch-Linux .com
List-Id: <linux-firmware.lore.kernel.org>
To: Linux-Firmware <linux-firmware@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000e6ea030628d5b946"

--000000000000e6ea030628d5b946
Content-Type: text/plain; charset="UTF-8"

Great news! The domain *Arch-Linux .com* is now available



The Internet is the most efficient way to acquire new customers.


Anytime someone types Arch-Linux, Arch Linux Online, The Best Arch Linux,
or any other phrase with these keywords into their browser, your site could
be the first they see!


Avg Google Search Results for this domain is: 51,800,000

You can easily redirect all the traffic this domain gets to your current
site!


Estibot .com appraises this domain at $1,900


*Priced at only $398 for a limited time! To claim it, go to **Arch-Linux
.com** and select Buy Now or purchase directly at GoDaddy.*


Since we're contacting multiple interested parties about this domain, quick
action is recommended if you're interested.



Thank you for your time.
Anne Kim
[image: beacon]

--000000000000e6ea030628d5b946
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"background-color:transparent;font-size:11pt;font-fami=
ly:Arial,sans-serif;vertical-align:baseline">Great news! The domain=C2=A0</=
span><b style=3D"font-size:15px"><font face=3D"arial black, sans-serif" col=
or=3D"#0000ff">Arch-Linux .com</font></b><span style=3D"background-color:tr=
ansparent;font-size:11pt;font-family:Arial,sans-serif;vertical-align:baseli=
ne">=C2=A0is now available=C2=A0</span></div><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial,sans-serif;background-color:transparent;vertical-align:ba=
seline">=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;background-color:transparent;vertical-align:baseline">The Internet=
 is the most efficient way to acquire new customers.</span></p><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><br></p><div=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:t=
ransparent;vertical-align:baseline">Anytime someone types=C2=A0</span><span=
 style=3D"font-size:11pt;font-family:Verdana,sans-serif;background-color:tr=
ansparent;vertical-align:baseline">A</span><span style=3D"font-size:11pt;ba=
ckground-color:transparent;vertical-align:baseline"><font face=3D"Arial, sa=
ns-serif" style=3D"background-color:inherit">rch-Linux, Arch Linux Online, =
The Best Arch Linux</font></span><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;vertical-align:baseline">, or=
 any other phrase with these keywords into their browser, your site could b=
e the first they see!</span></div><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><br></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;background-color:transparent;vertical-align:basel=
ine">Avg Google Search Results for this domain is:=C2=A0</span><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-weight:700;vertical-align:baseline">51,800,000</span></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;vertical-align:baseline">You can easily redirect all the traffic this dom=
ain gets to your current site!</span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><br></p><div style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;background-color:transparent;font-weight:700;vertica=
l-align:baseline">Estibot .com</span><span style=3D"font-size:11pt;font-fam=
ily:Arial,sans-serif;background-color:transparent;vertical-align:baseline">=
=C2=A0appraises this domain at $1,900</span></div><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><br></p><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"color=
:rgb(29,28,29);font-family:Slack-Lato,Slack-Fractions,appleLogo,sans-serif;=
font-size:15px"><span style=3D"background-color:rgb(207,226,243)">Priced at=
 only $398 for a limited time!</span>=C2=A0To claim it, go to=C2=A0</b><b s=
tyle=3D"font-size:15px"><font color=3D"#0000ff" face=3D"arial black, sans-s=
erif">Arch-Linux .com</font></b><b style=3D"color:rgb(29,28,29);font-family=
:Slack-Lato,Slack-Fractions,appleLogo,sans-serif;font-size:15px">=C2=A0and =
select Buy Now or purchase directly at GoDaddy.</b><br></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"colo=
r:rgb(29,28,29);font-family:Slack-Lato,Slack-Fractions,appleLogo,sans-serif=
;font-size:15px"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l,sans-serif;background-color:transparent;vertical-align:baseline">Since we=
&#39;re contacting=C2=A0</span><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;background-color:transparent;font-weight:700;vertical-align:=
baseline">multiple interested parties</span><span style=3D"font-size:11pt;f=
ont-family:Arial,sans-serif;background-color:transparent;vertical-align:bas=
eline">=C2=A0about this domain, quick action is recommended if you&#39;re i=
nterested.</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;background-color:transparent;vertical-align:baseline">=C2=A0</span></p=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-colo=
r:transparent;vertical-align:baseline">Thank you for your time.</span></p><=
div style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><font color=
=3D"#000000" face=3D"Arial, sans-serif"><span style=3D"font-size:14.6667px"=
>Anne Kim</span></font></div></div>
<img src=3D"https://yourdomainbroker-anne1075-dot-yamm-track.appspot.com/2-=
156eCI3uUImX2d35fnINyQY5ve42-FhVoGrsfjrLMxvKHOrkwEqG4WU2wlzAJqby61gH4bX0xo2=
arxtPhluKWnTUlK_kDc-dKPu5W2rYbPyvto3JNArQxcHKI2FMU3IH1U1_B9684dL_PQgVzKhMt3=
eKyburECxU8sGD-CSnYA" width=3D"1" height=3D"1" alt=3D"beacon" style=3D"disp=
lay:none; display:none!important;">

--000000000000e6ea030628d5b946--
