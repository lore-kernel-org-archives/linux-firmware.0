Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,LOTS_OF_MONEY,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EECCC10F27
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Mar 2020 17:52:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F3ECA20873; Mon,  9 Mar 2020 17:52:16 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B7376215A4
	for <linux-firmware@kernel.org>; Mon,  9 Mar 2020 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583776336;
	bh=y6KzXnQ9I5ONm1RDkfmJwhIfOIJiCnM2dFDZDWVaU8U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UeDD5R71PwyXxE6I4B+p72aa9onmIx+k9jRAQ+FCd3fERFPW/Nrf9xV6ozY08OM6i
	 tU4She7wmVavcrBCMLCMyexhZzuldG3j10GT2zrd9jJPvWLn17LGIrjuOY5Z/i3Ld+
	 3x0/WnPecy3OXEiHO4m7Zixlr39osFrjvUIjC9GM=
Received: by mail-io1-f53.google.com with SMTP id t26so2279875ios.11
        for <linux-firmware@kernel.org>; Mon, 09 Mar 2020 10:52:16 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3nwJnOEgSGV1ecHSPcZ0DNI3foZkDtoI155fCS+dG9SYS6wZyD
	LAQbyNrJdkPrilHBRqZbf3v7F2Do9F70+JWab10=
X-Google-Smtp-Source: ADFU+vuu20BTFwk9oFiNLIz+4pi655J3zA+rWFwlzdyvdPPc1Cp0GovV2DqzUxNUZVzUVWu4a3DxynqxrqCrtHoP37w=
X-Received: by 2002:a02:220f:: with SMTP id o15mr16548303jao.106.1583776335637;
 Mon, 09 Mar 2020 10:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200305031912.3894-1-hildawu@realtek.com>
In-Reply-To: <20200305031912.3894-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 Mar 2020 13:52:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5-_ro-kvyjKvZaj3jEsTTagNDLJURVx=A3KFzQ3ELWGA@mail.gmail.com>
Message-ID: <CA+5PVA5-_ro-kvyjKvZaj3jEsTTagNDLJURVx=A3KFzQ3ELWGA@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Add firmware and configuration files for RTL8822C
 BT UART chip
To: hildawu@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Max Chou <max.chou@realtek.com>, =?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>, 
	kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Mar 4, 2020 at 10:19 PM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> The firmware and config files are for RTL8822C BT controller with UART interface.
> Version: 0x0599_0D54
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  WHENCE                      |   2 ++
>  rtl_bt/rtl8822cs_config.bin | Bin 0 -> 33 bytes
>  rtl_bt/rtl8822cs_fw.bin     | Bin 0 -> 56288 bytes
>  3 files changed, 2 insertions(+)
>  create mode 100644 rtl_bt/rtl8822cs_config.bin
>  create mode 100644 rtl_bt/rtl8822cs_fw.bin
>
> diff --git a/WHENCE b/WHENCE
> index 4ec90f4..1bafda5 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3423,6 +3423,8 @@ File: rtl_bt/rtl8821c_fw.bin
>  File: rtl_bt/rtl8821c_config.bin
>  File: rtl_bt/rtl8822cu_fw.bin
>  File: rtl_bt/rtl8822cu_config.bin
> +File: rtl_bt/rtl8822cs_fw.bin
> +File: rtl_bt/rtl8822cs_config.bin
>
>  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
>
> diff --git a/rtl_bt/rtl8822cs_config.bin b/rtl_bt/rtl8822cs_config.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..33ee243d8d0ca0004c44c529c4fc1a628da9a5d7
> GIT binary patch
> literal 33
> pcmWGtt=ulnz{4QG)G&!9;OHyKhthx7M>8(ru3}&`zsbPJ4*;{u3Sa;L
>
> literal 0
> HcmV?d00001
>
> diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..2bafae366a2150c63125562a1dc941404a6902da
> GIT binary patch
> literal 56288
> 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
> Zug+%}zM(?P{5SswqFClB&HaD=KLOnyCAt6r
>
> literal 0
> HcmV?d00001
>
> --
> 2.17.1
>
