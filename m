Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C48C433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Dec 2021 14:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BCFAC36AE5; Thu, 16 Dec 2021 14:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB5EC36AE6
	for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 14:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639666019;
	bh=YdV1F2VqeJAMfCJglMnBft2P9B6hTQv6JmZfu6nbFmM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XDTTgpIyPd5xb9dw9VnUCOnjOEqwIHJcYQotAsrWdOXW7D9OBSgM2HayKQFfKp/HK
	 7EhnW8+tWY5e3qgs+5lngULifSwaRwRMgkAX5fVQ1AL7TikdMr9p/F5LJJbx5VFciK
	 xyWg789kgh+l7EsbzkpYABoyYzzYolCvXo0nLre3KunKSxhqz6nU5CCS6tZshWxBM0
	 28sHOG2rFxr7mKDLnJUugMXqn7jKqzRkuA9DW67hFTeazCNJ1AYQIQ++DThRnP30Zl
	 xaWN5e3YesS62qg6mKeIWYDKJ+A4mWMoNIDW8Q/3bFt+dWvxyBFLDrJJYzYIjam1YT
	 W/hwXVY34uiWw==
Received: by mail-io1-f48.google.com with SMTP id 14so35309387ioe.2
        for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 06:46:58 -0800 (PST)
X-Gm-Message-State: AOAM533JASfPJSNvrurQv6ypw2khYkWMFO5t7KWfrrwAID1dPvkP2VmC
	fcEe/3s2FDMHxkfLuDON8ZWmYRnjp3Z+PJEKw9I=
X-Google-Smtp-Source: ABdhPJy2dKpRos0EPOU4AvmAkscM14r4iIlupffCLGBHBm3Scrmg7wcwcVWts322eN1iAzaTNjQzCEmdL4sYR8UPVVA=
X-Received: by 2002:a05:6638:3014:: with SMTP id r20mr9631465jak.146.1639666018190;
 Thu, 16 Dec 2021 06:46:58 -0800 (PST)
MIME-Version: 1.0
References: <e270c9f1-d052-c40b-1d9e-f380f60a5a4f@codeaurora.org>
In-Reply-To: <e270c9f1-d052-c40b-1d9e-f380f60a5a4f@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Dec 2021 09:46:47 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4ZK9dVxMEP_zi=OW6TNQmiBKDWnS6+Vz7hYB9ezX2U4Q@mail.gmail.com>
Message-ID: <CA+5PVA4ZK9dVxMEP_zi=OW6TNQmiBKDWnS6+Vz7hYB9ezX2U4Q@mail.gmail.com>
Subject: Re: QCA Bluetooth WCN685x firmware pull request
To: Zijun Hu <zijuhu@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Rocky Liao <rjliao@codeaurora.org>, 
	tjiang@codeaurora.org, Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

This conflicts with the update I just pulled from tjiang.

remote: Enumerating objects: 7, done.
remote: Counting objects: 100% (7/7), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 7 (delta 4), reused 7 (delta 4), pack-reused 0
Unpacking objects: 100% (7/7), 81.20 KiB | 1.14 MiB/s, done.
From https://github.com/zijun-hu/qca-btfw
 * branch            HEAD       -> FETCH_HEAD
warning: Cannot merge binary files: qca/nvm_usb_00130201.bin (HEAD vs.
2d86903a10c2b06fdc84141167030931ac973a3f)
CONFLICT (add/add): Merge conflict in qca/nvm_usb_00130201.bin
Auto-merging qca/nvm_usb_00130201.bin
Auto-merging WHENCE
Automatic merge failed; fix conflicts and then commit the result.

Can you discuss and see if it's needed?

josh

On Thu, Dec 16, 2021 at 3:56 AM Zijun Hu <zijuhu@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.
>
> The following changes since commit
> commit b0e898fbaf377c99a36aac6fdeb7250003648ca4
>     linux-firmware: Update firmware file for Intel Bluetooth 9462 (Tue Nov 23 10:29:13 2021 +0530)
>
> are available in the Git repository at:
>
>    https://github.com/zijun-hu/qca-btfw.git
>
> for you to fetch changes up to 2d86903a10c2b06fdc84141167030931ac973a3f:
> ----------------------------------------------------------------
> Zijun Hu (1):
>         QCA: Update Bluetooth WCN685x firmware to 2.1.0-00297 (Thu Dec 9 16:09:53 2021 +0800)
