Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B61DC77B7D
	for <linux-firmware@archiver.kernel.org>; Mon, 15 May 2023 11:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1CDCC4339B; Mon, 15 May 2023 11:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA842C433D2
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684150827;
	bh=t9KAR/esFYqPJfPzAw/dzp/+KmPZST8HeRL8Vn82jVA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=grSTeX6+NjKwFqL94lBiSbNgcz/bI06X1t3aip/dBvxYhByahBBn1sCyCvqTtxZY2
	 XUlUyxw3Y+lAQAGizDntNXxLSFQJHozi5NHcwEHQE8tOn1lCdGkQAJ4gbz5yEles28
	 72LGltUqplVt1n520iwfLYIZtCzsTXA5+dmQtfpXFnJ482yv6rEA0AbbQhNZ7zRW9S
	 rgxwWlc5nK77M3H5f4LT/QULZ5lOYP6wD4L0G/YoQYst9kDVxbwakTOb4KRrDjxAYt
	 79oCYSx6+cGAv187MZO4Axku288hxR1GJxtDiBUoJMBovUfrCQrHg1cAdxtQ/4ZDQo
	 usIUYxRVu2vNQ==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55a5e0f5b1aso122116537b3.0
        for <linux-firmware@kernel.org>; Mon, 15 May 2023 04:40:27 -0700 (PDT)
X-Gm-Message-State: AC+VfDwBHfN5r0nLQA1fmYW3r19Jg3DtAuSxfOpyo5FDYt39y1w7J+Mr
	zPb2l+0xY69dYuSP8f2bSwagu1ifn8Gcyecbl0E=
X-Google-Smtp-Source: ACHHUZ5SQXu9TuapW3CD0hdU5zs5ksKeY+zS0tjCPPwU02QSkni9ZB9RRDRqA/5RFCy+58wYQ8IERb1LWyOApZfHzAk=
X-Received: by 2002:a81:6c4d:0:b0:561:aa8:6b11 with SMTP id
 h74-20020a816c4d000000b005610aa86b11mr9547486ywc.28.1684150826765; Mon, 15
 May 2023 04:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230509151902.65810-1-juerg.haefliger@canonical.com>
In-Reply-To: <20230509151902.65810-1-juerg.haefliger@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 May 2023 07:40:16 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7L4KrQvQFmYn5Cyt50SO-xbHrRhv570iyWw=f6BNT_1A@mail.gmail.com>
Message-ID: <CA+5PVA7L4KrQvQFmYn5Cyt50SO-xbHrRhv570iyWw=f6BNT_1A@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: Cleanup Realtek BT firmware provenance
To: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 11:19=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> From: Juerg Haefliger <juergh.haefliger@canonical.com>
>
> Over the years, Realtek has submitted updates of firmwares that were
> originally pulled out of vendor driver packages. Remove old and obsolete
> provenance notes for these blobs.
>
> Signed-off-by: Juerg Haefliger <juergh.haefliger@canonical.com>

Applied and pushed out.

josh

> ---
>  WHENCE | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 74a496864afc..7b78ac22d0ea 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3794,18 +3794,11 @@ Found in vendor driver, linux_bt_usb_2.11.2014042=
3_8723be.rar
>  From https://github.com/troy-tan/driver_store
>  Files rtl_bt/rtl8822b_* came directly from Realtek. These files are
>  updated on April 14, 2017.
> -Files rtl_bt/rtl8821c_* and rtl_bt/rtl8723d_* came directly from Realtek=
.
> -File rtl_bt/rtl8822cu_fw.bin came directly from Realtek.
> -updated on February 24, 2019
> -File rtl_bt/rtl8822cu_fw.bin came directly from Realtek.
> -updated on October 23, 2019
> -File rtl_bt/rtl8822cu_config.bin came directly from Realtek.
>
>  Found in vendor driver, 20200806_LINUX_BT_DRIVER_RTL8761B_COEX_v0202.zip
> -File rtl_bt/rtl8761b_fw.bin
>  File rtl_bt/rtl8761b_config.bin
> -File rtl_bt/rtl8761bu_fw.bin
>  File rtl_bt/rtl8761bu_config.bin
> +
>  ------------------------------------------------------------------------=
--
>
>  Driver: btmtk_usb - Bluetooth USB driver
> --
> 2.37.2
>
