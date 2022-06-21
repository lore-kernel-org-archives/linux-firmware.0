Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0580C43334
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jun 2022 13:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5FA6EC385A2; Tue, 21 Jun 2022 13:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F45C341C4;
	Tue, 21 Jun 2022 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655817090;
	bh=T/9HRwyBR6hYb7rkWe5HfERdyuIxYDDvGAiK9N+WAds=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qqtQl0i+x6FG3aRk8kqzmBiB/GhH2nXRdm19uYMfoSiLj/HWf5oDYrZ9AfqzhwhzY
	 IBzS7bZ/GCGwCWHRfZgWL6kJP6QvDjKrF2Q2dTiQ6Bul/d5nSqxYJRVlds9/vXgXfO
	 0rJtQRQoOSkdK6XJ5oexfYaSLmxGbyK+2konOscW1BQAxwQ6B9fC/7D5C+Q5A7GYLs
	 8cXgbZHfx9mWJ1cmiLyhh1SU0pdaaTZRT9XrK31Iw20+KVW9I1ngvqqm4Opf2nE4wD
	 57UyMy81Q9xWjcGFjUqcQ8G2cQ5dM5asijOmk3qlxjjS1+Peiiq+ijiIHv5BgHbH7t
	 pxd5gURbUHgHQ==
Received: by mail-io1-f49.google.com with SMTP id i16so14151212ioa.6;
        Tue, 21 Jun 2022 06:11:30 -0700 (PDT)
X-Gm-Message-State: AJIora+V8iHH8uSDtBjHCNOhxr8Y6F2RrgefOM6RxnGohmyyeqou61HL
	JfXZka7lOqBme/RBf8WZir5WY3olnUUeUZwGCWk=
X-Google-Smtp-Source: AGRyM1vlk7fApSx56OqxIsZu4pAjI53RtZ1Og2n+PzIl36r+ZdS8KesYAOoSUKa7cvVKKLizHY4u+IQ16h7fNWPhJ3s=
X-Received: by 2002:a05:6638:389f:b0:331:b463:fbee with SMTP id
 b31-20020a056638389f00b00331b463fbeemr16875459jav.145.1655817089366; Tue, 21
 Jun 2022 06:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220614124816.3948304-1-pbrobinson@gmail.com>
In-Reply-To: <20220614124816.3948304-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 21 Jun 2022 09:11:18 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6we2hhokOJ-Fv0p6p9BSDq=t25dfiDS29mgHB+UbEKRg@mail.gmail.com>
Message-ID: <CA+5PVA6we2hhokOJ-Fv0p6p9BSDq=t25dfiDS29mgHB+UbEKRg@mail.gmail.com>
Subject: Re: [PATCH] Remove the Pine64 Quartz copy of the RPi NVRAM
To: Peter Robinson <pbrobinson@gmail.com>, strit@manjaro.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: multipart/alternative; boundary="0000000000006cc7f005e1f4f5b1"

--0000000000006cc7f005e1f4f5b1
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Tue, Jun 14, 2022 at 8:48 AM Peter Robinson <pbrobinson@gmail.com> wrote:

> We can't just copy the Rasperry Pi NVRAM, their modules are custom
> made so they have their own special NVRAMs for their variant. While
> they may work for other modules it could put them out of compliance
> or worse. We need to add an appropraite AzureWave AW-CM256SM NVRAM.
>
> Even if it was the right one it should have just been linked rather
> than actually copying it again too.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  WHENCE                                        |  1 -
>  brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt | 83 -------------------
>  2 files changed, 84 deletions(-)
>  delete mode 100644 brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
>
> diff --git a/WHENCE b/WHENCE
> index 776dd8b..cc37751 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2952,7 +2952,6 @@ File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>  Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt ->
> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
> -File: "brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt ->
> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> diff --git a/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
> b/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
> deleted file mode 100644
> index abaf544..0000000
> --- a/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0+
> -# (C) Copyright 2018 Raspberry Pi (Trading) Ltd.
> -# NVRAM config file for the BCM43455 WiFi/BT chip as found on the
> -# Pine64 Quartz64 Model B
> -aa2g=1
> -aa5g=1
> -AvVmid_c0=1,165,2,100,2,100,2,100,2,100
> -boardflags=0x00480201
> -boardflags2=0x40800000
> -boardflags3=0x44200100
> -boardrev=0x1304
> -boardtype=0x6e4
> -btc_mode=1
> -btc_params1=0x7530
> -btc_params8=0x4e20
> -btc_params50=0x972c
> -cbfilttype=1
> -cckPwrIdxCorr=3
> -cckTssiDelay=150
> -deadman_to=481500000
> -devid=0x43ab
> -dot11agofdmhrbw202gpo=0x4442
> -dot11b_opts=0x3aa85
> -ed_thresh2g=-54
> -ed_thresh5g=-54
> -eu_edthresh2g=-54
> -eu_edthresh5g=-54
> -extpagain2g=2
> -extpagain5g=2
> -fdsslevel_ch11=6
> -femctrl=0
> -itrsw=1
> -ldo1=4
> -ltecxfnsel=0x22
> -ltecxgcigpio=0x32
> -ltecxmux=0
> -ltecxpadnum=0x0504
> -macaddr=b8:27:eb:74:f2:6c
> -manfid=0x2d0
> -maxp2ga0=80
> -maxp5ga0=82,82,82,82
> -mcsbw202gpo=0x98444422
> -mcsbw205ghpo=0xb9555000
> -mcsbw205glpo=0xb9555000
> -mcsbw205gmpo=0xb9555000
> -mcsbw402gpo=0x98444422
> -mcsbw405ghpo=0xb9555000
> -mcsbw405glpo=0xb9555000
> -mcsbw405gmpo=0xb9555000
> -mcsbw805ghpo=0xb9555000
> -mcsbw805glpo=0xb9555000
> -mcsbw805gmpo=0xb9555000
> -nocrc=1
> -ofdmlrbw202gpo=0x0022
> -ofdmTssiDelay=150
> -pa2ga0=-129,6525,-718
> -pa2ga1=-149,4408,-601
> -pa5ga0=-185,6836,-815,-186,6838,-815,-184,6859,-815,-184,6882,-818
> -pa5ga1=-202,4285,-574,-201,4312,-578,-196,4391,-586,-201,4294,-575
> -pdoffset2g40ma0=16
> -pdoffset2gperchan=0,-2,1,0,1,0,1,1,1,0,0,-1,-1,0
> -pdoffset40ma0=0x8888
> -pdoffset80ma0=0x8888
> -pdoffsetcckma0=2
> -phycal_tempdelta=15
> -prodid=0x06e4
> -rawtempsense=0x1ff
> -rxchain=1
> -sromrev=11
> -swctrlmap_2g=0x00000000,0x00000000,0x00000000,0x010000,0x3ff
> -swctrlmap_5g=0x00100010,0x00200020,0x00200020,0x010000,0x3fe
> -swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x3
> -swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x3
> -tssipos2g=1
> -tssipos5g=1
> -tworangetssi2g=1
> -tworangetssi5g=1
> -txchain=1
> -txpwr2gAdcScale=1
> -txpwr5gAdcScale=1
> -vcodivmode=1
> -vendid=0x14e4
> -xtalfreq=37400
> --
> 2.36.1
>
>

--0000000000006cc7f005e1f4f5b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Applied and pushed out.<div><br></div><div>josh</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, Jun 14, 2022 at 8:48 AM Peter Robinson &lt;<a href=3D"mailto:pbrobinson@=
gmail.com">pbrobinson@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">We can&#39;t just copy the Rasperry Pi NVR=
AM, their modules are custom<br>
made so they have their own special NVRAMs for their variant. While<br>
they may work for other modules it could put them out of compliance<br>
or worse. We need to add an appropraite AzureWave AW-CM256SM NVRAM.<br>
<br>
Even if it was the right one it should have just been linked rather<br>
than actually copying it again too.<br>
<br>
Signed-off-by: Peter Robinson &lt;<a href=3D"mailto:pbrobinson@gmail.com" t=
arget=3D"_blank">pbrobinson@gmail.com</a>&gt;<br>
---<br>
=C2=A0WHENCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 -<br>
=C2=A0brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt | 83 ------------------=
-<br>
=C2=A02 files changed, 84 deletions(-)<br>
=C2=A0delete mode 100644 brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt<br>
<br>
diff --git a/WHENCE b/WHENCE<br>
index 776dd8b..cc37751 100644<br>
--- a/WHENCE<br>
+++ b/WHENCE<br>
@@ -2952,7 +2952,6 @@ File: &quot;brcm/brcmfmac43430-sdio.MUR1DX.txt&quot;<=
br>
=C2=A0File: &quot;brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt&quot;<b=
r>
=C2=A0Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -&gt; brcm=
fmac43430-sdio.raspberrypi,3-model-b.txt<br>
=C2=A0File: &quot;brcm/brcmfmac43455-sdio.acepc-t8.txt&quot;<br>
-File: &quot;brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt&quot;<br>
=C2=A0File: &quot;brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt&qu=
ot;<br>
=C2=A0Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -&gt; br=
cmfmac43455-sdio.raspberrypi,3-model-b-plus.txt<br>
=C2=A0File: &quot;brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt&quot;<b=
r>
diff --git a/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt b/brcm/brcmfmac4=
3455-sdio.pine64,quartz64-b.txt<br>
deleted file mode 100644<br>
index abaf544..0000000<br>
--- a/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt<br>
+++ /dev/null<br>
@@ -1,83 +0,0 @@<br>
-# SPDX-License-Identifier: GPL-2.0+<br>
-# (C) Copyright 2018 Raspberry Pi (Trading) Ltd.<br>
-# NVRAM config file for the BCM43455 WiFi/BT chip as found on the<br>
-# Pine64 Quartz64 Model B<br>
-aa2g=3D1<br>
-aa5g=3D1<br>
-AvVmid_c0=3D1,165,2,100,2,100,2,100,2,100<br>
-boardflags=3D0x00480201<br>
-boardflags2=3D0x40800000<br>
-boardflags3=3D0x44200100<br>
-boardrev=3D0x1304<br>
-boardtype=3D0x6e4<br>
-btc_mode=3D1<br>
-btc_params1=3D0x7530<br>
-btc_params8=3D0x4e20<br>
-btc_params50=3D0x972c<br>
-cbfilttype=3D1<br>
-cckPwrIdxCorr=3D3<br>
-cckTssiDelay=3D150<br>
-deadman_to=3D481500000<br>
-devid=3D0x43ab<br>
-dot11agofdmhrbw202gpo=3D0x4442<br>
-dot11b_opts=3D0x3aa85<br>
-ed_thresh2g=3D-54<br>
-ed_thresh5g=3D-54<br>
-eu_edthresh2g=3D-54<br>
-eu_edthresh5g=3D-54<br>
-extpagain2g=3D2<br>
-extpagain5g=3D2<br>
-fdsslevel_ch11=3D6<br>
-femctrl=3D0<br>
-itrsw=3D1<br>
-ldo1=3D4<br>
-ltecxfnsel=3D0x22<br>
-ltecxgcigpio=3D0x32<br>
-ltecxmux=3D0<br>
-ltecxpadnum=3D0x0504<br>
-macaddr=3Db8:27:eb:74:f2:6c<br>
-manfid=3D0x2d0<br>
-maxp2ga0=3D80<br>
-maxp5ga0=3D82,82,82,82<br>
-mcsbw202gpo=3D0x98444422<br>
-mcsbw205ghpo=3D0xb9555000<br>
-mcsbw205glpo=3D0xb9555000<br>
-mcsbw205gmpo=3D0xb9555000<br>
-mcsbw402gpo=3D0x98444422<br>
-mcsbw405ghpo=3D0xb9555000<br>
-mcsbw405glpo=3D0xb9555000<br>
-mcsbw405gmpo=3D0xb9555000<br>
-mcsbw805ghpo=3D0xb9555000<br>
-mcsbw805glpo=3D0xb9555000<br>
-mcsbw805gmpo=3D0xb9555000<br>
-nocrc=3D1<br>
-ofdmlrbw202gpo=3D0x0022<br>
-ofdmTssiDelay=3D150<br>
-pa2ga0=3D-129,6525,-718<br>
-pa2ga1=3D-149,4408,-601<br>
-pa5ga0=3D-185,6836,-815,-186,6838,-815,-184,6859,-815,-184,6882,-818<br>
-pa5ga1=3D-202,4285,-574,-201,4312,-578,-196,4391,-586,-201,4294,-575<br>
-pdoffset2g40ma0=3D16<br>
-pdoffset2gperchan=3D0,-2,1,0,1,0,1,1,1,0,0,-1,-1,0<br>
-pdoffset40ma0=3D0x8888<br>
-pdoffset80ma0=3D0x8888<br>
-pdoffsetcckma0=3D2<br>
-phycal_tempdelta=3D15<br>
-prodid=3D0x06e4<br>
-rawtempsense=3D0x1ff<br>
-rxchain=3D1<br>
-sromrev=3D11<br>
-swctrlmap_2g=3D0x00000000,0x00000000,0x00000000,0x010000,0x3ff<br>
-swctrlmap_5g=3D0x00100010,0x00200020,0x00200020,0x010000,0x3fe<br>
-swctrlmapext_2g=3D0x00000000,0x00000000,0x00000000,0x000000,0x3<br>
-swctrlmapext_5g=3D0x00000000,0x00000000,0x00000000,0x000000,0x3<br>
-tssipos2g=3D1<br>
-tssipos5g=3D1<br>
-tworangetssi2g=3D1<br>
-tworangetssi5g=3D1<br>
-txchain=3D1<br>
-txpwr2gAdcScale=3D1<br>
-txpwr5gAdcScale=3D1<br>
-vcodivmode=3D1<br>
-vendid=3D0x14e4<br>
-xtalfreq=3D37400<br>
-- <br>
2.36.1<br>
<br>
</blockquote></div>

--0000000000006cc7f005e1f4f5b1--
