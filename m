Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1900BC4332F
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Dec 2022 12:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4731C433F1; Fri, 16 Dec 2022 12:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF02EC433D2
	for <linux-firmware@kernel.org>; Fri, 16 Dec 2022 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671192651;
	bh=kuS5hNF9eekVNo6kT3MmrkVWmU+2zYxqJY74zCb9nkk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=erw3dSAkf03OcRJMqi9mPRsyGi6u/A8Mmmj3DFEgHWy5W5/0Q+hya1wgLTItSjFee
	 BBRGTUqOkVF40ApBt8goEcpdmwrsg4nntBBO+MH4UwJ/BR5fVYXuAQxoaO1poKhMIU
	 y0H8QqQJyAe8aq3Alx9B6zwK/ceCgyd4tvyMuhp1OtmCPAUBv2/28irRamTgid53xf
	 6Nfcqk9QufiFJWDoaar0Hq45x2se3GGr3CA0MDagR0/H0wuz2G8dPHPRjNO2PG70jj
	 xiDcZbFG5pDFToBbbMbu4dUzLfOcbgIlG+KGHahL6Uhpc6Tcj7ag0ejKrfjD6wnp8a
	 Dqooys/HEC0fA==
Received: by mail-pj1-f43.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so2224213pjd.0
        for <linux-firmware@kernel.org>; Fri, 16 Dec 2022 04:10:51 -0800 (PST)
X-Gm-Message-State: AFqh2kq6i+QlkVCHihayotKR8Sd4cpFsqdCwlXrxw5+AgE91Cfipzia4
	ydUuqowNuPMGe4Ru/MzsXJn1mNx6yWhy7/pdZP8=
X-Google-Smtp-Source: AMrXdXu8vw0Of7NxAmQRbo7DdJftokTe1Gv9X7tuUVl+iwU1+hgFaL2D0vMmQQ4qPixUzr88FqDXnINvgdd6C+w2u5o=
X-Received: by 2002:a17:90a:b28c:b0:219:468e:88ac with SMTP id
 c12-20020a17090ab28c00b00219468e88acmr1028754pjr.105.1671192651281; Fri, 16
 Dec 2022 04:10:51 -0800 (PST)
MIME-Version: 1.0
References: <f3f5066578b088ee35dd7103a36bb6fc7c543ead.camel@realtek.com>
In-Reply-To: <f3f5066578b088ee35dd7103a36bb6fc7c543ead.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 16 Dec 2022 07:10:40 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7U8o9bFqCDO-+F2Kssc86dRegEkr0rdnso7HD6s3BqvA@mail.gmail.com>
Message-ID: <CA+5PVA7U8o9bFqCDO-+F2Kssc86dRegEkr0rdnso7HD6s3BqvA@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852c: update fw to v0.27.56.9
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 14, 2022 at 9:01 AM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update 8852c firmware of rtw89 driver to 0.27.56.9
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit f3c283e198d3fb69f5183b8dea4fd32b8c3cbe76:
>
>   amdgpu: updated navi10 firmware for amd-5.4 (2022-12-14 07:42:05 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to c9c19583f71721963b435fc6bc9d1eab49c73ad4:
>
>   rtw89: 8852c: update fw to v0.27.56.9 (2022-12-14 21:55:58 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw89: 8852c: update fw to v0.27.56.9
>
> Ping-Ke Shih (1):
>       rtw89: 8852c: update fw to v0.27.56.8
>
>  rtw89/rtw8852c_fw.bin | Bin 1516040 -> 1532608 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
>
