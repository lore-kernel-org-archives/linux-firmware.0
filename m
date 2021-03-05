Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D11C433E0
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Mar 2021 13:08:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1DDA165014; Fri,  5 Mar 2021 13:08:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF30464FE1
	for <linux-firmware@kernel.org>; Fri,  5 Mar 2021 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614949713;
	bh=won+Zu+s2zJ9WjwM1hlrAZ5e/ynTi8jfRNSnLIcR+0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=e+oSb5u/olo3TI6ywyFq44mJ0vo1FPSWTPsupq0HwiaGjA/Or5wfMCt+wQrPNLVr7
	 IP5LpLx2X4v68V813pSXUDA+/j+Dwpi9HOzIBLRS3OrFidbEdSCVOOhdC4esIX7Apb
	 by2M+GxoALBt9yEsTMoqStPgJ6OUpgdLvWCDM2cQ/NV0KZpugae2JzChFnzRMQzap1
	 L72XVAtmh8mLNC/QWe1ZYf8tL3uQX+B+AK2499akEB/62N1qm7959+NFilCgnro5I9
	 U78jmq1+S0lvZqcrRGpXxfYoUiBtl9+UDcxuhqIklaG0oxFN6ZJYh1YhNMjORyoMx/
	 yG98qUwuaipgg==
Received: by mail-il1-f172.google.com with SMTP id e2so1941345ilu.0
        for <linux-firmware@kernel.org>; Fri, 05 Mar 2021 05:08:32 -0800 (PST)
X-Gm-Message-State: AOAM533By5ukSYT9yLsmEfjyy9o9EuhdOuQBbLfEt+yF18TYYMLOjzQR
	lKROLd6jP35wB2I/wJKaqRi87FacqJJ7FZfNxOA=
X-Google-Smtp-Source: ABdhPJwkZfwRCMBt0EZHcxDQVjwKr5nRrGSSsH8KaUc5ivLE1aBAmVAfv6EIB2caXkwjlpXbW20AwSCKcKGREBzY1Vg=
X-Received: by 2002:a05:6e02:216f:: with SMTP id s15mr8924296ilv.81.1614949712437;
 Fri, 05 Mar 2021 05:08:32 -0800 (PST)
MIME-Version: 1.0
References: <2833354.gXvVfaC4I7@pc-42>
In-Reply-To: <2833354.gXvVfaC4I7@pc-42>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 5 Mar 2021 08:08:20 -0500
X-Gmail-Original-Message-ID: <CA+5PVA62OvSOkdw_x=oGgXHcD1y5zz9cf0cdthKgGHddH30eRw@mail.gmail.com>
Message-ID: <CA+5PVA62OvSOkdw_x=oGgXHcD1y5zz9cf0cdthKgGHddH30eRw@mail.gmail.com>
Subject: Re: pull-request: linux-firmware: silabs: add new firmware for WF200
To: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 3, 2021 at 12:27 PM J=C3=A9r=C3=B4me Pouiller
<jerome.pouiller@silabs.com> wrote:
>
> Hello,
>
> I know that PRs are less convenient for review, but it seems that my patc=
h
> does not want to reach the MLs (because it is too big?).

I got both copies :)  I actually prefer PRs for firmware because
otherwise it's 1% things we can review and the other 99% is megabytes
of non-readable stuff anyway.

> So, this PR contains only one commit. It adds the firmware for Silabs
> WF200. This firmware is necessary for the wfx driver currently hosted in
> the staging/ directory of the Linux kernel.

Pulled and pushed out.

josh

>
> J=C3=A9r=C3=B4me Pouiller
>
>
> The following changes since commit f7915a0c29fee27a310cebd7155b9e3a6eb71a=
1d:
>
>   amdgpu: add initial firmware for green sardine (2021-02-11 09:31:02 -05=
00)
>
> are available in the Git repository at:
>
>   git@github.com:jerome-pouiller/linux-firmware.git add-silabs-wf200
>
> for you to fetch changes up to 520f71bdedba1b0687b0d9fbd86ff9e84a56677b:
>
>   silabs: add new firmware for WF200 (2021-03-02 14:32:33 +0100)
>
> ----------------------------------------------------------------
> J=C3=A9r=C3=B4me Pouiller (1):
>       silabs: add new firmware for WF200
>
>  WHENCE                  |  10 ++++++++++
>  silabs/LICENCE.wf200    | 115 ++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  silabs/wfm_wf200_C0.sec | Bin 0 -> 305232 bytes
>  3 files changed, 125 insertions(+)
>  create mode 100644 silabs/LICENCE.wf200
>  create mode 100644 silabs/wfm_wf200_C0.sec
>
>
>
>
