Return-Path: <SRS0=o9Cr=5U=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A24C25B50
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Jan 2023 18:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05380C4339B; Mon, 23 Jan 2023 18:06:56 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2DCCC433D2
	for <linux-firmware@kernel.org>; Mon, 23 Jan 2023 18:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2DCCC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id g13so19454303lfv.7
        for <linux-firmware@kernel.org>; Mon, 23 Jan 2023 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SmI1q6Jnlrs1zy1NxwtaQQee4pAd4C+9o/kEp3Sn0RQ=;
        b=gKUG4OL8jvMtY/wTs08zS6cgdGXeW/LeKT2XhTuhF+coyVoEuuJonVBlbu2k1V4HtO
         u6HZLfDTjOHjULf9heBB6k9lOQmv73kyEdhCfALBEFxE663s7+I/2TW9MkJK2AvcLAbV
         FVkUKpprpSaOzUQKgk8dIpDyagVw51oj1p7XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmI1q6Jnlrs1zy1NxwtaQQee4pAd4C+9o/kEp3Sn0RQ=;
        b=cAiMHRVCmJrR0HAfwJQhQ/DeLzrOuJH6m8OcO4XWEkA4MmuLo6AIZ/PV4C2W3ZpO56
         nLvOJKF7Hqx8pEZYTCBd9eUMs8HlzRvrvF3PLS+T7Nrcu0cdJcijSp1Ig8IxNsTvFlcP
         /KxmLPIYIZ8MBBQssR1EjstrVMpf70YzxXumXx25lZ7Lxgv/ScpeKUINu1lwzoDFB9sf
         mPd1Tw8AqCNRzXLQf9YoPkmShl+DP7wAuHHZmf1zhXnGiC6kNbV50Iwrv9NUpdO7somV
         kZUbHaQm/vPw2ptRGRA51AIcXV/xA2Tmyps7aUFmiRXaWQArnYxREQoXkg6kIzzzv5A2
         CoSg==
X-Gm-Message-State: AFqh2kr++0w5MkNCWHocmXhVr2/vOTt85Mxi5KU9g61rsQFl8+34dEka
	wLBgN4kdBt98k+KeZeZQFMDwbZMG+oN6mXjbsnvM30QaQ62IImat
X-Google-Smtp-Source: AMrXdXv8lw4l9GTtqJaJPJJRyvVMvTd5ZiVcM8WCA96TNM/u3a9YwQqBpPMEQcop9UpUP0nLOR9pzz1L3hYqqDg7LjE=
X-Received: by 2002:a05:6512:1284:b0:4d5:9957:541 with SMTP id
 u4-20020a056512128400b004d599570541mr1436931lfs.52.1674497212970; Mon, 23 Jan
 2023 10:06:52 -0800 (PST)
MIME-Version: 1.0
References: <5dc7081a8b793baf08f20df6b641a86a80c9e15c.camel@collabora.com>
In-Reply-To: <5dc7081a8b793baf08f20df6b641a86a80c9e15c.camel@collabora.com>
From: Nathan Hebert <nhebert@chromium.org>
Date: Mon, 23 Jan 2023 10:06:43 -0800
Message-ID: <CANHAJhG3ba2jQhJ1p0nhN=XfFysp8vAPBW_wp9gsnyPu69bT7A@mail.gmail.com>
Subject: Re: pull request: add back missing symlink to Qualcomm firmware file
To: Denys Fedoryshchenko <denys.f@collabora.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

On Fri, Jan 20, 2023 at 10:23 PM Denys Fedoryshchenko
<denys.f@collabora.com> wrote:
>
> Add missing symlink required for Qualcomm SC7180.
> As stated in
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/qcom/venus-5.4?id=ad9fdba01fd2c909ea7962844211e25aa276e705
> likely by mistake file got deleted, instead of replaced by symlink.
>
> It results SC7180 failing to load firmware with following message:
>
> 1679 20:43:46.474154  <4>[   18.381820] qcom-venus aa00000.video-codec:
> Direct firmware load for qcom/venus-5.4/venus.mdt failed with error -2
>
> After fixing it device booting without error.
>
>
> The following changes since commit
> 7e4f0eda76d58024f78ac68d4ffd6f87d63a3a29:
>
>   Merge https://github.com/pkshih/linux-firmware (2023-01-17 08:00:15 -
> 0500)
>
> are available in the Git repository at:
>
>   https://github.com/nuclearcat/linux-firmware
>
> for you to fetch changes up to
> a02f1168becbaacbae82a7002ff489c137f9b8b4:
>
>   qcom: Fix symlink from venus-5.4/venus.mdt to venus.mbn (2023-01-20
> 14:18:17 +0200)
>
> ----------------------------------------------------------------
> Denys Fedoryshchenko (1):
>       qcom: Fix symlink from venus-5.4/venus.mdt to venus.mbn
>
>  qcom/venus-5.4/venus.mdt | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 qcom/venus-5.4/venus.mdt
It is my understanding that the link from qcom/venus-5.4/venus.mdt to
venus.mbn should be handled by the WHENCE file. There is a line [0]
that describes the link. A reviewer discouraged me from creating the
link in the file tree.
>
>
> Thank you!
>

Best regards,
Nathan Hebert

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/WHENCE?id=bb2d42dceff755623d6d59a32a743ccf87cbb6b9#n5730
