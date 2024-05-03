Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1F3C10F16
	for <linux-firmware@archiver.kernel.org>; Fri,  3 May 2024 10:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A219C4AF19; Fri,  3 May 2024 10:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C72C4AF1A
	for <linux-firmware@kernel.org>; Fri,  3 May 2024 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714733893;
	bh=s4Uw4eLWQcNump04Nl7nTG409+3jYVtZIOo7NApN/n4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ljUqgPeBnhZ5zQvt6xvRaia/mf95eEIGy+JIk+FKlo2v5f980ksF/7j9qZCUoaXzj
	 4t0F92PWPVVPrrmjDQyiZL0UjMu+Zglw6D6weyW2lMLjmN9/KVebfzrI+9COwGgk9K
	 x2x5Ep/ADNeHe77jNYjl+V+5Ehe2DMKj58j0or32FffQbeQjCR+7NOlRMaCtEVdXFg
	 nVfkqU+1NQMUwLCGyiJs5arJMrovHoZVb5nziTSnjZE0xcWOGUid7xePxyx1ClXurb
	 gHFc2brPBTJM5/kqsOLdcNk80NHZqDML6saBxdOOmJX9L4w6L0g/P0tV6L68RzoggS
	 1J6qnf/faN6dg==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-61bed738438so39517667b3.2
        for <linux-firmware@kernel.org>; Fri, 03 May 2024 03:58:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YyjZjmWzmqjfw4FLfWb+X122zrzbTn5ccT5SP1+HCy6lPQSzYbL
	zLcI6sNyHw0l+RjeEP2qD6c8tySTvpg9YZQY7aswVTSdKldYnR9CpSOYS5QeLg5WjYshK40Z2AG
	EztFvJb/aO9TzYCK0IFwk2gdZZ2Q=
X-Google-Smtp-Source: AGHT+IF4UgGBGZxzhFvxJo+4FdKZun2bGNDbD7jTiiQm0b5UJCOkYDTBkI2qOZbm+Efdsnn3ksMxKaVWd/0n8cM8X5Q=
X-Received: by 2002:a0d:ca0d:0:b0:61b:16d9:47cd with SMTP id
 m13-20020a0dca0d000000b0061b16d947cdmr2047649ywd.11.1714733892270; Fri, 03
 May 2024 03:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240502063839.2855046-1-hildawu@realtek.com>
In-Reply-To: <20240502063839.2855046-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 3 May 2024 06:58:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7SZFhUS30Ai_U5cnQyztaJ4kdiuf+DNmjuKhFCO3FEcQ@mail.gmail.com>
Message-ID: <CA+5PVA7SZFhUS30Ai_U5cnQyztaJ4kdiuf+DNmjuKhFCO3FEcQ@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT UART firmware to 0x0FD6_407B
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Larry.Finger@lwfinger.net, max.chou@realtek.com, 
	alex_lu@realsil.com.cn, mu_hua_chen@realtek.com, kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/206

josh

On Thu, May 2, 2024 at 2:38=E2=80=AFAM Hilda Wu <hildawu@realtek.com> wrote=
:
>
> This firmware patch update for Realtek RTL8822C BT UART controller.
>
> Release Version: 0x0FD6_407B
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8822cs_fw.bin | Bin 62580 -> 63616 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
> index 9bc8f0350d50a7ec8e750bc037b7a9b8a922c112..4061aa391a1293a9ab5a45310=
81a5fce2c1fb54b 100644
> GIT binary patch
> delta 6770
> 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
> E0Y%x|Jpcdz
>
> delta 5700
> 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
l
> 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
> Y>Lzr~5GauTZy9wj{8(nZ(DnKM0e#gqtN;K2
>
> --
> 2.34.1
>
