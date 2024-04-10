Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC08CD11C2
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Apr 2024 11:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5E61C43394; Wed, 10 Apr 2024 11:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D087BC43390
	for <linux-firmware@kernel.org>; Wed, 10 Apr 2024 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712749598;
	bh=H+ltWJTrCo8dAkDLOHCnfTU9X055aYq6FerReJVEQU4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=un79bBkjQtiu4AXFOuqBWUqWrKE2NrFzeGsyS95un8gsOWKrNwi68LyD3QDVNt0IO
	 EtxnioyHKJTNi+5XwUcsKAKNx4S6INPg19wpewkK1a6UHsk5l4BCmJE8MUMEEdYdHg
	 71J1gt37MMHtRoxn4moutl9B4nae+Jyyrra8Q6JF861KLQKyoFPiWJoltflnZvJzDx
	 UEOayzkdtu/4gwD8IKI7MSn8rhZRSZE29K8YSIsxXZ7fA3P7vI6e4bnPbT8lHJDiTP
	 y2b6plHjubqUgyymeXg0zsTpx8jq1CP5Npw17xRmIE0CSSMQ8vBjPUXYaB8rGzdtWm
	 58uTyM+gbcW9Q==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so6784589276.2
        for <linux-firmware@kernel.org>; Wed, 10 Apr 2024 04:46:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YwuZOsRmV94aTqyvmyIpXPEc347YDNZhA4XRzu1ZqdH2bRVBcIv
	Lk5cjrjHNP39zKRcwYSalND19UeXnGL1eLvuCg/Sd9K+vj8kbiV+QO8CP5eb3Qff5leqOyw/z/Y
	YvuIzUomiFzxyZ9ctesKFRkohx4g=
X-Google-Smtp-Source: AGHT+IGscNHInYs7CDsYy2rc+vs9zCMcROj27SxAQkw1qt7RRPJGJSIVkFJXaWYP64UZtB4m9xNghw6GJ6q3quU9p9A=
X-Received: by 2002:a5b:94a:0:b0:dda:a9cd:59c5 with SMTP id
 x10-20020a5b094a000000b00ddaa9cd59c5mr2464288ybq.40.1712749598059; Wed, 10
 Apr 2024 04:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240410111416.2204-1-irui.wang@mediatek.com>
In-Reply-To: <20240410111416.2204-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 10 Apr 2024 07:46:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5xfwVvLbKYNPKWJAqOw49VspoVnmHaZ0r2c4jBKNW85w@mail.gmail.com>
Message-ID: <CA+5PVA5xfwVvLbKYNPKWJAqOw49VspoVnmHaZ0r2c4jBKNW85w@mail.gmail.com>
Subject: Re: pull request: linux-firmware: mediatek: Update MT8173 VPU
 firmware to v1.1.9
To: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Longfei.Wang@mediatek.com, Yunfei.Dong@mediatek.com, 
	Andrew-CT.Chen@mediatek.com, tiffany.lin@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 7:14=E2=80=AFAM Irui Wang <irui.wang@mediatek.com> =
wrote:
>
> Dear linux-firmware maintainers,
>
> The following changes since commit 1addd7dca2d953a5484c3e3c08dbd7dc253058=
dd:
>
>   Merge branch 'rtw' into 'main' (2024-04-09 12:30:28 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.1.9.git v1.1.9

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/191

josh

>
> for you to fetch changes up to c81f094c847d934c0ffe0870fa5cf861c62e3451:
>
>   linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9 (2024-04=
-10 18:36:10 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
>
