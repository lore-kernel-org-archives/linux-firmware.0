Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA6AC433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Nov 2021 17:25:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4115B60F9D; Tue, 23 Nov 2021 17:25:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A05960F41
	for <linux-firmware@kernel.org>; Tue, 23 Nov 2021 17:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637688304;
	bh=PKMtWaxTDGF8chPucmyCcNbLogkXsi7a2e9q8qxM7m0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Oj9K6c1hDeWf7EUq9nAV5UGXyLQi3oB1eGq7ABcfwyEtTHev+2VgC8WjmfK2Xpvnh
	 DMClcNizcVFsBZuZ6ZH0JhmH5KExdVlyJRjxE2egL94gv8PQJsYXQUeRsg+GiHqKmU
	 IWQVqRzvrwS160GH7RhFHrOefLPKHm3fW8P5NF4s/n7B1S7sHzN854yFNRCsflgzYG
	 sokypBRei8jZmFq1tGCg0zDaTz+N5oMKI7EMDORfFJj1cDMMhkwtwdJmqjGTyztxRV
	 pKxx09Po98Bf+h0ahpTCB2MnxdBdMJL+IPLgPRZFHYEkqdSGNGRpPtI+PgLNG0oYyh
	 bFLJn6+oMq90Q==
Received: by mail-il1-f180.google.com with SMTP id h23so22452080ila.4
        for <linux-firmware@kernel.org>; Tue, 23 Nov 2021 09:25:04 -0800 (PST)
X-Gm-Message-State: AOAM53050JQdeOOL0OJzHzHkvh7BPpojqTsMoVsF4/vLJDRE0G20Tw2D
	mimXotoeZpN9rWiIWceC2Xh92gpZVDmaqt4fLDs=
X-Google-Smtp-Source: ABdhPJyWvMGMIrKrvhlGorQk5kEOYA4ZxEXragtWj3qEsox83jVLJKreEboiE1ztb5AZ/GJEhp2MSj5/0fO0LPUj9ZE=
X-Received: by 2002:a05:6e02:12e2:: with SMTP id l2mr7694996iln.251.1637688303574;
 Tue, 23 Nov 2021 09:25:03 -0800 (PST)
MIME-Version: 1.0
References: <d11597264d04b8e21a425ffb48372c5c@codeaurora.org>
In-Reply-To: <d11597264d04b8e21a425ffb48372c5c@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 Nov 2021 12:24:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4x75_MwvuzZumRLmerRm5-nY6HZCH95vQddnWhexQBSg@mail.gmail.com>
Message-ID: <CA+5PVA4x75_MwvuzZumRLmerRm5-nY6HZCH95vQddnWhexQBSg@mail.gmail.com>
Subject: Re: btqca firmware 20211117
To: tjiang@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 3:28 AM <tjiang@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit
> f5d519563ac9d2d1f382a817aae5ec5473811ac8
>
> linux-firmware: Update AMD cpu microcode
>
> are available in the Git repository at:
>
> https://github.com/tjiang123/qca-btfw.git
>
> for you to fetch changes up to 73a13f4d8d6059768f1090a95c43b8b5333b58db:
>
> Tim Jiang:
> QCA: Add Bluetooth firmware for WCN685x

Pulled and pushed out.  Thanks.

josh
