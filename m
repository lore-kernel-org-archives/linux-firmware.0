Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CADC6FD18
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Apr 2023 12:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EDA8C4339B; Tue, 18 Apr 2023 12:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F84C433EF
	for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681820144;
	bh=zWr0L8V81Bo7XdsZTT2isjwHH3r0cLo9cQIVh2LIxyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=j4moQdDQu3WdMJdAesrYR6bAU38n25TmsNIqG9MvHsWr46KIAfld5q30TP6E+TOWu
	 z2lGgOgFknPaEYpjzshY0ue6uTSJR/ZiS2xsk9rS5Yxv6UPoKMiLdc8NF/luXJKvfR
	 G+ax3T/0fuXfCQtyHLGorNQ9GIIym7HmWfMGWGaMg4WLS2SAngy0xTxFJv2E3pLByZ
	 LB4uOQ6kzxHS+jYif3EQYEN9wyAw8NmqqJrf0HqhuCCQZcHaS6/8w04eSTT4DafHeH
	 OdOlQ8aws00P08w9fimpr+fn0hCNypmtZ+94NTN8GZ/jmEiPPyIVZPceoFuTU1zplG
	 XHMQk4IsmvJmg==
Received: by mail-yb1-f180.google.com with SMTP id n203so17065579ybg.6
        for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 05:15:43 -0700 (PDT)
X-Gm-Message-State: AAQBX9c7i+0OfHiJvvls5yYo9fo9yFSdW6v61epb9/QJUjSIo35vC9Hm
	QT3sYsI+diEPr3OXvqHxQ7LxcH5aIaEmClVcUCg=
X-Google-Smtp-Source: AKy350YjTtj6PbsMcL6ZLUELJdP4wNfoq/7I6+RrxyOPMLzQ2m12YKV2ITZRwFbyZ1tXv8SiavMyp+ZoJUznn5jdA4w=
X-Received: by 2002:a05:6902:154b:b0:b92:5744:7d13 with SMTP id
 r11-20020a056902154b00b00b9257447d13mr7544292ybu.23.1681820142925; Tue, 18
 Apr 2023 05:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230418111252.936859-1-pbrobinson@gmail.com>
In-Reply-To: <20230418111252.936859-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Apr 2023 08:15:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Paexrhwph_7jPFy3FR6hdWqFAGm=cd1NaLdh7pSnZgg@mail.gmail.com>
Message-ID: <CA+5PVA7Paexrhwph_7jPFy3FR6hdWqFAGm=cd1NaLdh7pSnZgg@mail.gmail.com>
Subject: Re: [PATCH] mt76xx: Move the old Mediatek WiFi firmware to mediatek
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 7:13=E2=80=AFAM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> There's a few original Mediatek firmware still in the
> firmware root so move them to where the rest of the
> Mediatek WiFi firmware reside and link them back to the
> old location so there's a transition.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>
> I'm pretty sure I have the link direction correct but it wouldn't be the
> first time I've screwed it up so verification would be useful :)

Applied and pushed out.  Links look correct in a local test install.

josh

>
>  WHENCE                                              |  12 ++++++++----
>  mt7601u.bin =3D> mediatek/mt7601u.bin                 | Bin
>  mt7650.bin =3D> mediatek/mt7650.bin                   | Bin
>  mt7662.bin =3D> mediatek/mt7662.bin                   | Bin
>  .../mt7662_rom_patch.bin                            | Bin
>  5 files changed, 8 insertions(+), 4 deletions(-)
>  rename mt7601u.bin =3D> mediatek/mt7601u.bin (100%)
>  rename mt7650.bin =3D> mediatek/mt7650.bin (100%)
>  rename mt7662.bin =3D> mediatek/mt7662.bin (100%)
>  rename mt7662_rom_patch.bin =3D> mediatek/mt7662_rom_patch.bin (100%)
>
> diff --git a/WHENCE b/WHENCE
> index 7cc9afd..0f60f10 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -1454,8 +1454,9 @@ Downloaded from http://www.ralinktech.com/ralink/Ho=
me/Support/Linux.html
>
>  Driver: mt7601u - MediaTek MT7601U Wireless MACs
>
> -File: mt7601u.bin
> +File: mediatek/mt7601u.bin
>  Version: 34
> +Link: mt7601u.bin -> mediatek/mt7601u.bin
>
>  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware=
 for details
>
> @@ -3843,7 +3844,8 @@ File rtl_bt/rtl8761bu_config.bin
>
>  Driver: btmtk_usb - Bluetooth USB driver
>
> -File: mt7650.bin
> +File: mediatek/mt7650.bin
> +Link: mt7650.bin -> mediatek/mt7650.bin
>
>  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware=
 for details
>
> @@ -5248,11 +5250,13 @@ Licence: Redistributable. See LICENCE.mediatek fo=
r details.
>
>  Driver: mt76x2e - MediaTek MT76x2 Wireless MACs
>
> -File: mt7662.bin
> +File: mediatek/mt7662.bin
>  Version: 1.9
> +Link: mt7662.bin -> mediatek/mt7662.bin
>
> -File: mt7662_rom_patch.bin
> +File: mediatek/mt7662_rom_patch.bin
>  Version: 0.0.2_P69
> +Link: mt7662_rom_patch.bin -> mediatek/mt7662_rom_patch.bin
>
>  Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware=
 for details
>
> diff --git a/mt7601u.bin b/mediatek/mt7601u.bin
> similarity index 100%
> rename from mt7601u.bin
> rename to mediatek/mt7601u.bin
> diff --git a/mt7650.bin b/mediatek/mt7650.bin
> similarity index 100%
> rename from mt7650.bin
> rename to mediatek/mt7650.bin
> diff --git a/mt7662.bin b/mediatek/mt7662.bin
> similarity index 100%
> rename from mt7662.bin
> rename to mediatek/mt7662.bin
> diff --git a/mt7662_rom_patch.bin b/mediatek/mt7662_rom_patch.bin
> similarity index 100%
> rename from mt7662_rom_patch.bin
> rename to mediatek/mt7662_rom_patch.bin
> --
> 2.40.0
>
