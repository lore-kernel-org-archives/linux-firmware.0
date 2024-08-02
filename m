Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A273C3DA4A
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Aug 2024 10:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62162C4AF0B; Fri,  2 Aug 2024 10:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CABDC4AF0D
	for <linux-firmware@kernel.org>; Fri,  2 Aug 2024 10:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722595957;
	bh=qcrAcHO2YSjhcP7c6sC3WwCXTGCSBiTo31OGfvGC594=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Jn1dB8nxQOGyMr6fuNLuPgbcGaJcQY4rSBv/6Vq00NNmdd8AWXZmtiUfBpLbquJU4
	 /LiPOHgnSO2wRCTk5ZzUJ3EsBSgTODHDzXkg/7/L4SKyQwF7hehnCuVEEG+sHlg/04
	 oSXjBITvLd5yHxoN5TjM5/gq9ik64CAc2opUBjS0JmuErwWHhS3UyIpyyx6PSWjsNv
	 CAmHEHQXK8dM4+qQuqcLzCJFhkNd5u2+dj6kg/kGtOnQhN8WVGrnT5/M7NNYpOL+rK
	 rrjgkATqCgQL5sTX1TjJvzKKBpgPOAOEOWdTfYQ/2vyCuT7dCAqnMkAGeXd21uTS+c
	 sUQeodMhLmbfA==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-64b417e1511so66423417b3.3
        for <linux-firmware@kernel.org>; Fri, 02 Aug 2024 03:52:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YwZsMHezoZnxcfgzsa9bj5h9X7mQmj0nJ63azzfow02ZrMSKcPS
	mOjcP+mG9Bt9jNyr++QNYhBllm431Zn4yx+nE+Y3QWytUkZ96ybjszfSFMdNl02tXAjYrxKaG9v
	CruZhYMH6UV7wzkajcgTsKcOHhfM=
X-Google-Smtp-Source: AGHT+IERv05sOyklefryRccSd46bjfA63PokS0TsNG/WLbPxs09/cIXwxAbZ5h9QNyu509cAL3J/yBm8u5pPSrXdHsw=
X-Received: by 2002:a81:6e8b:0:b0:62f:37c9:77bc with SMTP id
 00721157ae682-6895a1e4c43mr36967567b3.0.1722595956518; Fri, 02 Aug 2024
 03:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <bb54bfc8-edc2-4e76-bead-f2a25e663ec8@quicinc.com>
In-Reply-To: <bb54bfc8-edc2-4e76-bead-f2a25e663ec8@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Aug 2024 06:52:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6YbQZ+XUTGbteeHw7UH30dBrGFRS6q2w-FPC_hWtbGJw@mail.gmail.com>
Message-ID: <CA+5PVA6YbQZ+XUTGbteeHw7UH30dBrGFRS6q2w-FPC_hWtbGJw@mail.gmail.com>
Subject: Re: Update QCA2066 Bluetooth firmware to 2.1.0-00641 request-pull
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 6:11=E2=80=AFAM quic_zijuhu <quic_zijuhu@quicinc.co=
m> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit 65c5d9b1a4808462f5e885447dae1a133c96ab=
ec:
>
>   Merge branch 'amdgpu-20240726' into 'main' (2024-07-28 14:28:08 +0000)
>
> are available in the git repository at:
>
>   https://github.com/zijun-hu/qca_btfw HEAD

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/265

josh

>
> for you to fetch changes up to d118dc8ad5562ac0ae0c07be748cbe35a9361b47:
>
>   QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00641 (2024-07-29
> 17:41:28 +0800)
>
> ----------------------------------------------------------------
> Zijun Hu (1):
>       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00641
