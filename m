Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738B9C433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Oct 2021 11:17:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4DF8160F4F; Mon, 25 Oct 2021 11:17:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37EBE60EFF
	for <linux-firmware@kernel.org>; Mon, 25 Oct 2021 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635160668;
	bh=r7DyUTrVNiR4Tfk0DduN686lPgFQhx65579z0d5Oq1I=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mQYYQckYqy4B2PimbWjRp4Wf38nx1WfqjM8LiHQTp7Ex+9L5lym6gJMu5D6oDlkbt
	 FYt9qmCPVrV1Qf+bW7pk8UWtuHkwTkgnp+a5zj46AGZkpT8+XLogJx01MygZBvPahD
	 kMyYBJ7FxczfbsWLZumfwMZy4bztnFsG/MPbEfiq1bROKK6g084DcfVPwO+82qNn5I
	 7ANcbVnkQ4HYRSVq+m/b+H5+czAsxgkdZrlSuBWDn1Z45nsMX3hgVLC0SYlyQd3laL
	 C07EZxdROfD6OsczCpRNSfJ3izxy+yeAaNZl0qwhJUX7YK01YsvZaHSLq94M+Dl+vB
	 KMy9ZrMWpRlww==
Received: by mail-io1-f50.google.com with SMTP id q6so10829156iod.7
        for <linux-firmware@kernel.org>; Mon, 25 Oct 2021 04:17:48 -0700 (PDT)
X-Gm-Message-State: AOAM5318lnRU6njk6InkEL/HeyfyDlHN2YYv7r5nSDBGDvj2/VygJsHR
	HRSTpd48q/WhbrrhksInOaRq/HyOA+igcn+UYkE=
X-Google-Smtp-Source: ABdhPJxV6Ql6EQmw/eaOYsHwJF02XvjvHCko7O/jLAzr9A6ZQGlWao+2LVnhihFF/Nux8urivSO/LmbhYLxZC4wQmVs=
X-Received: by 2002:a05:6602:2dca:: with SMTP id l10mr9676884iow.175.1635160667636;
 Mon, 25 Oct 2021 04:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <ce803519aaf7feb5845bc694ceb55b1d@codeaurora.org>
In-Reply-To: <ce803519aaf7feb5845bc694ceb55b1d@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Oct 2021 07:17:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4YdACvgNPUSE-w-x6HUa9nX-gz6RPkimj6htZ-edanUQ@mail.gmail.com>
Message-ID: <CA+5PVA4YdACvgNPUSE-w-x6HUa9nX-gz6RPkimj6htZ-edanUQ@mail.gmail.com>
Subject: Re: btqca firmware 20211019
To: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 19, 2021 at 4:11 AM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.

qca/nvm_usb_00130200_0109.bin is a new file and needs to be added to
WHENCE.  Can you please adjust and resend the pull request when it's
fixed?

josh

> The following changes since commit
> d34196f55db16f2344483f94718c2b2263a5489e:
>
>     linux-firmware: update firmware for MT7921 WiFi device (Mon Oct 18
> 13:11:16 2021 +0800)
>
> are available in the Git repository at:
>
>     https://github.com/rjliao-qca/qca-btfw.git
>
> for you to fetch changes up to c2e1fd30d91e22f9540f8253f1890c06cbba1a75:
> ----------------------------------------------------------------
> Rocky Liao (1):
>          QCA: Update Bluetooth firmware for WCN685x (Tue Oct 19 16:00:42
> 2021 +0800)
