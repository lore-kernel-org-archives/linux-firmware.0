Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BB4C6FA82
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Sep 2022 12:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26116C433B5; Tue, 13 Sep 2022 12:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1067CC433C1
	for <linux-firmware@kernel.org>; Tue, 13 Sep 2022 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663070608;
	bh=qW0G24e6hNeWfW9LFMbUPWRMkqk5Jdwt3+QyWMLYJjY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=RUCpTUgeaXiJZlhzLia5mRpYLH3UPrO27TklaC5MbWl/c0KkGiFZyJbrzxVD1v3DS
	 1tjGJuJGekh/fK1HkF6u+A8Hwz/KL8NUBNoZRFYvs9xdzwjAilozmalcu1eMgobxq3
	 t6QtTcbwo++XF1aQ9XwlOfXDnRINHT1E1cRU1IhFEgbVzUiuEiNFp8fqx13BHsYFAg
	 z3DCVVzfnS319X1m8VEiX96i2ZArsbspKQWYykbHh33amY0VDmwOd+We9EAeNYNj4B
	 YtkCfSO/q+2ajS+C4W+Gp9kOpJVDMlAj/sOLqTwJpogYtdY8Vp6tsv0ipmMS/lCGHB
	 fyDuNEvzJD69A==
Received: by mail-ot1-f52.google.com with SMTP id d25-20020a9d72d9000000b00655d70a1aeaso4826715otk.3
        for <linux-firmware@kernel.org>; Tue, 13 Sep 2022 05:03:27 -0700 (PDT)
X-Gm-Message-State: ACgBeo2w9OnmxbK4KhFJEOj2DD/iZd0qNZGdMhlhI9iOIBkobUDHdevI
	IGZ58Q5cNE5PQU1eE/CI1oC00zFE4HKr9ZaJBJs=
X-Google-Smtp-Source: AA6agR7tRwbOdHgs99qYS39hS9ng50oiUB97Nu20OJyw5DQdWzHOJBLDQpqec856WiMIoot8ukhG7WflGLtF6ZzjXzI=
X-Received: by 2002:a05:6830:44ac:b0:63a:e6e0:e905 with SMTP id
 r44-20020a05683044ac00b0063ae6e0e905mr12826412otv.160.1663070607166; Tue, 13
 Sep 2022 05:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220912162852.16815-1-mario.limonciello@amd.com>
In-Reply-To: <20220912162852.16815-1-mario.limonciello@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 13 Sep 2022 08:03:16 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7-k6ps7oeC++rJ+eH67XOoeGE9eYu54goZ-8EULzmupw@mail.gmail.com>
Message-ID: <CA+5PVA7-k6ps7oeC++rJ+eH67XOoeGE9eYu54goZ-8EULzmupw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Updates for amdgpu
To: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Alexander Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 12, 2022 at 12:28 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> Hi,
>
> In this series it introduces support for some new IP blocks that
> are to be used in upcoming programs and with newer kernel versions
> that support them.
>
> Also a new Rembrandt (Yellow Carp) DMCUB firmware is included that
> helps with some problems with USB4 DPIA.
>
> Mario Limonciello (6):
>   amdgpu: add firmware for DCN 3.1.5 IP block
>   amdgpu: add firmware for GC 10.3.6 IP block
>   amdgpu: add firmware for PSP 13.0.5 IP block
>   amdgpu: add firmware for SDMA 5.2.6 IP block
>   amdgpu: add firmware for VCN 3.1.2 IP block
>   amdgpu: update yellow carp DMCUB firmware

All 6 applied and pushed out.  Thanks.

josh

>
>  WHENCE                       |  12 ++++++++++++
>  amdgpu/dcn_3_1_5_dmcub.bin   | Bin 0 -> 176912 bytes
>  amdgpu/gc_10_3_6_ce.bin      | Bin 0 -> 263296 bytes
>  amdgpu/gc_10_3_6_me.bin      | Bin 0 -> 263424 bytes
>  amdgpu/gc_10_3_6_mec.bin     | Bin 0 -> 268592 bytes
>  amdgpu/gc_10_3_6_mec2.bin    | Bin 0 -> 268592 bytes
>  amdgpu/gc_10_3_6_pfp.bin     | Bin 0 -> 263424 bytes
>  amdgpu/gc_10_3_6_rlc.bin     | Bin 0 -> 177088 bytes
>  amdgpu/psp_13_0_5_asd.bin    | Bin 0 -> 168448 bytes
>  amdgpu/psp_13_0_5_ta.bin     | Bin 0 -> 201728 bytes
>  amdgpu/psp_13_0_5_toc.bin    | Bin 0 -> 1792 bytes
>  amdgpu/sdma_5_2_6.bin        | Bin 0 -> 34048 bytes
>  amdgpu/vcn_3_1_2.bin         | Bin 0 -> 569808 bytes
>  amdgpu/yellow_carp_dmcub.bin | Bin 231696 -> 232720 bytes
>  14 files changed, 12 insertions(+)
>  create mode 100644 amdgpu/dcn_3_1_5_dmcub.bin
>  create mode 100644 amdgpu/gc_10_3_6_ce.bin
>  create mode 100644 amdgpu/gc_10_3_6_me.bin
>  create mode 100644 amdgpu/gc_10_3_6_mec.bin
>  create mode 100644 amdgpu/gc_10_3_6_mec2.bin
>  create mode 100644 amdgpu/gc_10_3_6_pfp.bin
>  create mode 100644 amdgpu/gc_10_3_6_rlc.bin
>  create mode 100644 amdgpu/psp_13_0_5_asd.bin
>  create mode 100644 amdgpu/psp_13_0_5_ta.bin
>  create mode 100644 amdgpu/psp_13_0_5_toc.bin
>  create mode 100644 amdgpu/sdma_5_2_6.bin
>  create mode 100644 amdgpu/vcn_3_1_2.bin
>
> --
> 2.25.1
>
