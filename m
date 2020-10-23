Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31968C388F9
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Oct 2020 12:07:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E5F2F24248; Fri, 23 Oct 2020 12:07:04 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B88AC221F9
	for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 12:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603454824;
	bh=MNWp9GQYPa/P/DTRLFU60x7t7/yuI14dxvnRGZgCNKk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qD2AhsKM2zyjpR2DzH+X8wkWLDT/rN6XGgqYvz8OqyCcf3Ea93I6vrP+XBsk1UGUQ
	 FC2XBfchAhqzdP34wfCNrcGpv7aKr/G1LHoHldUsaZYkXMQ5vRDtjH/IPSZWTvh30d
	 qY5o7yUIk+oYK2qZ72neCvGCk99kCAasDyXZeY7s=
Received: by mail-il1-f177.google.com with SMTP id j17so1121686ilr.2
        for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 05:07:04 -0700 (PDT)
X-Gm-Message-State: AOAM533BkrI3T7B5vea9FxBAnwarrvAAUdA8Pj5PJaK/BiuZvzC3evzT
	k2aAN1omh1U8hJOu6tN3bRjjC6asIG+55yTCBZw=
X-Google-Smtp-Source: ABdhPJxCgORnaVr8UgO+Y2tceTSZtC20+SEJbhMfJsw4uMJ21whVFbJwQWikdKNAAs3H6hJhMc1cew3p7LSel65eidI=
X-Received: by 2002:a05:6e02:664:: with SMTP id l4mr1410434ilt.81.1603454824020;
 Fri, 23 Oct 2020 05:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <b74ea9cb201bb98691ecbfb3893d2a49@codeaurora.org>
In-Reply-To: <b74ea9cb201bb98691ecbfb3893d2a49@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Oct 2020 08:06:53 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5YguS6cKMUNCPMGeFjEd_+e5Wk92M6MBTN322MFqM4EQ@mail.gmail.com>
Message-ID: <CA+5PVA5YguS6cKMUNCPMGeFjEd_+e5Wk92M6MBTN322MFqM4EQ@mail.gmail.com>
Subject: Re: Update WCN3991 FW file
To: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, mka@chromium.org, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, Hemantg <hemantg@codeaurora.org>, 
	gubbaven@codeaurora.org, abhishekpandit@chromium.org, 
	Balakrishna Godavarthi <bgodavar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Sat, Oct 17, 2020 at 11:33 AM <asitshah@codeaurora.org> wrote:
>
>
> Hi Team,
>
> Please include updated firmware bin for WCN3991.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
> >>>>>
>
> The following changes since commit
> 58d41d0facca2478d3e45f6321224361519aee96:
>
>    ice: Add comms package file for Intel E800 series driver (2020-10-05
> 08:09:03 -0400)
>
> are available in the git repository at:
>
>    https://github.com/shahasit/bt-linux-firmware/tree/master
>
> for you to fetch changes up to 8877322c1254f327f47c86ec02c46013b68b9a47:
>
>    QCA : Updated firmware file for WCN3991 (2020-10-17 20:53:36 +0530)
>
> ----------------------------------------------------------------
> Asit Shah (1):
>        QCA : Updated firmware file for WCN3991
>
>   qca/crbtfw32.tlv | Bin 126300 -> 126832 bytes
>   1 file changed, 0 insertions(+), 0 deletions(-)
>
> <<<<<<
>
> Regards,
> Asit
