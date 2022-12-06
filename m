Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01854C352A1
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Dec 2022 12:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0F85C433B5; Tue,  6 Dec 2022 12:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C3AC433D6
	for <linux-firmware@kernel.org>; Tue,  6 Dec 2022 12:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670330184;
	bh=zuewj9TnJcM6sd/WVqqSNogJrDwdJGuSOgHykRyUWYc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DPLy93NJlwuzkpV4OiRp9CsFvd2fZNHae2NgdGvcR99LM1+SM4eV89lojR2faXg6m
	 r3HkkPK6L9qVude0n5lEVxeTPrn07lm8LkZr6ITmecQdi5F9ezi2XfmNMKUYLhFON+
	 dTBYuJ447p1/TOWSHTxX2INI/ICB+UCxLN8QpDoV8KCSP7BkFL5varaaPXeIOJrouk
	 n0loyHN5OBCfxwi3jFhZx1HjJyQCy3OHJPv1gFMfR3g+6QTZlhw+5zTuL9rHjrzL3z
	 aQxUKZFya4IC4T1+Y7MmpcIn23S2BRR/byxenS+A56rZRdAgJfBnGxGIc818AP2apn
	 SjKmAvg7BrEWA==
Received: by mail-oi1-f171.google.com with SMTP id t62so16713460oib.12
        for <linux-firmware@kernel.org>; Tue, 06 Dec 2022 04:36:24 -0800 (PST)
X-Gm-Message-State: ANoB5pn7KqB4LXSK8XxY/29HSTtYqmYNQ4eq+W1YuZOBPNDFp2fa2BHF
	U1r9MdWp8Z6COoeNxJddZgyG1CJekjg4USd04uU=
X-Google-Smtp-Source: AA0mqf4T+9WbHvhhWpAnBf+bf7DFnd/0GMgGAXBV5oN1XAAUmaxgh+5KiDVyRoqivd1UTduK6WhCPL4jeOQJcQmYUaY=
X-Received: by 2002:a05:6808:642:b0:353:b8c5:4845 with SMTP id
 z2-20020a056808064200b00353b8c54845mr33128914oih.267.1670330183597; Tue, 06
 Dec 2022 04:36:23 -0800 (PST)
MIME-Version: 1.0
References: <20221202104829.3411-1-max.chou@realtek.com>
In-Reply-To: <20221202104829.3411-1-max.chou@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 6 Dec 2022 07:36:12 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6fdjvi44UCN68G9aS5HzRco4xZeJf_CrYWGPMUOBjycg@mail.gmail.com>
Message-ID: <CA+5PVA6fdjvi44UCN68G9aS5HzRco4xZeJf_CrYWGPMUOBjycg@mail.gmail.com>
Subject: Re: [PATCH 1/1] rtl_bt: Update RTL8821C BT(USB I/F) FW to 0x75b8_f098
To: max.chou@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, alex_lu@realsil.com.cn, hildawu@realtek.com, 
	karenhsu@realtek.com, kidman@realtek.com, hsinyu_chang@realtek.com
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Fri, Dec 2, 2022 at 5:48 AM <max.chou@realtek.com> wrote:
>
> From: Max Chou <max.chou@realtek.com>
>
> This firmware patch update for Realtek RTL8821C BT controller with USB
> I/F.
>
> Release Version: 0x75b8_f098
>
> Signed-off-by: Max Chou <max.chou@realtek.com>
> ---
>  rtl_bt/rtl8821c_fw.bin | Bin 51700 -> 54636 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8821c_fw.bin b/rtl_bt/rtl8821c_fw.bin
> index b30e645f193c2a4415c435ecc889e9d7bb137cc3..e1e78206a3165cfde920152d91d79ef2f98869f2 100644
> GIT binary patch
> delta 12193
> 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
>
> delta 9234
> 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
> TKkyG9m1N9=rj`hP{qz3=5r@h{
>
> --
> 2.34.1
>
