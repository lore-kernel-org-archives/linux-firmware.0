Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8A3C072A2
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Nov 2023 16:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 420EFC433CA; Fri, 17 Nov 2023 16:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218CBC433C8;
	Fri, 17 Nov 2023 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700239953;
	bh=f9rtcK56mhDLhOp4RKNpeUtKt+ICIAmxCI82XE6Z37Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FNXa8Eqei7viAqPYvU8GZz9CLHcuHSNWDRWRntRPyvK0S4ReCF43hHgvCfyEsnne/
	 /UrF1mk4r3L5x3CWj2M3RRtnBPIhTyiBuSrZZUWEbDMXtx/WFIQ5b7R6pEqeVNoOUa
	 EGocN91fiighO9HxRH4OaGnSuGqVxxcVYQCGNKEbGVgTgko5SZ+TEJCvXRDTw49B9x
	 4VgyCLQ/yZ1BSeYO5YHGnZXPVrcsHBwS6rtZWVNUvbtxM+XpZiFDN4Sf+ifzyDGhYD
	 4W5L3WZp00BQs5+rcUJA3JmEV0YoFaYkstVBXZ3JTTC6LQKvHbEWQ52U4y1PuU/I35
	 R8Nh7C/d5KPsg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5c8c8f731aaso3121337b3.0;
        Fri, 17 Nov 2023 08:52:33 -0800 (PST)
X-Gm-Message-State: AOJu0YxNIs3z7gpazkPlEK1E/mZ8f0FLl8T/gaG1tzweEvigMlFMlgxt
	OrG/3tvE0fbvSIwTKX78wSL9V2l7pQMyLjKL1iQ=
X-Google-Smtp-Source: AGHT+IGinxPFXo5mERoJL+vrqJ92Z5DnP2b6xg9usz1TN6JSUcn7bOPY5ismH06tT8bELfD0NHiOwIBkrs/HTucB11M=
X-Received: by 2002:a0d:e615:0:b0:5c1:25f:5674 with SMTP id
 p21-20020a0de615000000b005c1025f5674mr141383ywe.32.1700239952266; Fri, 17 Nov
 2023 08:52:32 -0800 (PST)
MIME-Version: 1.0
References: <20231117150711.24379-1-gustavo.sousa@intel.com>
In-Reply-To: <20231117150711.24379-1-gustavo.sousa@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 17 Nov 2023 11:52:21 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5QSZqFiTkyTnWeWOW-_9iyEjRu2SZSAL+sD4JaiCkc8w@mail.gmail.com>
Message-ID: <CA+5PVA5QSZqFiTkyTnWeWOW-_9iyEjRu2SZSAL+sD4JaiCkc8w@mail.gmail.com>
Subject: Re: PR for MTL DMC v2.19
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@kernel.org, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 10:07=E2=80=AFAM Gustavo Sousa <gustavo.sousa@intel=
.com> wrote:
>
> The following changes since commit 6723a8d9092325d00a125a1b3ca058644f74d3=
14:
>
>   Merge branch 'robot/pr-5-1700153542' into 'main' (2023-11-16 16:54:38 +=
0000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware mtl_dmc_2.19

Pulled and pushed out.
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/65

josh

>
> for you to fetch changes up to 451090149cecfae5e674d24944579a564afefe8a:
>
>   i915: Update MTL DMC to v2.19 (2023-11-17 11:03:16 -0300)
>
> ----------------------------------------------------------------
> Gustavo Sousa (1):
>       i915: Update MTL DMC to v2.19
>
>  WHENCE           |   2 +-
>  i915/mtl_dmc.bin | Bin 52508 -> 52476 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
