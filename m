Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469B0C678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 14:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A704C433A0; Tue,  7 Mar 2023 14:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1533DC4339E
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678200983;
	bh=PGqezoCa4kYsmDF/549+8qrdfXTGNP9wNVReptDVqMc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qRIii+ZTaWx7afK4TjZF9SUZ4g43L70a+jTVY+dxurXrtlrAVuf8IckezOW5Rd3rN
	 qmJN/2uv3JoCTytTFgmTfORY6bIGvIHlnkfL59natCnPX9qJX4oM9dIPx8uEhbncbm
	 Rt/lzXEhYEGiP60/OX7McQO+ZLK/YYKiUVXkCCSNk3QUFmEm+y11qF4OjdTAv2CEdj
	 bKefjtPjQNBUqaYagHzQ2DSDIm+/xi2AxV7VIAVd0oa9q/J68dttQeR66Gh6HAgw6/
	 5smBEPuOLLbasUw2L0Wx99WcMvksy9qymhDi/psYiDRbV8oGCpAvOStTmAtmz5/x7Z
	 Zd/ZG1W6D5W0g==
Received: by mail-yb1-f170.google.com with SMTP id e194so11662688ybf.1
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 06:56:23 -0800 (PST)
X-Gm-Message-State: AO0yUKUYiljZfSSRu47ZVLNgwHdZ0UU7M+XoJ/t8aZaq0noPRpGgjNy1
	3HgpyYNFIaPJNwiwvDiBjByaDCtNzJx791Xg++4=
X-Google-Smtp-Source: AK7set/wu1MynEfbL6Mz4o6Lt/vtSt5eemU4klDaCR0UEweOpwSTgslC8LvOQAbngQX1N+new288X2lYGnOKeg3VmJ0=
X-Received: by 2002:a5b:a0c:0:b0:a24:1001:1fd2 with SMTP id
 k12-20020a5b0a0c000000b00a2410011fd2mr8724599ybq.0.1678200982120; Tue, 07 Mar
 2023 06:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-2-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-2-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 09:56:11 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4iTX11n044dGRgu-3uE-JncTRoYWmu0nd2p=isfcpYug@mail.gmail.com>
Message-ID: <CA+5PVA4iTX11n044dGRgu-3uE-JncTRoYWmu0nd2p=isfcpYug@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/16] WHENCE: remove unnecessary filename quotation
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This one no longer applies.  While the quotes might be unnecessary,
they also don't hurt.

josh

On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> From: Emil Velikov <emil.l.velikov@gmail.com>
>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  WHENCE | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 205162e..d4654dd 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2691,20 +2691,20 @@ Link: brcm/brcmfmac54591-pcie.clm_blob -> ../cypr=
ess/cyfmac54591-pcie.clm_blob
>  Licence: Redistributable. See LICENCE.cypress for details.
>
>  File: "brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt"
> -File: "brcm/brcmfmac4330-sdio.Prowise-PT301.txt"
> +File: brcm/brcmfmac4330-sdio.Prowise-PT301.txt
>  File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
> -File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
> -File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
> -File: "brcm/brcmfmac43340-sdio.predia-basic.txt"
> -File: "brcm/brcmfmac43362-sdio.WC121.txt"
> -File: "brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt"
> +File: brcm/brcmfmac43340-sdio.meegopad-t08.txt
> +File: brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt
> +File: brcm/brcmfmac43340-sdio.predia-basic.txt
> +File: brcm/brcmfmac43362-sdio.WC121.txt
> +File: brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt
>  Link: brcm/brcmfmac43362-sdio.kobo,aura.txt -> brcmfmac43362-sdio.WC121.=
txt
>  Link: brcm/brcmfmac43362-sdio.kobo,tolino-shine2hd.txt -> brcmfmac43362-=
sdio.WC121.txt
>  Link: brcm/brcmfmac43362-sdio.lemaker,bananapro.txt -> brcmfmac43362-sdi=
o.cubietech,cubietruck.txt
> -File: "brcm/brcmfmac43430a0-sdio.ilife-S806.txt"
> -File: "brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt"
> +File: brcm/brcmfmac43430a0-sdio.ilife-S806.txt
> +File: brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt
>  File: "brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt"
> -File: "brcm/brcmfmac43430-sdio.AP6212.txt"
> +File: brcm/brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-=
sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-=
sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430=
-sdio.AP6212.txt
> @@ -2713,19 +2713,19 @@ Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-=
r1.txt -> brcmfmac43430-sdio.AP
>  Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac4343=
0-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> =
brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt -> =
brcmfmac43430-sdio.AP6212.txt
> -File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
> -File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
> -File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
> +File: brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt
> +File: brcm/brcmfmac43430-sdio.MUR1DX.txt
> +File: brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
>  Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43=
430-sdio.raspberrypi,3-model-b.txt
>  Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-2-w.txt -> brcmfmac=
43430-sdio.raspberrypi,3-model-b.txt
> -File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
> -File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
> +File: brcm/brcmfmac43455-sdio.acepc-t8.txt
> +File: brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac=
43455-sdio.raspberrypi,3-model-b-plus.txt
> -File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> +File: brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4=
\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ C=
ompute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
> -File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> +File: brcm/brcmfmac4356-pcie.gpd-win-pocket.txt
>  File: "brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt"
>  File: brcm/brcmfmac4356-sdio.AP6356S.txt
>  Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-=
sdio.AP6356S.txt
>
> --
> 2.39.2
>
