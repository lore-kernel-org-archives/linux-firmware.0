Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F0CC19F2D
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Aug 2022 11:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4259C43140; Thu,  4 Aug 2022 11:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0E6C433D6
	for <linux-firmware@kernel.org>; Thu,  4 Aug 2022 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659613044;
	bh=FjzXh9wOhnz0QVqLzamIpPYTx002hj5ogg6FPrVMARk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LeJWqUBKM9e1iLBRaBbvAaTrs82DgqZEG1tJnhrv/Ag/tk9nrJXf1JYGKCl7zjn8k
	 2hxADa/NJZ03Wilv0mKS4VyREQjFERSgXj436UZv1IiJm0db/kf/AlupYr8qntYYWH
	 4Uu/vYyZG5riyezGfBHFV55jjdhsQDOqN+Ee4KSPhWvOzPnF1I5zlNNa4V7vzITOy7
	 SHIqHNJjt3IwqHen6ZFtPPDyAv0S+EL0VCiWauVMC0o6sTknEN+zvY3g+EwcScfz59
	 AthlpUGI9NPc3eW5b3Unyc7VQqFDSV6h/3w6/TlRgUoc30V4a7L9QW5lC/HfjKJOaf
	 ohJMGVAWYqocA==
Received: by mail-io1-f52.google.com with SMTP id e69so14913701iof.5
        for <linux-firmware@kernel.org>; Thu, 04 Aug 2022 04:37:24 -0700 (PDT)
X-Gm-Message-State: ACgBeo3cPP7hdCZGu8KtDVzCcyl3cmglUEIVz0LIXx2/pVtSvuH3jnG/
	XjXcOCxQmf7B9DQxVsdJ+GKfV8/y3h8rCMXfTNY=
X-Google-Smtp-Source: AA6agR67GgEjCgGkXgFF+9BAHSMV8skpESzkE5ASXWbb7mE8b3ZxaqvrS2KhOWjeIZpYwfzaOCRq8DiaMY4ntkUlRjw=
X-Received: by 2002:a6b:e511:0:b0:67f:9ef6:5779 with SMTP id
 y17-20020a6be511000000b0067f9ef65779mr595706ioc.177.1659613043974; Thu, 04
 Aug 2022 04:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <badb459d915e98b52402f9b517c032b2a6efd5c0.camel@intel.com>
In-Reply-To: <badb459d915e98b52402f9b517c032b2a6efd5c0.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 4 Aug 2022 07:37:13 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4CLLnCFoJr+BEAf=UTZTHDS0E5vcz1yeLwD8m7ymNVeQ@mail.gmail.com>
Message-ID: <CA+5PVA4CLLnCFoJr+BEAf=UTZTHDS0E5vcz1yeLwD8m7ymNVeQ@mail.gmail.com>
Subject: Re: i915 Updates: DG2 DMC v2.07
To: "Tolakanahalli Pradeep, Madhumitha" <madhumitha.tolakanahalli.pradeep@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Srivatsa, Anusha" <anusha.srivatsa@intel.com>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "kyle@mcmartin.ca" <kyle@mcmartin.ca>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 29, 2022 at 1:25 PM Tolakanahalli Pradeep, Madhumitha
<madhumitha.tolakanahalli.pradeep@intel.com> wrote:
>
> Kindly add the below changes to linux-firmware:
>
> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>
>   amdgpu partially revert "amdgpu: update beige goby to release 22.20" (2022-07-
> 25 14:16:04 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dg2_dmc_2_07

Pulled and pushed out.

josh

>
> for you to fetch changes up to 3ab394af47ab6b0139a3fa6a7b39564a4d18cb25:
>
>   i915: Add DMC v2.07 for DG2 (2022-07-27 10:52:59 -0700)
>
> ----------------------------------------------------------------
> Anusha Srivatsa (1):
>       i915: Add DMC v2.07 for DG2
>
>  WHENCE                   |   3 +++
>  i915/dg2_dmc_ver2_07.bin | Bin 0 -> 22488 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/dg2_dmc_ver2_07.bin
>
> --
> 2.37.1
>
> Thanks!
> - Madhumitha
