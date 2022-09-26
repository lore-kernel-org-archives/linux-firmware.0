Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2A0C07E9D
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Sep 2022 14:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBDBDC4347C; Mon, 26 Sep 2022 14:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6886C433D6
	for <linux-firmware@kernel.org>; Mon, 26 Sep 2022 14:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664202437;
	bh=1U5VBGz85XhNUc2UADvk3Pgf0NByRxd3FTgYZdNJFrM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LU70XK5my3UbwctpDxoJy3hgYk5kwu8eoDcOYfPOP8HG+zkUymfsgCpGYs9gjGec0
	 9/IbuEVXRR+SiEyWOZwGOR/60S/Vhe+7GsVZ9An17Cekt/RnBLBiIv8QU3T9ka1okr
	 7aZPGeueHXLIum7Yn+tFPpclxhUgpgDzKYlpBjbNsR/b7sd+qNS+UQavkQzhqMi2ex
	 R5L4LRQu3lkln8Kcg1zbNYp16eZEIx5tVXqikdTUunwKVBNQ8lO8ikn/tH500KbpAH
	 desMhcyN6gEHrjwT7ZXP4L3DBUxBmOKAp6pkZwMggJ/qVL3YjFcLokbtQspfj5bonW
	 Al/+ntCRRu9nA==
Received: by mail-oi1-f180.google.com with SMTP id m81so8480586oia.1
        for <linux-firmware@kernel.org>; Mon, 26 Sep 2022 07:27:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf3aCWsw8F9DKR4k0VkOppGrhQwfEi7vjfVNtIDMjL8VYR5RKQbj
	unSyJDiknIrk6drnzf+QNVYr2KoG31v0jik5MDo=
X-Google-Smtp-Source: AMsMyM6ECsDl0rUTQCplACP+WIsxAWk/8w6OCE7Tlu//TA9K039EvcqcUk0Nu4YyLih4ANv0ZWTPXCNf+aSr6GeWGYM=
X-Received: by 2002:a05:6808:f05:b0:350:c7fc:3a71 with SMTP id
 m5-20020a0568080f0500b00350c7fc3a71mr10597133oiw.267.1664202436844; Mon, 26
 Sep 2022 07:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
In-Reply-To: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 26 Sep 2022 10:27:06 -0400
X-Gmail-Original-Message-ID: <CA+5PVA60ODTEZPoYqPMqjxu_ARxFLmeHie11McQUAx95+bXwFw@mail.gmail.com>
Message-ID: <CA+5PVA60ODTEZPoYqPMqjxu_ARxFLmeHie11McQUAx95+bXwFw@mail.gmail.com>
Subject: Re: [PULL v2 linux-firmware] Update mediatek mt81xx SOF firmware
To: TingHan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	chunxu.li@mediatek.com, allen-kh.cheng@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 16, 2022 at 4:35 AM TingHan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request adds new MediatekTek MT8195 SOF firmware and
> updates MT8186 SOF firmware.
>
> Please let me know if there is any problem.
>
> Best regards,
> TingHan
>
> --
>
> The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
>
>   amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20220915
>
> for you to fetch changes up to 3e08c58f8af488c41573c4a64a261e3b3f35849b:
>
>   mediatek: Add new mt8195 SOF firmware (2022-09-16 16:19:11 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (2):
>       mediatek: Update mt8186 SOF firmware
>       mediatek: Add new mt8195 SOF firmware
>
>  WHENCE                                                                                      |  11 ++++++++---
>  mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
>  mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                  | Bin 0 -> 20895 bytes
>  .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes

This fails check_whence.py:

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg not
listed in WHENCE
[jwboyer@vader linux-firmware]$

Can you fix it up please?

josh

>  mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
>  mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
>  mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
>  mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
>  8 files changed, 8 insertions(+), 3 deletions(-)
>  rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
>  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
>  rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
>  create mode 100644 mediatek/sof/sof-mt8186.ldc
>  create mode 100644 mediatek/sof/sof-mt8195.ldc
>  create mode 100644 mediatek/sof/sof-mt8195.ri
>
