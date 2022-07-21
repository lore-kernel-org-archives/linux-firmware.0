Return-Path: <SRS0=K0UU=X2=digigram.com=boissy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CBAC43334
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Jul 2022 08:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B928C3411E; Thu, 21 Jul 2022 08:23:36 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7866C341C6
	for <linux-firmware@kernel.org>; Thu, 21 Jul 2022 08:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7866C341C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=digigram.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=digigram.com
Received: by mail-lj1-f171.google.com with SMTP id p6so932220ljc.8
        for <linux-firmware@kernel.org>; Thu, 21 Jul 2022 01:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=digigram.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=P/fo7pGPRdvxu/Ue2o8FjCQL3yHbO9JvmsjOjOjYqWs=;
        b=DKZkk0Bne2z4g/TOPtywvjaq8qmEi75+VGJPQFnVauexHYpnbcjib5d65N7zRhqEkx
         nJ31isPuFLM/f2tWBgMwR95vrcaicNQXQ6t4rewAzLWKcnX7cy1s2pf9ZH8ic3qKmTcX
         EIqg66ZFJ9FDqTAX2tUwGPImzWjirt5WJCK6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=P/fo7pGPRdvxu/Ue2o8FjCQL3yHbO9JvmsjOjOjYqWs=;
        b=cX5bHid46s/I+FP0DZF3xsspDxwaA9ekfPUc65l/OfZ8Sk+zy92r50BoAak8qandSu
         qf5tDloYBLA2adfbMGZK5qoTw8S/B33Blui9qlC2gLxeAHVmjVBelQ9cUKk18cATnvUj
         DAzI86F96ofC0bStlQ2sCpwTHaDEWCfeEV/n5/6O6t1KrchRURRJzqrQcDjpl5pJWV9o
         JGohGvRBpn97EVe78/Q5VReBSRkVVd0YQQ91E7pdBxKJWic2lv9ziKmcdIp0EfjbW1/N
         SqyF6KV/wGSfA+YlntftsDDU6jT94ywfiFJfSLwhY2qniug/Ju9oBc+XDrIn66GBYwiu
         pX0w==
X-Gm-Message-State: AJIora+u7I3DEr9NAPejJpq+d1SwLoozjfhCsRc434rPSFpqsoBS8Jqw
	s8Qids+fQdXvFqwXp2ZYIy1J/9VqqtL+bC43mUGK5DSVXNRgaw==
X-Google-Smtp-Source: AGRyM1u8oRSGeg898xhpPbYjVBpaXUk9w8AZAd5blf8pJYPAfU80eTkK3DFXo1fo5cdEiVvdZAmK1Wa9vdNBJyTmqtA=
X-Received: by 2002:a2e:87c8:0:b0:25d:776c:8343 with SMTP id
 v8-20020a2e87c8000000b0025d776c8343mr17970338ljj.268.1658391812123; Thu, 21
 Jul 2022 01:23:32 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TG/Dr2MgQm9pc3N5?= <boissy@digigram.com>
Date: Thu, 21 Jul 2022 10:23:20 +0200
Message-ID: <CAHrc+6k2hy20_3yrTGBsp9n3c2t0wkZymd1e+EiU_R_R3phD4g@mail.gmail.com>
Subject: New pull request?
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Eric Debief <debief@digigram.com>, Yoann Lubiato <lubiato@digigram.com>
Content-Type: multipart/alternative; boundary="000000000000dc470705e44c6e35"

--000000000000dc470705e44c6e35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I am Lo=C3=AFc BOISSY. I work for Digigram company in France.
Digigram is an audio card manufacturer for professional customers.

Our old cards used specific firmware files.
These files were provided by the alsa-firmware package.
But it seems that this package is now deprecated and replaced by
linux-firmware package.
Do you confirm that?

If yes, How can we push our firmwares files? Just by sending them to you?

Regards,
Lo=C3=AFc
--=20
<http://www.digigram.com/>
*Lo=C3=AFc BOISSY*
*R&D software engineer & Project manager*

office: +33 (0)4 76 52 53 16
<http://www.digigram.com/>  <https://www.facebook.com/Digigram.Official/>
<https://www.linkedin.com/company/digigram>  <https://twitter.com/digigram>
<https://www.youtube.com/channel/UCFtzu31f6rbeFVssCBwWNvw>
<https://www.instagram.com/digigram.official/>

--000000000000dc470705e44c6e35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>I am Lo=C3=AFc BOISSY. I work for Digigram comp=
any in France.</div><div>Digigram is an audio card manufacturer for profess=
ional customers.</div><div><br></div><div>Our old cards used specific firmw=
are files.</div><div>These files were provided by the alsa-firmware package=
.</div><div>But it seems that this package is now deprecated and replaced=
=C2=A0by linux-firmware package.</div><div>Do you confirm that?</div><div><=
br></div><div>If yes, How can we push our firmwares=C2=A0files? Just by sen=
ding them to you?</div><div><br></div><div>Regards,</div><div>Lo=C3=AFc=C2=
=A0</div><div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div style=3D"color:rgb(136,136,136)"><div style=
=3D"color:rgb(34,34,34);font-size:12.8px"><table style=3D"font-family:Helve=
tica"><tbody><tr><td rowspan=3D"6" style=3D"border-right-style:solid;border=
-color:rgb(255,153,63)"><a href=3D"http://www.digigram.com/" target=3D"_bla=
nk"><img src=3D"https://www.digigram.com/wp-content/uploads/2022/03/signatu=
re-email/logo-baseline-digigram-mail.png" style=3D"padding-right:5px"></a><=
br></td></tr><tr><td colspan=3D"5" style=3D"padding-left:5px"><font color=
=3D"#000000"><b>Lo=C3=AFc BOISSY</b></font></td></tr><tr><td colspan=3D"5" =
style=3D"padding-left:5px"><i>R&amp;D software engineer &amp; Project manag=
er</i><br></td></tr><tr><td colspan=3D"5" style=3D"padding-left:5px"><br></=
td></tr><tr><td colspan=3D"5" style=3D"padding-left:5px"><span style=3D"fon=
t-weight:bold">office:</span>=C2=A0+33 (0)4 76 52 53 16</td></tr><tr><td st=
yle=3D"padding-left:5px"><a href=3D"http://www.digigram.com/" target=3D"_bl=
ank"><img src=3D"https://www.digigram.com/wp-content/uploads/2022/03/websit=
e.png" width=3D"20" height=3D"20" style=3D"padding-top:5px;padding-right:8p=
x"></a>=C2=A0<a href=3D"https://www.facebook.com/Digigram.Official/" target=
=3D"_blank"><img src=3D"https://www.digigram.com/wp-content/uploads/2022/03=
/facebook.png" width=3D"20" height=3D"20" style=3D"padding-top:5px;padding-=
right:8px"></a>=C2=A0<a href=3D"https://www.linkedin.com/company/digigram" =
target=3D"_blank"><img src=3D"https://www.digigram.com/wp-content/uploads/2=
022/03/linkedin.png" width=3D"20" height=3D"20" style=3D"padding-top:5px;pa=
dding-right:8px"></a>=C2=A0<a href=3D"https://twitter.com/digigram" target=
=3D"_blank"><img src=3D"https://www.digigram.com/wp-content/uploads/2022/03=
/twitter.png" width=3D"20" height=3D"20" style=3D"padding-top:5px;padding-r=
ight:8px"></a>=C2=A0<a href=3D"https://www.youtube.com/channel/UCFtzu31f6rb=
eFVssCBwWNvw" target=3D"_blank"><img src=3D"https://www.digigram.com/wp-con=
tent/uploads/2022/03/youtube.png" width=3D"20" height=3D"20" style=3D"paddi=
ng-top:5px;padding-right:8px"></a>=C2=A0<a href=3D"https://www.instagram.co=
m/digigram.official/" target=3D"_blank"><img src=3D"https://www.digigram.co=
m/wp-content/uploads/2022/03/instagram.png" width=3D"20" height=3D"20" styl=
e=3D"padding-top:5px;padding-right:8px"></a></td></tr></tbody></table></div=
><div style=3D"color:rgb(34,34,34);font-size:12.8px"><table style=3D"font-f=
amily:Arial"><tbody><tr><td rowspan=3D"7"><br></td></tr></tbody></table></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div>

--000000000000dc470705e44c6e35--
