Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FD9C05027
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Feb 2023 19:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BA91C433D2; Fri, 10 Feb 2023 19:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E87C433EF
	for <linux-firmware@kernel.org>; Fri, 10 Feb 2023 19:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676057718;
	bh=Xayb9wY4iDm/Rf4ns9pmmsdR7uI7yEm3fNx2oeJyM58=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IYnC8Yr1/V7uSt/07xzo6x0cVyU6aACB9kEbDAuNotGXhwgBfviPvM3a56wRjMcky
	 C3AaD0VdduwtNMeHL5uyuh35UYlXfRj9zg/hTnUIfRCTtZvjOk9x+Lza1BTsJJOb8f
	 Mo4BB6REayYF4G0+VSRU7SmQpMBOqaEElivhY26dMOSnQA23tOldg7XbS3rHgKPmiF
	 xATxKONMqe4WQILIbAuG99nDWx39+2PoV8s/FKHWjuYwlg1uzgXaXyQSqxi5sGXXc1
	 s47AEx8pU51djHmINE+XqanKYzzgQTxxSY7iMKVrNO+5CV9uwZEV/Ofu2vcGfQH6jl
	 mIycATbfeTgjA==
Received: by mail-yb1-f182.google.com with SMTP id o66so1701621ybc.0
        for <linux-firmware@kernel.org>; Fri, 10 Feb 2023 11:35:18 -0800 (PST)
X-Gm-Message-State: AO0yUKXGrXAvDrtQl2QRcwjz/INVFUhjCaI3Z1sMid8B9v8zSQO+DbnC
	44u9LmnzbrEtRKIg2hvcKn/N7O5QabCt6JdjJ5E=
X-Google-Smtp-Source: AK7set/APspItif4YmW4hUFFTbAwmn7vbzEWa0MNv6Ah3Ybj8oFCby98+cK8nipe8klk//oFFy2mqgEO9fzwe9iazx0=
X-Received: by 2002:a5b:b8f:0:b0:8ca:26ed:3f59 with SMTP id
 l15-20020a5b0b8f000000b008ca26ed3f59mr839604ybq.375.1676057717337; Fri, 10
 Feb 2023 11:35:17 -0800 (PST)
MIME-Version: 1.0
References: <004601d93a39$dcb02ae0$961080a0$@opensource.cirrus.com>
In-Reply-To: <004601d93a39$dcb02ae0$961080a0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Feb 2023 14:35:06 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7bWCL7-wS8NZYPThqKb7VKmKGHyOQyWEd5cHoAAAeJ4g@mail.gmail.com>
Message-ID: <CA+5PVA7bWCL7-wS8NZYPThqKb7VKmKGHyOQyWEd5cHoAAAeJ4g@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for additional laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 6, 2023 at 9:47 AM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Hi,
>
>
>
> We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for an ASUS Laptop UM3402.
>
> Additionally, we have also added missing tuning files for 2 existing HP laptops.
>
>
>
> Thanks,
>
> Stefan Binding
>
>
>
> The following changes since commit 5c11a3742947810ee8bffbd476eb5a1b0c7999f2:
>
>
>
>   amdgpu: Add VCN 4.0.2 firmware (2023-01-25 07:40:41 -0500)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware.git for-upstream

Pulled and pushed out.

josh

>
>
>
> for you to fetch changes up to 2fd61bc5d6d33e6804810418da96b58a0f00a41a:
>
>
>
>   linux-firmware: Add firmware for Cirrus CS35L41 on UM3402 ASUS Laptop (2023-02-06 14:34:10 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Stefan Binding (2):
>
>       linux-firmware: Add missing tuning files for HP Laptops using Cirrus Amps
>
>       linux-firmware: Add firmware for Cirrus CS35L41 on UM3402 ASUS Laptop
>
>
>
> WHENCE                                              |  14 ++++++++++++++
>
> cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin | Bin 0 -> 2012 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin | Bin 0 -> 2012 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin | Bin 0 -> 2012 bytes
>
> cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin | Bin 0 -> 2012 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin | Bin 0 -> 5532 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin | Bin 0 -> 5532 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin | Bin 0 -> 5532 bytes
>
> cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin | Bin 0 -> 5532 bytes
>
> 9 files changed, 14 insertions(+)
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin
