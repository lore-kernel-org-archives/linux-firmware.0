Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8B0C433EF
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Feb 2022 23:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D2ACC340F1; Wed,  9 Feb 2022 23:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873EFC340F0
	for <linux-firmware@kernel.org>; Wed,  9 Feb 2022 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644447954;
	bh=J5WToPiGKydKgNmlHDBh3sDpK10rCuUi6fnLbW3ex5k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UZvJdP+TqJ14zo8QEpI1+hljpZbdCSp/js4pUypTSsoe2463T/EMNeB/Ip5UEvyuf
	 B53DEGDzbnbbY7o5CDUiw9jeFa1HRPMw4NMAEPCzHImHfCd6n9lrKRAyzjP2JbOVlf
	 /nQT+tIgSeBGPfbkGzrZrg/fyLBZ1D2+MJpCznhbwvGpu1MENyAGlxIuyrl3ED2l61
	 lpakdGpFzCRVe3Q8ax04gdjuvPpQOOsZVHrHHVbVzrHTwDcaOI+GmzpUFevUDtcI/U
	 gKbZ70DfJdtZtpkixAb0tGezopUWCKn23n9HzcXhJ1Q7yLfzwm+pppIaoFNS5ZzkHe
	 l/Sb4NFcnuZfw==
Received: by mail-il1-f181.google.com with SMTP id i10so3023524ilm.4
        for <linux-firmware@kernel.org>; Wed, 09 Feb 2022 15:05:54 -0800 (PST)
X-Gm-Message-State: AOAM531naE5eOuSR0wco8ipIgfZbAMVYjL+ooe/UwZ7+v2iyjq78JUZk
	SSlkTRH0/hJDwp2lV2wNaLM/RUp4qZrBr2ri2Zc=
X-Google-Smtp-Source: ABdhPJxHTUhoyam2R3W29pMjekSOb7alEOyJMeAv1PpcxnSJ/zgb7IS+WqtmJCLqgRCC1Pi/iMZcWUahsnxIYjDwaXc=
X-Received: by 2002:a05:6e02:12e6:: with SMTP id l6mr2401767iln.251.1644447953714;
 Wed, 09 Feb 2022 15:05:53 -0800 (PST)
MIME-Version: 1.0
References: <d1ca9d426d8e568d1939b4adad6d531fd0107c27.camel@intel.com>
In-Reply-To: <d1ca9d426d8e568d1939b4adad6d531fd0107c27.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Feb 2022 18:05:43 -0500
X-Gmail-Original-Message-ID: <CA+5PVA56iMMatYA12=X7p9cacQQY-SSRZow3bPUbiO3X+jutrA@mail.gmail.com>
Message-ID: <CA+5PVA56iMMatYA12=X7p9cacQQY-SSRZow3bPUbiO3X+jutrA@mail.gmail.com>
Subject: Re: i915 Updates: ADL-P DMC v2.16
To: "Tolakanahalli Pradeep, Madhumitha" <madhumitha.tolakanahalli.pradeep@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Srivatsa, Anusha" <anusha.srivatsa@intel.com>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "kyle@mcmartin.ca" <kyle@mcmartin.ca>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Tue, Jan 25, 2022 at 7:50 PM Tolakanahalli Pradeep, Madhumitha
<madhumitha.tolakanahalli.pradeep@intel.com> wrote:
>
> Hi Ben, Josh, Kyle,
>
> The following changes since commit
> eb8ea1b46893c42edbd516f971a93b4d097730ab:
>
>   Merge branch 'v1.1.7' of https://github.com/irui-
> wang/linux_fw_vpu_v1.1.7 into main (2022-01-24 06:49:52 -0500)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware adlp_dmc_v2.16
>
> for you to fetch changes up to
> 847c6de09299b59bb6f8e641cfd500aa8d1c0a9a:
>
>   i915: Add DMC firmware v2.16 for ADL-P (2022-01-25 16:05:54 -0800)
>
> ----------------------------------------------------------------
> Madhumitha Tolakanahalli Pradeep (1):
>       i915: Add DMC firmware v2.16 for ADL-P
>
>  WHENCE                    |   3 +++
>  i915/adlp_dmc_ver2_16.bin | Bin 0 -> 77084 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/adlp_dmc_ver2_16.bin
>
> Thanks!
> - Madhumitha
>
