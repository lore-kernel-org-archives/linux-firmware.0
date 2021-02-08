Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC6BC433E0
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Feb 2021 13:23:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 340B064EB1; Mon,  8 Feb 2021 13:23:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AF7B64E9C
	for <linux-firmware@kernel.org>; Mon,  8 Feb 2021 13:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612790592;
	bh=FrGHWqx1U9Iad24zpveOXO/w7V8vq940yXeChyywkZM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=G0u5XBUiQEm5U8gtXMPX0H1cOWMfk4Dgp1/+wC/cLnT75ACPtQ1DsVdHGjVKW0e+e
	 LxyIsdKWRYYVo11qfHl9b+3k++vautXwU1CunWXris7c32hZsOWoOnNu82xJ+gaPcX
	 vLBZ4QW552jWuffEa/gDVEafyoNMu7Watou4I1o/NCrY7IvzTIPkjwXerSCO/uXA7L
	 0CyMAjHTWk+ql1rMtVoh7liO7G0pBeNBB51q55hDeEP4vIbhwwhZxE0C1cP5gBXt7I
	 KobdXCfMnDqUzVrwk+hI3hlbg+3A7qCAlEEgjyyyUERAnzPCUkvPRoAotaBdN7zBxj
	 EI+69g7kgh6dg==
Received: by mail-il1-f175.google.com with SMTP id q9so12705101ilo.1
        for <linux-firmware@kernel.org>; Mon, 08 Feb 2021 05:23:12 -0800 (PST)
X-Gm-Message-State: AOAM53324ikx9AhqcPdbf3ROtGUcQylysQf39zBDpOcrIozAEU0dFAa0
	OPn89oiW8JA4TUnfMORx7ozAgpLFiHD/SPoc76k=
X-Google-Smtp-Source: ABdhPJxCJw6F64WozBsGgnQ0ENzJVkWCprAZpLjNlYiXcOinfnIyRBzM9ojNwdIJsxMDuZUFoCitRVQ4x2XBY2fyzbY=
X-Received: by 2002:a05:6e02:1845:: with SMTP id b5mr15757839ilv.11.1612790591378;
 Mon, 08 Feb 2021 05:23:11 -0800 (PST)
MIME-Version: 1.0
References: <6ac7d05dfec24e8abff678f47f27f6a1@intel.com>
In-Reply-To: <6ac7d05dfec24e8abff678f47f27f6a1@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 Feb 2021 08:23:00 -0500
X-Gmail-Original-Message-ID: <CA+5PVA53a7tKz3MkLGHCMROMWoQWdCbm6L5r5ifsc8wqoESW8w@mail.gmail.com>
Message-ID: <CA+5PVA53a7tKz3MkLGHCMROMWoQWdCbm6L5r5ifsc8wqoESW8w@mail.gmail.com>
Subject: Re: I915 Update - ADLS(dmc), DG1(GuC, HuC)
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Kyle McMartin <kyle@mcmartin.ca>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Mon, Feb 1, 2021 at 7:49 PM Srivatsa, Anusha
<anusha.srivatsa@intel.com> wrote:
>
> Sending some i915 updates to be pulled in upstream.
>
>
>
> The following changes since commit 05789708b79b38eb0f1a20d8449b4eb56d39b39f:
>
>
>
>   brcm: Link RPi4's WiFi firmware with DMI machine name. (2021-01-19 07:42:43 -0500)
>
>
>
> are available in the Git repository at:
>
>
>
>   git://anongit.freedesktop.org/drm/drm-firmware DG1-guc-huc-ADLS-dmc
>
>
>
> for you to fetch changes up to 348d8a9740930e7b8bd83a36baba40c5cfc3f8be:
>
>
>
>   i915: Add DMC v2.01 for ADL-S (2021-01-29 11:43:12 -0800)
>
>
>
> ----------------------------------------------------------------
>
> Anusha Srivatsa (3):
>
>       i915: Add GuC v49.0.1 for DG1
>
>       i915: Add HuC v7.7.1 for DG1
>
>       i915: Add DMC v2.01 for ADL-S
>
>
>
> WHENCE                    |   9 +++++++++
>
> i915/adls_dmc_ver2_01.bin | Bin 0 -> 18704 bytes
>
> i915/dg1_guc_49.0.1.bin   | Bin 0 -> 311872 bytes
>
> i915/dg1_huc_7.7.1.bin    | Bin 0 -> 582400 bytes
>
> 4 files changed, 9 insertions(+)
>
> create mode 100644 i915/adls_dmc_ver2_01.bin
>
> create mode 100644 i915/dg1_guc_49.0.1.bin
>
> create mode 100644 i915/dg1_huc_7.7.1.bin
>
>
>
>
>
> Thanks,
>
> Anusha
>
>
