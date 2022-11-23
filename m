Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DE3C4332F
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Nov 2022 12:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31B68C43470; Wed, 23 Nov 2022 12:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB32C433B5
	for <linux-firmware@kernel.org>; Wed, 23 Nov 2022 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669206131;
	bh=ywY4ljuFsxwQzejeKie0DHcvCpJoxJttoV5ePAofXbg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TeQwMqDNuHyN3vdUQYcK1o4OBSE6RKUI2U99mqZBzf/qHhVGpRJ4dk+uz0Ld9RjbC
	 85S7AoW/5BPmg+HfbhYGqtPUiTIWgQp7asCH82iafilyrfH8J6nTpzodBKpFOrBwLp
	 9E9PJwuuVk8MDeRrOWRz36jJlKVgqAAcIedxyQ32N/wrGy59cglo/fRCgyev2djSlP
	 33zbdXeZXFIvsNbRwhakUtFU2CvEiXV9SV7CagIn/yPp8M8R9/7Z7FeqRsC3N/+nkr
	 tHO0yrCd/7AJwHsPcQG0i5GPV/C8h7JfgnYywbfgJC1/lBrBRRd0BMgXrchDRLpVh/
	 vyl8I1/lbUaqA==
Received: by mail-oi1-f175.google.com with SMTP id e205so18791906oif.11
        for <linux-firmware@kernel.org>; Wed, 23 Nov 2022 04:22:11 -0800 (PST)
X-Gm-Message-State: ANoB5pnNBQiMm7Zz0xAR7DFcyVIQ6JE1CiIn0ikXm+VKdR3CfkeRym/W
	1rrEuUlAQtKPLh5nbPosp7u4F6x20WFA225sUyQ=
X-Google-Smtp-Source: AA0mqf5XAHP8cEQ0uNaYb+4MU523Txhm3kShKLpYKE5fjF3TWypo31OiqLnM21tYL0JSeRlLQQ6h6IbLMMo1nr8l6iA=
X-Received: by 2002:aca:f15:0:b0:35a:6004:2bc9 with SMTP id
 21-20020aca0f15000000b0035a60042bc9mr13491029oip.3.1669206130315; Wed, 23 Nov
 2022 04:22:10 -0800 (PST)
MIME-Version: 1.0
References: <f032c2336ca7c60deb53fbbbaab1c60f896bfe7d.camel@intel.com>
In-Reply-To: <f032c2336ca7c60deb53fbbbaab1c60f896bfe7d.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 23 Nov 2022 07:21:59 -0500
X-Gmail-Original-Message-ID: <CA+5PVA46cbS=t6Fdybmw0q_DrAFA4RuALZGab_M0iBTSnxRKFQ@mail.gmail.com>
Message-ID: <CA+5PVA46cbS=t6Fdybmw0q_DrAFA4RuALZGab_M0iBTSnxRKFQ@mail.gmail.com>
Subject: Re: i915 Updates: MTL DMC v2.10
To: "Tolakanahalli Pradeep, Madhumitha" <madhumitha.tolakanahalli.pradeep@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Srivatsa, Anusha" <anusha.srivatsa@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "kyle@mcmartin.ca" <kyle@mcmartin.ca>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 3:18 PM Tolakanahalli Pradeep, Madhumitha
<madhumitha.tolakanahalli.pradeep@intel.com> wrote:
>
> The following changes since commit daff40492bd0cd071c7f5521b339e12e4de718c1:
>
>   linux-firmware: update firmware for MT7986 (2022-11-16 08:53:28 -0500)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware mtl_dmc_v2.10

Pulled and pushed out.

josh

>
> for you to fetch changes up to de854c96df66be4a13f8bfbb1e78bd5d0cea2e8e:
>
>   i915: Add DMC v2.10 for MTL (2022-11-16 14:26:06 -0800)
>
> ----------------------------------------------------------------
> Madhumitha Tolakanahalli Pradeep (1):
>       i915: Add DMC v2.10 for MTL
>
>  WHENCE                   |   3 +++
>  i915/mtl_dmc_ver2_10.bin | Bin 0 -> 48112 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/mtl_dmc_ver2_10.bin
>
