Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADC7FA3740
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Oct 2022 16:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B428EC43142; Mon, 24 Oct 2022 16:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F22FC433D6
	for <linux-firmware@kernel.org>; Mon, 24 Oct 2022 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666627606;
	bh=Cr4173dFd1wBfirqot+69yvqtny0fl+BI1AkUoo5eOg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OjTSG32iPeiqTjU2JMPr7FzX/ULFx4hluax8UZ27+29bacv5xGfiLzqXtyXNbxKYX
	 bn5GrlUCDvScGqkuf80QdtEq+lZtfC7vrd09KqRSFyRDt0LovEDQr9pakBOf+e82ZP
	 fECzZf20iG0Glsc91yoOjelrfePqCk6mkj8/ui5VImgdCzASKGaA7gPZEcfwSumrzL
	 H34eN2kxNScBWlJM3xczr8Ti0b82SRiSHMA/cejZoPUeYTBQob6Y1pJV7VEZTEvsR8
	 6INc2Y0aVeUVTUkNpuFXsaF1gJWcR9QruZRSRtpk3RFA3ETfRIpNrDLZCmQrRMlMYy
	 uPr0+Z5u+aR2w==
Received: by mail-oi1-f175.google.com with SMTP id n83so11285593oif.11
        for <linux-firmware@kernel.org>; Mon, 24 Oct 2022 09:06:46 -0700 (PDT)
X-Gm-Message-State: ACrzQf1cEOOFRqNBktBiu4p3fpYVrbuQUrD6UTmeuQBzxBHw64FGfBmw
	1P5GcJl4X/xgBydGlbPLdpxQmPK8LudY0H1uEFk=
X-Google-Smtp-Source: AMsMyM4AVeYAEpVyuxM9MHrZW7TPg9bOIELrcX7mdR6/5FLVRKAm061ESrifx6nINdGFuf7yeidDnxKSDay39POYrkw=
X-Received: by 2002:a05:6808:1986:b0:355:3525:8fb with SMTP id
 bj6-20020a056808198600b00355352508fbmr16819037oib.3.1666627605725; Mon, 24
 Oct 2022 09:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <fba70e8292fe40a88511c5d333564c9b@realtek.com>
In-Reply-To: <fba70e8292fe40a88511c5d333564c9b@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Oct 2022 12:06:35 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5TB=JURZTMD=iTYtvUrjezcf0nGZEWr7sJBbPhrrt+uQ@mail.gmail.com>
Message-ID: <CA+5PVA5TB=JURZTMD=iTYtvUrjezcf0nGZEWr7sJBbPhrrt+uQ@mail.gmail.com>
Subject: Re: pull request: update Realtek 8188FU, 8192eu and 8852b firmware
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	Jes Sorensen <jes.sorensen@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 2:14 AM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Hi,
>
> This pull-request is to update firmware from Realtek. That includes three
> firmware:
>  1. rtlwifi: Add firmware v4.0 for RTL8188FU
>     I have sent before, so please ignore previous pull-request [1].
>  2. rtlwifi: update firmware for rtl8192eu to v35.7
>     I revise commit message and check firmware content from [2].
>  3. rtw89: 8852b: update fw to v0.27.32.1
>
> Thank you
> Ping-Ke
>
> [1] https://lore.kernel.org/linux-firmware/fabce04424f945a7a51cc466919d4a01@realtek.com/T/#u
> [2] https://lore.kernel.org/linux-firmware/20221014132729.2107129-1-james.hilliard1@gmail.com/
>
> ---
> The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
>
>   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD
>
> for you to fetch changes up to dae5d4603b0795a0ed42b9d5a6f4c4b5fbaa362d:
>
>   rtw89: 8852b: update fw to v0.27.32.1 (2022-10-20 13:45:49 +0800)
>
> ----------------------------------------------------------------
> Bitterblue Smith (1):
>       rtlwifi: Add firmware v4.0 for RTL8188FU
>
> James Hilliard (1):
>       rtlwifi: update firmware for rtl8192eu to v35.7
>
> Ping-Ke Shih (1):
>       rtw89: 8852b: update fw to v0.27.32.1

Pulled and pushed out.

josh

>
>  WHENCE                       |  11 ++++++++++-
>  rtlwifi/rtl8188fufw.bin      | Bin 0 -> 21020 bytes
>  rtlwifi/rtl8192eu_nic.bin    | Bin 31818 -> 32286 bytes
>  rtlwifi/rtl8192eu_wowlan.bin | Bin 25878 -> 29008 bytes
>  rtw89/rtw8852b_fw.bin        | Bin 1029056 -> 1035232 bytes
>  5 files changed, 10 insertions(+), 1 deletion(-)
>  create mode 100644 rtlwifi/rtl8188fufw.bin
>
