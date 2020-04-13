Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C0DC2BA19
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Apr 2020 11:56:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3604420767; Mon, 13 Apr 2020 11:56:52 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 142A920753
	for <linux-firmware@kernel.org>; Mon, 13 Apr 2020 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586779012;
	bh=NKQeM5BS3mUIxm1ApFxYjoywQdRYYcVsgj1UTV2xfc4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=V/YFtduGg5xxoCYr9TViwE21jRxvfPQI2T6Iv22380gMb+8gJUbwUdedM8tI2s9vd
	 b6hJWN3dKg7DZAzBs1XHpGh+8Lad62NKUeNuZ5UOjoDpvxmPQXtK/J9FnHu9rLqfSp
	 GmuNqcXmJXi9TugR8MzyPabvGXINEkTkAAs0W/as=
Received: by mail-io1-f50.google.com with SMTP id f3so9061788ioj.1
        for <linux-firmware@kernel.org>; Mon, 13 Apr 2020 04:56:52 -0700 (PDT)
X-Gm-Message-State: AGi0PuYyS6g41ouM5B+UG5MfaSAptJ0spZwpNHHhtwttBuQ7vEjUfZzs
	upToh9B9qqdIQNZTPBvJ5j0iB8YJCK8MZJhrA3s=
X-Google-Smtp-Source: APiQypJQ6sHXWGeKPzcbqcGlzHobMuxn/+DCcijMRUSAj0MjfznYqeJbEY4eDvRs8Ku6uf8QpS8lq1exv/0uA/qfxOc=
X-Received: by 2002:a02:cc19:: with SMTP id n25mr15156808jap.107.1586779011426;
 Mon, 13 Apr 2020 04:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <4ac4959d44823e7a23618b970f68293e@codeaurora.org>
In-Reply-To: <4ac4959d44823e7a23618b970f68293e@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 13 Apr 2020 07:56:40 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4zsVfaMse=TKPVcnavzg-f=qPMOQqhrnYmRTcg6g=0YQ@mail.gmail.com>
Message-ID: <CA+5PVA4zsVfaMse=TKPVcnavzg-f=qPMOQqhrnYmRTcg6g=0YQ@mail.gmail.com>
Subject: Re: Update fw file to enable transparent WBS
To: Balakrishna Godavarthi <bgodavar@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, mka@chromium.org, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, Hemantg <hemantg@codeaurora.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, gubbaven@codeaurora.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 3, 2020 at 4:55 AM <bgodavar@codeaurora.org> wrote:
>
> The following changes since commit
> edf390c23a4e185ff36daded36575f669f5059f7:
>
>    Merge branch 'v12573.77' of https://github.com/erinlo/linux_fw_scp
> (2020-03-20 07:39:19 -0400)
>
> are available in the git repository at:
>
>    https://github.com/bgodavar/qca_bt_fw
>
> for you to fetch changes up to 1a8b0dc00f77ec8bbc8aece2d1fc19222326efe5:
>
>    qca: Enable transparent WBS for WCN3991 (2020-04-03 14:15:42 +0530)
>
> ----------------------------------------------------------------
> Balakrishna Godavarthi (1):
>        qca: Enable transparent WBS for WCN3991
>
>   qca/crnv32.bin | Bin 5388 -> 5388 bytes
>   1 file changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

josh
