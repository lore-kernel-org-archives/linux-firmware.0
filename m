Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748B2CAC5B0
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Sep 2025 12:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4412FC19422; Mon, 29 Sep 2025 12:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC2AC16AAE
	for <linux-firmware@kernel.org>; Mon, 29 Sep 2025 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759149551;
	bh=UPayV7sH9iZs2yD3LVHaRcURbvcQ0a/mJAvGuC63X8o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=puK0rOFskCmgbj136Nt7tAC0VYKChOz6DigbqT0J4HmZ5zklS0bpUI/xr4xPbK0Qk
	 i4MqkRsXlU2DBCxEiLQgf7rq9XsTCH+qrr7K1mTbOvJC2Hlvq2otys3Wvt5zZOoGQ3
	 f11aJRcFyaKXUBXwhRVaMrOn/y5lxbIpSVrh/8BzO5ExIQk7tsfiLh4uD4RYxmsd+f
	 y4EqijS4m6TZZVYGyXsxz5sZ0XYSNf7mmO8bbHWRoBP/mk8OELtF7+/B3DbfIMlwEt
	 7DgZQuIi3MrEHSI2aDMPIj6w86uLHxWCj0Vp5NaQzxOpgnLA1AGRo/0vSK4dnPTHJA
	 uH5s+pjE00tww==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d71bcab6fso47152087b3.0
        for <linux-firmware@kernel.org>; Mon, 29 Sep 2025 05:39:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWX4vVeKllmIMub4d+Gvrq9uBb4Gfuiz0HxWSePTUlmSaDDtY2oeURvcsMH5yf5LA7YLtq1A7Hdb9cCw9erLw==@kernel.org
X-Gm-Message-State: AOJu0YxAKYb1RIebHXp2cM7wnGx+v9XoW2hieErRYu3iE0wP3TsozeqU
	g4V/TedPSUDT2nMqH/LLJoC9uuh7xyDE7/yzrx57g3OlB39+0MqFDqgte8Uhc4ATXhVIgj9JH8R
	pEiVshvzOqdLeQbTz1vlXiBrcaXG5sC4=
X-Google-Smtp-Source: AGHT+IGBbqVPnO4g2RougADgIRndnc00QkyvpQ4fGXqajHkTlXUIa//TQhpF0x9rwfTVnpqIfxuGv8rANWtyDJ0gbXc=
X-Received: by 2002:a53:c787:0:b0:635:4ecc:fc2a with SMTP id
 956f58d0204a3-6361a85b56amr13479860d50.50.1759149550355; Mon, 29 Sep 2025
 05:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250928173234.233947-1-xose.vazquez@gmail.com>
In-Reply-To: <20250928173234.233947-1-xose.vazquez@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 29 Sep 2025 08:38:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA74pLZYkwocUuYcMLVpSLHM2W--siW5ZNXJ+kgm9NBhAQ@mail.gmail.com>
X-Gm-Features: AS18NWBmSjT-Uo8ouICHJp-1aG7AXhZ-YlyOU2hLz4GUJCH5a6YRDbftHIv6gGo
Message-ID: <CA+5PVA74pLZYkwocUuYcMLVpSLHM2W--siW5ZNXJ+kgm9NBhAQ@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: WHENCE: identify Qlogic firmware
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	QLOGIC-ML <GR-QLogic-Storage-Upstream@marvell.com>, 
	SCSI-ML <linux-scsi@vger.kernel.org>, FIRMWARE-ML <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 28, 2025 at 1:32=E2=80=AFPM Xose Vazquez Perez
<xose.vazquez@gmail.com> wrote:
>
> Info from:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D1bfa11db712cbf4af1ae037cd25fd4f781f0c215
>
> Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: QLOGIC-ML <GR-QLogic-Storage-Upstream@marvell.com>
> Cc: SCSI-ML <linux-scsi@vger.kernel.org>
> Cc: FIRMWARE-ML <linux-firmware@kernel.org>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
> If anyone is interested in this, NetBSD has different/newer versions:
> https://github.com/NetBSD/src/tree/trunk/sys/dev/microcode/isp
> ---
>  WHENCE | 4 ++++

I don't understand the point of this patch.  It's adding version
information from a patch sent 16 years ago, for firmware versions that
are 22-23 years old.  Nothing has needed this change for over two
decades, so why add this now?

josh

>  1 file changed, 4 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index bc807bd2..bf35f40e 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -70,8 +70,11 @@ Found in hex form in kernel source.
>  Driver: qla1280 - Qlogic QLA 1240/1x80/1x160 SCSI support
>
>  File: qlogic/1040.bin
> +Version: 7.65.06 Initiator/Target (14:38 Jan 07, 2002)
>  File: qlogic/1280.bin
> +Version: 8.15.11 Initiator (10:20 Jan 02, 2002)
>  File: qlogic/12160.bin
> +Version: 10.04.42 Initiator (15:44 Apr 18, 2003)
>
>  Licence: Redistributable. See LICENCE.qla1280 for details
>
> @@ -1590,6 +1593,7 @@ Licence: Redistributable. See LICENSE.conexant for =
details.
>  Driver: qlogicpti - PTI Qlogic, ISP Driver
>
>  File: qlogic/isp1000.bin
> +Version: 1.31.00 Initiator
>
>  Licence: Unknown
>
> --
> 2.51.0
>
