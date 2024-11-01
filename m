Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E444BE6F06E
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Nov 2024 16:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3B59C4CED1; Fri,  1 Nov 2024 16:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB91C4CED3
	for <linux-firmware@kernel.org>; Fri,  1 Nov 2024 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730479060;
	bh=HoXr4vWlQme6M9GCXhSIC4l6+U4gz6G1OlVU850o9RA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KP5L4Yk0NVzkA1Q5WNhKoDdy1t0r6/ruMnS6ljaoy1YQ/5+4yrqaDvRae7LUz+Uwy
	 0W0dHKIYul5GjehxJONINGhewok/bFgJJSui6s6WVf7W51DPwTHYe4QumTNvGUR1/i
	 4HxPFLxNcTVb2IN5K9964J3dey/oQ0E3byZq+pCMCfbmkI5UpihxGOz5AcZlImKTeY
	 gLv5WUNqEDUnH05r/h+f0Usga3sRTeVuq55UzNhjs64aP3i/00Isr84gfoB0WoGM+D
	 qte2k2IavJRALpefxhWThFPLiAciq1pH18XUCnUU15NpPsPexWx5zuG+daLXiqaruF
	 byC5hM1sAbMww==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e38fc62b9fso18655807b3.2
        for <linux-firmware@kernel.org>; Fri, 01 Nov 2024 09:37:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YzIkX1dEw4XYvGEonD588/hoGvvL9FqR9GDON/VEUFI638OIz+y
	twAIs6eI4Ksx7BDcQtSFYITKpcqxGuDV4KgZWbcDSRmRkdWfaCzFMYZdN/8pymVmD3sE3YtfriL
	mNvWVH4NGy++GQ3t2nSNFW1epJb0=
X-Google-Smtp-Source: AGHT+IHgqh2oDISSM1jxrjXUQ+yMwaBo9rjjDOzHMWwI6/gvuKnrvNlMpH4aSYvjbo0nOR9nHke1i13ixX+cKRx/YlQ=
X-Received: by 2002:a05:690c:368e:b0:6e3:39b6:5370 with SMTP id
 00721157ae682-6ea64b10f6amr50362197b3.24.1730479059837; Fri, 01 Nov 2024
 09:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241101160953.6yxes4h37ip34kj5@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20241101160953.6yxes4h37ip34kj5@hu-akhilpo-hyd.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 1 Nov 2024 12:37:28 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6n3wM41pt0tBup+HJBhqrmwA+fRUAKSWwdn-+88Zadow@mail.gmail.com>
Message-ID: <CA+5PVA6n3wM41pt0tBup+HJBhqrmwA+fRUAKSWwdn-+88Zadow@mail.gmail.com>
Subject: Re: qcom: update gpu firmwares for QCS615 chipset
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 12:10=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> Hi,
>
> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
>
> -Akhil
>
> ---
> The following changes since commit 3cdc52d83e478e189669697eb244d48b592d16=
52:
>
>   Merge branch 'robot/pr-0-1730397728' into 'main' (2024-10-31 18:19:48 +=
0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-Q=
CS615

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/351

josh

>
> for you to fetch changes up to f4f5689fe58fe324193bf4fa014496b0ff062f87:
>
>   qcom: update gpu firmwares for qcs615 chipset (2024-11-01 20:50:54 +053=
0)
>
> ----------------------------------------------------------------
> Akhil P Oommen (1):
>       qcom: update gpu firmwares for qcs615 chipset
>
>  WHENCE                   |   1 +
>  qcom/qcs615/a612_zap.mbn | Bin 0 -> 14256 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100644 qcom/qcs615/a612_zap.mbn
