Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4A0C32771
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Sep 2022 14:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25C34C4347C; Mon, 26 Sep 2022 14:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAF4C43470;
	Mon, 26 Sep 2022 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664202639;
	bh=dOJvu0QbBOW27mp6VROLsdkrZ0Y7BdS0f+JZ2EMs1lk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LFLC/jxMKyarDwJB4nhu01X9GJElWcBKkTxS3uso1BLFxM55a+xH16lDUAf5TvS+9
	 6jkzpt6gAEkCRVcqmso6/7NdQp67ldWSBxeZxOTM/FycDN6mt2qWelrrMO0XzM4tkb
	 2dJKZRwwzttRXSL849aBhAxz29sStkCQ3BzeRTbIRULuZ6+GqTOH6siw1ePK9/DgPY
	 7VyMIhrehq3hgssal24Av4Izw05lFkkuOhgTFP4saHJctTzrI0bMIg/qoMAfKBs6w7
	 gJRY97L7R/nRvdyUGAbiLtLc/lJsKVeAy42ibiSnUCDY6P20TDF0O2bBV8dCy1GEqn
	 VDj5uad50SYOg==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-12c8312131fso9466089fac.4;
        Mon, 26 Sep 2022 07:30:39 -0700 (PDT)
X-Gm-Message-State: ACrzQf2lZ30SVbqbCiEkoNV69rqZhTpT3Kh5CB9/rlHWUEij81Jiyz6K
	X7FfktygQWpRw6qTVl9Z7NofVCizMI03pXFWVJI=
X-Google-Smtp-Source: AMsMyM4cB8tZWGtWfifYtolOqeyq3rNi8D78OxP+cuFbHeYhDhSwEgMhpI254D/z8ppsMGbxVer/XF61WnsJMbI99fk=
X-Received: by 2002:a05:6870:d0c7:b0:127:9860:95b0 with SMTP id
 k7-20020a056870d0c700b00127986095b0mr12318895oaa.3.1664202638214; Mon, 26 Sep
 2022 07:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220920204119.3514792-1-John.C.Harrison@Intel.com>
In-Reply-To: <20220920204119.3514792-1-John.C.Harrison@Intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 26 Sep 2022 10:30:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7inRVU=ux3cC9bvu3aOWydGLBQDbfCFoGUhAqfxPQG3g@mail.gmail.com>
Message-ID: <CA+5PVA7inRVU=ux3cC9bvu3aOWydGLBQDbfCFoGUhAqfxPQG3g@mail.gmail.com>
Subject: Re: PR for new GuC v70.5.1 and GuC/HuC with new names
To: John.C.Harrison@intel.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@kernel.org, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Tue, Sep 20, 2022 at 4:40 PM <John.C.Harrison@intel.com> wrote:
>
> The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
>
>   amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware guc_70.5.1_huc_nover
>
> for you to fetch changes up to 51fff4e69b4554dd3fee21e3c55a0f94937293e3:
>
>   i915: Add versionless HuC files for current platforms (2022-09-16 08:52:30 -0700)
>
> ----------------------------------------------------------------
> John Harrison (2):
>       i915: Add GuC v70.5.1 for DG1, DG2, TGL and ADL-P
>       i915: Add versionless HuC files for current platforms
>
>  WHENCE               |  18 ++++++++++++++++++
>  i915/adlp_guc_70.bin | Bin 0 -> 297984 bytes
>  i915/dg1_guc_70.bin  | Bin 0 -> 272512 bytes
>  i915/dg1_huc.bin     | Bin 0 -> 589888 bytes
>  i915/dg2_guc_70.bin  | Bin 0 -> 369600 bytes
>  i915/tgl_guc_70.bin  | Bin 0 -> 285888 bytes
>  i915/tgl_huc.bin     | Bin 0 -> 589888 bytes
>  7 files changed, 18 insertions(+)
>  create mode 100644 i915/adlp_guc_70.bin
>  create mode 100644 i915/dg1_guc_70.bin
>  create mode 100644 i915/dg1_huc.bin
>  create mode 100644 i915/dg2_guc_70.bin
>  create mode 100644 i915/tgl_guc_70.bin
>  create mode 100644 i915/tgl_huc.bin
