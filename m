Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8989FECAAA1
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Oct 2022 16:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59546C43140; Mon, 24 Oct 2022 16:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4335EC433D7;
	Mon, 24 Oct 2022 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666627458;
	bh=87XR0XMzq5ovLkL8iPNfFsbvuUaZAvPAsoef7GdAcwY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dYyYB79TbETLGLXr+Fwe/TXvlrml/xQhxP1sssiCtgG0Z8aM7XzkAyR/EptjDG1CF
	 Ub4ck9jDn10wHvWdSWwh6UiAGKSadPkWIby+yyBI806EWE/V1pCs9+f5WjEWmLNfM+
	 oYg/BM9yQ/qrI/heS8MhxRuMGLP/Z/d+dTpxISFXgRuc0qOAbY55whhJvFID1EkzQH
	 F+oU53Ne4R2Vt707X2oSPkKmguYB27RZQZbXmxCmIrFlYfGZRW06YMHVUDwI4yaCGA
	 fVOTbN0T4hy3BJEqeZy+LPnmwrAupPSJiB+VZfAvb7JatNizXityDnbkh3LRZ9EpwC
	 YO7c8nhGY4DIA==
Received: by mail-ot1-f51.google.com with SMTP id w6-20020a056830110600b00665bf86f012so993892otq.0;
        Mon, 24 Oct 2022 09:04:18 -0700 (PDT)
X-Gm-Message-State: ACrzQf2Z7FSYFZk1qj0XDBrOt2MzYvlyn9c8AKrNlsGolNKbnRno3fT+
	l6vptiUQfiyn4cplFB9F+5eC4sPWJ63iyfUW+hs=
X-Google-Smtp-Source: AMsMyM6BXv6kI3vQ4Swypdlb7E73xhmUxx7U0tk9ymTtDHvb4EbdOcmqI1TygvtrwaesSMdB+PHSMpv/CRbxnEAPScA=
X-Received: by 2002:a9d:12a6:0:b0:661:d26c:708c with SMTP id
 g35-20020a9d12a6000000b00661d26c708cmr16757946otg.160.1666627457357; Mon, 24
 Oct 2022 09:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221018152446.1927225-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20221018152446.1927225-1-daniele.ceraolospurio@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Oct 2022 12:04:06 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4Fxi9ZL9kpoN2kSC29X6nei2vHh8Y3uDg70o3Ocq_ahA@mail.gmail.com>
Message-ID: <CA+5PVA4Fxi9ZL9kpoN2kSC29X6nei2vHh8Y3uDg70o3Ocq_ahA@mail.gmail.com>
Subject: Re: PR for HuC 7.10.3
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, intel-gfx@lists.freedesktop.org, 
	kyle@kernel.org, ben@decadent.org.uk
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 18, 2022 at 11:22 AM Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
>
>   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dg2_huc_7.10.3_pr
>
> for you to fetch changes up to 8f86b5ab3e051170ea240fc409d457e16e24bc21:
>
>   i915: Add HuC 7.10.3 for DG2 (2022-10-18 08:18:19 -0700)
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
>       i915: Add HuC 7.10.3 for DG2

Pulled and pushed out.

josh
