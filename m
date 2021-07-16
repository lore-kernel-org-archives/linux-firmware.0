Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E6EC12002
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Jul 2021 11:52:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 87FA1613FE; Fri, 16 Jul 2021 11:52:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FD76613FC
	for <linux-firmware@kernel.org>; Fri, 16 Jul 2021 11:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626436359;
	bh=j91FiuonnZd/UzU/U7HlHzDss6SWE4iBrPn1hlMhhIk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kyy+C9qg46RRuAOGGLRb+/CzmCEwcTGXRQbUiXxoCuBhCqoH3IOTb+1xmVlYs+F9E
	 nk96kmTghaVM5/NDgqYnuswgeFFAeLdZdNuJ20PPlzyahs+xY1hg68W0QHdCBVK8f5
	 2/Zwku8hCNjHmDMmv2cssb94rQBvhikKQLZlBI+U65Ll2IU34A6KRuVqaZoPqAQ3CH
	 jyXKekU4WgWWp7RwLX1xT0Iy32hbFD37AlXa4CrjdRZJQ9SQkblpmDk3br1Uip4E+e
	 czwl5iVSvei5uo2rU8GlpQM2TI7NGkDZdIoCvWoe3vRlgi9J4sw67wqevpv6IA1JNb
	 aIxrpMe25WcOg==
Received: by mail-io1-f46.google.com with SMTP id z11so10329156iow.0
        for <linux-firmware@kernel.org>; Fri, 16 Jul 2021 04:52:39 -0700 (PDT)
X-Gm-Message-State: AOAM533/hlJbv1MS314TkoK1MAzoIpaNr5miRziLTIJZnALkoaV1gPm4
	d0bW9jCOiqgGhZQ4FwY6k6hvBfwXuNY1kHZiSzg=
X-Google-Smtp-Source: ABdhPJzBSHRAtfFvxNANCaNpcOuVPiyLV7dSsS8TCBbxyUt+P83ZW6lWu+sB3jUU2035SHpy62FZlUNPJb1DCiG0VWs=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr8606754jag.106.1626436358844;
 Fri, 16 Jul 2021 04:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210707081735.3010667-1-pbrobinson@gmail.com>
In-Reply-To: <20210707081735.3010667-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 16 Jul 2021 07:52:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5L=E2i_bGb8qHd0UwPfOLx9pANhc__Xv7Xqr2xDoH_sA@mail.gmail.com>
Message-ID: <CA+5PVA5L=E2i_bGb8qHd0UwPfOLx9pANhc__Xv7Xqr2xDoH_sA@mail.gmail.com>
Subject: Re: [PATCH] rtlwifi: de-dupe rtl8192e WiFi firmware
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Jul 7, 2021 at 4:17 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The rtl8192eefw.bin and rtl8192eu_nic.bin WiFi firmware are identical according
> to sha256sum so remove and link the former to the later as rtl8192eu_nic.bin
> also has matching wowlan and ap_wowlan variants.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> CC: Larry Finger <Larry.Finger@lwfinger.net>
> ---
>  WHENCE                  |   3 ++-
>  rtlwifi/rtl8192eefw.bin | Bin 31818 -> 0 bytes
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  delete mode 100644 rtlwifi/rtl8192eefw.bin
>
> diff --git a/WHENCE b/WHENCE
> index 623935d..b481a18 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3170,7 +3170,8 @@ Info: Initial version taken from Realtek version
>        rtl_92ce_92se_92de_8723ae_88ee_8723be_92ee_linux_mac80211_0017.1224.2013
>        Updated Jan. 14, 2015 with file added by Realtek to
>        http://github.com/lwfinger/rtlwifi_new.git.
> -File: rtlwifi/rtl8192eefw.bin
> +      Same firmware rtl8192eu_nic.bin so just link them
> +Link: rtlwifi/rtl8192eefw.bin -> rtl8192eu_nic.bin
>
>  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
>
> diff --git a/rtlwifi/rtl8192eefw.bin b/rtlwifi/rtl8192eefw.bin
> deleted file mode 100644
> index 4a034d3ae8910df49682876dfe44fe8690798825..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 31818
> 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
> KP@SgNTmK&fTs;*4
>
> --
> 2.31.1
>
