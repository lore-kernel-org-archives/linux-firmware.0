Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C9CC433B4
	for <linux-firmware@archiver.kernel.org>; Tue, 11 May 2021 18:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5170B6188B; Tue, 11 May 2021 18:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B88C616ED
	for <linux-firmware@kernel.org>; Tue, 11 May 2021 18:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620756603;
	bh=GQaCD1F5XIVekrIRlF7EzIHD4+KdT/KLt/SW4BKvahY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sNKD05ADUWkSwkFwPTkQ/MQCcdH5qdyo32mQu89wDQEzsQw9s/St/gLQEnu7qQ22j
	 /3QuVHU9RCuOgxHSBxN3TmH00sWq405ADIyPGD1TcIdUlfRmj/y3Bn25jYEYGBRSCA
	 /Ek10ntU07tYUldb8VozgAu7PMsVS0B0Kvt6D2L13ZmKTU35Wjicxm9bbKOauREtZz
	 Utrs7VqXv5GlGi0KKFLrGQx5xlWORL58kC1cMUwSldce9viF95LOn0wu0NYPIpBugh
	 Xt+dBIBWo4pKBw8gzghBrF0nWKoyQCvDTI43JqV6KoOp9Z4wJ5zKbnviiBGBl/pr9w
	 8tKUQcEfn1AzQ==
Received: by mail-il1-f176.google.com with SMTP id j12so17973028ils.4
        for <linux-firmware@kernel.org>; Tue, 11 May 2021 11:10:03 -0700 (PDT)
X-Gm-Message-State: AOAM530y2cn9eHC0LnQzA1oXsn7o8MyLTAa8rZe7/p2RLeLk1cp87wJd
	6OBx/CWsZg8rNyMOOuRVI8guitoLhcMct2uQPBk=
X-Google-Smtp-Source: ABdhPJyrSFHHatmkUJpQeJKst0O+PmAKqIChm3lHoyrX/CtXdIlwlU/NpGUzElKJ4AqAyYbxV0dnlU3gGakG8zhOpaE=
X-Received: by 2002:a05:6e02:811:: with SMTP id u17mr26771993ilm.206.1620756602611;
 Tue, 11 May 2021 11:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <57e9f582340545c79a9ab3433e2a4a7d@realtek.com> <87cztx87tr.fsf@tynnyri.adurom.net>
In-Reply-To: <87cztx87tr.fsf@tynnyri.adurom.net>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 11 May 2021 14:09:51 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4=ZfqvTi8_OB-d_QC-xmvjD=y_AV+hMyGjQtuNLGRaoA@mail.gmail.com>
Message-ID: <CA+5PVA4=ZfqvTi8_OB-d_QC-xmvjD=y_AV+hMyGjQtuNLGRaoA@mail.gmail.com>
Subject: Re: Request to update 8852a firmware of rtw89 to v0.13.8.0
To: Kalle Valo <kvalo@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Pkshih <pkshih@realtek.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 11, 2021 at 2:05 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Pkshih <pkshih@realtek.com> writes:
>
> > Please help to update 8852a firmware.
> > This is first time I send a pull request. If anything is wrong, please let me know.
>
> rtw89 driver is not in upstream yet, and it has not been reviewed
> either. I recommend holding off pulling the firmware until the driver is
> reviewed.

Too late.  It can always be revised if needed.

josh
