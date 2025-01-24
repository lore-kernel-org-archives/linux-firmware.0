Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2079C02181
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Jan 2025 13:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DC3BC4CEE3; Fri, 24 Jan 2025 13:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881E6C4CEE2
	for <linux-firmware@kernel.org>; Fri, 24 Jan 2025 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737726691;
	bh=qj8d9iR1pc40pJAWEGQCPbcSHLqz/venFxM7ZauuI9M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PfGBDLpkxCxGmbb60MZ88VKc9dd/Ne/wVuY/L3AZbcs9Z6DLacEilnKWdCc4UyG2/
	 mAGpdC0f9BMqtXHxJIVGXc3P9tr8yqVci4aMKpswlbo+S7o2WPnNx767JmDcqcQCzN
	 I+eEHNYMsYc9a+J3zCsN0eY9I4xJBKHcasJIlLi82KAzH1QKcHWNNNh6SrVcqR0nAI
	 RMBFvHrHAVOvAN4LHJyrPM1PbSDqW46IwdXwNwqvSt04GTdfjiUI6NovdJenJkx/MY
	 +4kmZ5M39g9EJTrNYByEetWUM3O7khXoTT/PctavpTXrKpeaQKSUYDBBDQvcYjTdj/
	 IeLQEXy6g0xGQ==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3c9ec344efso2992966276.2
        for <linux-firmware@kernel.org>; Fri, 24 Jan 2025 05:51:31 -0800 (PST)
X-Gm-Message-State: AOJu0YyVCmtex7EKYXE4cgBSbF67dSWEUR6kAB1oZt+ulGiiR38Dbs/a
	T8sMAJNQOHoij1GoJKl9cBAg3EeTCOQvuWVdIvYjstfa6dfj/CQiBO1nAsHFKf0E3s/0fpMp8C7
	7ODwhEXss9vqkO44bsivigFk0zzo=
X-Google-Smtp-Source: AGHT+IFZHoVFhnMsrbWr6b13gkjpy7tUgwPfNhuAVIw9LQoGszrrlDuOVLlPMOgAQ46f2YXIWjPRn3MSTNqAsEFTmlE=
X-Received: by 2002:a05:6902:188e:b0:e58:1501:23ae with SMTP id
 3f1490d57ef6-e58150126a2mr7997898276.9.1737726690759; Fri, 24 Jan 2025
 05:51:30 -0800 (PST)
MIME-Version: 1.0
References: <5ae5f4b3-92de-4ea4-a4be-2f21f610cd46@quicinc.com> <3be5c5f8-6c47-4ca4-9998-44761bba9f3b@quicinc.com>
In-Reply-To: <3be5c5f8-6c47-4ca4-9998-44761bba9f3b@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 24 Jan 2025 08:51:19 -0500
X-Gmail-Original-Message-ID: <CA+5PVA60RJ4hwp3AL9t-yc2srDtxaH9bxvkuvse0iqnWgraSsA@mail.gmail.com>
X-Gm-Features: AWEUYZmAcv9WzQTd_ATwmXlOcD4BotRQtU6-e9J4vssfJ1MCK80P3xqRHDeZ8Jg
Message-ID: <CA+5PVA60RJ4hwp3AL9t-yc2srDtxaH9bxvkuvse0iqnWgraSsA@mail.gmail.com>
Subject: Re: QCA: Update firmware files for BT chip WCN6856
To: Vivek Sahu <quic_vivesahu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 5:57=E2=80=AFAM Vivek Sahu <quic_vivesahu@quicinc.c=
om> wrote:
>
> Hi Team,
>
> Please include firmware bins for WCN6856.
>
> Major contributions : Bug Fixes/Stability.
>
> Snapshot of pull request is as below trailing mail.

The original email is enough.  No need to send two.

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/427

josh

>
> Regards,
>
> Vivek K Sahu
>
> On 1/24/2025 4:24 PM, Vivek Sahu wrote:
>
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if y=
ou have any problems.
>
> The following changes since commit 27ef6224c306b342c940dfafa1f5b3d060d966=
53:
>
>   qca: Update Bluetooth WCN6856 firmware 2.1.0-00642 to 2.1.0-00650 (2025=
-01-24 16:08:32 +0530)
>
>   Merge branch 'parallel' into 'main'
>
>
> are available in the Git repository at:
>
>   https://github.com/vivesahu-qcom/bt_hsp_fw650.git HEAD
>
> for you to fetch changes up to 0ff5d85785fba6f7f23ecb57d36047bb3eb515ad:
>
>   qca: Update Bluetooth WCN6856 firmware 2.1.0-00642 to 2.1.0-00650 (2025=
-01-24 16:08:32 +0530)
>
> ----------------------------------------------------------------
> Vivek Kumar Sahu (1):
>
> qca: Update Bluetooth WCN6856 firmware 2.1.0-00642 to 2.1.0-00650
> Thanks and regards,
> Vivek K Sahu
>
