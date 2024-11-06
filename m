Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19FCD44D6F
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Nov 2024 13:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B50CC4CED5; Wed,  6 Nov 2024 13:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C08C4CED3
	for <linux-firmware@kernel.org>; Wed,  6 Nov 2024 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730901313;
	bh=d4EM6mtLal20B8LZsV+CPjK2lFL7YVutRh5DdPWqz3E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=COaYLYjKCZ2TxU1jrUxSoLSNRhHYazbWfNRh/Pqp43xzsPbsoyokqwBtapUMj3VT2
	 yV1KtQcpw6iSHcZQh1+v9eTcaeT8YxbZj4YfLbcIqbHLJwEWMHIPksMIYW2BU25oBd
	 oyN0RElISciLd7ym2wKKSqF/zP1sFRoPTK1Ib5vKuTzWMn3xoKA0wjcDgAkO5Lg7mA
	 ArKe4oxZX8o06xnYJqw2lixfRY2LRg4t2Yn2O3541fg5U+c572ZCYuVWsZ/i8na6Y4
	 uxkMzEw7LxGE9ziMqfe3n4i3HTvcjpzuLPOoJzUhPNIhSF65zyeQfCCOyh40Z0l8pr
	 Vx6Fpr9j+irjg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea053b5929so55971837b3.0
        for <linux-firmware@kernel.org>; Wed, 06 Nov 2024 05:55:13 -0800 (PST)
X-Gm-Message-State: AOJu0YwAjwtAXO3gX+lFhQmYVAZjRa8a3klpf6zbF09J9vkbGmWlw5re
	uoy75lLFtXRyoojxit2zdvxjAwF5RW72c/uiMVxojhXbleRNA6IafWcfSLEFPGGFysokY05Wynt
	F8qTgMnTcw+HbFJGck0UkE10pAE4=
X-Google-Smtp-Source: AGHT+IGa1lUB9PdniSpywWNKpUKfY7p+4rKEVHMIImOb10PjezU0QCBOPyvYj8qIkNZ++d8S92SjkPw9Za3N63dwRxc=
X-Received: by 2002:a05:690c:6211:b0:6d5:90f:d497 with SMTP id
 00721157ae682-6ea64b18e26mr195025467b3.19.1730901312488; Wed, 06 Nov 2024
 05:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20241106025439.25929-1-yr.yang@mediatek.com>
In-Reply-To: <20241106025439.25929-1-yr.yang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Nov 2024 08:55:01 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4va=YSDFRygt856fJGGpHuBY0teaJgFg5pmxsXvuWpwA@mail.gmail.com>
Message-ID: <CA+5PVA4va=YSDFRygt856fJGGpHuBY0teaJgFg5pmxsXvuWpwA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Add sof-tplg for mt8195
To: "yr.yang" <yr.yang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	shawnku@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/354

josh

On Tue, Nov 5, 2024 at 9:55=E2=80=AFPM yr.yang <yr.yang@mediatek.com> wrote=
:
>
> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b2755570955=
58:
>
>   Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:0=
4 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/mtk13576/sof_tplg adspsof
>
> for you to fetch changes up to a142ad7250ffd9292e225780ba69c61bf11696d2:
>
>   WHENCE: Add sof-tolg for mt8195 (2024-11-06 10:14:38 +0800)
>
> ----------------------------------------------------------------
> YR Yang (2):
>       mediatek: Add sof-tolg for mt8195
>       WHENCE: Add sof-tolg for mt8195
>
>  WHENCE                                                   |   3 +++
>  mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg | Bin 0 -> 1619=
1 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.t=
plg
>
