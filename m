Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C737C02194
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Feb 2025 13:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65DFDC4CEE0; Mon,  3 Feb 2025 13:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BBCC4CEE5
	for <linux-firmware@kernel.org>; Mon,  3 Feb 2025 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738590649;
	bh=Xa+6raRYVU0MsjDYHu++Al1r0R04gfxaZUSoBnOQ05M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XOon90LCosk/N6n0br/hanZ4Rbpf4h161TjzB+xSzBoR6k0I38N+7IdCjbCMsfpuo
	 4qxKvUHb2egaLox73jkLTTPgl0K2WoLWoS20FY3+13B7sQGz4DyJWsmCSZDeX26zk4
	 VGjviaJEpHAkmfFoKx1MWx03wtqIMkD09F49LUa/IXJFrnUBscOQ+SM4UnZ1hSCrUL
	 8iO1VzBXJ4qi89yclSm10++Yl9lDemPLXett/rGTs6sExrzgx/Kb0vH6JrQz/IJcXL
	 T2XMho1N5EDMRnpQDRefAklI7xOM61FxqOqydvBcePVhEjW46O9QNj5hkytoyShTqq
	 toncWhhjbCyNQ==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e461015fbd4so4028115276.2
        for <linux-firmware@kernel.org>; Mon, 03 Feb 2025 05:50:49 -0800 (PST)
X-Gm-Message-State: AOJu0YwHflZNEOM3e1fH2CqOyPn/4oaVgYYyFLJWHHKcZ7EBGhi1jtXS
	/HUnDSSzgiwp1tabLcBeI58aumVO+3VNLhBkNk9ImQEkaCoyG4FfK+QOGN/StPNLvT9vSSgfNxQ
	37WbhBDWkrxyBrW2cv27G+ssGnBM=
X-Google-Smtp-Source: AGHT+IHtYy/i4qjsnjVA8n0uJm6x7an4eaqDzhj7nDLRjx5J+7kQy6yTACd06jU9rEEqpLgnMru7xp78XiG8a3Vkdyc=
X-Received: by 2002:a05:6902:230e:b0:e5a:ca6b:4531 with SMTP id
 3f1490d57ef6-e5aca6b47a6mr12748976276.12.1738590648516; Mon, 03 Feb 2025
 05:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20250201092637.3358518-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20250201092637.3358518-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 Feb 2025 08:50:37 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6F5meXWfdTZGSLNs+5o-mf5JqNrLC-6oRKS=M1QKXHYQ@mail.gmail.com>
X-Gm-Features: AWEUYZmpYNZ5DAGT1uoJLwm9Xu-QOEA-6n5X1zTZNVNoYbRh5ifkh6Tvnbwz3Zw
Message-ID: <CA+5PVA6F5meXWfdTZGSLNs+5o-mf5JqNrLC-6oRKS=M1QKXHYQ@mail.gmail.com>
Subject: Re: qca: add two more NVM files for WCN3950
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
	linux-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 4:26=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83=
a7:
>
>   Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +=
0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/lumag/linux-firmware.git cmbt

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/434

josh

>
> for you to fetch changes up to 6b12b9649a91d08163d7f62d52afbf6237953182:
>
>   qca: add more WCN3950 1.3 NVM files (2025-02-01 11:23:54 +0200)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       qca: add more WCN3950 1.3 NVM files
>
>  WHENCE          |   2 ++
>  qca/cmnv13s.bin | Bin 0 -> 1641 bytes
>  qca/cmnv13t.bin | Bin 0 -> 1641 bytes
>  3 files changed, 2 insertions(+)
>  create mode 100644 qca/cmnv13s.bin
>  create mode 100644 qca/cmnv13t.bin
