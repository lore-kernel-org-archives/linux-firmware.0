Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDDC4332F
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Nov 2022 17:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B334C4347C; Wed,  9 Nov 2022 17:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6519FC43470
	for <linux-firmware@kernel.org>; Wed,  9 Nov 2022 17:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668016623;
	bh=X4sPsBLpGApv2bpx2u4MSQ+yplOdy185tUX0FgaV3Nc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PL0uP7clH9CmZYaX4C4e0ioOlqB9+WxBJ7DFTJ7BIUYOKlo/N7CsmKwqUvm39UhFF
	 ifDO934dkYV7Wp1Fy0miEkWCfxxam5FiYfvSudq7hAl7m42PGU+E6DXLEhXcsyql4a
	 NC7Xb78sjM9k0wlHPjM+Bk3UcnIqkRlueDJbW+D941Zs9U+UY+AZbhGWTNVG4suToA
	 tndwhtsXMtGKQOfD9dYQQX+NRWgo59X4fls3HgahVm7ekNh7Ggma+O796W7GQ8AnhB
	 dAOJ90q2HzZIapOc1acQxI3QYXI85Bo236CFxZnOLifOuyG+VOibw9tQGjybwiWtE9
	 qgv2QL6mkp9yA==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13bd19c3b68so20458223fac.7
        for <linux-firmware@kernel.org>; Wed, 09 Nov 2022 09:57:03 -0800 (PST)
X-Gm-Message-State: ACrzQf3unblcCtnMU84KoL31wJPePszzUJxAr8eezoftb7zWD2iF51X6
	SPUeIk7couH+xf/7bu0qFZP9ZxSrnZ4ZGjLZkEY=
X-Google-Smtp-Source: AMsMyM4Ey+bWdhzuw0hai8ycSdF5ZLdmHmCXW/eUgS9+lUWnDNOnwievdGEXU3iIGFMxAanJJqesPRwep9V7IzSA5t0=
X-Received: by 2002:a05:6871:723:b0:13b:f919:3146 with SMTP id
 f35-20020a056871072300b0013bf9193146mr37124179oap.267.1668016622604; Wed, 09
 Nov 2022 09:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20221108170301.8539-1-oleksandr.mazur@plvision.eu>
In-Reply-To: <20221108170301.8539-1-oleksandr.mazur@plvision.eu>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Nov 2022 12:56:51 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5xbNx+N5DG9Hg85mqmX5=obktpP3wA1-8N1Zbc8fHWUg@mail.gmail.com>
Message-ID: <CA+5PVA5xbNx+N5DG9Hg85mqmX5=obktpP3wA1-8N1Zbc8fHWUg@mail.gmail.com>
Subject: Re: [GIT PULL] linux-firmware: mrvl: prestera: Update Marvell
 Prestera Switchdev v4.1
To: Oleksandr Mazur <oleksandr.mazur@plvision.eu>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, mickeyr@marvell.com, serhiy.boiko@plvision.eu, 
	serhiy.pshyk@plvision.eu, taras.chornyi@plvision.eu, vadym.kochan@plvision.eu, 
	volodymyr.mytnyk@plvision.eu, yevhen.orlov@plvision.eu, 
	maksym.glubokiy@plvision.eu
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Tue, Nov 8, 2022 at 12:03 PM Oleksandr Mazur
<oleksandr.mazur@plvision.eu> wrote:
>
> The following changes since commit 8bb75626e9dd831d323c4e460414b56260f0b700:
>
>   Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-31 11:12:54 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/PLVision/linux-firmware/ prestera-v4.1
>
> for you to fetch changes up to b15fc2134a655900168832efea6ae49d96a003c7:
>
>   WHENCE: mrvl: prestera: Add WHENCE entries for newly updated 4.1 FW images (2022-11-08 18:42:45 +0200)
>
> ----------------------------------------------------------------
> Oleksandr Mazur (2):
>       mrvl: prestera: Update Marvell Prestera Switchdev FW to v4.1
>       WHENCE: mrvl: prestera: Add WHENCE entries for newly updated 4.1 FW images
>
>  WHENCE                                        |   2 ++
>  mrvl/prestera/mvsw_prestera_fw-v4.1.img       | Bin 0 -> 15369292 bytes
>  mrvl/prestera/mvsw_prestera_fw_arm64-v4.1.img | Bin 0 -> 17505368 bytes
>  3 files changed, 2 insertions(+)
>  create mode 100644 mrvl/prestera/mvsw_prestera_fw-v4.1.img
>  create mode 100644 mrvl/prestera/mvsw_prestera_fw_arm64-v4.1.img
