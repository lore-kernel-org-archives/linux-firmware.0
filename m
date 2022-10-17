Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB38C4332F
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Oct 2022 13:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31C33C4347C; Mon, 17 Oct 2022 13:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EF1C433B5
	for <linux-firmware@kernel.org>; Mon, 17 Oct 2022 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666013726;
	bh=MDNof1PMQXV9lfVxFotKOrygyV1jKzYmphFTUXA6Vbg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ftUDkBby9MvhNDIiw0eAYCQcwya5ZyNrQsmrsEg0HSJ/ug6zVstXifEp337+pOSCS
	 UwV+EkU5m/Yaq0QARCNg8Wc5pPel8tX96tY/zSKqx/AdY583LVFjlKP84ycgKmGQYK
	 lA6a8FpFGBCyoNpA0ZKHQcCi5lO51Sk+HmsrNjGETJ2ck4G8F3McsynRw2AUsFX/wJ
	 eTuSTttx1LhP1YtA45Gj4sXFOJAQNVtg1LhXryG1zRo/IUvTXHSPY7ay1TITuTshaU
	 uc0qSgRWqw+5M6g9s+ZzLtuwfA15VV466Jk8/8fTdXqq6javiaw8f2HUku2e7L41DJ
	 ELcfSCKdlo9DA==
Received: by mail-oi1-f182.google.com with SMTP id w74so12142677oie.0
        for <linux-firmware@kernel.org>; Mon, 17 Oct 2022 06:35:26 -0700 (PDT)
X-Gm-Message-State: ACrzQf1K6qRPFGARK8AuI4VOnrmyzo/ON5T0z8E+jPmos70xoFJMguMV
	gk9ZNbPYeN9ji5NYQW84uvxMVoqwD2hcpivfluE=
X-Google-Smtp-Source: AMsMyM7Cd5NsYCVZIBBfgVGystUtMMJBAUJNdiXPyyv3O0WhVwLtKZ4DRZV4VZQm0w0nQIiLi3MNq+2qhhGmNYFQW00=
X-Received: by 2002:a05:6808:1446:b0:354:f46b:8802 with SMTP id
 x6-20020a056808144600b00354f46b8802mr5002790oiv.267.1666013725251; Mon, 17
 Oct 2022 06:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <16127c1d65f44d37a125f6000f4b9714@realtek.com>
In-Reply-To: <16127c1d65f44d37a125f6000f4b9714@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 17 Oct 2022 09:35:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA44Ba_6HpB015VEAh4AUi8S9AObNZR1WxRiGDZugmwfbg@mail.gmail.com>
Message-ID: <CA+5PVA44Ba_6HpB015VEAh4AUi8S9AObNZR1WxRiGDZugmwfbg@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852b: add initial fw v0.27.32.0
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 14, 2022 at 2:48 AM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Add first 8852B firmware of rtw89 driver, and update WHENCE as well.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 49fccf689a13c0d49bc2f911247d51a4435a7eaa:
>
>   Merge tag 'iwlwifi-fw-2022-13-10' of http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware (2022-10-13 08:34:06 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD
>
> for you to fetch changes up to e497757a948697838d7d56bf0cf94831b3655d6f:
>
>   rtw89: 8852b: add initial fw v0.27.32.0 (2022-10-14 14:36:08 +0800)
>
> ----------------------------------------------------------------
> Ping-Ke Shih (1):
>       rtw89: 8852b: add initial fw v0.27.32.0

Pulled and pushed out.

josh

>
>  WHENCE                |   3 ++-
>  rtw89/rtw8852b_fw.bin | Bin 0 -> 1029056 bytes
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  create mode 100644 rtw89/rtw8852b_fw.bin
>
>
