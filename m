Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEF2C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Nov 2021 17:28:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2724A60F6F; Tue, 23 Nov 2021 17:28:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10DD360F58
	for <linux-firmware@kernel.org>; Tue, 23 Nov 2021 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637688480;
	bh=t2feZgW3f0peTfx9k4KNTmmUCphjvHoh6a+m7xx129k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=X9BdWu6Lt44ARAS52rITl1wDmbNp6HWauqtEJxU0tAMHJ0VPL0M/YoYHtupa3ZMju
	 LG9ABQsRp7+lA9j/u5Bm7VMK/IbxzqRBfQJgC0vElZzfITmBZyIvuXz35TUqPejzKN
	 AOb0hqbjp8OMu/zUa4PGEEVHSirE532Mx2k0jJjMOKBENeaMI8v8zio6uyCCZN8fwz
	 Ck5xLzF5zMgxvw26KjVwVzb1Z8p+W0ijJMLtA8OSTXMsHEkC1Cd7finPybVi6vMvmn
	 RrmBYtrIubheiH3RVBgSfAXJ8hRd9mvIqNkfkGHQ17pTsZpvWIcbNUCJFzndBmVmUQ
	 LhRr+8urhsQUg==
Received: by mail-io1-f44.google.com with SMTP id p23so28958339iod.7
        for <linux-firmware@kernel.org>; Tue, 23 Nov 2021 09:28:00 -0800 (PST)
X-Gm-Message-State: AOAM531xATNi9jvLtCTalxtG/s/KbdQjgPeULwOHaycfhNBvBx2PZcnW
	5l/KkWMILD8l+nwuqFsuPHP67A59hd5UrtbeLEo=
X-Google-Smtp-Source: ABdhPJyM9Ym/8DyIJAceaQMWREpwsBeO6kqf1ODn7pmd38tEpfJ8vKHeuFh2bBgAtUTbZTRTukTIZoYakb0iOAaimvE=
X-Received: by 2002:a05:6638:1348:: with SMTP id u8mr8439474jad.95.1637688479424;
 Tue, 23 Nov 2021 09:27:59 -0800 (PST)
MIME-Version: 1.0
References: <b44d854c-571c-2e69-51ff-f17c13cb135d@redhat.com>
In-Reply-To: <b44d854c-571c-2e69-51ff-f17c13cb135d@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 Nov 2021 12:27:48 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5gy7Ae6V+12iy+Z9xFRNuQ2dTAHvatD+Wqug1OpdW1Aw@mail.gmail.com>
Message-ID: <CA+5PVA5gy7Ae6V+12iy+Z9xFRNuQ2dTAHvatD+Wqug1OpdW1Aw@mail.gmail.com>
Subject: Re: [linux-firmware GIT PULL] Update ath10k/QCA6174/hw3.0/board-2.bin
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, 
	Jouni Malinen <j@w1.fi>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 18, 2021 at 12:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Josh,
>
> Here is a linux-firmware pull-req to sync ath10k/QCA6174/hw3.0/board-2.bin
> with the latest version from:
> https://github.com/kvalo/ath10k-firmware/
>
> And add 2 entries with the board-parameters for 2 Microsoft Surface devices:
>
> Add eeprom_ar6320_3p0_TX8_clpc.bin used by the Windows drivers on the
> Microsoft Surface Go to board-2.bin with BoardName:
> "bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3370"
>
> Add eeprom_ar6320_3p0_Parsberg_clpc.bin used by the Windows drivers on the
> Microsoft Surface Laptop 3 to board-2.bin with BoardName:
> bus=pci,vendor=168c,device=003e,subsystem-vendor=045e,subsystem-device=0001
>
> The additions of these 2 extra entries has also been submitted
> to the ath10k-firmware git repo:
> https://github.com/kvalo/ath10k-firmware/pull/11/
>
> Regards,
>
> Hans
>
>
> The following changes since commit f5d519563ac9d2d1f382a817aae5ec5473811ac8:
>
>   linux-firmware: Update AMD cpu microcode (2021-11-15 12:49:19 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux-firmware.git hansg/QCA6174-ms-surface-board-data
>
> for you to fetch changes up to 4d74f4dec175363fa24c95702dd86f477cef232c:
>
>   Update ath10k/QCA6174/hw3.0/board-2.bin (2021-11-18 18:06:53 +0100)
>
> ----------------------------------------------------------------
> Hans de Goede (1):
>       Update ath10k/QCA6174/hw3.0/board-2.bin
>
>  ath10k/QCA6174/hw3.0/board-2.bin | Bin 633360 -> 715444 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.  Thanks.

josh
