Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29E1C433ED
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 23:29:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9EF9C610A2; Mon,  3 May 2021 23:29:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8872F61090;
	Mon,  3 May 2021 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620084586;
	bh=XYBEkYeF5MSAMLWCLV+6aZ8n974XiA79whalpnYgYjE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=srJwmpoaTBDWuJvCIB0ngTt0vwv5OU4bL5D5tVxpMjUr8iFKHIWfHcPz5/w/fnE3p
	 QTBwNLeT8k0ge1ACeoy89+VERl6IlXHdFL2DxwktFAgOgNE3qTvKIqY/NjT/CTdmgY
	 4FpXle7ygJmAhzVceBXXL0QGNnFhFbTuFEuBNit8A0yrqu75HRKNS/2ySvDmy6OIPN
	 ei2sW5wU1pdoh+Yj30K0XfulYjk+wbysGE+M3Ly695HoRL5n5FBakm2DTDls1BVXL5
	 od1e75DFsV+IYQ4R7jvrxErVTu8mHNPZqJD5jGT2o1rZ98iBvJBvrcxIHkr1Mg4/mN
	 rWVNz7FgB1kog==
Received: by mail-il1-f181.google.com with SMTP id r5so4951378ilb.2;
        Mon, 03 May 2021 16:29:46 -0700 (PDT)
X-Gm-Message-State: AOAM5335s6M48qP9TymOjmiluGx8k8vd36eeWOWxD1PK8V2QgsNjLqm1
	hmgwEB56xVcZFFS87WtrnbtrrPr8SUrFrW2HntY=
X-Google-Smtp-Source: ABdhPJxvZBF5i/9CuIUNlKZRkmkFFTLNju81mGIW3LpuXBEITJ4kd6qsyzp+7lIc8oiuWwlf3QU+0VT6PmW2xlkoRV8=
X-Received: by 2002:a05:6e02:160d:: with SMTP id t13mr18738478ilu.85.1620084585946;
 Mon, 03 May 2021 16:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <42c5b2447ab6474f922638c5dfc24f37@intel.com>
In-Reply-To: <42c5b2447ab6474f922638c5dfc24f37@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 May 2021 19:29:34 -0400
X-Gmail-Original-Message-ID: <CA+5PVA70VxrMEp+tGVx5N8k2iMRdC4m7B7pH0MvGS9-V8wP7cg@mail.gmail.com>
Message-ID: <CA+5PVA70VxrMEp+tGVx5N8k2iMRdC4m7B7pH0MvGS9-V8wP7cg@mail.gmail.com>
Subject: Re: I915 Firmware update
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@kernel.org" <kyle@kernel.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 3, 2021 at 5:42 PM Srivatsa, Anusha
<anusha.srivatsa@intel.com> wrote:
>
> Resending the PR with WHENCE file entries.
>
>
> Requesting to add the updates to linux-firmware repo.
>
>
>
> The following changes since commit 3f23f5125b1fef5ed2103c0236a5657966e30e4d:
>
>
>
>   amdgpu: add new polaris 12 MC firmware (2021-05-03 09:26:38 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   git://anongit.freedesktop.org/drm/drm-firmware adlp_dmc_firmware
>
>
>
> for you to fetch changes up to 3d32f216e153b0365132592910efcbfa2533066f:
>
>
>
>   i915: Add ADL-P DMC Support (2021-05-03 14:34:52 -0700)
>
>
>
> ----------------------------------------------------------------
>
> Anusha Srivatsa (1):
>
>       i915: Add ADL-P DMC Support

Thanks.  Pulled and pushed out.

josh

>
>
>
> WHENCE                    |   6 ++++++
>
> i915/adlp_dmc_ver2_09.bin | Bin 0 -> 44636 bytes
>
> i915/adlp_dmc_ver2_10.bin | Bin 0 -> 44616 bytes
>
> 3 files changed, 6 insertions(+)
>
> create mode 100644 i915/adlp_dmc_ver2_09.bin
>
> create mode 100644 i915/adlp_dmc_ver2_10.bin
>
>
>
> Thanks,
>
> Anusha
