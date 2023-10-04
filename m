Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C70E7B601
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Oct 2023 12:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA073C433CB; Wed,  4 Oct 2023 12:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CD5C433CC
	for <linux-firmware@kernel.org>; Wed,  4 Oct 2023 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696422498;
	bh=s6MIaYFoLBiUrWFoNZyyjP10lI4I2oeizymP5aERV/E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nv9/Dup1T6nljnAKcScZCTuGyKY8ZhW3XqoA+GQbJkFwx+WF208+KXkugodO6S+2S
	 GkXneDbqQaB3TuDXuYz1sGeIGvZcmmvVi2g52wUzojKtVp17FxNHKr63KdNA50YjL3
	 S6x1Dego+YkZYNZd6aeyLqF6R+VpsA4s7JNtcswsMn07efr3RmhIS5MiQGnnFVfxcP
	 Kjs9F7p7IAG/5T9xhcC5h+S5vTCaR/E2EmD/bWe9QmZfMIuJhcKy8Va3PMOIktjVEf
	 DAJn2GOEf2RZuG97/k4bd3RUwDg5y86ht+juiaxggtFljGb3hnYMpPO7sQawQ15sq1
	 xAFdJih+E+gFg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59f55c276c3so24743767b3.2
        for <linux-firmware@kernel.org>; Wed, 04 Oct 2023 05:28:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YwyH8v39CC74xT6ZrPZCcias8hdONtsIWgwDIkRJJQZkf+kh96b
	J/u/bt7GgFFJAwwSIfwR8t3630Bl9/Isr5Vy0UM=
X-Google-Smtp-Source: AGHT+IHA9/MbVARLlM8LWdL6THD+U88plnrQK3x9BxLdFGt6e48JR4IfmA7hTsR8Y1DNUquQ4HCRiuoCV33U6e2iw9w=
X-Received: by 2002:a5b:285:0:b0:d7b:9d44:7574 with SMTP id
 x5-20020a5b0285000000b00d7b9d447574mr1679243ybl.64.1696422497875; Wed, 04 Oct
 2023 05:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <thqm4hqbkgqxj5fh6olad5brvwvtlof55tjk3kfzzz6r65xcd4@pww7dj5lvr25>
In-Reply-To: <thqm4hqbkgqxj5fh6olad5brvwvtlof55tjk3kfzzz6r65xcd4@pww7dj5lvr25>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 4 Oct 2023 08:27:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4RVQDWMrZkA3_XVfM8j3y5KjVokhzjLRgNMoQSHHmGrg@mail.gmail.com>
Message-ID: <CA+5PVA4RVQDWMrZkA3_XVfM8j3y5KjVokhzjLRgNMoQSHHmGrg@mail.gmail.com>
Subject: Re: PR for MTL DMC v2.17
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@mcmartin.ca, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org, Anusha Srivatsa <anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2023 at 8:59=E2=80=AFAM Gustavo Sousa <gustavo.sousa@intel.c=
om> wrote:
>
> The following changes since commit 8b855f3797e6b1d207b7a2b8dae0e9913f907e=
5b:
>
>   Merge branch 'main' into 'main' (2023-09-26 18:31:16 +0000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dmc-mtl_2.17

Pulled and pushed out.

josh

>
> for you to fetch changes up to 18b60f44e61c72eb5a5a36dc8e0381c77ba670b3:
>
>   i915: Update MTL DMC to v2.17 (2023-10-02 09:52:35 -0300)
>
> ----------------------------------------------------------------
> Gustavo Sousa (1):
>       i915: Update MTL DMC to v2.17
>
>  WHENCE           |   2 +-
>  i915/mtl_dmc.bin | Bin 52388 -> 52508 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
