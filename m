Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F7BC433B4
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 13:07:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 183BE61208; Mon,  3 May 2021 13:07:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02B67611AD
	for <linux-firmware@kernel.org>; Mon,  3 May 2021 13:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620047238;
	bh=mHYCUssp3J0oFLV8Qj+wt02J/61PQDFfGqTU7ToyTJU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=hIsM/iBaSqEiAawZbpxetZpIxtHPDJv8CziZA4/zSIxcFE4sVYeAHL4bK1Ht6ILWL
	 v5TkVfn5gMX5EWd5JjX0XFDJ2NJgIy4DDr6++Zq5xpZP0pebsD7f0EVJYB8aF8KNBv
	 //RsY5wL2/kDnFqTApjtoY70oDN2VHwQmbTm+hDxvZzk1F19I2qtSSokw4CGifGJ6C
	 uYaKvbHX4t8QGnfW3tWKes+8BDWPlRDf1ZycpCxpXncZM0umUKrVUruWBl5Z/KbbnH
	 52pgA9vAtGibz44jRNLcsEbgw6QVGu/EOGR6UO4kXfbMHZZiQ4AS2ai3+nfZuoOGhu
	 ep7YmO69QpL8w==
Received: by mail-il1-f180.google.com with SMTP id p15so3630175iln.3
        for <linux-firmware@kernel.org>; Mon, 03 May 2021 06:07:17 -0700 (PDT)
X-Gm-Message-State: AOAM533YWggJbNvl/KMe0i8oSfoM6sQVaZTk4nezXZjI4vXgyXYHRXFz
	AoV2+CL94uWMAhmNLbN6bTnUAIZDXzfJ1GZajRM=
X-Google-Smtp-Source: ABdhPJyZW8DeEbGExdUNMBTSayH98n9xDCSbg5BQDQk6fEI8E0ErucAQVt5S9X40PWeG5HU8tRO0UtDy6jL5mK402HA=
X-Received: by 2002:a05:6e02:160d:: with SMTP id t13mr16526977ilu.85.1620047237273;
 Mon, 03 May 2021 06:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <e3fb2ef55263454495ed8b4aabfa77be@intel.com>
In-Reply-To: <e3fb2ef55263454495ed8b4aabfa77be@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 May 2021 09:07:06 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4ZcqSyvMg1tsy_gbnLgMzKtsDTJ+mESJcmEFjoGOyttQ@mail.gmail.com>
Message-ID: <CA+5PVA4ZcqSyvMg1tsy_gbnLgMzKtsDTJ+mESJcmEFjoGOyttQ@mail.gmail.com>
Subject: Re: I915 updates to be pulled to linux-firmware
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "ben@decadent.org.uk" <ben@decadent.org.uk>, 
	Kyle McMartin <kyle@mcmartin.ca>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 6:04 PM Srivatsa, Anusha
<anusha.srivatsa@intel.com> wrote:
>
> Sending PR for ADL-P:
>
>
>
> The following changes since commit fa0efeff4894e36b9c3964376f2c99fae101d147:
>
>
>
>   linux-firmware: Update firmware file for Intel Bluetooth AX210 (2021-04-26 07:00:56 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   git://anongit.freedesktop.org/drm/drm-firmware adlp_firmware
>
>
>
> for you to fetch changes up to 726645d0915c8506b491db23d3103f0027055ac5:
>
>
>
>   i915: Add ADL-P DMC Support (2021-04-27 09:32:13 -0700)
>
>
>
> ----------------------------------------------------------------
>
> Anusha Srivatsa (1):
>
>       i915: Add ADL-P DMC Support

This adds two new files but doesn't update WHENCE.  Please correct.

josh

>
>
>
> i915/adlp_dmc_ver2_09.bin | Bin 0 -> 44636 bytes
>
> i915/adlp_dmc_ver2_10.bin | Bin 0 -> 44616 bytes
>
> 2 files changed, 0 insertions(+), 0 deletions(-)
>
> create mode 100644 i915/adlp_dmc_ver2_09.bin
>
> create mode 100644 i915/adlp_dmc_ver2_10.bin
>
>
>
>
>
> Thanks,
>
> Anusha
