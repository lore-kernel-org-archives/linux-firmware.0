Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C838C433FE
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Nov 2022 12:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BBB5C43470; Wed, 30 Nov 2022 12:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3005FC4347C
	for <linux-firmware@kernel.org>; Wed, 30 Nov 2022 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669812801;
	bh=O135k3EjtaR5pVeq5ZX3cd5MKaWtgT0WO/xCt+a4K+A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TprDieo+6NSQJM7mxZcDbfJwznJcjKWqsBJYo2GTaHoPArog6uAik1xQA4XM7fSDF
	 qZbBmH5GRYMVn13lG+w6gaJ1EjTm4ffQnwVpQ31Aa4xcyfGPNTiIE23B9M1zyJ0BeO
	 P4qob4zjSLXOXUrkODrKhy4Mc7226QiUMCaaK3UqH/4lw0OuSK9B/5DUFZt08n0DMA
	 tE0DJEr1m2OLG2ngQTxiEBBFwibXR5CxccDdcy2qfQw5nMMlSb/WdOoklc1qCJae4G
	 vXmB4l6v2s9jVm4j3u9VXKkfkmewzj9x90iHTWfqR3RHR2ScNu6Fs1YDzrK600Xhvy
	 XTjmw5VmNxQEQ==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-14263779059so20845304fac.1
        for <linux-firmware@kernel.org>; Wed, 30 Nov 2022 04:53:21 -0800 (PST)
X-Gm-Message-State: ANoB5pmIeXHX2P4VRHXCiAowX0f6g6lf5qxEnu1L21Bgy3wLOfPnV4xQ
	85lwIi5DOf1m3LwzCz8nUhi2iGzDgN2DiowQ+sk=
X-Google-Smtp-Source: AA0mqf6Sr2IS6+ys5YTP/Df4NQKDayIfhQtpmu93rN5w+I/XEB+8J8PQnHdS2VNL4gI4BmaVQMh7xYbBaGVBkLGn6WI=
X-Received: by 2002:a05:6870:fd8d:b0:13b:5fff:181b with SMTP id
 ma13-20020a056870fd8d00b0013b5fff181bmr23339824oab.267.1669812800250; Wed, 30
 Nov 2022 04:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20221123140335.4xqxepev4bdvybut@gjsousa-mobl2>
In-Reply-To: <20221123140335.4xqxepev4bdvybut@gjsousa-mobl2>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 30 Nov 2022 07:53:09 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6rWdPwgmy7RvTY_GbOcGz8qR-6-08Too47_66+aQCkhg@mail.gmail.com>
Message-ID: <CA+5PVA6rWdPwgmy7RvTY_GbOcGz8qR-6-08Too47_66+aQCkhg@mail.gmail.com>
Subject: Re: PR for DG2 DMC v2.08
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Srivatsa, Anusha" <anusha.srivatsa@intel.com>, 
	Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>, 
	"kyle@mcmartin.ca" <kyle@mcmartin.ca>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 23, 2022 at 9:03 AM Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>
> The following changes since commit 391fb47caabaae8719fb72ba4891d1fc27ca1923:
>
>   amdgpu: update green sardine DMCUB firmware (2022-11-17 10:42:59 -0500)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dg2_dmc_v2.8
>
> for you to fetch changes up to 7f6279b3dd76ff955278fcd9e517eab85a4c97d6:
>
>   i915: Add DMC v2.08 for DG2 (2022-11-21 16:38:26 -0300)

Pulled and pushed out.  Minor conflict in WHENCE fixed up.

josh

> ----------------------------------------------------------------
> Gustavo Sousa (1):
>       i915: Add DMC v2.08 for DG2
>
>  WHENCE                   |   3 +++
>  i915/dg2_dmc_ver2_08.bin | Bin 0 -> 22540 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/dg2_dmc_ver2_08.bin
