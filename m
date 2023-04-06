Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645E9C76196
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Apr 2023 11:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24D42C4339E; Thu,  6 Apr 2023 11:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6EFC4339C;
	Thu,  6 Apr 2023 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680780578;
	bh=u2VzX8NXGwIpE7sYmKgdhvAa1066NHln6fAaJSoi+Rg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MwFXFpAzX6xdbVIPd2sh7eWo9V8VtGjIxUoXrqnV+m1jRO/JvabK7XF1RFfMH4sg/
	 MLSVAhvuMgBL1G4yJyd2kdyYB06diMU6sOZquj58EXtAKTJYQ4uEtYVrJelc7MLpM+
	 dtMlo3p/DASShpmLvPiSgbIZcRjtIAeUVvXE9I98t65YGg1hW08GD0/DxDc4BPiy3N
	 7fe5ZmqnDhwme0JS7kMgRS6MIQQ8OMA+sZHoYhKdz2PD3+U6eD2CCSquqt7z/dn5YB
	 TkA+O0erHDYiIdrhiwB8QWhmzAyHXlB0ymqzdNL4OzyGih5v34YZmXTOa6vjb5JuLC
	 LzOENAnqgdpfQ==
Received: by mail-yb1-f181.google.com with SMTP id j7so45781182ybg.4;
        Thu, 06 Apr 2023 04:29:37 -0700 (PDT)
X-Gm-Message-State: AAQBX9f70J6qMtkWJ/shOnyM2SylHinAAjn3/FnnsZhWKMKp6Y1TNucu
	1wHXTT6w/GVIS/ZFQojp+tyOYMIW0CVjlkrY9MY=
X-Google-Smtp-Source: AKy350ZUb7CzOMChMvtBqAf2Ouc+5U2rsElMXaijjVDj3r0F+Lv3pwbu6YpOsXFKKAOxVVeeX6JAc6hd0ixHytAEPAE=
X-Received: by 2002:a25:3753:0:b0:b8b:fd21:2e63 with SMTP id
 e80-20020a253753000000b00b8bfd212e63mr599755yba.2.1680780577053; Thu, 06 Apr
 2023 04:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <87cz4ia35m.fsf@kernel.org>
In-Reply-To: <87cz4ia35m.fsf@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 6 Apr 2023 07:29:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6=PoB=+GiKuZMYXY=fTOxVY-SrUDyAWxzOyEP5oqxdxA@mail.gmail.com>
Message-ID: <CA+5PVA6=PoB=+GiKuZMYXY=fTOxVY-SrUDyAWxzOyEP5oqxdxA@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230405
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 5, 2023 at 9:07=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wrote:
>
> Hi,
>
> Here's a pull request for ath10k and ath11k. For ath10k we have lots of
> board file updates in multiple hardware families. For ath11k we have new
> firmware branches for QCN9074, IPQ6018 and IPQ8074. WCN6750 also got a
> firmware update and WCN6855 has board file updates.
>
> Please let me know if there are any problems.
>
> Kalle
>
>
> The following changes since commit 2e92a49f90f73c8edc44b25c6e669d5e70893c=
90:
>
>   nvidia: update Tu10x and Tu11x signed firmware to support newer Turing =
HW (2023-04-04 08:03:53 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git =
ath10k-20230405

Pulled and pushed out.

josh

>
> for you to fetch changes up to d1dc30480fef478b06827a428970ef5d763ed76e:
>
>   ath11k: WCN6855 hw2.0: update board-2.bin (2023-04-05 15:56:21 +0300)
>
> ----------------------------------------------------------------
> Kalle Valo (12):
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA6174 hw3.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: QCA9984 hw1.0: update board-2.bin
>       ath10k: QCA99X0 hw2.0: update board-2.bin
>       ath11k: IPQ6018 hw1.0: update board-2.bin
>       ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: IPQ8074 hw2.0: update board-2.bin
>       ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: QCN9074 hw1.0: update to WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: WCN6750 hw1.0: update to WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1
>       ath11k: WCN6855 hw2.0: update board-2.bin
>
>  WHENCE                           |   8 +++----
>  ath10k/QCA4019/hw1.0/board-2.bin | Bin 1154076 -> 1798148 bytes
>  ath10k/QCA6174/hw3.0/board-2.bin | Bin 731852 -> 740076 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin | Bin 145684 -> 206444 bytes
>  ath10k/QCA9984/hw1.0/board-2.bin | Bin 220528 -> 281312 bytes
>  ath10k/QCA99X0/hw2.0/board-2.bin | Bin 157680 -> 169824 bytes
>  ath11k/IPQ6018/hw1.0/board-2.bin | Bin 787208 -> 787208 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.b01   | Bin 6712 -> 6712 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.b02   | Bin 294912 -> 294912 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.mdt   | Bin 6860 -> 6860 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b00   | Bin 340 -> 340 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b01   | Bin 7000 -> 7000 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b02   | Bin 4696 -> 4696 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b03   | Bin 2557136 -> 2602320 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b04   | Bin 412064 -> 386016 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b05   | Bin 198052 -> 202532 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b07   | Bin 9416 -> 9912 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b08   | Bin 453364 -> 464564 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.mdt   | Bin 7340 -> 7340 bytes
>  ath11k/IPQ8074/hw2.0/board-2.bin | Bin 1311380 -> 1311380 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b01   | Bin 136 -> 136 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b02   | Bin 327680 -> 327680 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.mdt   | Bin 284 -> 284 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b00   | Bin 340 -> 340 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b01   | Bin 328 -> 328 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b02   | Bin 4696 -> 4696 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b03   | Bin 2934864 -> 2978704 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b04   | Bin 1009888 -> 982944 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b05   | Bin 243652 -> 248260 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b07   | Bin 9816 -> 10112 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b08   | Bin 486546 -> 504104 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.mdt   | Bin 668 -> 668 bytes
>  ath11k/QCN9074/hw1.0/amss.bin    | Bin 11905872 -> 3963336 bytes
>  ath11k/QCN9074/hw1.0/m3.bin      | Bin 340108 -> 340108 bytes
>  ath11k/WCN6750/hw1.0/Notice.txt  |  48 ++++++++++++++++++++++++++++-----=
------
>  ath11k/WCN6750/hw1.0/wpss.b00    | Bin 340 -> 340 bytes
>  ath11k/WCN6750/hw1.0/wpss.b01    | Bin 6848 -> 6848 bytes
>  ath11k/WCN6750/hw1.0/wpss.b02    | Bin 10300 -> 10300 bytes
>  ath11k/WCN6750/hw1.0/wpss.b03    | Bin 4096 -> 4096 bytes
>  ath11k/WCN6750/hw1.0/wpss.b04    | Bin 5783231 -> 5819999 bytes
>  ath11k/WCN6750/hw1.0/wpss.b05    | Bin 175236 -> 164332 bytes
>  ath11k/WCN6750/hw1.0/wpss.b06    | Bin 266684 -> 266684 bytes
>  ath11k/WCN6750/hw1.0/wpss.b07    | Bin 1176368 -> 1176368 bytes
>  ath11k/WCN6750/hw1.0/wpss.mdt    | Bin 7188 -> 7188 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin | Bin 6158196 -> 6278772 bytes
>  45 files changed, 39 insertions(+), 17 deletions(-)
