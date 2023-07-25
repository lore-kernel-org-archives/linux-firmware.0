Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D182C0015E
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Jul 2023 10:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04894C433CA; Tue, 25 Jul 2023 10:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D10C433C7
	for <linux-firmware@kernel.org>; Tue, 25 Jul 2023 10:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690282467;
	bh=+RhTgCYglDAlK6FpN6nhTrJKKow+y3C62zkpUKmF2Po=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=qOpe7TLos3a3XFrqEFIpq/so19Y7Kfz6uTPkheebHjWzC5Mrj2HOlVHUDnu/4Uk2E
	 bU0es0sJRwbKIQcZOLpaUiC+Nx7dd4O7q8kh/8hVJRASc029A8tAF77F5kzO4FahZ4
	 1sDGUtQkL99ie9VHpvT9FCzC98liR3W+bHtxMlEaeBa/cz8pBTr3blI/PckvpqWcFv
	 nJiYJMvbVQgg9yEUoYwHz/qwUwvt+SABNuic8j20JKJooJDrqEj2HsRy5qB6oPW4ej
	 gts6AzhvjRBlzzrCFqNTqVVndOp4IQ+NObnUgDZOAfA32Sw90dC03cXf+WfrhTUY/5
	 LvMG6IR20B6WQ==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d0728058651so3697943276.1
        for <linux-firmware@kernel.org>; Tue, 25 Jul 2023 03:54:27 -0700 (PDT)
X-Gm-Message-State: ABy/qLagD3En/hOkrEymPNF70BcYpeV0LwBGAUv/A5ym3I+gf7VdeVhe
	SPbtbcB22JLJN1eDfiRXbOfZs+WB89lR8xnM0bE=
X-Google-Smtp-Source: APBJJlHE+LFf+f43cO0Vky6is7TPk4TPBjOKT9sy5Ji6zAL6WreGu9ZbiTDbw7Rjr8P1y2F1CqEfUUlA9I4oxyXf8fo=
X-Received: by 2002:a5b:ac1:0:b0:d08:d20c:b167 with SMTP id
 a1-20020a5b0ac1000000b00d08d20cb167mr7552752ybr.58.1690282466853; Tue, 25 Jul
 2023 03:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <c151f7d4837d3a07143ee5191d3f5e57bc6ded2c.camel@canonical.com>
In-Reply-To: <c151f7d4837d3a07143ee5191d3f5e57bc6ded2c.camel@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 25 Jul 2023 06:54:16 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6sBk+jAGNb8=fFGG=b18q88h4M15NNqZ9P1q=hTgjUJg@mail.gmail.com>
Message-ID: <CA+5PVA6sBk+jAGNb8=fFGG=b18q88h4M15NNqZ9P1q=hTgjUJg@mail.gmail.com>
Subject: Re: [PATCH] copy-firmware: Fix linking directories when using compression
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, benjamin.drung@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Tue, Jul 18, 2023 at 2:31=E2=80=AFPM Benjamin Drung
<benjamin.drung@canonical.com> wrote:
>
> When `copy-firmware` is called with `--xz` or `--zstd` it will create
> broken symlinks for directories:
>
> ```
> $ ./copy-firmware -v --zstd $dir
> [...]
> creating link qcom/LENOVO/21BX.zst -> ../sc8280xp/LENOVO/21BX.zst
> ```
>
> The original target `../sc8280xp/LENOVO/21BX` is a directory. Adding the
> compression extension to the directory name breaks the link. The
> directory `qcom/sc8280xp/LENOVO/21BX` exists but
> `qcom/sc8280xp/LENOVO/21BX.zst` does not exist.
>
> The relative symlink needs to be resolved. If it points to a directory,
> create the symlink without the compression extension.
>
> --
> Benjamin Drung
> Debian & Ubuntu Developer
