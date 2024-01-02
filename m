Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674CAC47074
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Jan 2024 13:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39293C433C8; Tue,  2 Jan 2024 13:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E4EC433C9
	for <linux-firmware@kernel.org>; Tue,  2 Jan 2024 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704200704;
	bh=sSnmjh4qdaWTUkCsEBVG8VCmIJYmhNfm4TACpVlTP0w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KXYfhFFFDjJ5wVJJx0TYJfEhaMOfe6oyYDbCNS12DpkihWexJ1ZsuonTjXTvpfRkG
	 6RFP1yLIT7hZ70x4K7cWwN0Rsa6Ry/VL+4dwcj4WLYrbtr5+JmCbWQcIUATXH6BHwZ
	 Dsu+PkIqK3AmOwt7h3ZDIeRfUgOl+Exv3AvDEy+llu8pcpuwU63JLZZhIRWqq7SIey
	 uRJdUfO/CK1Y4WXebL5AQmn4gsNtp2U1HFv3cyMR4d/nhH4Ty5ZA16AzjarbSdgY/h
	 OZSOIpZUnkkXNTZ+ihnqJy5EWxokbznP8wLelzeg6EK3JlUTkKESGtRc1UqjGDzO9W
	 t7qrdFw5RbwIQ==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbd73ac40ecso6304408276.1
        for <linux-firmware@kernel.org>; Tue, 02 Jan 2024 05:05:04 -0800 (PST)
X-Gm-Message-State: AOJu0Yw8NM58QDccwVNG+HogkW3prdv8v1HfM/16jqT3ob6YIcGij0+D
	vOFVV4JRcuIddabli57FNpI2IMD0a4Grf3rGXcw=
X-Google-Smtp-Source: AGHT+IE7AXPhyUzEBAJH6tragROnPU44iUXSsQb9Z9TnnAyWV3BM9xDbykuAVzWCXvslV9LX2AbrNcax9D3VUMTKVKU=
X-Received: by 2002:a25:b20c:0:b0:dbd:9d84:5892 with SMTP id
 i12-20020a25b20c000000b00dbd9d845892mr8789553ybj.67.1704200703271; Tue, 02
 Jan 2024 05:05:03 -0800 (PST)
MIME-Version: 1.0
References: <02a60c43-9077-4387-934d-71885ead1eeb@quicinc.com>
In-Reply-To: <02a60c43-9077-4387-934d-71885ead1eeb@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 2 Jan 2024 08:04:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6v3rQwztoow6bNEDgjZYuHdedo0gvzvO8cv6ta9OB1Og@mail.gmail.com>
Message-ID: <CA+5PVA6v3rQwztoow6bNEDgjZYuHdedo0gvzvO8cv6ta9OB1Og@mail.gmail.com>
Subject: Re: Update QCA2066 Bluetooth firmware to 2.1.0-00629 request-pull
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 25, 2023 at 3:34=E2=80=AFAM quic_zijuhu <quic_zijuhu@quicinc.co=
m> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if y=
ou have any problems.
>
> The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa196=
93:
>
>   Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57 +=
0000)
>
> are available in the git repository at:
>
>   https://github.com/zijun-hu/qca_btfw

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/110


josh

>
> for you to fetch changes up to adb26935b5440c5f4cdb6d3f174c4fdf59b56fef:
>
>   QCA: Add bluetooth firmware nvm files for QCA2066 (2023-12-18 15:01:25 =
+0800)
>
> ----------------------------------------------------------------
> Zijun Hu (2):
>       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00629
>       QCA: Add bluetooth firmware nvm files for QCA2066
