Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE0FC433E2
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Jul 2020 14:44:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D91FE2084C; Thu, 16 Jul 2020 14:44:11 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BA98520825
	for <linux-firmware@kernel.org>; Thu, 16 Jul 2020 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594910651;
	bh=jEJTiHoFVYkD0JQnDpdy9N0U1kE0CdBaGEzuIUBvmWc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XMsQMRWbvgKA0ghNMj54ePCMcu51CjrOvOhgBBIbWbK+UPyZpA+kSRQiCkqnU8oB1
	 xheGwsUAZQLhzKmf+SyyNOqQPZpn73/hE/Gasefd9jmiGIfWBF1v4LHg0lHLvDPHmn
	 myR6/f5G4nwaTkfurP3soHu51p/p2puBHsIX0Vjk=
Received: by mail-io1-f51.google.com with SMTP id c16so6234389ioi.9
        for <linux-firmware@kernel.org>; Thu, 16 Jul 2020 07:44:11 -0700 (PDT)
X-Gm-Message-State: AOAM533jlYSb21ZtKh5mscbgjhvakLhfc0gxmAnO/f0YK3jvYvmG7pJa
	9EInT+TBIUwOh0fLocJ/1m5mnKfeMu0j1119Tkk=
X-Google-Smtp-Source: ABdhPJzfbB/6Ox7V5UJgWHrAwQ/fTy2KkkD0iT058tfJVF31BPUz+BpvdAOAZcvNW4qC9RTJBEeFwfD9k3tLqo185BI=
X-Received: by 2002:a6b:c910:: with SMTP id z16mr4745171iof.120.1594910651194;
 Thu, 16 Jul 2020 07:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <cfee5e2b0064b8aa387e13901913a3a424dc1eec.1594624155.git.ryder.lee@mediatek.com>
In-Reply-To: <cfee5e2b0064b8aa387e13901913a3a424dc1eec.1594624155.git.ryder.lee@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Jul 2020 10:44:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7AiTau50zWyiGVjijQ96WX4Z_PVHGExgyt0thWvWztMA@mail.gmail.com>
Message-ID: <CA+5PVA7AiTau50zWyiGVjijQ96WX4Z_PVHGExgyt0thWvWztMA@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: mediatek: update firmware v2 for MT7615E
To: Ryder Lee <ryder.lee@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Jul 15, 2020 at 9:15 PM Ryder Lee <ryder.lee@mediatek.com> wrote:
>
> From: Shayne Chen <shayne.chen@mediatek.com>
>
> Update to 20200629111339 version to aligh SDK. Mainly fix DFS false alarm.
>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  WHENCE                 |   2 +-
>  mediatek/mt7615_n9.bin | Bin 457992 -> 457992 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/WHENCE b/WHENCE
> index 086374d..40256bb 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4643,7 +4643,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
>  Driver: mt7615e - MediaTek MT7615e Wireless MACs
>
>  File: mediatek/mt7615_n9.bin
> -Version: 20200131
> +Version: 20200629
>  File: mediatek/mt7615_cr4.bin
>  Version: 20190114
>  File: mediatek/mt7615_rom_patch.bin
> diff --git a/mediatek/mt7615_n9.bin b/mediatek/mt7615_n9.bin
> index f6ad748155672dd52fd7f41c452c320ad8ef8d7d..761ad9bbc8714eca880cb7fd24a3c0ea761bf839 100644
> GIT binary patch
> delta 51
> zcmeD9CEf8$x}k-!g{g(Pg{6gc3){6noMuLrhK7d5#+K9X|6!BngL4`7>|tO40Onp0
> AvH$=8
>
> delta 51
> ycmeD9CEf8$x}k-!g{g(Pg{6gc3){6noQB4Rh893*H2wY`HfcUMmtoHy1_l7-5fGpN
>
> --
> 2.17.1
