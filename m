Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062ECCEACEF
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Nov 2025 17:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE493C19423; Mon, 17 Nov 2025 17:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA816C19424
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 17:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763401280;
	bh=A4F5PJLasrrm16tZ8Vvy+5mmSuMc9DptCJKcLbMf4yc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=U9vd9/RVdErVE5Cawogz4Y68ZQY4SnczvX2LHNknQA9jtzoK3kShxJy2rl/RmPaQF
	 O1i3fh45py7s1SSMle9/XWYDu/+714+Gn3ptp8XuUV4d0L+9s0XorLtscH7XXDrLoW
	 c5xfCYgjntUifaUgfj18CBp90KerRZL4Aevo3vVfQb+z+iGdZwM9Et6cYcXNDhfUnN
	 pnhQLricsDuT+6NVdvKUMjJp6UzsG7v+OlJJdmUtOYTf/zYdzHc4Db4rBFabGjqdcr
	 +cjyVa26IUCLZXReM9oHO4UcKimQXRgT8H2cVdkKxUoN2q3Cy186Q3jdYcZ6P/pvAz
	 Z3Vekj/FtVpBQ==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7866aca9ff4so45691887b3.3
        for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 09:41:20 -0800 (PST)
X-Gm-Message-State: AOJu0Yzm2T/HJcG2v+5XlHQjNg6SUZvXvQ1arM/mWoAeqGqhH0oGEDvi
	/qiHiwC2V4mJbpGYbKcQ+vQqEB7jEpie8JFK+3v3LWghiN5CWJSHMbks4etttLvLVxSbO4X5wWu
	Df0YkCdwOoxV0+c4CLxb/jXwIyO7lxEw=
X-Google-Smtp-Source: AGHT+IERFGmwZzvgfmQpsekA5ySepC5cWhE1RdcPAgMU6moeZ0oLlNfQdW91BxLVB/lGep7xzrsdF3YlTmu3LcwSYnc=
X-Received: by 2002:a05:690e:23c5:b0:63d:5d72:1918 with SMTP id
 956f58d0204a3-641e76adb35mr8370590d50.63.1763401279225; Mon, 17 Nov 2025
 09:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20251117144130.2214135-1-shayne.chen@mediatek.com>
In-Reply-To: <20251117144130.2214135-1-shayne.chen@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 17 Nov 2025 12:41:07 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7fLSKqr4r5GC85B2oZpayTiTYu6jNpvX0zUUBT9G8wkA@mail.gmail.com>
X-Gm-Features: AWmQ_bkl7PWjM_nLGeo0QyKIbfhI2BF4jkkjBdQ6YO7jEboEjxVYNyjE4JJh-Lw
Message-ID: <CA+5PVA7fLSKqr4r5GC85B2oZpayTiTYu6jNpvX0zUUBT9G8wkA@mail.gmail.com>
Subject: Re: pull-request: mt76 firmware 20251117
To: Shayne Chen <shayne.chen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware <linux-firmware@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai <evelyn.tsai@mediatek.com>, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:41=E2=80=AFAM Shayne Chen <shayne.chen@mediatek.c=
om> wrote:
>
> Hi,
>
> This contains the WiFi firmwares for MT7996, MT7992, and MT7990 chipsets.
>
> Please let me know if there's any problem.
>
> Thanks,
> Shayne
> ---
>
> The following changes since commit fb0dbcd3011839d85920d1e4aa956f6a84700c=
af:
>
>   Merge branch 'amd-ucode' into 'main' (2025-11-13 22:26:11 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/csyuanc/linux-firmware.git mt76-20251117

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/784

josh

>
> for you to fetch changes up to 05895b31008ae27cc8a8f9a44e014f09595a736c:
>
>   mt76: add firmware for MT7990 (2025-11-17 22:08:46 +0800)
>
> ----------------------------------------------------------------
> Shayne Chen (3):
>       mt76: update firmware for MT7996
>       mt76: update firmware for MT7992
>       mt76: add firmware for MT7990
>
>  WHENCE                                   |  41 +++++++++++++++++++------=
------
>  mediatek/mt7996/mt7990_eeprom.bin        | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7990_eeprom_2i5i.bin   | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7990_rom_patch.bin     | Bin 0 -> 12832 bytes
>  mediatek/mt7996/mt7990_wm.bin            | Bin 0 -> 1336664 bytes
>  mediatek/mt7996/mt7992_dsp.bin           | Bin 63536 -> 63572 bytes
>  mediatek/mt7996/mt7992_dsp_23.bin        | Bin 63536 -> 63536 bytes
>  mediatek/mt7996/mt7992_rom_patch.bin     | Bin 20640 -> 20896 bytes
>  mediatek/mt7996/mt7992_rom_patch_23.bin  | Bin 20640 -> 20896 bytes
>  mediatek/mt7996/mt7992_wa.bin            | Bin 536240 -> 515184 bytes
>  mediatek/mt7996/mt7992_wa_23.bin         | Bin 536240 -> 515184 bytes
>  mediatek/mt7996/mt7992_wm.bin            | Bin 1712336 -> 1742052 bytes
>  mediatek/mt7996/mt7992_wm_23.bin         | Bin 1672256 -> 1701216 bytes
>  mediatek/mt7996/mt7996_dsp.bin           | Bin 191704 -> 191728 bytes
>  mediatek/mt7996/mt7996_rom_patch.bin     | Bin 23968 -> 37216 bytes
>  mediatek/mt7996/mt7996_rom_patch_233.bin | Bin 23968 -> 37216 bytes
>  mediatek/mt7996/mt7996_wa.bin            | Bin 516272 -> 509232 bytes
>  mediatek/mt7996/mt7996_wa_233.bin        | Bin 516272 -> 509232 bytes
>  mediatek/mt7996/mt7996_wm.bin            | Bin 2622816 -> 2655416 bytes
>  mediatek/mt7996/mt7996_wm_233.bin        | Bin 2620960 -> 2681656 bytes
>  20 files changed, 25 insertions(+), 16 deletions(-)
>  create mode 100644 mediatek/mt7996/mt7990_eeprom.bin
>  create mode 100644 mediatek/mt7996/mt7990_eeprom_2i5i.bin
>  create mode 100644 mediatek/mt7996/mt7990_rom_patch.bin
>  create mode 100644 mediatek/mt7996/mt7990_wm.bin
