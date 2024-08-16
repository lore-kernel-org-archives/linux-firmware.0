Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A89C531DC
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Aug 2024 18:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF8BFC4AF0C; Fri, 16 Aug 2024 18:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D866FC4AF0B
	for <linux-firmware@kernel.org>; Fri, 16 Aug 2024 18:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723832762;
	bh=XQWlkEGFhNAyNRAQrzHFdyqb4N4h6I9PuFCDh1JjUus=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iUz2JTjoH3IY8wsHWgrpiM6X6EVpzhx8aX4/MKcoEe/63R3mHTG0bLwPKN88308dk
	 PZENn+/TrXETTfUfOKzB/TmG+AS63AL0TgSzgqq9RqE239oXM+Uart3EQRvvSJOFxJ
	 d7iIYaoh3CxTy9n9a8qZCmEx8z9OUXKBkEmVrQij1vZ6DpOAb1BFLPV3BbB4+7KyN5
	 mvE5I1WNmy70pp4Q8oypnSNP57cgyqTZqFVbR2sh7Lb7OsFhxg3/PSHulx3zHQA3kB
	 p4yxc2ksS81+lzUqLVkRVkJt1qGwAtdfJtqvWIXeAtpaJsf5N4+Cu7Ml0JpFkvzimO
	 DcLUM3TVq1hIg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6b41af35b1fso2464407b3.0
        for <linux-firmware@kernel.org>; Fri, 16 Aug 2024 11:26:02 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx7Dxod4xCKrgfd3pShIvSVyuLdB9MajlvM6FADpaZxksKpfTkK
	q+uGhpSc1+cXqElTnOorOJNV5UPhKFZlKohAS7QsAVnSBb/Kqts8+azbQTvHLVeJYHELexqGL0o
	mKdWkRj5Mq1zulAj/2lPzP3uXlZY=
X-Google-Smtp-Source: AGHT+IGp9x5fPCFSuqnjSqLMs0HrPHeJztfCcUsLkj1CuuyyTF8qJpDs7u84vATV3QnLgm7rNsjJh6/sOr7s0j6Q0CQ=
X-Received: by 2002:a05:690c:fc7:b0:650:1ee7:7689 with SMTP id
 00721157ae682-6b453a0d76fmr4830247b3.35.1723832762032; Fri, 16 Aug 2024
 11:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240815212216.66557-1-gustavo.sousa@intel.com>
In-Reply-To: <20240815212216.66557-1-gustavo.sousa@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 16 Aug 2024 14:25:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7VCvYYNu=Ct8193nMbu2eokJmKTJk4SNLaxQY2MXvCKg@mail.gmail.com>
Message-ID: <CA+5PVA7VCvYYNu=Ct8193nMbu2eokJmKTJk4SNLaxQY2MXvCKg@mail.gmail.com>
Subject: Re: PR to revert MTL DMC to v2.21
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 5:22=E2=80=AFPM Gustavo Sousa <gustavo.sousa@intel.=
com> wrote:
>
> The following changes since commit b1de0237a78a84baf7e1e2a1e9585405b88d82=
f8:
>
>   Merge branch 'ath-20240813' into 'main' (2024-08-15 13:43:05 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/firmware.git intel/mtl-dmc-revert-to=
-v2.21

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/276

josh

>
> for you to fetch changes up to ad8d5f76c429e5485764a9ecb7a2ce3fbc1386ae:
>
>   Revert "i915: Update MTL DMC v2.22" (2024-08-15 18:10:27 -0300)
>
> ----------------------------------------------------------------
> Gustavo Sousa (1):
>       Revert "i915: Update MTL DMC v2.22"
>
>  WHENCE           |   2 +-
>  i915/mtl_dmc.bin | Bin 52700 -> 52476 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
