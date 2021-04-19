Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4218C433ED
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 14:08:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 96AE661157; Mon, 19 Apr 2021 14:08:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D4FA60698
	for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618841333;
	bh=jKRwc1ELyZP4wOKCi1hl0nSkEqniR1YWg1ZOo7CxWU0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Xjl20PmjN9BWYb26Zzmz4zCewUyRX7z1ZhFCO9OJBdcuWL62L3PWH/JN8qpFjcUFf
	 8i8IMQ8j77oVG6mEpFzHH80Gv7cteR8BHvbgJ4MQ1to1uD5C1UxvA8TViV7alqMBto
	 RPiT/GMw3nPSOL6TXx26oTZInAOS0pLZdjvyokyUIoNS4bzRNKbei90xARyiL59sih
	 N7R0l2UK8A/eg4IjwTxk5aJ8hkd1JFG5CCFKRGLVCQ9JPuWNFE4WZruVG9n+HRYhda
	 BxbZr4RsTf/5KB1MCegrki5pJ0FCNMsTUgJ/VzUNiHIvWNy9hgYG5OOq9f61R2c5EV
	 KIG+h3U1ELzUA==
Received: by mail-io1-f47.google.com with SMTP id e186so34988294iof.7
        for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 07:08:53 -0700 (PDT)
X-Gm-Message-State: AOAM532gWMzHzJjRXdZbtQDktmxG5hagI1CePVnl9I36Aw8woRNftown
	DS5pRjfRlHR/pZ6FVmnNuQLEfLszJKnamxhbnTY=
X-Google-Smtp-Source: ABdhPJx1OSG+1egKTVtVXIyjQOedXu6AGrOf/08BRsdDX12bnQ4UwcG5zHuEEpSnVvFp5AXkXkyv5tP7u5U5KTJf4nQ=
X-Received: by 2002:a5d:9401:: with SMTP id v1mr15057266ion.101.1618841332845;
 Mon, 19 Apr 2021 07:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <YG8o0cMVPS113OuK@photino.stro.at>
In-Reply-To: <YG8o0cMVPS113OuK@photino.stro.at>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Apr 2021 10:08:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6xiLq+bukZRgKAF47MYEVB209_F=QNqQXwa1Z03nfSFA@mail.gmail.com>
Message-ID: <CA+5PVA6xiLq+bukZRgKAF47MYEVB209_F=QNqQXwa1Z03nfSFA@mail.gmail.com>
Subject: Re: simple fix for missing rtl8821a config file
To: maximilian attems <maks@stro.at>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Thu, Apr 8, 2021 at 12:01 PM maximilian attems <maks@stro.at> wrote:
>
> Please pull from main for single commit
>
> gitolite.kernel.org:pub/scm/linux/kernel/git/maks/linux-firmware.git
>
>
> with minimal fix concerning the aformentioned rtl8821a bug:
> https://lore.kernel.org/linux-firmware/YCKZE3lhjtOdUT0i@photino.stro.at/T/#u
>
>
>
> From 4374e10e2605957f7b1ae711c665914e70853a46 Mon Sep 17 00:00:00 2001
> From: maximilian attems <maks@stro.at>
> Date: Sun, 14 Mar 2021 17:46:46 +0100
> Subject: [PATCH] WHENCE: link to similar config file for rtl8821a support
>
> linux-firmware ships no config file for rtl8821a, as it seems
> quite similar to rtl8821c add symlink to that config file
> see https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1784835
> (Maintainers may replace with proper file).
>
> fixes: https://bugs.debian.org/893912
>
> -- error
> [    2.574742] Bluetooth: hci0: rtl: loading rtl_bt/rtl8821a_config.bin
> [    2.575137] bluetooth hci0: firmware: failed to load
> rtl_bt/rtl8821a_config.bin (-2)
> [    2.575143] bluetooth hci0: Direct firmware load for
> rtl_bt/rtl8821a_config.bin failed with error -2
> [    2.575145] Bluetooth: hci0: Failed to load rtl_bt/rtl8821a_config.bin
> --
>
> -- with config file
> [   26.389532] Bluetooth: hci0: RTL: rtl: examining hci_ver=06
> hci_rev=000a lmp_ver=06 lmp_subver=8821
>
> [   26.390623] Bluetooth: hci0: RTL: rom_version status=0 version=1
>
> [   26.390624] Bluetooth: hci0: RTL: rtl: loading rtl_bt/rtl8821a_fw.bin
>
> [   26.392597] bluetooth hci0: firmware: direct-loading firmware
> rtl_bt/rtl8821a_fw.bin
> [   26.392605] Bluetooth: hci0: RTL: rtl: loading rtl_bt/rtl8821a_config.bin
>
> [   26.392748] bluetooth hci0: firmware: direct-loading firmware
> rtl_bt/rtl8821a_config.bin
> [   26.392757] Bluetooth: hci0: RTL: cfg_sz 10, total sz 17438
> --
>
> Cc: Max Chou <max.chou@realtek.com>
> Reported-by: Kate Komi <katahipo@gmail.com>
> Signed-off-by: maximilian attems <maks@stro.at>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index f279af1..ea89177 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3680,6 +3680,7 @@ File: rtl_bt/rtl8723bs_config-OBDA8723.bin
>  File: rtl_bt/rtl8761a_fw.bin
>  File: rtl_bt/rtl8812ae_fw.bin
>  File: rtl_bt/rtl8821a_fw.bin
> +Link: rtl_bt/rtl8821a_config.bin -> rtl8821c_config.bin
>  File: rtl_bt/rtl8822b_fw.bin
>  File: rtl_bt/rtl8822b_config.bin
>  File: rtl_bt/rtl8723d_fw.bin
> --
> 2.30.2
>
>
