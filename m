Return-Path: <SRS0=kOLw=Z7=gmail.com=vanshikaubitech18@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD61C83F1A
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Jul 2025 11:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93A41C4CEF5; Fri, 18 Jul 2025 11:43:51 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8BB7C4CEF4
	for <linux-firmware@kernel.org>; Fri, 18 Jul 2025 11:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8BB7C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1153626f8f.0
        for <linux-firmware@kernel.org>; Fri, 18 Jul 2025 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752839029; x=1753443829; darn=kernel.org;
        h=to:subject:message-id:date:reply-to:from:sender:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qM6VV7HO7+TrTec797vXHOxY3ew6h2b05KKphvbT/YY=;
        b=TgjOgeASX+EAv3QrhSYkmBhiBpf4XuZ9455DJ579bjmNtSJ+LMulAVZJcPwmxj14lJ
         z0WcNSOvuI/aVh2n0Hszn+J+SqvDAyRVOzGQ/XbgBrwZxQbSLsYRmbYLVUaP0cvBxDi0
         lJ1pZNamnQeUaAva0soIfyO1lK71jP90x30z9obuGooCvKW98AOi1FkVlRA2092e5kUU
         XvBlsbsigo/yj00gmuDDvhyqSste8viGfHLFD4j1kPdIiKpLz9JG8/wfig1rnN+Ce7yC
         2oAmvHfye4I2GP0IlFV4scpuQoxZwx7ZFSCOmnex+eFY8TKK1Vdi+XQ31JmlYUYPXu9m
         7vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752839029; x=1753443829;
        h=to:subject:message-id:date:reply-to:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qM6VV7HO7+TrTec797vXHOxY3ew6h2b05KKphvbT/YY=;
        b=IyUZZlUqUMEIV55Ny8Uzh8ZPOvwDmhq9XYgRxmtqw7cCHNZMbMI+MRNydUJs1Is+Fw
         pFGjdgHy6Yn/+S+j6fhK+hK1QrOaQgAcYTlD0AL7m4RSDFs1FdG9mIypTYw1zNIkryyQ
         zCkRYDv5PXCoWemB7b2jgGzDPW0CTEw9KcxdBt3b8TD7oBCZB8svCNAzx0pFuhKa8eGK
         1aPrJRO4oYeA2s+z14ugEHbe0Hy45vwha19JDb84YB1S1BGjV6yU4dcRIkl0qzN0ajmz
         MZiehuwyvS1glaVCjUjbQDzyVxd77hZpmjXJ34BC0eDsmW7hFouTCkSQft0IiRMEsasD
         dkAA==
X-Gm-Message-State: AOJu0YyTctWDpb/IEQK25AOJxcMWK3EfiuoIVZPdoCk72QBjx7tvut3L
	JB840IXXYD4o5do5DdKxv4XqieSItLwe6z2vrtZKClRpKpeSqZmMgfLvtSDYWen9ilxgrndoKcJ
	Ne5hnAQHkHs0gZ8fCZ9Fnnhj7mu0pDg+sPyj+
X-Gm-Gg: ASbGnct5ppS3tUrCuu7x3AfFKjRA6xr2J5xydkTo98XqbymJIvI3uqdzSZDpNmNPXQ0
	Yl4ruO/m1XGcEeUzRuVpGlfAbfvCidLX7sULEMxECHckPhUDr5ZvG6WCJZZAZblUyXw7OkXe7/b
	nL6kEfuZSwHbsrAeNtH/tlS7u3o21rJi0PD/C8jjR1mLhZeIweQR+ZD5ETNnrSPhZGY0vOfhhQK
	W7x8D5MBz5Fuiv3O/A=
X-Google-Smtp-Source: AGHT+IFrNaiPBcIuh6gKcvLCA8ZG1euUfL13XSk5KareKawc7CfipzbUzwHgWARJSEZm4YeoxVg/RLEUvZb9dADRj/s=
X-Received: by 2002:a05:6000:2c08:b0:3b4:9b82:d44c with SMTP id
 ffacd0b85a97d-3b61b0f498amr1952340f8f.22.1752839028541; Fri, 18 Jul 2025
 04:43:48 -0700 (PDT)
Received: from 52669349336 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 18 Jul 2025 04:43:48 -0700
Received: from 52669349336 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 18 Jul 2025 04:43:47 -0700
MIME-Version: 1.0
Sender: ubiAttendence Team <vanshikaubitech18@gmail.com>
From: ubiAttendence Team <vanshikaubitech18@gmail.com>
Reply-To: business@ubitechsolutions.com
Date: Fri, 18 Jul 2025 04:43:48 -0700
X-Google-Sender-Auth: Ga11502Fs5amyZRl1Ew7SDbbS6k
X-Gm-Features: Ac12FXypbp1w2kOg4AW_-tTJOABP8-UJmsMwKrHNCA0-Y-vL3Zp35k91MVnHVhM
Message-ID: <CAOk=dpxkT=Bx492DUJLY7T2A7nn-hYcSqWW7sqYgwxZ19XOsAw@mail.gmail.com>
Subject: Seamless Attendance Management with ubiAttendance
List-Id: <linux-firmware.lore.kernel.org>
To: Linux-Firmware <linux-firmware@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000a50f14063a32a362"

--000000000000a50f14063a32a362
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Track Attendance, Time & location of Employees - 24*7Greeting from
ubiAttendance team,

ubiAttendance App offers the surest way to track employees' attendance
wherever, and whenever you want. Clients in over 101+ countries love our
Time Clock App already! In the meantime, please click here
<https://vanshikaubitech18-dot-yamm-track.appspot.com/2y9TEVAWm5CniQ8l__XtX=
UbqJUMAYR3xVSEBVZjXAA4Id_FgdmAGU3tQ6KbRLr7bRMme9Bg6Zug-XB2eDBu1-Nsjeh0rQ4_9=
GV5dbsB-bqFNjyJU7xdeQPBjeawPCDJIomxvWfNE2yCc0jpjbA3pBrbQfFYsSRsVzBnLB5KIDSx=
EbSUkB7MnKYeTlwM9mMp45NWsK-Tbdjd0tRxHnFSJC>
to
learn more about all the features of the ubiAttendance App.
Say No to Buddy Punching. SCHEDULE FREE DEMO
<business@ubitechsolutions.com?&&++subject=3DSCHEDULE%20MY%20DEMO&body=3D%0=
D%0A%0AYes,%20I%20am%20interested%20in%20Scheduling%20the%20Demo%20of%20the=
%20ubiAttendance%20App.%0A%0ADate:.........%0ATime(IST):........%20%0A%0A>
at
a time convenient to you with our product experts.
Team ubiAttendance
Web: www.ubitechsolutions.com/attendance-software
<https://vanshikaubitech18-dot-yamm-track.appspot.com/2rsHMIazNXo8BStVBU32s=
c4jJ5XuEjehT23iO3rbeR-Qi_FgdmAE6lQWk0SMFGFCilWh5PiMjpum0ANKZ1U2S36GtXhok8Vo=
91X1LYfPNAG9zI9Ea1jAX4l2ssxyej7-2FO5MBjAt-So0wkzJR2w0hSM4KUoagvKtf1Swyug07E=
b_DXr-T0JsebfcgX-DtUzyoA>
Toll Free(India):  1800 890 6670
Phone: +971 55-5524131
Email: business@ubitechsolutions.comUbitech Solutions ranked among "Top 10
HRMS Solution Providers"

If you no longer wish to receive mail from us, you can Click here to
unsubscribe
<https://vanshikaubitech18-dot-yamm-track.appspot.com/2yC2i3Tsbsb5eOxGSycet=
c9yQeAfDTB8Xs7StFdEESNMm_FgdmAGr_comSbv3f87PUG14Bb35QvVjUIQiISRddl12iwxdK6l=
KWisuYDhc6oCUQimUg_Vwlb42mtNks4sphgnbOFtOAus7f2hk-4QXTxl7S79jXKSfpH4QNHbbQG=
Z4wxliofUjU_hErE8P>
[image: beacon]

--000000000000a50f14063a32a362
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><h1 dir=3D"ltr" style=3D"line-height:1.44;text-align:cente=
r;margin-top:12pt;margin-bottom:0pt;padding:0pt 0pt 5.75pt"><span style=3D"=
font-size:14pt;font-family:&quot;Times New Roman&quot;,serif;color:rgb(26,1=
42,129);background-color:transparent;font-weight:400;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">Track Attendance, Time &amp; location of Employees - 24*7=
</span></h1><h2 dir=3D"ltr" style=3D"line-height:1.44;text-align:justify;ma=
rgin-top:0pt;margin-bottom:0pt;padding:8.25pt 0pt 0pt"><span style=3D"font-=
size:12pt;font-family:&quot;Times New Roman&quot;,serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-weight:400;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">Greeting from ubiAttendance team,<br><br></span></h2><h2 dir=3D"ltr=
" style=3D"line-height:1.44;text-align:justify;margin-top:0pt;margin-bottom=
:0pt;padding:0pt 0pt 14pt"><span style=3D"font-size:12pt;font-family:&quot;=
Times New Roman&quot;,serif;color:rgb(0,0,0);background-color:transparent;f=
ont-weight:400;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">ubiAttendance App of=
fers the surest way to track employees&#39; attendance wherever, and whenev=
er you want. Clients in over 101+ countries love our Time Clock App already=
!=C2=A0</span></h2><h2 dir=3D"ltr" style=3D"line-height:1.44;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:12pt;font-family:&quot;Times N=
ew Roman&quot;,serif;color:rgb(0,0,0);background-color:transparent;font-wei=
ght:400;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">In the meantime, please=C2=
=A0</span><a href=3D"https://vanshikaubitech18-dot-yamm-track.appspot.com/2=
y9TEVAWm5CniQ8l__XtXUbqJUMAYR3xVSEBVZjXAA4Id_FgdmAGU3tQ6KbRLr7bRMme9Bg6Zug-=
XB2eDBu1-Nsjeh0rQ4_9GV5dbsB-bqFNjyJU7xdeQPBjeawPCDJIomxvWfNE2yCc0jpjbA3pBrb=
QfFYsSRsVzBnLB5KIDSxEbSUkB7MnKYeTlwM9mMp45NWsK-Tbdjd0tRxHnFSJC" rel=3D"nofo=
llow" target=3D"_blank" style=3D"text-decoration-line:none"><span style=3D"=
font-size:12pt;font-family:&quot;Times New Roman&quot;,serif;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">click here</span></a><span style=3D"font-size:12pt;font-family=
:&quot;Times New Roman&quot;,serif;color:rgb(0,0,0);background-color:transp=
arent;font-weight:400;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline">=C2=A0to lear=
n more about all the features of the ubiAttendance App.</span></h2><br><h2 =
dir=3D"ltr" style=3D"line-height:1.44;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:12pt;font-family:&quot;Times New Roman&quot;,serif;co=
lor:rgb(0,0,0);background-color:transparent;font-weight:400;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">Say No to Buddy Punching.=C2=A0</span><a href=3D"m=
ailto:business@ubitechsolutions.com?&amp;&amp;++subject=3DSCHEDULE%20MY%20D=
EMO&amp;body=3D%0D%0A%0AYes,%20I%20am%20interested%20in%20Scheduling%20the%=
20Demo%20of%20the%20ubiAttendance%20App.%0A%0ADate:.........%0ATime(IST):..=
......%20%0A%0A" target=3D"_blank" style=3D"text-decoration-line:none"><spa=
n style=3D"font-size:11pt;font-family:&quot;Times New Roman&quot;,serif;bac=
kground-color:transparent;font-weight:400;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;text-decoration-li=
ne:underline;vertical-align:baseline">SCHEDULE FREE DEMO</span></a><span st=
yle=3D"font-size:12pt;font-family:&quot;Times New Roman&quot;,serif;color:r=
gb(0,0,0);background-color:transparent;font-weight:400;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">=C2=A0at a time convenient to you with our product expe=
rts.</span></h2><h2 dir=3D"ltr" style=3D"line-height:1.44;text-align:justif=
y;margin-top:0pt;margin-bottom:0pt;padding:0pt 0pt 14pt"><span style=3D"bac=
kground-color:transparent;color:rgb(0,0,0);font-family:&quot;Times New Roma=
n&quot;,serif;font-size:12pt;font-weight:400"><br>Team ubiAttendance<br></s=
pan><span style=3D"background-color:transparent;font-size:12pt;font-family:=
&quot;Times New Roman&quot;,serif;color:rgb(0,0,0);font-weight:400;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline">Web:=C2=A0</span><a href=3D"https://vanshik=
aubitech18-dot-yamm-track.appspot.com/2rsHMIazNXo8BStVBU32sc4jJ5XuEjehT23iO=
3rbeR-Qi_FgdmAE6lQWk0SMFGFCilWh5PiMjpum0ANKZ1U2S36GtXhok8Vo91X1LYfPNAG9zI9E=
a1jAX4l2ssxyej7-2FO5MBjAt-So0wkzJR2w0hSM4KUoagvKtf1Swyug07Eb_DXr-T0JsebfcgX=
-DtUzyoA" rel=3D"nofollow" target=3D"_blank" style=3D"font-size:small;font-=
weight:normal;text-decoration-line:none"><span style=3D"font-size:12pt;font=
-family:&quot;Times New Roman&quot;,serif;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;text-decoration-line:underline;vertical-align:baseline">www.ubit=
echsolutions.com/attendance-software</span></a><u><br></u><span style=3D"ba=
ckground-color:transparent;color:rgb(0,0,0);font-family:&quot;Times New Rom=
an&quot;,serif;font-size:12pt;font-weight:400">Toll Free(India):=C2=A0 1800=
 890 6670<br></span><span style=3D"background-color:transparent;color:rgb(0=
,0,0);font-family:&quot;Times New Roman&quot;,serif;font-size:12pt;font-wei=
ght:400">Phone: +971 55-5524131<br></span><span style=3D"background-color:t=
ransparent;font-size:12pt;font-family:&quot;Times New Roman&quot;,serif;col=
or:rgb(0,0,0);font-weight:400;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Email=
:=C2=A0</span><a href=3D"mailto:business@ubitechsolutions.com" target=3D"_b=
lank" style=3D"font-size:small;font-weight:normal;text-decoration-line:none=
"><span style=3D"font-size:12pt;font-family:&quot;Times New Roman&quot;,ser=
if;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;text-decoration-line:underli=
ne;vertical-align:baseline">business@ubitechsolutions.com</span></a></h2><h=
2 dir=3D"ltr" style=3D"line-height:1.44;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-family:Arial,sans-serif;background-color:transparent;fon=
t-style:italic;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline"><font size=3D"2" sty=
le=3D"color:rgb(227,108,10)">Ubitech Solutions ranked among &quot;Top 10 HR=
MS Solution Providers&quot;</font></span></h2><div><span style=3D"font-fami=
ly:Arial,sans-serif;background-color:transparent;font-style:italic;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;vertical-align:baseline"><font size=3D"2" style=3D"color:rgb(227,108=
,10)"><br></font></span></div><div><span style=3D"font-family:Arial,sans-se=
rif;background-color:transparent;font-style:italic;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline"><span style=3D"font-family:Arial,Helvetica,sans-serif;font-=
style:normal;font-size:x-small">If you no longer wish to receive mail from =
us, you can=C2=A0</span><font color=3D"#0000ff" style=3D"font-family:Arial,=
Helvetica,sans-serif;font-style:normal;font-size:x-small"><a href=3D"https:=
//vanshikaubitech18-dot-yamm-track.appspot.com/2yC2i3Tsbsb5eOxGSycetc9yQeAf=
DTB8Xs7StFdEESNMm_FgdmAGr_comSbv3f87PUG14Bb35QvVjUIQiISRddl12iwxdK6lKWisuYD=
hc6oCUQimUg_Vwlb42mtNks4sphgnbOFtOAus7f2hk-4QXTxl7S79jXKSfpH4QNHbbQGZ4wxlio=
fUjU_hErE8P" rel=3D"nofollow" target=3D"_blank">Click here to unsubscribe</=
a></font></span></div></div>
<img src=3D"https://vanshikaubitech18-dot-yamm-track.appspot.com/2B0pVT6bbm=
9pATKGqPeuY6QOvqnmAFJepYhYTsiALsHMY_FgdmAGwiyf18AC6aqTDLivipqEdHIIMPAb8MoVq=
rplq2I7Ya4d0hIuQMI3zducYMU2Uxk5xALTFCYMKfqyOb1Xed63LLuSuyhz20_YV026Azca2mx9=
z" width=3D"1" height=3D"1" alt=3D"beacon" style=3D"display:none; display:n=
one!important;">

--000000000000a50f14063a32a362--
