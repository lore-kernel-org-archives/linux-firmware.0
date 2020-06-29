Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D36C433E4
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jun 2020 19:12:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DECCF20776; Mon, 29 Jun 2020 19:12:10 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BDEEF206E9
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2020 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593457930;
	bh=14p0VXky6iGlyWj0ZUViaUSLe38mjYP4L51lBrr4uBA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=1EiXqGjOBdhYv7J4mmV1fByg4Q+oY18m3arZ9X4BFBp6tU8frXr+8LAfkQRWbHXgQ
	 COpTpRiNaLFwFUvaZRrXxTqMBBw6lx3PsxzPekTuHUrzUYuXRSBevcEBFx1LMocmVH
	 nLOgshzSoJqm12iAAeDoNMU2ndAS7vL3LNa4l4zY=
Received: by mail-io1-f43.google.com with SMTP id f23so18393272iof.6
        for <linux-firmware@kernel.org>; Mon, 29 Jun 2020 12:12:10 -0700 (PDT)
X-Gm-Message-State: AOAM533/iNedEkIZs9lQ4EZ571z8c4F126RIhfCz/HI3gBsnqWLcUJso
	IUolS5YkAFQRHAQ/ZkyhodPTL/r1ptEY/nyag2Q=
X-Google-Smtp-Source: ABdhPJyEnKNBID9+F1koe4AAgyNE3UH8l7NPIkOsWzRYAxYcvFz7rvX3A+G5nnVQbWmcYIFmD0bOGinVFzqZhVpP1OE=
X-Received: by 2002:a6b:c910:: with SMTP id z16mr18052240iof.120.1593457930284;
 Mon, 29 Jun 2020 12:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_MsOdHrb46f9tcxminQUc_Uqw=zgHHhzLsYdjaW_nFN+g@mail.gmail.com>
In-Reply-To: <CADnq5_MsOdHrb46f9tcxminQUc_Uqw=zgHHhzLsYdjaW_nFN+g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 29 Jun 2020 15:11:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4BwVKJQbPMwH05ZXa7Xr-a3AKX-kY-pmLd=OfVVyTKuA@mail.gmail.com>
Message-ID: <CA+5PVA4BwVKJQbPMwH05ZXa7Xr-a3AKX-kY-pmLd=OfVVyTKuA@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 29, 2020 at 12:55 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> The attached patch adds UVD firmware for SI asics.  Please apply!

Applied and pushed out.

josh
