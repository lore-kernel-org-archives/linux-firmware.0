Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D05ECE57A
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Sep 2024 11:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CBA9C4CEC8; Mon,  9 Sep 2024 11:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8B0C4CEC6
	for <linux-firmware@kernel.org>; Mon,  9 Sep 2024 11:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725880913;
	bh=r/khpboT4fKpWlhXC4u+pjCVqn3ROT17KI9BJCpIf4w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=th+4KlriWq4bfr1jIlPlZFHWw1yO2XmYlYMHa8cc0vOiR/wLHr7gne3pp8HEtp5tA
	 b7wdwkblequ37Mg+TwdXolCLQb6xY5jqOdK2OgrOZKqOPok/qj/P3w+O4cKexCvfSQ
	 T5Msv1UO/epkNSLJ06FW1lrL5IN5THjCZZM2XHVZOdRlhD3jFcRroDisGkEgo+ZAel
	 TZ4tPp5tJbLnfnUe5c1Wi4vrSqTXnMDww4gUtS3Ncr+CEgtFxhmIe7k42A2D+c5fVw
	 w5bz3H/Q/EEnsyQqWqy6B/6gXP6Tzr31KFO9GXqT1VE3ugiw9BbDG/nz4Zl8cmaVpW
	 vIyB1AWgBmCRA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6d6a3ab427aso31400977b3.2
        for <linux-firmware@kernel.org>; Mon, 09 Sep 2024 04:21:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YwXNfQ6eGdB9u49nLc/C0f0kku+UvSX6mjqHTxskKDd3uHgnXQ2
	w2xDVFRHaHBel6bETHrCifJyv9sTGlAZ4AS8AEqK/4cmJo36sFfbZbJ+31HkaFKOK03wUV/YZm3
	9zv6T8AHoB9kLs+CtPvtEd7OqJpw=
X-Google-Smtp-Source: AGHT+IFCdA7MSkJ9VHYlVShZz0GSHdQk9BhjkZy0kGXfN23s8Zgc5L77gkBJiot/LIJ11CwFgVfuXoi+MZvh++La1QE=
X-Received: by 2002:a05:690c:ec9:b0:627:24d0:5037 with SMTP id
 00721157ae682-6db44a5f76emr91974727b3.0.1725880912147; Mon, 09 Sep 2024
 04:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240909095549.1712018-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20240909095549.1712018-1-dnyaneshwar.bhadane@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 Sep 2024 07:21:40 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7bvjqiYZm241XgfL3oOsqLjGzLVn0kkj8cfiMhUF641g@mail.gmail.com>
Message-ID: <CA+5PVA7bvjqiYZm241XgfL3oOsqLjGzLVn0kkj8cfiMhUF641g@mail.gmail.com>
Subject: Re: PR for MTL DMC v2.23
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 5:54=E2=80=AFAM Dnyaneshwar Bhadane
<dnyaneshwar.bhadane@intel.com> wrote:
>
> The following changes since commit 87cae274d38e69f6e9461f966fe42d223e20d7=
be:
>
>   Merge branch 'cirrus-20240904' into 'main' (2024-09-04 17:12:54 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/firmware.git drm-https/intel/mtl-dmc=
-v2.23

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/291

josh

>
> for you to fetch changes up to 6528c3446191b0071691b71590d13f7344db5560:
>
>   i915: Update MTL DMC v2.23 (2024-09-05 13:09:16 -0300)
>
> ----------------------------------------------------------------
> Dnyaneshwar Bhadane (1):
>       i915: Update MTL DMC v2.23
>
>  WHENCE           |   2 +-
>  i915/mtl_dmc.bin | Bin 52476 -> 52712 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
