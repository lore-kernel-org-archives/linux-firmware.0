Return-Path: <SRS0=wK22=EX=gmail.com=rogan.dawes@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45156EC8735
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Sep 2023 14:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0ADD8C4AF69; Thu,  7 Sep 2023 14:59:00 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DAAF7C36AF0;
	Thu,  7 Sep 2023 14:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DAAF7C36AF0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dawes.za.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6bd066b0fd4so745110a34.2;
        Thu, 07 Sep 2023 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20230601.gappssmtp.com; s=20230601; t=1694098736; x=1694703536; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7zwcMur4Yyn/vbyW8iBg1EnJdAk52Bew+6g1efMBMv0=;
        b=1wWC/GzD0vkrXLHfo0ge2KvykM1fy7u5fGYdkWNlHiKFqDnmorFL5akGC7S/a1iwl8
         QFp6vlVCLnmXlrNeU3G68UalHdVQnZTSQ8bMsog5uVUzlPHEAFftxOknfjnDeoMOxFiG
         llbcaL1OdUjG5JhVb5j2Bck+2G4Rm2I+FD/SUdCIsyvORO6YdT2VG6GveNMEZfdq6XfM
         kVbw8INsUr7RUwNHtBhkKEYiSbufiwK1uKPyK+kDkWb2squxkftMDURKjtCsJNwmHvoB
         eOu2+JZyjTV1X27Q0xCw8ab6pyvwF+EBiHDY/D+G8LUMyno0a79IUNFSwa/7re0ueFCc
         wBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694098736; x=1694703536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zwcMur4Yyn/vbyW8iBg1EnJdAk52Bew+6g1efMBMv0=;
        b=Ys5vSs2jpkAn301RgGlbfcI2R37B9pAlDQmTIIDm5cbFV3AwvHoN+Bnl2ZA+VNtodQ
         9Ls/OeTjRkYMiK7hnSwVP+ijVdMFFuGzaNGlMdnjuvM20gRRILrpM8F6DBrlfyeIRCUq
         DBozjtm8B/p5LRND9NicKrmtssHiJGLm6bTbcsdBTEfFU01/3dSj+cP7SRh6ls9H27ui
         4rp/hs1LmUrr1HNqulyEGCU4x4s9XLdmhvK8C5N+Kg8vuCsV0202/4g6HAYwm+qw9Eof
         ttyMMnMYoS83Ea/m0yYIW6AEgxBHwxpsouuH7f1ERo+xKwaGq99ZayNQnzbuloNP2JGH
         FD8w==
X-Gm-Message-State: AOJu0YwkfMc0hl8mIUZxM5hYnB0NPJZuXwJWrT4/Au0LvsGg3ZsIkaft
	/O9Q3teFcz4IgSEOBeGLldaITEZ83S8jN9d+He1mvSfN
X-Google-Smtp-Source: AGHT+IGjaOlmbtoDnj6vCr8FLMclXjQR62XK9B3WshplG1mjegUHtwamBgkIMx52bt1trSc+34IFDS1AgzhpkmCEqKM=
X-Received: by 2002:a05:6830:22e7:b0:6b9:a9a8:7807 with SMTP id
 t7-20020a05683022e700b006b9a9a87807mr19143663otc.23.1694098736517; Thu, 07
 Sep 2023 07:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAOYdKdhsMWGtubm-sRs3f8Y0K4Raz1ATbV_NhGw+04MtALiLQw@mail.gmail.com>
 <CA+5PVA79oa-9vrgMmgf9VoR0mswVr+H4DuMtrPCYVg0odZf2Pg@mail.gmail.com>
In-Reply-To: <CA+5PVA79oa-9vrgMmgf9VoR0mswVr+H4DuMtrPCYVg0odZf2Pg@mail.gmail.com>
From: Rogan Dawes <rogan@dawes.za.net>
Date: Thu, 7 Sep 2023 16:58:45 +0200
Message-ID: <CAOYdKdiGRK3dCz2fx+=vmZ5ZcwstmH=Q=OQyC3aJctNYnMbqKg@mail.gmail.com>
Subject: Re: [PATCH] brcm: Add 4334 NVRAM for the Wink Hub v1
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="0000000000006798d80604c61991"

--0000000000006798d80604c61991
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josh,

Thanks for taking a look. This configuration file was taken verbatim from
the vendor firmware, shipped with the device, but had no license directly
attributable to this file. Is it something that can still be accepted?

Not sure how to add that sort of origin to the WHENCE file (although it was
described in the commit message).

If you could give me a pointer to something similar, I would be happy to
resubmit.

Regards,

Rogan


On Thu, 7 Sept 2023 at 13:44, Josh Boyer <jwboyer@kernel.org> wrote:

> On Wed, Sep 6, 2023 at 11:28=E2=80=AFAM Rogan Dawes <rogan@dawes.za.net> =
wrote:
> >
> > Add a NVRAM file for the Broadcom 4334 Wifi/BT module as used on the
> > Wink Hub v1 home automation gateway. This file has been lifted directly
> > from the vendor firmware image, and has been tested using a custom
> > OpenWrt build.
> >
> > Signed-off-by: Rogan Dawes <rogan@dawes.za.net>
> > ---
> >  ...cmfmac4334-sdio.wink,imx28-wink-hub-v1.txt | 101 ++++++++++++++++++
> >  1 file changed, 101 insertions(+)
> >  create mode 100644 brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt
> >
> > diff --git a/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt
> b/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt
> > new file mode 100644
> > index 00000000..e63019b0
> > --- /dev/null
> > +++ b/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt
>
> This fails to apply for some reason, and you didn't add an entry into
> WHENCE.  Can you fix it up and resend?
>
> josh
>
> > @@ -0,0 +1,101 @@
> > +# SWB-B53_B1_R04_eLNA 10/21/2011
> > +
> > +manfid=3D0x2d0
> > +prodid=3D0x05c1
> > +vendid=3D0x14e4
> > +devid=3D0x4380
> > +boardtype=3D0x05de
> > +boardrev=3D0x1105
> > +boardnum=3D22
> > +macaddr=3D00:90:4c:c5:12:38
> > +sromrev=3D0
> > +
> > +boardflags=3D0x10081a00
> > +xtalfreq=3D37400
> > +nocrc=3D1
> > +ag0=3D255
> > +aa2g=3D1
> > +ccode=3DALL
> > +pa0itssit=3D0x20
> > +
> > +#PA parameters for 2.4GHz (0x15A7,0xFD54,0xFF4A)
> > +pa0b0=3D0x19B7
> > +pa0b1=3D0xFD2A
> > +pa0b2=3D0xFF7B
> > +extpagain2g=3D2
> > +extpagain5g=3D2
> > +
> > +# rssi params for 2.4GHz
> > +rssismf2g=3D0x2
> > +rssismc2g=3D0x7
> > +rssisav2g=3D0x1
> > +cckPwrOffset=3D0
> > +
> > +# rssi params for 5GHz
> > +rssismf5g=3D0x8
> > +rssismc5g=3D0x8
> > +rssisav5g=3D0x1
> > +
> > +
> > +#PA parameters for lower a-band
> > +pa1lob0=3D5516
> > +pa1lob1=3D-680
> > +pa1lob2=3D-182
> > +#PA parameters for midband
> > +pa1b0=3D5560
> > +pa1b1=3D-683
> > +pa1b2=3D-178
> > +#PA paramasdeters for high band
> > +pa1hib0=3D5438
> > +pa1hib1=3D-681
> > +pa1hib2=3D-193
> > +rxpo5g=3D0
> > +
> > +
> > +maxp2ga0=3D66
> > +ofdm2gpo=3D0x22222222
> > +mcs2gpo0=3D0x4444
> > +mcs2gpo1=3D0x4444
> > +
> > +maxp5ga0=3D0x4a
> > +maxp5gla0=3D0x4a
> > +maxp5gha0=3D0x4a
> > +ofdm5gpo=3D0x66666666
> > +ofdm5glpo=3D0x66666666
> > +ofdm5ghpo=3D0x66666666
> > +mcs5gpo0=3D0x8888
> > +mcs5gpo1=3D0x8888
> > +mcs5glpo0=3D0x8888
> > +mcs5glpo1=3D0x8888
> > +mcs5ghpo0=3D0x8888
> > +mcs5ghpo1=3D0x8888
> > +
> > +#il0macaddr=3D00:90:4c:c5:12:38
> > +wl0id=3D0x431b
> > +pagc2g=3D0x10
> > +#dacgc2g=3D4
> > +txalpfbyp=3D1
> > +
> > +#For SEMCO B53-R04-eLNA Module
> > +swctrlmap_2g=3D0x0c0c0c0c,0x12121212,0x02020202,0x11202,0x1ff
> > +swctrlmap_5g=3D0x40404040,0x20202020,0x20202020,0x12202,0x2f8
> > +
> > +gain=3D32
> > +triso2g=3D12
> > +triso5g=3D8
> > +
> > +hostwake=3D0x40
> > +hostrdy=3D0x41
> > +usbrdy=3D0x03
> > +usbrdydelay=3D100
> > +deadman_to=3D0xffffffff
> > +muxenab=3D0x1
> > +
> > +tssioffsetmax=3D27
> > +
> > +PwrOffset40mhz2g=3D0
> > +PwrOffset40mhz5g=3D-8
> > +
> > +tssioffsetmax5gl=3D21
> > +tssioffsetmax5gm=3D23
> > +tssioffsetmax5gh=3D20
> > --
> > 2.34.1
> >
>

--0000000000006798d80604c61991
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Josh,<div><br></div><div>Thanks for taking a look. This=
 configuration file was taken verbatim from the vendor firmware, shipped wi=
th the device, but had no license directly attributable to this file. Is it=
 something that can still be accepted?</div><div><br></div><div>Not sure ho=
w to add that sort of origin to the WHENCE file (although it was described =
in the commit message).</div><div><br></div><div>If you could give me a poi=
nter to something similar, I would be happy to resubmit.</div><div><br></di=
v><div>Regards,</div><div><br></div><div>Rogan</div><div><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
7 Sept 2023 at 13:44, Josh Boyer &lt;<a href=3D"mailto:jwboyer@kernel.org">=
jwboyer@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, Sep 6, 2023 at 11:28=E2=80=AFAM Rogan Dawes &lt;<=
a href=3D"mailto:rogan@dawes.za.net" target=3D"_blank">rogan@dawes.za.net</=
a>&gt; wrote:<br>
&gt;<br>
&gt; Add a NVRAM file for the Broadcom 4334 Wifi/BT module as used on the<b=
r>
&gt; Wink Hub v1 home automation gateway. This file has been lifted directl=
y<br>
&gt; from the vendor firmware image, and has been tested using a custom<br>
&gt; OpenWrt build.<br>
&gt;<br>
&gt; Signed-off-by: Rogan Dawes &lt;<a href=3D"mailto:rogan@dawes.za.net" t=
arget=3D"_blank">rogan@dawes.za.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...cmfmac4334-sdio.wink,imx28-wink-hub-v1.txt | 101 ++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 101 insertions(+)<br>
&gt;=C2=A0 create mode 100644 brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1=
.txt<br>
&gt;<br>
&gt; diff --git a/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt b/brcm/=
brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt<br>
&gt; new file mode 100644<br>
&gt; index 00000000..e63019b0<br>
&gt; --- /dev/null<br>
&gt; +++ b/brcm/brcmfmac4334-sdio.wink,imx28-wink-hub-v1.txt<br>
<br>
This fails to apply for some reason, and you didn&#39;t add an entry into<b=
r>
WHENCE.=C2=A0 Can you fix it up and resend?<br>
<br>
josh<br>
<br>
&gt; @@ -0,0 +1,101 @@<br>
&gt; +# SWB-B53_B1_R04_eLNA 10/21/2011<br>
&gt; +<br>
&gt; +manfid=3D0x2d0<br>
&gt; +prodid=3D0x05c1<br>
&gt; +vendid=3D0x14e4<br>
&gt; +devid=3D0x4380<br>
&gt; +boardtype=3D0x05de<br>
&gt; +boardrev=3D0x1105<br>
&gt; +boardnum=3D22<br>
&gt; +macaddr=3D00:90:4c:c5:12:38<br>
&gt; +sromrev=3D0<br>
&gt; +<br>
&gt; +boardflags=3D0x10081a00<br>
&gt; +xtalfreq=3D37400<br>
&gt; +nocrc=3D1<br>
&gt; +ag0=3D255<br>
&gt; +aa2g=3D1<br>
&gt; +ccode=3DALL<br>
&gt; +pa0itssit=3D0x20<br>
&gt; +<br>
&gt; +#PA parameters for 2.4GHz (0x15A7,0xFD54,0xFF4A)<br>
&gt; +pa0b0=3D0x19B7<br>
&gt; +pa0b1=3D0xFD2A<br>
&gt; +pa0b2=3D0xFF7B<br>
&gt; +extpagain2g=3D2<br>
&gt; +extpagain5g=3D2<br>
&gt; +<br>
&gt; +# rssi params for 2.4GHz<br>
&gt; +rssismf2g=3D0x2<br>
&gt; +rssismc2g=3D0x7<br>
&gt; +rssisav2g=3D0x1<br>
&gt; +cckPwrOffset=3D0<br>
&gt; +<br>
&gt; +# rssi params for 5GHz<br>
&gt; +rssismf5g=3D0x8<br>
&gt; +rssismc5g=3D0x8<br>
&gt; +rssisav5g=3D0x1<br>
&gt; +<br>
&gt; +<br>
&gt; +#PA parameters for lower a-band<br>
&gt; +pa1lob0=3D5516<br>
&gt; +pa1lob1=3D-680<br>
&gt; +pa1lob2=3D-182<br>
&gt; +#PA parameters for midband<br>
&gt; +pa1b0=3D5560<br>
&gt; +pa1b1=3D-683<br>
&gt; +pa1b2=3D-178<br>
&gt; +#PA paramasdeters for high band<br>
&gt; +pa1hib0=3D5438<br>
&gt; +pa1hib1=3D-681<br>
&gt; +pa1hib2=3D-193<br>
&gt; +rxpo5g=3D0<br>
&gt; +<br>
&gt; +<br>
&gt; +maxp2ga0=3D66<br>
&gt; +ofdm2gpo=3D0x22222222<br>
&gt; +mcs2gpo0=3D0x4444<br>
&gt; +mcs2gpo1=3D0x4444<br>
&gt; +<br>
&gt; +maxp5ga0=3D0x4a<br>
&gt; +maxp5gla0=3D0x4a<br>
&gt; +maxp5gha0=3D0x4a<br>
&gt; +ofdm5gpo=3D0x66666666<br>
&gt; +ofdm5glpo=3D0x66666666<br>
&gt; +ofdm5ghpo=3D0x66666666<br>
&gt; +mcs5gpo0=3D0x8888<br>
&gt; +mcs5gpo1=3D0x8888<br>
&gt; +mcs5glpo0=3D0x8888<br>
&gt; +mcs5glpo1=3D0x8888<br>
&gt; +mcs5ghpo0=3D0x8888<br>
&gt; +mcs5ghpo1=3D0x8888<br>
&gt; +<br>
&gt; +#il0macaddr=3D00:90:4c:c5:12:38<br>
&gt; +wl0id=3D0x431b<br>
&gt; +pagc2g=3D0x10<br>
&gt; +#dacgc2g=3D4<br>
&gt; +txalpfbyp=3D1<br>
&gt; +<br>
&gt; +#For SEMCO B53-R04-eLNA Module<br>
&gt; +swctrlmap_2g=3D0x0c0c0c0c,0x12121212,0x02020202,0x11202,0x1ff<br>
&gt; +swctrlmap_5g=3D0x40404040,0x20202020,0x20202020,0x12202,0x2f8<br>
&gt; +<br>
&gt; +gain=3D32<br>
&gt; +triso2g=3D12<br>
&gt; +triso5g=3D8<br>
&gt; +<br>
&gt; +hostwake=3D0x40<br>
&gt; +hostrdy=3D0x41<br>
&gt; +usbrdy=3D0x03<br>
&gt; +usbrdydelay=3D100<br>
&gt; +deadman_to=3D0xffffffff<br>
&gt; +muxenab=3D0x1<br>
&gt; +<br>
&gt; +tssioffsetmax=3D27<br>
&gt; +<br>
&gt; +PwrOffset40mhz2g=3D0<br>
&gt; +PwrOffset40mhz5g=3D-8<br>
&gt; +<br>
&gt; +tssioffsetmax5gl=3D21<br>
&gt; +tssioffsetmax5gm=3D23<br>
&gt; +tssioffsetmax5gh=3D20<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
</blockquote></div>

--0000000000006798d80604c61991--
