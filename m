Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA988C3F2D7
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Mar 2020 13:09:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DE9C821D56; Mon,  2 Mar 2020 13:09:31 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BDA762173E
	for <linux-firmware@kernel.org>; Mon,  2 Mar 2020 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583154571;
	bh=lySI/q75avm0slYlcnqNpqtbekCD9iVQ6o75C0gOMG4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VvgiCAijrO3mtCLd+ncALQpMfirP9wU9vvUN2U8gocNbBzO4wPTkdZiiffB05ga9o
	 0RC9JenT5TOv3lFKAdXSuWUeB/ZA8XkasHsbuz2ZSfkp1ep2IfINLYaOrDssJnYaMC
	 es7oXaNfIsgn6uJqV7cXCcncntbmT0qagjSbJ1iU=
Received: by mail-io1-f41.google.com with SMTP id w9so11370789iob.12
        for <linux-firmware@kernel.org>; Mon, 02 Mar 2020 05:09:31 -0800 (PST)
X-Gm-Message-State: ANhLgQ3Mvkeju79GUjJFQXLi8x3T9LPwu1ue8g2hfUuQze83y6cjUW+h
	DhyOd+XxHhxLnh9q4XxKNOenzZcoW1hfKyoD+Bw=
X-Google-Smtp-Source: ADFU+vvfWj1FM/8m7eNLOFsFFDPdjC2WNyiQOetmEowFdSlzWVVef8xXNn/NN799oCKPpvDeg1nmmny/Y2sqbS2j7Zs=
X-Received: by 2002:a5d:9ccc:: with SMTP id w12mr1897573iow.206.1583154571182;
 Mon, 02 Mar 2020 05:09:31 -0800 (PST)
MIME-Version: 1.0
References: <87e4fd88a5a72fe40fe83d31a0762c95@codeaurora.org>
In-Reply-To: <87e4fd88a5a72fe40fe83d31a0762c95@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Mar 2020 08:09:20 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5uLE06wfikBeqxqSydTgi1B5GXvsaYsUb=ZsKkLm0rVw@mail.gmail.com>
Message-ID: <CA+5PVA5uLE06wfikBeqxqSydTgi1B5GXvsaYsUb=ZsKkLm0rVw@mail.gmail.com>
Subject: Re: [PULL] btqca firmware 20200229
To: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 28, 2020 at 10:01 PM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit
> efcfa03ae6100dfe523ebf612e03c3a90fc4c794:
>
>     linux-firmware: Update firmware file for Intel Bluetooth AX201
> (2020-02-24 16:54:19 +0530)
>
> are available in the Git repository at:
>
>     https://github.com/rjliao-qca/qca-btfw.git

Pulled and pushed out.

josh

>
> for you to fetch changes up to 2db3978ce4a0c5b8ab04a81701b4eb010c721b2d:
> ----------------------------------------------------------------
> Rocky Liao (1):
>         qca: Fix blueooth firmware name for QCA6174 (2020-02-29 09:20:06
> +0800)
>
>   WHENCE                        |   2 --
>   qca/rampatch_00440302.bin     | Bin 64940 -> 66332 bytes
>   qca/rampatch_00440302.tlv     | Bin 66332 -> 0 bytes
>   qca/rampatch_usb_00000302.bin | Bin 64168 -> 66964 bytes
>   qca/rampatch_usb_00000302.tlv | Bin 66964 -> 0 bytes
>   5 files changed, 2 deletions(-)
>   delete mode 100644 qca/rampatch_00440302.tlv
>   delete mode 100644 qca/rampatch_usb_00000302.tlv
>
>
>
>
