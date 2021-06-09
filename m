Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93469C48BCD
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Jun 2021 12:10:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 69A98613B8; Wed,  9 Jun 2021 12:10:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D0A261364
	for <linux-firmware@kernel.org>; Wed,  9 Jun 2021 12:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623240643;
	bh=Q3oXAlbU9Y9WeMRbtt1Mz3yLT7Tf6JpTxDM0y3cHggY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ikqjgdflkiwUykM0XO7AYvnGyDEofZtNVSyW4h94Pl9n9TJtxajXkfWXj7LRoYyV6
	 SxPS3gxxd/xEAR5Y7qxYq2iQCcgm+JP33pdfeC1kB2MBonAm8sysUHeHTswirbgLSa
	 fBDjvOwviZFLd24YrqYQl7xAs9VTLyMzt2B9NUsj47hlLwxxrh2YkjVM5ywebmrASi
	 j6EReRIaTOwt60+vznVNMe0zpJvLqblvF5Jw6uCf51NSX34YnqtdPcJWbttcU3hMvc
	 XYCtKovJS6q0H/V5NEqKrzosMcz85bDwwTg86PZ0atp8ahoBXAb80JyEzBypA/MNvX
	 UBsRRsR0HDiIQ==
Received: by mail-il1-f182.google.com with SMTP id d1so22396959ils.5
        for <linux-firmware@kernel.org>; Wed, 09 Jun 2021 05:10:43 -0700 (PDT)
X-Gm-Message-State: AOAM530Wg1+3HTJatk4azzH0tq8LbWxqwwOIz1BR3ctPlL367+QiqNgd
	an+uASfUL8iz/9GA4BRUx9EbkK4xRDwwGWfb5sc=
X-Google-Smtp-Source: ABdhPJymuYg/9DlrdvPH9eG270csRN6+NrIhD6FXE6nVelFaTlcUnYnzOjtGPLmJSMm8pg+J+gXbCAebd44lyvsYCag=
X-Received: by 2002:a92:d48a:: with SMTP id p10mr23047438ilg.206.1623240642600;
 Wed, 09 Jun 2021 05:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210529125334.32258-1-joakim.tjernlund@infinera.com> <20210529125334.32258-2-joakim.tjernlund@infinera.com>
In-Reply-To: <20210529125334.32258-2-joakim.tjernlund@infinera.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Jun 2021 08:10:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7KsYRf8UZmW_yLzRJ=h05EthRGsFiEPnL7wkUybpRY-g@mail.gmail.com>
Message-ID: <CA+5PVA7KsYRf8UZmW_yLzRJ=h05EthRGsFiEPnL7wkUybpRY-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rtl_bt: Add rtl8761bu firmware
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Both applied and pushed out.

josh

On Sat, May 29, 2021 at 8:53 AM Joakim Tjernlund
<joakim.tjernlund@infinera.com> wrote:
>
> From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>
> From Realtek 20200806_LINUX_BT_DRIVER_RTL8761B_COEX_v0202
> driver package.
>
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> ---
>
>  -v2: Add WHENCE entrires
>
>  WHENCE                      |   4 ++++
>  rtl_bt/rtl8761bu_config.bin | Bin 0 -> 6 bytes
>  rtl_bt/rtl8761bu_fw.bin     | Bin 0 -> 34796 bytes
>  3 files changed, 4 insertions(+)
>  create mode 100644 rtl_bt/rtl8761bu_config.bin
>  create mode 100644 rtl_bt/rtl8761bu_fw.bin
>
> diff --git a/WHENCE b/WHENCE
> index d6773da..1facbf1 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3762,6 +3762,8 @@ Link: rtl_bt/rtl8723bs_config-OBDA0623.bin -> rtl8723bs_config-OBDA8723.bin
>  File: rtl_bt/rtl8761a_fw.bin
>  File: rtl_bt/rtl8761b_fw.bin
>  File: rtl_bt/rtl8761b_config.bin
> +File: rtl_bt/rtl8761bu_fw.bin
> +File: rtl_bt/rtl8761bu_config.bin
>  File: rtl_bt/rtl8812ae_fw.bin
>  File: rtl_bt/rtl8821a_fw.bin
>  Link: rtl_bt/rtl8821a_config.bin -> rtl8821c_config.bin
> @@ -3794,6 +3796,8 @@ File rtl_bt/rtl8822cu_config.bin came directly from Realtek.
>  Found in vendor driver, 20200806_LINUX_BT_DRIVER_RTL8761B_COEX_v0202.zip
>  File rtl_bt/rtl8761b_fw.bin
>  File rtl_bt/rtl8761b_config.bin
> +File rtl_bt/rtl8761bu_fw.bin
> +File rtl_bt/rtl8761bu_config.bin
>  --------------------------------------------------------------------------
>
>  Driver: btmtk_usb - Bluetooth USB driver
> diff --git a/rtl_bt/rtl8761bu_config.bin b/rtl_bt/rtl8761bu_config.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..91d3f4402289e7b0efd395c7fcc8b4789465aba6
> GIT binary patch
> literal 6
> NcmWGtt=!JQ000Mk0jmH2
>
> literal 0
> HcmV?d00001
>
> diff --git a/rtl_bt/rtl8761bu_fw.bin b/rtl_bt/rtl8761bu_fw.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..4bdc3a32ee634b3c66df0adcfa026352fe9993d3
> GIT binary patch
> literal 34796
> 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
>
> literal 0
> HcmV?d00001
>
> --
> 2.31.1
>
