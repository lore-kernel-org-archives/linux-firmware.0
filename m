Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7CDC001B0
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jul 2023 12:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61BC6C433CA; Mon, 24 Jul 2023 12:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CDDC433CC
	for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201888;
	bh=arSozrwxDpZ+l0skGmjtu0PIGes17IR9Ze3bfBXTz/0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=X9/cu0n3kCtcRYE9ifYOdiKqnn98QOy6rQ19KCEqPX6QYXoYAAZWXlCe++ro4nz6J
	 FH9zBNBQB0xVO4+bBZ+lLykulGtnBqxCpmFMsGg4uXg/fUbRrAlzdeDyYi1STh8SHZ
	 cglbke7zxMLifp241QWcV5u7fpfeZFf+WuhBSoUVRUxfibzzooNT6Qp3y3pq1q30h5
	 I1BSTGkeJomwxbftlxSL2bfzvghPP12FluNf3mLpBLCQFLfLvOQyF6LCWt/XXZhGb4
	 VvPw+WbHRR94+NuJ+hGnCm3rM9PrHEFc1/tYPgxqnrp2miyzvLyaOyQxEQD0VDYffb
	 l8I8tKp7Ii+sQ==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-c01e1c0402cso3485699276.0
        for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 05:31:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLZW0j6zryfiGsN20a5p1IPnuzdGcl80N6ShGB3y9oy3LJ4BxMa2
	7Z1CBQDoVY2s7QyAxLgfeih3THgiqbLEHKz7RlM=
X-Google-Smtp-Source: APBJJlFX6Rz0HrOPIzSj83lKd/AddSySrti6u5QaKYK8HNySYxuAQM/Kn7sFwmxfhEdMfkNysrN+U3KeMor6GXr+jFY=
X-Received: by 2002:a25:9003:0:b0:d0a:8973:b1c with SMTP id
 s3-20020a259003000000b00d0a89730b1cmr3068049ybl.12.1690201887298; Mon, 24 Jul
 2023 05:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR03MB41573133CF759BFD9D6C25BE8F3CA@TY2PR03MB4157.apcprd03.prod.outlook.com>
In-Reply-To: <TY2PR03MB41573133CF759BFD9D6C25BE8F3CA@TY2PR03MB4157.apcprd03.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 08:31:16 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7GTXtDywu25Tf4c6QP_TPvs0EbujQWT8BJoHoZH=fxLw@mail.gmail.com>
Message-ID: <CA+5PVA7GTXtDywu25Tf4c6QP_TPvs0EbujQWT8BJoHoZH=fxLw@mail.gmail.com>
Subject: Re: [PATCH] pull request: Update mt8195 SCP firmware to support 10bit mode
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, 
	=?UTF-8?B?TWluZ2ppYSBaaGFuZyAo5byg5piO5L2zKQ==?= <Mingjia.Zhang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pulled and pushed out.

josh

On Sat, Jul 22, 2023 at 4:28=E2=80=AFAM Yunfei Dong (=E8=91=A3=E4=BA=91=E9=
=A3=9E)
<Yunfei.Dong@mediatek.com> wrote:
>
> Hi,
>
>
>
> This is used to support mediatek 10bit hardware decoder.
>
>
>
> Please let me know if there is any issue, thank you.
>
>
>
> ---
>
>
>
> The following changes since commit d3f66064cf43bd7338a79174bd0ff60c4ecbdf=
6d:
>
>
>
>   Partially revert "amdgpu: DMCUB updates for DCN 3.1.4 and 3.1.5" (2023-=
07-07 15:24:32 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/yunfei-mtk/linux_fw_10bit v2.0.21961
>
>
>
> for you to fetch changes up to f41d890ac9e3540caf59cbda34be50a6ebef31f3:
>
>
>
>   mediatek: Update mt8195 SCP firmware to support 10bit mode (2023-07-22 =
16:07:30 +0800)
>
>
>
> ----------------------------------------------------------------
>
> Yunfei Dong (1):
>
>       mediatek: Update mt8195 SCP firmware to support 10bit mode
>
>
>
> WHENCE                  |   2 +-
>
> mediatek/mt8195/scp.img | Bin 639700 -> 635492 bytes
>
> 2 files changed, 1 insertion(+), 1 deletion(-)
>
>
>
> ---
>
>
>
> Best Regards,
>
> Yunfei Dong
>
>
