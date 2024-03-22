Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC51C54E71
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Mar 2024 13:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDFB0C43394; Fri, 22 Mar 2024 13:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8820C433C7
	for <linux-firmware@kernel.org>; Fri, 22 Mar 2024 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711114785;
	bh=5TgSuCauS8GT6QQBaZPrZ5FUn7IoDZ6oyTws1noJ3dU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jCRSWwtgI1VTREEpxVvdKrcnVV4Xc0WSWjDLuG5ZqA/F1eO8PPKIh9NB91vX1TSBC
	 DbopIxSssShPK9LF3zZOuLct9A1mM6COnudYcucWsY6pcNRpTG8YiDvD8bLUQk1qkN
	 RQLMrRj2Ugrn5tfHbpOHyvVtD7MUdzrhvUL3cadp5fRmuTFo63qrS4EE3M/GJIfpQ0
	 tqZfkB1bQMwcfP+rn+wKTNVUDUqKWHFkCxS30MWXVC2hfEHDGIrnFqbg3DnaiGMgm8
	 mXe8mqZQX/X90bp5E4oPXtVTyajuGL7H7FhGYCIm1XglDPS61yJasivi4vdwLO/9Ti
	 OuJ5b3uMaIgaw==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso1640684276.1
        for <linux-firmware@kernel.org>; Fri, 22 Mar 2024 06:39:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YwW+XHnziDuGdzOkmz4ayCP/Mm7WaD0T98VWPQpalSPFJ+ooo16
	d9wcoo+NvPUcIsqX2/31zLSuMYyBassFghg+rK/GKaYsAd4lvvx+v9Vy6NcHwmHIuAoBHx4EY0v
	0sJdSQfNp2iRpkVth7uI84fziZpI=
X-Google-Smtp-Source: AGHT+IG9QOnlmA925r/URlwN8TWyLSJ8cidRQ/KYULhpPmwaQG5KAQuoRS5+qmd5tlP2wVw70KmwZLmMHc3/VbuXD4A=
X-Received: by 2002:a25:2f0c:0:b0:dcc:f5d4:8b43 with SMTP id
 v12-20020a252f0c000000b00dccf5d48b43mr2071317ybv.9.1711114784961; Fri, 22 Mar
 2024 06:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <30f41011495fb0b11a11eef9c7a536268306edb2.camel@mediatek.com>
In-Reply-To: <30f41011495fb0b11a11eef9c7a536268306edb2.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 22 Mar 2024 09:39:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5unmBTXbiksB=N5x16RinxnYGgevPYZ0Hd2j7owLGRsQ@mail.gmail.com>
Message-ID: <CA+5PVA5unmBTXbiksB=N5x16RinxnYGgevPYZ0Hd2j7owLGRsQ@mail.gmail.com>
Subject: Re: [PULL] mediatek: Update mt8186 SOF firmware to v2.0.1
To: =?UTF-8?B?SGFpbG9uZyBGYW4gKOiMg+a1t+m+mSk=?= <Hailong.Fan@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 5:32=E2=80=AFAM Hailong Fan (=E8=8C=83=E6=B5=B7=E9=
=BE=99)
<Hailong.Fan@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request updates MT8186 SOF firmware.
>
> If there is any problem, please let me know.
> Thank you.
>
> Best regards,
> Hailong
>
> --
>
> The following changes since commit
> 22ee1d8ca6663ca7c28477581993d6ed5cc54323:
>
>   Merge branch 'robot/pr-0-1710861164' into 'main' (2024-03-19 19:07:14
> +0000)
>
> are available in the Git repository at:
>
>   https://github.com/hailongfan-mtk/linux_fw_sof v2.0.1

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/183

josh

>
> for you to fetch changes up to
> 9a6a0cc195c108c677165075c55cbc0e417a1e64:
>
>   mekdiatek: Update mt8186 SOF firmware to v2.0.1 (2024-03-22 17:04:27
> +0800)
>
> ----------------------------------------------------------------
> Hailong Fan (1):
>       mekdiatek: Update mt8186 SOF firmware to v2.0.1
>
>  mediatek/sof-tplg/sof-mt8186.tplg | Bin 16191 -> 16191 bytes
>  mediatek/sof/sof-mt8186.ldc       | Bin 48436 -> 48564 bytes
>  mediatek/sof/sof-mt8186.ri        | Bin 128712 -> 129304 bytes
>  3 files changed, 0 insertions(+), 0 deletions(-)
