Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6224AC00140
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Aug 2022 11:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23102C433B5; Wed, 10 Aug 2022 11:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D98FC433C1
	for <linux-firmware@kernel.org>; Wed, 10 Aug 2022 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660132652;
	bh=yQtGcMn7SMCIGh2DFd3kGpXYZ8o8iIDNpa78EFvVMj4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qeO0ETi/EDRZtah3zU8crAyhwCH1kLfR6XqjQcC5haXSORKOljIfV4EfLVxa3IGSg
	 3M1XwSwYlOPcwdm2wWhekluVyE9kzGecMkVw6qEtpXa3HdaPFfRuK3SfMJu88GnKM9
	 g1BUK6hdYLUJbPBJ6NlDvNFV0nWSUlMvAoNefH9Z1eaPSzNS0kX5Vbj2MtaHpDCrHq
	 jQrmkwlOR1ZbYBrPz5wsfS0slknX8xSDg25OsLLwmUEv6IiToHJ9l1Qk+F+7EtL0AN
	 c/bFNbFnnevmDFKwKZW9HrqM1lVrbcm7A/3YE0ZTJbC91SlG7xWuHDAKMDk9N+CgLW
	 9OWEurWEimFbg==
Received: by mail-il1-f180.google.com with SMTP id j20so8131128ila.6
        for <linux-firmware@kernel.org>; Wed, 10 Aug 2022 04:57:31 -0700 (PDT)
X-Gm-Message-State: ACgBeo3tsasN12gfWymZJcKiMpLILqPiR5bm4lEzB608U80GEbN2xITf
	HwwD3MU5QbCN4q6K7H5hxj01Q/QZi0cxBHlQLMU=
X-Google-Smtp-Source: AA6agR5XnC7j30wEa7Vkeez3Wt//xcnW0gefuef5tGHAPYhySzFW9fE1dc6OZKmMbqYqd1HJnEGIYsfO47HIVEcjZbA=
X-Received: by 2002:a05:6e02:1b86:b0:2df:f7e:b780 with SMTP id
 h6-20020a056e021b8600b002df0f7eb780mr12267805ili.218.1660132651106; Wed, 10
 Aug 2022 04:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220809202950.297935-1-john.allen@amd.com>
In-Reply-To: <20220809202950.297935-1-john.allen@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 10 Aug 2022 07:57:20 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4eMozwhKqTG07bRSf2XAuFkvVNGNu+HTjtRuQLJyHprw@mail.gmail.com>
Message-ID: <CA+5PVA4eMozwhKqTG07bRSf2XAuFkvVNGNu+HTjtRuQLJyHprw@mail.gmail.com>
Subject: Re: [PATCH] Add amd-ucode README file
To: John Allen <john.allen@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 9, 2022 at 4:30 PM John Allen <john.allen@amd.com> wrote:
>
> Create new README file describing the microcode patch levels included in the
> microcode container files in the amd-ucode directory.
>
> Signed-off-by: John Allen <john.allen@amd.com>
> ---
>  amd-ucode/README | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 amd-ucode/README

This wasn't added to WHENCE and it caused check_whence.py to fail.  I
amended the patch to add an entry and pushed it out.

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=89ec6198f13d1007563ff87aae5de209e993be07

josh

>
> diff --git a/amd-ucode/README b/amd-ucode/README
> new file mode 100644
> index 0000000..f1ad2bb
> --- /dev/null
> +++ b/amd-ucode/README
> @@ -0,0 +1,41 @@
> +This repository includes microcode container files for family 15h, 16h,
> +17h, and 19h AMD CPUs. Microcode patches for families earlier than 15h are
> +included in the microcode_amd.bin microcode container file. The microcode
> +patches included in an AMD CPU microcode container file can be listed using
> +the script in the following git repository:
> +https://github.com/AMDESE/amd_ucode_info
> +
> +The microcode patches included in the container files in this directory are
> +listed below:
> +
> +Microcode patches in microcode_amd.bin:
> +  Family=0x10 Model=0x02 Stepping=0x02: Patch=0x01000083 Length=960 bytes
> +  Family=0x10 Model=0x02 Stepping=0x0a: Patch=0x01000084 Length=960 bytes
> +  Family=0x10 Model=0x06 Stepping=0x02: Patch=0x010000c7 Length=960 bytes
> +  Family=0x10 Model=0x05 Stepping=0x03: Patch=0x010000c8 Length=960 bytes
> +  Family=0x10 Model=0x09 Stepping=0x01: Patch=0x010000d9 Length=960 bytes
> +  Family=0x10 Model=0x08 Stepping=0x00: Patch=0x010000da Length=960 bytes
> +  Family=0x10 Model=0x05 Stepping=0x02: Patch=0x010000db Length=960 bytes
> +  Family=0x10 Model=0x0a Stepping=0x00: Patch=0x010000dc Length=960 bytes
> +  Family=0x11 Model=0x03 Stepping=0x01: Patch=0x02000032 Length=512 bytes
> +  Family=0x12 Model=0x01 Stepping=0x00: Patch=0x03000027 Length=960 bytes
> +  Family=0x14 Model=0x01 Stepping=0x00: Patch=0x05000029 Length=1568 bytes
> +  Family=0x14 Model=0x02 Stepping=0x00: Patch=0x05000119 Length=1568 bytes
> +
> +Microcode patches in microcode_amd_fam15h.bin:
> +  Family=0x15 Model=0x01 Stepping=0x02: Patch=0x0600063e Length=2592 bytes
> +  Family=0x15 Model=0x02 Stepping=0x00: Patch=0x06000852 Length=2592 bytes
> +  Family=0x15 Model=0x10 Stepping=0x01: Patch=0x06001119 Length=2592 bytes
> +
> +Microcode patches in microcode_amd_fam16h.bin:
> +  Family=0x16 Model=0x00 Stepping=0x01: Patch=0x0700010f Length=3458 bytes
> +
> +Microcode patches in microcode_amd_fam17h.bin:
> +  Family=0x17 Model=0x08 Stepping=0x02: Patch=0x0800820d Length=3200 bytes
> +  Family=0x17 Model=0x01 Stepping=0x02: Patch=0x0800126e Length=3200 bytes
> +  Family=0x17 Model=0x31 Stepping=0x00: Patch=0x08301055 Length=3200 bytes
> +
> +Microcode patches in microcode_amd_fam19h.bin:
> +  Family=0x19 Model=0x01 Stepping=0x00: Patch=0x0a001058 Length=5568 bytes
> +  Family=0x19 Model=0x01 Stepping=0x01: Patch=0x0a001173 Length=5568 bytes
> +  Family=0x19 Model=0x01 Stepping=0x02: Patch=0x0a001229 Length=5568 bytes
> --
> 2.25.1
>
