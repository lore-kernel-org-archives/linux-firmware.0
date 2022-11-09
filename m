Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AD3C433FE
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Nov 2022 17:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE0B9C433B5; Wed,  9 Nov 2022 17:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32E6C433D7
	for <linux-firmware@kernel.org>; Wed,  9 Nov 2022 17:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668015803;
	bh=YohDgZ9DC4RqZmYVMj5r41wA08Cd/pVpxv/SunWnH2s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aH+qrIfkR4/nC6nWcqdFRYeSxAuZdGAXWJtdK/wUVdaDeV/m4BAJ6begsS7lbzLGb
	 qMBc7gbuzfFpKZbNudf3G0OHartsSo/v/kfCSG8NJqN8TsoN8s8Tc12KI3uYV25E85
	 SJNc4Tw6ceYQRO6w+52rCcEqax9ohOID5pNRr+HRoksr0dsmjgqbRUgISmm9dDZZuK
	 3NPGmTrPj1NTHJ4ERYkaLoTi2jyEhLVJNGU7cNK5chi5jsZpEyIh89V7O13xCkkpYC
	 cjhk+J3tODQ8K0TmJcVfFLtwEtSeRKZGpFZ44S/VAVmjNGlqkLOY5IvOhB4Cf4Wpl3
	 3YroUuzll6Phw==
Received: by mail-ot1-f51.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so10519748otl.3
        for <linux-firmware@kernel.org>; Wed, 09 Nov 2022 09:43:23 -0800 (PST)
X-Gm-Message-State: ACrzQf2WbjdFdu//sRa11li8yglzD63VyL5JcsY1fsCXi46L9BUSHE5F
	+vDppauGge1VP5HSU7u6arbJH8GMaBwHfHcKwa0=
X-Google-Smtp-Source: AMsMyM7jTRmNDhif2qE9RN/V+X0E+p1ecFJyGtmjhP50lf1sbPVMYEcjt/M6il2QrJ+9jvVXqYfT8Ulba18lRNX6M2E=
X-Received: by 2002:a05:6830:6089:b0:660:ea3e:46b7 with SMTP id
 by9-20020a056830608900b00660ea3e46b7mr30170032otb.166.1668015802760; Wed, 09
 Nov 2022 09:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20221102130230.23896-1-hildawu@realtek.com> <20221102130230.23896-2-hildawu@realtek.com>
In-Reply-To: <20221102130230.23896-2-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Nov 2022 12:43:11 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7enZyXOjSrwEaQf9P31e152gCF8oJSE3estyUQLBuh-Q@mail.gmail.com>
Message-ID: <CA+5PVA7enZyXOjSrwEaQf9P31e152gCF8oJSE3estyUQLBuh-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] rtl_bt: Update RTL8822C BT UART firmware to 0xFFB8_ABD6
To: hildawu@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Larry.Finger@lwfinger.net, max.chou@realtek.com, 
	alex_lu@realsil.com.cn, mu_hua_chen@realtek.com, hsinyu_chang@realtek.com, 
	kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"

Both patches applied and pushed out.

josh

On Wed, Nov 2, 2022 at 9:03 AM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8822C BT UART controller.
>
> Release Version: 0xFFB8_ABD6
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8822cs_fw.bin | Bin 61796 -> 62040 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
> index 48ff5d223f1f93dda36481373336514797cfa16e..f22013afaa5be2955653470e7124970c0ce5c3d5 100644
> GIT binary patch
> delta 6560
> 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
> S2ju?<2ju^gF*`t$T=57DGld!e
>
> delta 6355
> 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
> V1_*<PlM#c5lM$0KJ3y0A@(3QaHgf;~
>
> --
> 2.17.1
>
