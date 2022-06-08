Return-Path: <SRS0=1/HE=WP=canonical.com=dimitri.ledkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811D9C433EF
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Jun 2022 09:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C9CEC341C0; Wed,  8 Jun 2022 09:13:29 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13110C34116
	for <linux-firmware@kernel.org>; Wed,  8 Jun 2022 09:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13110C34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 92EE63F325
	for <linux-firmware@kernel.org>; Wed,  8 Jun 2022 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1654679599;
	bh=hyTg6F6Lypsmg9zWvREoAQEX2uMDpjOv4U51wJrGNQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=S4XceUBeZ4GL7RyFUBq8WrlB9LIR0JrD6jtD9uDKIo89x8ZsL2rFZopBHVvEgA7rv
	 OgDtwPxnrTeMNl2kRd81eo7SquRreNFt7+eIIrFT6lrh+ti0qh5tHJVvFUU9K+bm0b
	 3ItCudTkpFX8EBXMATMpEOCwlgwU/9qi6yl37225BfYRS/O6wq5p+aIRlze2dcbxH4
	 3UtBrRFHsGJUyFxR3pWt/fagaB586lxq7KCDSqMBsRI1/YKBI6GjBqsdbRCVg3F+4D
	 8WdQKaZhUMDrqCoW5q1GdwhqvAPNHtV9W0tQGfbupmDRvrnYh84Z6CbpbG+K5kdQ7f
	 Or2X4EP6WdLXw==
Received: by mail-io1-f69.google.com with SMTP id x13-20020a0566022c4d00b0065491fa5614so9437978iov.9
        for <linux-firmware@kernel.org>; Wed, 08 Jun 2022 02:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hyTg6F6Lypsmg9zWvREoAQEX2uMDpjOv4U51wJrGNQ4=;
        b=od2aeJ2IMZy8AzntRA+n775ItLMreqHmCJrjR4X3diCsCCvPgVhbWKJE0t06IZXY/R
         vduA4bkTBHYzrSmb7kCSp6I7PM2pZNuZFeHl4Bt3i1ChT38eEAgRFXn6i72TpjZkgHLJ
         j+Nd4PsJ3ZH/hsNeByQoXjvtSkc6CHTbgeddM8Qtw5cdmm3CmBjldkO+VE1ZwUutj+ZO
         pwl6j1KOXV2Y7CueX0vl62P7OO/LRtYksisbVoi+66FWkHv7vx+DlyE8PQkGRYa8n67W
         4apEdC7x7lxp2CuZAMszCFufjreOekDk5n9RAAwziIaxOrN7aHI/8b7oIBKlKiZ8D39S
         67Aw==
X-Gm-Message-State: AOAM531sjjozjmktxWJkfJROvRM4B/iZuC6jmRPFe0Yvb1Q7RFviVX7F
	Pm+NzE+2mBDGfLYfEgGaE1sh0tGtSqz5V3mgNnPQK9DmPNt1YoJF/lYQuWmHvVaE9xBIfcLeDNM
	8g28zulONd+J1FuB0W0s1lh1xTaSNIARAecTggfzw5CSsAhyJDmZlkA==
X-Received: by 2002:a05:6638:1446:b0:331:e0cc:bd15 with SMTP id l6-20020a056638144600b00331e0ccbd15mr2450361jad.89.1654679598224;
        Wed, 08 Jun 2022 02:13:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRrQGXHAjiY0NTsmJtYtS6vbX/mxuOKSJ/Elu28cLCxhKgIiOrXdppNkogncug4Yzyn9j7MvzOPGa1xaqRvOY=
X-Received: by 2002:a05:6638:1446:b0:331:e0cc:bd15 with SMTP id
 l6-20020a056638144600b00331e0ccbd15mr2450356jad.89.1654679597973; Wed, 08 Jun
 2022 02:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220607165641.104182-1-dimitri.ledkov@canonical.com>
In-Reply-To: <20220607165641.104182-1-dimitri.ledkov@canonical.com>
From: =?UTF-8?B?RGltaXRyaSBKb2huIExlZGtvdiDwn4+z77iP4oCN8J+MiA==?= <dimitri.ledkov@canonical.com>
Date: Wed, 8 Jun 2022 10:12:42 +0100
Message-ID: <CADWks+YJm8bi+KPXYTvQ3JrriDW2dcdxfSZ2O5J0vfhfC654Tw@mail.gmail.com>
Subject: NAK: [PATCH] WHENCE: add symlinks for StarFive based boards
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jun 2022 at 17:56, Dimitri John Ledkov
<dimitri.ledkov@canonical.com> wrote:
>
> StarFive VisionFive v1, BeagleV Starlight & Starlight r0 boards use
> AP6212 Wi-Fi module.
>
> BugLink: https://bugs.launchpad.net/bugs/1977872
>
> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
> ---
>  WHENCE | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index f634c12a2f..0841afa1ab 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2908,6 +2908,9 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
> +Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.AP6212.txt
> +Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100.txt -> brcmfmac43430-sdio.AP6212.txt

The early revision of the board was called
beagle,beaglev-starlight-jh7100-a1.txt, will send a v2 patch.

-- 
Happy Pride,

Dimitri
