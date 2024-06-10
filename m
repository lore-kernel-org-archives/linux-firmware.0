Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94361C27C55
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Jun 2024 14:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6485AC4AF1D; Mon, 10 Jun 2024 14:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E678C2BBFC
	for <linux-firmware@kernel.org>; Mon, 10 Jun 2024 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718028426;
	bh=h+He/nwRfR8g28lDy25VK7xMaM7Tgv7Aa+CrBrPsd60=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JO5WBCMmYfsiOP6WMFSm+s1553k6QIRnCfEETBNYgcgLGXmX4YlMPPVW14s0svRxY
	 wtqJ2fgwA3AIM+cF5U5yvK4SjnNl126MQIuZK42mnGCrZ2DyyVd8uh9xNSwNzOK/DV
	 Q4FoKl3jv2wMz4IQM9yxetn1vfxB2afUMp5LWJBcWZh2bol7vxv70Gg3RvDyc+h2PZ
	 Rb92l/CQY+OV2LbVHIKQxaHCmg/BzJly9EFfkxfT5IC9U1Mk1WiNzgpe8g53/xkG9M
	 SO9YrD8SYtURxJ3XpAydHamI4MZzw1JC8UuQ6erAhvyAPh49aat1z0QqzJaRHNymaL
	 cNFmGNv63eHiA==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfa7faffa6cso4976116276.0
        for <linux-firmware@kernel.org>; Mon, 10 Jun 2024 07:07:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YxYtzo7wBLhLG9wlx9U/UXoiCWxR02dYCKyC70t8r5NuzvIl1Z2
	3ytVgdi2QGCEOzK3nISt1PS0w4S9rFA2hk8sIzNM3WWfYqsdlXJXcwKORjnOqvfY3EvSOV4sdPg
	xRME3l//P75S8IaqnCDRnGnC9nR8=
X-Google-Smtp-Source: AGHT+IHcN/IkYeNmXxDCZEO4vyaqdw6nsrzR4d5gTyjrVQFm1I73P1CGdY0AScznlI53IO+lgG4fljKCqv2MvcTNx3c=
X-Received: by 2002:a25:c742:0:b0:df4:e36b:e9 with SMTP id 3f1490d57ef6-dfaf66e5577mr8133002276.54.1718028425442;
 Mon, 10 Jun 2024 07:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <c419baba-fe67-4a20-91cc-1df3ee117505@quicinc.com>
In-Reply-To: <c419baba-fe67-4a20-91cc-1df3ee117505@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Jun 2024 10:06:54 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4uy4UzUToCkEVNspCiyvmWA4Srv=H9Na2JM2r6MisgXA@mail.gmail.com>
Message-ID: <CA+5PVA4uy4UzUToCkEVNspCiyvmWA4Srv=H9Na2JM2r6MisgXA@mail.gmail.com>
Subject: Re: Update QCA2066 Bluetooth firmware to 2.1.0-00639 request-pull
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 4:50=E2=80=AFAM quic_zijuhu <quic_zijuhu@quicinc.co=
m> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit 92d264e864cef693e8da87f31dde6e575fc992=
1d:
>
>   Merge branch 'robot/patch-0-1716949439' into 'main' (2024-05-29
> 02:42:42 +0000)
>
> are available in the git repository at:
>
>   https://github.com/zijun-hu/qca_btfw HEAD

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/223

josh

>
> for you to fetch changes up to 436b0a920352d13290043d9ec9e50c420ab10f92:
>
>   QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00639 (2024-05-30
> 15:20:09 +0800)
>
> ----------------------------------------------------------------
> Zijun Hu (1):
>       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00639
