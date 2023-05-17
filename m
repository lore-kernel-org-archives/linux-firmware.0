Return-Path: <SRS0=Qoea=BG=gmail.com=sl1pkn07@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A9BC77B75
	for <linux-firmware@archiver.kernel.org>; Wed, 17 May 2023 10:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64132C433EF; Wed, 17 May 2023 10:06:10 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A25CC433D2
	for <linux-firmware@kernel.org>; Wed, 17 May 2023 10:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A25CC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f24ddf514eso794298e87.0
        for <linux-firmware@kernel.org>; Wed, 17 May 2023 03:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684317965; x=1686909965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6WcLdx/PPAJktc9ifLxZrAMPvUSKobpLWFNStJmSqy4=;
        b=fOy14lUw2fTdNzLRCl0k3hLi4EpZbdY8AWaVx50qJGHLZFPM1BA4JSpeMBvSRIBX1e
         XHKj6fFbSRynoJAbIKtsg/a7QabE8b6/X8hvIGs1ePHOHe/VP7VXX8P1IRIcDykVccLW
         95MN0sCRX2fXNa3Dc8sbmWXDLpkvmrhhurKG/+EII+AGUxY7GvjWayqiUNmNHAd2ORdJ
         cLPlLtQ4ZguD1bV7vHvy1z/a8LHu1V9TY6ANqlXgYLxOE174488MnzmUEgsZC8Xa2ZJE
         9F8K3ZhPLGvSGrz3hTDertjTC4wJ9O+vd5wPiYG2XJf71UsZgpMdkLrIqpLCfRhSWkMU
         PKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684317965; x=1686909965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WcLdx/PPAJktc9ifLxZrAMPvUSKobpLWFNStJmSqy4=;
        b=fbmMOsbwb318mgotBEnwgEruIleO5jUPoOc5y+FWW4ba2xYV8Wtcfri9AMgTRG5rKO
         5TL6Zu4NJ+kS9yC5/mCVTG04eS//yVBc7uQ1A5Kuv209deV7evYFHZYksYSVsqGDNcK+
         wKVuX57MQ802UHpFbocyRv+oscLRJemDLcOA7dZTow3WJwkHKjA9iFL6wrOw2zA16Uk1
         ckuioZoVEwLzuSRlprpsmeq9Rh2jO4EIJgfg5JpiNqqLm4ifT9OK649kln0x3Jvtvu+n
         ixMGGCxySuH98c1KX/G1EPuVXFMgbmGH7jIXpLiNFnPlLV6n1MXA2w0Lhb4fmJ/3XKnl
         HbNQ==
X-Gm-Message-State: AC+VfDx3A+nSyZM5blNqbcFz2CxBwdWe0V6EXhxpINVKtTvkH49r+Ak1
	U+IJm44tg+RoRuT5dt1thtxJHwi7acGewvz02u6AEYzplZo=
X-Google-Smtp-Source: ACHHUZ68/K8CbEhGpVASuTefuKrfDb6pLVWlKxmliOu9I4vhIk8vdajNtAkV2Q7JV2b5tiyYBPWnU7mJZlYmv0YsIx4=
X-Received: by 2002:a19:c507:0:b0:4f1:3eea:eaf9 with SMTP id
 w7-20020a19c507000000b004f13eeaeaf9mr81747lfe.24.1684317965298; Wed, 17 May
 2023 03:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAaYXTtWEE0XjvQfaPw5_MiKiDS7uhb=X+0zAuX8b1hDv0Bj2Q@mail.gmail.com>
In-Reply-To: <CAAaYXTtWEE0XjvQfaPw5_MiKiDS7uhb=X+0zAuX8b1hDv0Bj2Q@mail.gmail.com>
From: sL1pKn07 SpinFlo <sl1pkn07@gmail.com>
Date: Wed, 17 May 2023 12:05:53 +0200
Message-ID: <CAAaYXTtzYnD-jVtSOOY31rb8qNF2kZoFm-KdYH7Un-1reQ=yXw@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: Add support to SoQuartz CM4 modules
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: didi.debian@cknow.org
Content-Type: multipart/alternative; boundary="00000000000002aee905fbe0d680"

--00000000000002aee905fbe0d680
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mi=C3=A9, 17 may 2023 2:12, sL1pKn07 SpinFlo <sl1pkn07@gmail.com> escrib=
i=C3=B3:

> Pine64 SoQuartz CM4 modules ship with AW-CM256SM.
>
> This bring wifi enabled in the, at the moment, tree knowed carriers:
>
> CM4io (Official Raspberry Pi CM4 carrier)
> Model-A (Pine64 CM4IO-like Carrier for SoQuartz64)
> Blade (Pine64 BLADE form-factor Carrier for SoQuartz64)
>
> Greetings
>
> ---
>
> diff --git a/WHENCE b/WHENCE
> index 61da3444..9c9f5f1a 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2720,6 +2720,10 @@ Link:
> brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-s=
d
> Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt ->
> brcmfmac43455-sdio.AW-CM256SM.txt
> Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt ->
> brcmfmac43455-sdio.AW-CM256SM.txt
> Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt ->
> brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,soquartz-cm4.txt ->
> brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt ->
> brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt ->
> brcmfmac43455-sdio.AW-CM256SM.txt
> +
>
> Licence: GPLv2. See GPL-2 for details.
>
>
Hi

cc'ing Diederik de Haas <didi.debian@cknow.org> because seems he do the
task before, but not summited here (he say it in a discord channel). so
this patch should be marked as Duped.

I declined all authority of this patch and i do not doing a future update
about it

this 'thread' can be close

Greetings and big apology to Diederik de Haas

--00000000000002aee905fbe0d680
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">El mi=C3=A9, 17 may 2023 2:12, sL1pKn07 SpinFlo &lt;<a=
 href=3D"mailto:sl1pkn07@gmail.com">sl1pkn07@gmail.com</a>&gt; escribi=C3=
=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Pine64 SoQuar=
tz CM4 modules ship with AW-CM256SM.<div><br></div><div>This bring wifi ena=
bled in the, at the moment, tree knowed carriers:</div><div><br></div><div>=
CM4io (Official Raspberry Pi CM4 carrier)</div><div>Model-A (Pine64 CM4IO-l=
ike Carrier for SoQuartz64)</div><div>Blade (Pine64 BLADE form-factor Carri=
er for SoQuartz64)</div><div><br></div><div>Greetings</div><div><br></div>-=
--<div><br></div><div><span style=3D"font-family:monospace"><span style=3D"=
font-weight:bold;color:rgb(0,0,0)">diff --git a/WHENCE b/WHENCE</span><span=
 style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">index 61da3444=
..9c9f5f1a 100644</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">--- a/WHENCE</=
span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">+++ b/WHENCE</=
span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,178)">@@ -2720,6 +2720,10 @@</sp=
an><span style=3D"color:rgb(0,0,0)"> Link: brcm/brcmfmac43455-sdio.beagle,a=
m5729-beagleboneai.txt -&gt; brcmfmac43455-sd
</span><br> Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -&gt; brc=
mfmac43455-sdio.AW-CM256SM.txt
<br> Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt -&gt; brcmfmac4=
3455-sdio.AW-CM256SM.txt
<br> Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt -&gt; brcmfmac4345=
5-sdio.AW-CM256SM.txt
<br><span style=3D"color:rgb(24,178,24)">+Link: brcm/brcmfmac43455-sdio.pin=
e64,soquartz-cm4.txt -&gt; brcmfmac43455-sdio.AW-CM256SM.txt</span><span st=
yle=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+Link: brcm/brcmfmac43455-s=
dio.pine64,soquartz-model-a.txt -&gt; brcmfmac43455-sdio.AW-CM256SM.txt</sp=
an><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+Link: brcm/brcmfmac43455-s=
dio.pine64,soquartz-blade.txt -&gt; brcmfmac43455-sdio.AW-CM256SM.txt</span=
><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+</span><span style=3D"colo=
r:rgb(0,0,0)">
</span><br> =C2=A0<br> Licence: GPLv2. See GPL-2 for details.
<br> <br>
</span></div></div></blockquote></div></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><span st=
yle=3D"font-family:monospace"></span></div></div></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Hi</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">cc&#39;ing Diederik de Haas &lt;<a href=3D"mailto:d=
idi.debian@cknow.org">didi.debian@cknow.org</a>&gt; because seems he do the=
 task before, but not summited=C2=A0here (he say it in a discord channel). =
so this patch should be marked as Duped.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">I declined all authority of this patch and i do not doing =
a future update about it</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>this &#39;thread&#39; can be close</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Greetings and big apology to=C2=A0Diederik de Haas</div></div>

--00000000000002aee905fbe0d680--
