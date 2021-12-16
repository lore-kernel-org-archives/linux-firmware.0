Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B7C433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Dec 2021 14:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A13EC36AE7; Thu, 16 Dec 2021 14:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA8CC36AE6
	for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639665129;
	bh=4+rMHOEQpJCvGSkx0e7zN/4DAdrkwTKpeFolNplFJD0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Exd/+ltj/PoFZMZZ6Is+Nc8fdyLa7D9wQ/OXpxkjF0H7UdwONd/sirQsMZiv5jk3f
	 D+BVSGcBNhfVVi/Zg8+9N0HgU325gUNHnLOgCveWCojbeFML/WtqKhIWA07zRDdmaq
	 ETIElriv5Sir3FR1KsC6uLUcueOf9wd+V8oo+/l3gSzuyPAWuF7R2QpmRcn4/daN3n
	 aVpiHcD+E/srwJhs797I2zjaR9XRobbXnFr2QX+25gN76UarltZ/IZDuX7QGCdsCio
	 2blNrx350zKVeCr6gnmZtsl/GhhNhuQhLxiiEApzG84mG1idZrxCvHjMPaPXoSevTA
	 M2U78DPYQv5GQ==
Received: by mail-il1-f175.google.com with SMTP id d14so19850970ila.1
        for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 06:32:09 -0800 (PST)
X-Gm-Message-State: AOAM531VtJeW40fPf6I3Psc0AdkSJ9VKl8hhZJeqBqxyiPH7MbZvO+JH
	9Lha8FljCwEq78QNJncoya4lqwascGH+93neQZQ=
X-Google-Smtp-Source: ABdhPJzI8fGfP+LPc3uZgeSfp3C8KGzHH1vGqQnVTY2k/zkAQys5tGY6SQn86cqN3hHPuBnwur5pGl6OwoB5TqwTcyA=
X-Received: by 2002:a05:6e02:168a:: with SMTP id f10mr9301133ila.2.1639665128115;
 Thu, 16 Dec 2021 06:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20211125085259.21602-1-hildawu@realtek.com>
In-Reply-To: <20211125085259.21602-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Dec 2021 09:31:56 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7QErK+XirRPzWLu3_0ow9-zZNbDnd+D8iZMu8HGVJayg@mail.gmail.com>
Message-ID: <CA+5PVA7QErK+XirRPzWLu3_0ow9-zZNbDnd+D8iZMu8HGVJayg@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8761B BT USB firmware to 0x09A9_8A6B
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Max Chou <max.chou@realtek.com>, =?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>, 
	Hsin Yu Chang <hsinyu_chang@realtek.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Nov 25, 2021 at 3:53 AM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8761B BT USB controller.
>
> Release Version: 0x09A9_8A6B
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8761bu_fw.bin | Bin 34796 -> 42088 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8761bu_fw.bin b/rtl_bt/rtl8761bu_fw.bin
> index 4bdc3a32ee634b3c66df0adcfa026352fe9993d3..d042bb1971800ea1526dcbfc782ae350be3a53fd 100644
> GIT binary patch
> delta 11709
> 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
> TU#SU`5jQ{x{|*5FQ3U;WB0P!Z
>
> delta 4448
> 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
>
> --
> 2.17.1
>
