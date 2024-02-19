Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF08C48BC3
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4252DC43394; Mon, 19 Feb 2024 12:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFE5C433C7
	for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708346875;
	bh=B0huZ1tlfHspTlqV5nqhZZOf0hK1oHmwQZy2ulnbPj0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=j0kClkQLQgprjGta9njAUBforTv6T+grDTfHEEnoyo6WTXkqMizAfe1jd6IKiXCBc
	 9r3h1EuL6rp/Pm8HeKydAJ3Of6HoPAb4eja//FJR4eXiQsLCJeaCrDFz6eoSqxjKKh
	 E5wszKxzbro2TUBHEnvaqlMDebIEAt7dtXN0ftACBzzZuk6rcCyC7uTc9HaJDj/0wF
	 iPk2fLcJ7sDyilahIvbC7IcP9sZFhwugpiEvbUCDR3Qbi31Wr3OYrvwohNcErJNvnu
	 0H4IKhkQeX2pj+MF6kRgfhNKnSQmhWMEeQH/YtTuO1cAxEZeEcOg0aM0nJxMTrUQDo
	 a9ZjyK15IX4LA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-607e707a7f1so40025617b3.2
        for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 04:47:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUiZbzQrvkTSz/uANe3ND3niPMV/vs6Bu2ssIh5AihTPuHgopW7rN2FDuobJb7F8NyO9wiK5Z3xJaUJDNfDdXDXSvkrJS57P09
X-Gm-Message-State: AOJu0YxB9X33WWZ77I9malaLLc5yt4aAZVjlpOdVG9Y78hFwyd/mkbsz
	JM0lIbg5y7rNmAZPQdMiLkv+R6rpqbWhgQ0mA1btR8n9hA+USy9Dr9j/b7TRVJATtbfUEPXqViG
	uDxd4Bo4qPySiOIW0X7mKC/+dSk0=
X-Google-Smtp-Source: AGHT+IG9aWTbki//NF9KOjTlfOSrt3oZuZFiBF93vpBpqZbx8F8h2bQfCcJUj9OOXiJzqpYniuHRb8wy5zZFSIeutUU=
X-Received: by 2002:a81:b603:0:b0:607:ec66:36bd with SMTP id
 u3-20020a81b603000000b00607ec6636bdmr10754864ywh.18.1708346874273; Mon, 19
 Feb 2024 04:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20240216111720.105373-1-hdegoede@redhat.com>
In-Reply-To: <20240216111720.105373-1-hdegoede@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:47:43 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5wVYM6VAmGpj0s_MqRQXA2+zF90d_bGZs6wC_AhfrpmA@mail.gmail.com>
Message-ID: <CA+5PVA5wVYM6VAmGpj0s_MqRQXA2+zF90d_bGZs6wC_AhfrpmA@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] brcm: Add nvram for the Asus Memo Pad 7
 ME176C tablet
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mario Limonciello <superm1@gmail.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 6:17=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Add a NVRAM file for the brcmfmac43362 wifi/bt chip found on the Asus
> Memo Pad 7 ME176C tablet. This is based on copy of the existing
> brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt file with some
> of the values adjusted for the Asus Memo Pad 7 ME176C tablet.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/154

josh

> ---
>  WHENCE                                        |  1 +
>  ...3362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt | 63 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.=
txt
>
> diff --git a/WHENCE b/WHENCE
> index d9bed25d..ba9baa17 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2838,6 +2838,7 @@ File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC=
.-TF103CE.txt"
>  File: "brcm/brcmfmac43340-sdio.meegopad-t08.txt"
>  File: "brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt"
>  File: "brcm/brcmfmac43340-sdio.predia-basic.txt"
> +File: "brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt"
>  File: "brcm/brcmfmac43362-sdio.WC121.txt"
>  File: "brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt"
>  Link: brcm/brcmfmac43362-sdio.kobo,aura.txt -> brcmfmac43362-sdio.WC121.=
txt
> diff --git a/brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt b/b=
rcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt
> new file mode 100644
> index 00000000..0d05d420
> --- /dev/null
> +++ b/brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +# (C) Copyright 2018 Linaro Ltd
> +# NVRAM config file for the Ampak AP6476A 43362 WiFi/BT module found on =
the
> +# Asus Memo Pad 7 ME176C tablet
> +aa2g=3D1
> +ag0=3D2
> +boardflags2=3D0x80
> +boardflags=3D0x80201
> +boardnum=3D777
> +boardrev=3D0x1207
> +boardtype=3D0x0598
> +btc_flags=3D0x7
> +btc_params0=3D5000
> +btc_params1=3D1000
> +btc_params6=3D63
> +cck2gpo=3D0x2222
> +cckPwrIdxCorr=3D-8
> +cckPwrOffset=3D4
> +ccode=3DX2
> +devid=3D0x4343
> +edoffthd=3D-71
> +edonthd=3D-65
> +initxidx2g=3D45
> +logen_mode=3D0x0,0x02,0x1b,0x0,0x1b
> +macaddr=3D00:90:4c:c5:12:38
> +manfid=3D0x2d0
> +maxp2ga0=3D74
> +mcs2gpo0=3D0x8888
> +mcs2gpo1=3D0x8888
> +noise_cal_dbg.fab.3=3D1
> +noise_cal_enable_2g=3D0
> +noise_cal_high_gain.fab.3=3D76
> +noise_cal_nf_substract_val.fab.3=3D356
> +noise_cal_po_2g.fab.3=3D4
> +noise_cal_po_2g=3D4
> +ofdm2gpo=3D0x66666666
> +ofdmdigfilttype=3D4
> +pa0b0=3D0x12AD
> +pa0b1=3D0xFDE2
> +pa0b2=3D0xFF71
> +pa0itssit=3D62
> +pa0maxpwr=3D80
> +pa1itssit=3D62
> +prodid=3D0x492
> +rfreg033=3D0x19
> +rfreg033_cck=3D0x1f
> +rssisav2g=3D0x7
> +rssismc2g=3D0x3
> +rssismf2g=3D0xa
> +sd_gpout=3D1
> +sd_gpval=3D0
> +sd_oobonly=3D0
> +spuravoid_enable2g=3D1
> +sromrev=3D3
> +swctrlmap_2g=3D0x04040404,0x02020202,0x02020202,0x010101,0x1ff
> +temp_add=3D29767
> +temp_mult=3D425
> +temp_q=3D10
> +triso2g=3D0
> +tssitime=3D1
> +vendid=3D0x14e4
> +wl0id=3D0x431b
> +xtalfreq=3D26000
> --
> 2.43.0
>
