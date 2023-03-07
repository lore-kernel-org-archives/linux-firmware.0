Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3725DC678D4
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 15:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06B33C433A0; Tue,  7 Mar 2023 15:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5101C4339E
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678201369;
	bh=PX5RqI44er5e3qDhl0lwIf4PsfZRwIpB1L71sdVUlOA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=j/Afup52pPpiu5yzxotPUz0u+J6A1eJaWQ7Ewd7Zyt034zYep6eXr7Iont67DV/b+
	 rAv+7mXDQj5lrp1gH2tAbAI286T5NFBarusDMQiMXOsMBn1Mz9eE/bC62to2ZG0pPq
	 JmZIw0/0KE33TCJwuHdM3PTDtCWXlzLYoS7bPTFLL0or4HbT4PeH+cMWtmjD2vmlKs
	 ZVaaf7WF87/VqtubhQ5IDv4Z3RyNOWaH66ujUkouHFSKna3+ZdT9m/P+rvydorrJ9T
	 3oxYzfySxcSehJZLhDE15c/1/CoKMPfhW4bC2/TOzH/lG6LAixmebISulbP9CL3DRd
	 /P5JWYbzD263A==
Received: by mail-qk1-f169.google.com with SMTP id bk39so4526478qkb.8
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 07:02:49 -0800 (PST)
X-Gm-Message-State: AO0yUKVBOJRIq7kxZIeV8xxEeRn8QnI7hP8yYCsqIwlxadfTeQLQCBHF
	NQxSfF8mEYodZPhhFsBpJLCiQ9I81iqkhBIhhDM=
X-Google-Smtp-Source: AK7set+NiphrdLn8eaEnia0UdKb2FDVAlAYOFZYPMO7le5M4LDmmp//PesrhYZV1XR9FMDqOg2FVUz1FumCsPxaaUB8=
X-Received: by 2002:a37:e209:0:b0:71f:b8ba:ff4a with SMTP id
 g9-20020a37e209000000b0071fb8baff4amr4176164qki.8.1678201368924; Tue, 07 Mar
 2023 07:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-5-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-5-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 10:02:37 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7eOJ+y2rdSyMAqVqqcp8w4oYfZU1J8PZV7+TKqDcxqbA@mail.gmail.com>
Message-ID: <CA+5PVA7eOJ+y2rdSyMAqVqqcp8w4oYfZU1J8PZV7+TKqDcxqbA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 05/16] WHENCE: comment out duplicate MediaTek firmware
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> From: Emil Velikov <emil.l.velikov@gmail.com>
>
> As mentioned in the inline comment - file is already listed further
> down. To prevent check_whence.py errors, comment it out.

Why did you comment this one out instead of remove it as duplicate
like the previous patch?

josh

>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  WHENCE | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 7de6d6b..bce94c5 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5183,8 +5183,9 @@ File: mediatek/mt7622pr2h.bin
>  Version: 20180621204904
>  File: mediatek/mt7668pr2h.bin
>  Version: 20180517181834
> -File: mediatek/mt7663pr2h.bin
> -Version: 7663e2ccn04-2006030247
> +# Note: explicitly commented out, since it's duplicated further down
> +# File: mediatek/mt7663pr2h.bin
> +# Version: 7663e2ccn04-2006030247
>
>  Licence: Redistributable. See LICENCE.mediatek for details.
>
>
> --
> 2.39.2
>
