Return-Path: <SRS0=qGCO=7S=chromium.org=wenst@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D0ED29DC9
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Jan 2026 05:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14C71C19421; Tue, 13 Jan 2026 05:15:35 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46840C116C6
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 05:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46840C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-382fb2bb83dso37121311fa.1
        for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 21:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768281332; x=1768886132; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWBxLf1QC+y4YgB8POl0KL9EwXvMQCo2FGvWmorcofw=;
        b=m5/i0VG/nnO0ddbH3x0d+bMc1BcFSlitOeMzPDtNsWokvpYXsRebNw6SB2UCykWHMW
         R0kAqjzeUoB1Ntcmc4J6y5U9w5irYF5EG+se1dHpQ8x95CfcyzGG05dMpQ39sLhQcJNS
         1rcxAorLX8PY2rslGYarO4OhGQUs3KRg5/tX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768281332; x=1768886132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWBxLf1QC+y4YgB8POl0KL9EwXvMQCo2FGvWmorcofw=;
        b=q1rK+6hMuYQ9EUX7Aa9CcETWCRijKOVl5CeEISQ//vh+ff3Jeo0tRypEFVHHBuCw7V
         BLP2DR96sl6OfdD7yprHGRvFfMtUeMlX91JfsNtGbk85MSv2qlaazdwRRuVdaKz4DrkA
         FE8xGl670qiM1KMK7RlFt9w743kahi+708s75QWrgzoU6ThB848cevukNwKdTxsvVsSK
         sHfFRVZNp4aP4lucfUny+OM/YJBMVm3iabS+teKufmC/4C9k9AO7Lk3iru2j7hv1Bwxu
         d+5n7jdFEJXgyZO5cCsWnrXLDmdHAKKARmndvWhDCjlaP1EJpPGUSCau0pql++1Vjga/
         MQ+w==
X-Gm-Message-State: AOJu0YxgYlnxSlXY8UG2qeMDeOdvHtcGcazc/fInFSW4Mb0KNdxLkmUh
	9x5F0NDD2WyAu4iS4irB4U4rNXzOvIujA9whFMwT14ZXpDfiMzZkbv092Zg4iUrjeACGaySL5hE
	PujIvvGWU9eemupJxvBM/gf151RPbVkJOBtjMKXSv
X-Gm-Gg: AY/fxX5e0BipbxhuQAcw9X4bHK86+e7ahhuWFEV8GohhKCu8LpUTMI9TAi9elNSouFb
	V7FoWpSt31tnMCpsPciQsrWckfwwpo+19MProdLn/tkHGrfxobibHYDqrIvpvsXdjgBv5Li1I7f
	ziPll1+f4xPC1WD6v63TAh5u4AiPV3wqvhwScpLrVus+lWWZj5qNxoleb8LzygBZ3ykoxBm3+ia
	3inUuVINthvUstz4nl1hdl4kWY10XBroulNBMC9mtgkRA9D6fxr+yrQwSrLWmX0aOqSCFqwJ83p
	9HWNrff/t/BB79lE/mcMHMwT3g==
X-Google-Smtp-Source: AGHT+IHWKs0mfOOzl5izVTf2Xnk+dBtkiERsFPIhjYONY21eCvBjmqzHviJFVUDrzrpWYYipwkevq6I80fQTIre1OE4=
X-Received: by 2002:a2e:bd06:0:b0:37f:af1a:d455 with SMTP id
 38308e7fff4ca-382ff6dd8d4mr54027781fa.26.1768281332335; Mon, 12 Jan 2026
 21:15:32 -0800 (PST)
MIME-Version: 1.0
References: <20260113020959.2377348-1-moudy.ho@mediatek.com> <20260113020959.2377348-2-moudy.ho@mediatek.com>
In-Reply-To: <20260113020959.2377348-2-moudy.ho@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 13 Jan 2026 13:15:21 +0800
X-Gm-Features: AZwV_QgQaYc38zex9UgDK8EJeiDeEy6Wlobj2pgj5rttXP7rM_aLnUG0nodlUAc
Message-ID: <CAGXv+5Ee59X1TufGeyJxo_JeLjSYC6qam=GwRXcZWyYkEQ7fCQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: add symlink for MT8188 SCP dual core firmware
To: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	nfraprado@collabora.com, Jason-ch.Chen@mediatek.com, 
	angelogioacchino.delregno@collabora.com, Macpaul.Lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 10:10=E2=80=AFAM Moudy Ho <moudy.ho@mediatek.com> w=
rote:
>
> The MT8188 device tree (DTS) is configured for dual core SCP, and the
> driver by default attempts to load "scp_c0.img" as the core 0 firmware.
> Without this symlink, the firmware fails to load and the following error
> is observed:
>
>   [   79.494105] remoteproc remoteproc0: powering up scp
>   [   79.496217] remoteproc remoteproc0: Booting fw image mediatek/mt8188=
/scp.img, size 636548
>   [   79.497298] platform 10500000.scp: IPI buf addr 0x000ffb40
>   [   79.498013] platform 10500000.scp: IPI buffer does not fit in SRAM.
>
> This patch adds a symlink "scp_c0.img" pointing to "scp.img" under
> meditek/mt8188/ to ensure proper firmware loading for dual core SCP.

It should be the opposite. "scp_c0.img" is the proper name used upstream,
"scp.img" is the old name used in old DTBs.

So you should rename "scp.img" to "scp_c0.img", and then add a symlink
"scp.img" pointing to "scp_c0.img".

> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  mediatek/mt8188/scp_c0.img | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 mediatek/mt8188/scp_c0.img
>
> diff --git a/mediatek/mt8188/scp_c0.img b/mediatek/mt8188/scp_c0.img
> new file mode 120000
> index 00000000..8d1dcd4d
> --- /dev/null
> +++ b/mediatek/mt8188/scp_c0.img
> @@ -0,0 +1 @@
> +scp.img
> \ No newline at end of file
> --
> 2.45.2
>
>
