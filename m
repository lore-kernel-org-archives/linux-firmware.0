Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7916EC55ABD
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Nov 2020 15:18:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 525DF22275; Fri, 13 Nov 2020 15:18:11 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2F0FA2225E
	for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 15:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605280691;
	bh=ELa6/A6IH5SZ58CW/xBfrugiy1Lyc3GwQ5JlAubhoD8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=w0Q/tj9ezK1Mhp70E2SndVyZirHiqKHbR/fDxT3OJbSDFS1rBNGVSp9umKq/7EJtw
	 I8ikby77uuTLhOoBIEu5c5bxT1xR1yjWRogkC5ZIg+uaGIYK+5i4YUlFXojGS3Ny5n
	 q1wF7GC56qzyG1khGTeKT3ZbNdXxqvqaY4H2nmbM=
Received: by mail-il1-f170.google.com with SMTP id g7so8757405ilr.12
        for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 07:18:11 -0800 (PST)
X-Gm-Message-State: AOAM533iFt60n75lnuIJO3vunyeoK8XxiMy3HuKmkrNiUIPVPSD6Lg+U
	b/z9SW2L4smxL3iIBLe2A8pSskSMAUiU8rQaLaU=
X-Google-Smtp-Source: ABdhPJxmAyvxd9YQ6yY7BJNKPxJBVBE8O99qgCtfbszweIMnTVv72zH/QWXPPjUPf2CkB6R4wPVLIkjiA/Exir/Cdjc=
X-Received: by 2002:a92:4846:: with SMTP id v67mr243909ila.206.1605280688729;
 Fri, 13 Nov 2020 07:18:08 -0800 (PST)
MIME-Version: 1.0
References: <71acb08c5c7e7b10f4112b350707ee82@codeaurora.org>
In-Reply-To: <71acb08c5c7e7b10f4112b350707ee82@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 13 Nov 2020 10:17:57 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5+Z6S9H__X0DJ17zo+H2dABb5M591qHK4zDcvbBdEXhg@mail.gmail.com>
Message-ID: <CA+5PVA5+Z6S9H__X0DJ17zo+H2dABb5M591qHK4zDcvbBdEXhg@mail.gmail.com>
Subject: Re: Request to Update WCN3991 FW file
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

On Thu, Nov 5, 2020 at 2:06 AM <asitshah@codeaurora.org> wrote:
>
> Hello Team,
>
> Please include updated firmware bins for WCN3991. Change includes
> updated TLV file to fix BT SSR.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
> >>>>>
>
> The following changes since commit
> dae4b4cd084102cd49c37aa8b579b208028ab025:
>
>    Merge branch 'v1.1.5' of
> https://github.com/irui-wang/linux_fw_vpu_v1.1.5 into main (2020-10-23
> 08:10:37 -0400)
>
> are available in the git repository at:
>
>    https://github.com/shahasit/bt-linux-firmware.git master
>
> for you to fetch changes up to d7793e53b156126f6ea09c8d6e17cc9a8fe0ca77:
>
>    QCA : Fixed BT SSR due to command timeout / IO fatal error (2020-11-05
> 12:26:32 +0530)
>
> ----------------------------------------------------------------
> Asit Shah (1):
>        QCA : Fixed BT SSR due to command timeout / IO fatal error
>
>   qca/crbtfw32.tlv | Bin 126832 -> 126892 bytes
>   1 file changed, 0 insertions(+), 0 deletions(-)
>
> <<<<<
>
> Regards,
> Asit
