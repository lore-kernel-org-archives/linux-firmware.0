Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0539CC433B4
	for <linux-firmware@archiver.kernel.org>; Sat,  3 Apr 2021 12:31:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B26026120F; Sat,  3 Apr 2021 12:31:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D874611ED
	for <linux-firmware@kernel.org>; Sat,  3 Apr 2021 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617453061;
	bh=xIkhapfkM8jw0JH90c1XFJxb+XxZLs8cUkwqJ33xrZw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Z5H4uKNN+He6bdyrY7PjWviEFC/ZaJXjOONj4ZzQzUhwzftkgZYn/071fSLraPzp8
	 e1QZ4PiYaVAsRG1prspAXuZSlMYMiMsclVVDvMMUrTTzCmkIgSxMhJ+xvGdCeb9gq+
	 ObAtK9tYLkLRi3yXxCoKCyt0I9l5trWRHgSvmJj97MUbfqenCqGYVA6RQWdkE+ypR7
	 lnknaBFRdRy/Nune20sE/HPF1+5kCTuoHCyNumEe5AOQhoHeTd4dtLGlXVWjJDUyIk
	 qFVfr1Nbndx4r+0XcbxmmpoL9J20y1xORkRDvrnr6ZxJJv/gnb02X4/1QrBdFl77Ki
	 3TQ/YzslsVBFQ==
Received: by mail-io1-f49.google.com with SMTP id f19so7725867ion.3
        for <linux-firmware@kernel.org>; Sat, 03 Apr 2021 05:31:01 -0700 (PDT)
X-Gm-Message-State: AOAM531x0VhwFBI8+DXfr8Bt077wtQeNcahsfXpt3l+iK2kplCrl7pMl
	wwDHX6PFmAZLcFd0eUraEopsRIC6aiWJnAUp2bU=
X-Google-Smtp-Source: ABdhPJy2mxg2dAlu9bG+r56vdVDxL6HCX4xHip8RkxKQ3ZhiARCL/erOGCidpEzJsNfsU0WTxjWzTdQ0FRC4pwXtzyI=
X-Received: by 2002:a02:9382:: with SMTP id z2mr16909679jah.120.1617453060985;
 Sat, 03 Apr 2021 05:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210325221547.22966-1-hdegoede@redhat.com> <20210325221547.22966-3-hdegoede@redhat.com>
In-Reply-To: <20210325221547.22966-3-hdegoede@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 3 Apr 2021 08:30:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6v+nxBrKRPvP26pCkSw6FkUvLbDQ9DZpzzmwfcBYVKLQ@mail.gmail.com>
Message-ID: <CA+5PVA6v+nxBrKRPvP26pCkSw6FkUvLbDQ9DZpzzmwfcBYVKLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] rtl_bt: Add rtl8723bs_config-OBDA0623.bin symlink
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

All 3 applied and pushed out.

josh

On Thu, Mar 25, 2021 at 6:16 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Some x86/ACPI devices such as the Acer Aspire Switch 10E (SW3-016),
> use an alternative ACPI hardware-id (HID) for the BT part of the
> RTL8723BS chip.
>
> Instead of using the standard OBDA8723 HID this device uses a HID
> of OBDA0623. Despite using a different HID it does work fine with
> the default config settings from the rtl8723bs_config-OBDA8723.bin
> file. Add a symlink to that file, to fix BT not working on this
> device due to a missing config file.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index 4483297..4070103 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3717,6 +3717,7 @@ File: rtl_bt/rtl8723a_fw.bin
>  File: rtl_bt/rtl8723b_fw.bin
>  File: rtl_bt/rtl8723bs_fw.bin
>  File: rtl_bt/rtl8723bs_config-OBDA8723.bin
> +Link: rtl_bt/rtl8723bs_config-OBDA0623.bin -> rtl8723bs_config-OBDA8723.bin
>  File: rtl_bt/rtl8761a_fw.bin
>  File: rtl_bt/rtl8812ae_fw.bin
>  File: rtl_bt/rtl8821a_fw.bin
> --
> 2.30.2
>
