Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86609C433EF
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Jul 2022 15:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71320C341D1; Tue,  5 Jul 2022 15:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B332C341D0
	for <linux-firmware@kernel.org>; Tue,  5 Jul 2022 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657035057;
	bh=kUXDpKKltU2E5XUxKJ1iBTwK6bfrdSF41IJcNKUY8N4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JSoVp6BTXh4v7n0Wnh2VXbZB8n9X7b5Xy0LEmQ8gNpehQr9/79HxzAzTH0aCoKD4o
	 MMRlD9ojcMDadWox6EJTR43LTzLmAW9czCVB8FpoLrjCIQ2cIgEJox1X2fKDZrjojE
	 z7wT0psCAWYc8bipXq5GGpwKW1Lim3W1aBPAtT1u5cJARTrJlwGr6HqtOzcZx/1SM2
	 rKHOM4oj0S2WonZeBxUxVnr+fRpyrOE51wwXqWt8okhKh7fvG6x/47WfQ4NT4UzOzQ
	 wj60XaHMQA6JBMbEvYOo0WPgfDQqf1Gtjo0Rhiw51mFodplX7q/FSO33FfHOBe+Fw3
	 m2XROeQxcuxUA==
Received: by mail-il1-f172.google.com with SMTP id k1so2906187ilu.1
        for <linux-firmware@kernel.org>; Tue, 05 Jul 2022 08:30:57 -0700 (PDT)
X-Gm-Message-State: AJIora+bYtg25MwaCxeMWMp3juuQ7iOAcpuTQQAFheYd7o9i1fuJkPva
	pzk/D/eWGhwzVMOCeavrPiWcPwhQSBE4y36s2r0=
X-Google-Smtp-Source: AGRyM1uobwKoa1jgaeSGOfqWvAr3ryhlzckYrcL9SdV5QFDDrv6yCYQkwwjkfqlw0RWJgQzkkOUmhhgtYXCbFARIUsg=
X-Received: by 2002:a05:6e02:1be9:b0:2da:d622:6dde with SMTP id
 y9-20020a056e021be900b002dad6226ddemr16471966ilv.2.1657035056512; Tue, 05 Jul
 2022 08:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <b4392c845d0af4e0e9d06493078c8af9dc39e237.camel@mediatek.com> <10ed0b2a78baa88f7fd1d466036c98de2f6d8e29.camel@mediatek.com>
In-Reply-To: <10ed0b2a78baa88f7fd1d466036c98de2f6d8e29.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 5 Jul 2022 11:30:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4A4ng9Hkugr6oegxkOU0CCY5c_kUWM8E70kZP63CBYyw@mail.gmail.com>
Message-ID: <CA+5PVA4A4ng9Hkugr6oegxkOU0CCY5c_kUWM8E70kZP63CBYyw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8186 SCP firmware
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Shawn Ku <shawnku@google.com>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	Rong Chang <rongchang@google.com>, hsinyi@chromium.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pulled and pushed out.  Thank you.

josh

On Fri, Jul 1, 2022 at 3:37 AM allen-kh.cheng
<allen-kh.cheng@mediatek.com> wrote:
>
>
> I am sorry, there are some mistakes in CC list.
>
> Regards,
> Allen
>
> -----Original Message-----
> From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
> Sent: Friday, July 1, 2022 2:32 PM
> To: linux-firmware@kernel.org
> Cc: Yunfei Dong (=E8=91=A3=E4=BA=91=E9=A3=9E) <Yunfei.Dong@mediatek.com>;=
 ";
> shawnku"@google.com
> Subject: pull request: linux-firmware: Create Mediatek MT8186 SCP
> firmware
>
> Hi maintianers,
>
> Add a new SCP firmware for MediaTek MT8186.
> Thank you!
>
> Regards,
> Allen
>
> ---
>
> The following changes since commit
> 9ed4d42c51aca99d70adc6738d7ea55c5e897835:
>
>   amdgpu: update Yellow Carp VCN firmware (2022-06-22 06:28:03 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/kuanhsuncheng/linux-firmware-scp v0.0.6
>
> for you to fetch changes up to
> 1c8b6c3dddf751f5f786bdd3440aa3ce238ab808:
>
>   mediatek: Add SCP firmware for MT8186 (2022-07-01 14:20:06 +0800)
>
> ----------------------------------------------------------------
> Allen-kh Cheng (1):
>       mediatek: Add SCP firmware for MT8186
>
>  WHENCE                  |   2 ++
>  mediatek/mt8186/scp.img | Bin 0 -> 416960 bytes
>  2 files changed, 2 insertions(+)
>  create mode 100644 mediatek/mt8186/scp.img
>
