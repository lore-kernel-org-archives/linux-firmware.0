Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0D3C19776
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Feb 2025 14:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EBDBC4CEE2; Fri, 28 Feb 2025 14:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A8AC4CEE5
	for <linux-firmware@kernel.org>; Fri, 28 Feb 2025 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740752564;
	bh=YrAZZ0PXP5RjSr4W8+ynydCh7w4dki4z3wY77uRoG9E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EFIenLh+3t6G/0EDNTEcT26Vcdx3srf/mqTsWArGGLIvFNYr+bpbP1HLGruAHp0cR
	 Mxqbn887JD6CeYxp9jtOfzx+8rL3WJA0KpcRc55WxGnOv2nLzrHwoBKP8C08FJlDWd
	 3eJjchTBLZEvCDqcOGssNJZzvEC/bipJkhFXJfjZBjdKMUonI1B1TQQNVQAMMr7Del
	 X18xaX/bMB7iYYL1I38wShIT5KDJI6KW/cyoA7GXeR+2yRngKhT4XZ1o1xGC5L62QM
	 jx6i0Mo2sBb4LAodVTjRdiWdvdHROL3/CMXHlck8vDZmS4rLVc/l8D9Ejfu+MpU79R
	 oXGUpHS8vJmMw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fb2a0e4125so14059167b3.1
        for <linux-firmware@kernel.org>; Fri, 28 Feb 2025 06:22:43 -0800 (PST)
X-Gm-Message-State: AOJu0Yxg5XfC/bNIDRrdl81Drb47aEUdn22vaHm6rlUvc9yh1CxUkgvS
	2zg3QeFpd1v+rxpN8yxRMmalFw70zJ9VwxMnnGIapqqLzs1JmJIj08cmyIdljSrlhOP5jkx3KJT
	pVakPVCs/XImkd8tC2etcDF/oPTM=
X-Google-Smtp-Source: AGHT+IFfyUh86GcvZnrtYJPKMoqrbcpz+KFHRuNfCwiOATtnh4qd+SJoWoK730GrjXadozCYh+sJzkIMhFBLKCP6o14=
X-Received: by 2002:a05:690c:4c04:b0:6fb:b907:d94b with SMTP id
 00721157ae682-6fd4a08f53fmr48737467b3.17.1740752563081; Fri, 28 Feb 2025
 06:22:43 -0800 (PST)
MIME-Version: 1.0
References: <81e6a3ea-70a9-41ff-ba13-6121aa66d487@RTEXMBS04.realtek.com.tw>
In-Reply-To: <81e6a3ea-70a9-41ff-ba13-6121aa66d487@RTEXMBS04.realtek.com.tw>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 28 Feb 2025 09:22:31 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7Pbyf8rWZp88NkvHE8ACxs6g5BdB5ffCVGTbjs65Xg6w@mail.gmail.com>
X-Gm-Features: AQ5f1JpdpDnNsEsPYD_tNovf09kbvTFnhgJ5fqT_AayksyqNBl5z7nO-rU6cXd4
Message-ID: <CA+5PVA7Pbyf8rWZp88NkvHE8ACxs6g5BdB5ffCVGTbjs65Xg6w@mail.gmail.com>
Subject: Re: pull-request: rtw89: 8852bt: update fw to v0.29.122.0 and BB
 parameter to 07
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	timlee@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 10:11=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> =
wrote:
>
> Hi,
>
> Update firmware of RTL8852BT to v0.29.122.0 including BB parameters 07.
>
> Thank you
> Ping-Ke
>
> ---
>
> The following changes since commit 6cf959daab2a38d074b059f73c24aab9d4dbcb=
c3:
>
>   Merge branch 'amd-sev-fw' into 'main' (2025-02-20 18:38:39 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-02-24

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/460

josh

>
> for you to fetch changes up to 0a69dcd33a4b2d9ec7286146c99cf6c37714d09e:
>
>   rtw89: 8852bt: update fw to v0.29.122.0 and BB parameter to 07 (2025-02=
-24 10:54:49 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw89: 8852bt: update fw to v0.29.122.0 and BB parameter to 07
>
>  rtw89/rtw8852bt_fw.bin | Bin 913992 -> 918376 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
