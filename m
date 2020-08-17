Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A378C433E1
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Aug 2020 12:21:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7A76820789; Mon, 17 Aug 2020 12:21:32 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5735E2076E;
	Mon, 17 Aug 2020 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597666892;
	bh=jN4qmxfky1tB51+vlOAf0lr2hMEzb7uRNK8Gkm+KmhQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XvpwItJwUH9J65SVv59B7eLdzWcenny9uLrfh0iHbKMmUoHfg1bvSqTon9twnNfCN
	 /8LqUGw3xUK9i+pfEKChvmJhdbA05GisT3zReMDyZ59j/7Pn35mw0QG0nZa5A23Ebp
	 BbYvvFcHTSfgY8K+4ZnpXmrBpKFVO+U6gku3gKB0=
Received: by mail-io1-f42.google.com with SMTP id t15so17432345iob.3;
        Mon, 17 Aug 2020 05:21:32 -0700 (PDT)
X-Gm-Message-State: AOAM531mRZjIR1A2il/7szdnxjuIufdMbrmJh9A0jlAP/aACCW2nZrvY
	RHmhFq3oiQRMfV/eSa1DaDUHrrCDTikTjCIswNg=
X-Google-Smtp-Source: ABdhPJxIJn+vxkz31SjOj+S2Z/Tzr+DhmDvHK456hUhzk6UJOwbwiGkFbJ9VE0XQfr6JRionUNTUvq2micD4fJMT7J8=
X-Received: by 2002:a02:84c1:: with SMTP id f59mr14474441jai.106.1597666891789;
 Mon, 17 Aug 2020 05:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200815004802.25787-1-jose.souza@intel.com>
In-Reply-To: <20200815004802.25787-1-jose.souza@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 17 Aug 2020 08:21:20 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5_tHd3BuNEc1tV-JpNNe-pJ3FaAugQmJ_pJyrGp8HMtA@mail.gmail.com>
Message-ID: <CA+5PVA5_tHd3BuNEc1tV-JpNNe-pJ3FaAugQmJ_pJyrGp8HMtA@mail.gmail.com>
Subject: Re: PR for new i915 firmware files
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Kyle McMartin <kyle@kernel.org>, 
	Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 8:45 PM Jos=C3=A9 Roberto de Souza
<jose.souza@intel.com> wrote:
>
> The following changes since commit c331aa9c49ce507d4e5a9a4f2f19115db8e155=
36:
>
>   amdgpu: update vega20 firmware for 20.30 (2020-08-07 08:16:21 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware i915-firmware-updates-08=
-2020

Pulled and pushed out.

josh


> for you to fetch changes up to 1b81373b52a86dadcfe70d4385e62bc6afc3963a:
>
>   i915: Add DMC firmware 2.02 for RKL (2020-08-13 11:04:08 -0700)
>
> ----------------------------------------------------------------
> Jos=C3=A9 Roberto de Souza (3):
>       i915: Add HuC firwmare v7.5.0 for TGL
>       i915: Add DMC firmware 2.08 for TGL
>       i915: Add DMC firmware 2.02 for RKL
>
>  WHENCE                   |   9 +++++++++
>  i915/rkl_dmc_ver2_02.bin | Bin 0 -> 18204 bytes
>  i915/tgl_dmc_ver2_08.bin | Bin 0 -> 18932 bytes
>  i915/tgl_huc_7.5.0.bin   | Bin 0 -> 580736 bytes
>  4 files changed, 9 insertions(+)
>  create mode 100644 i915/rkl_dmc_ver2_02.bin
>  create mode 100644 i915/tgl_dmc_ver2_08.bin
>  create mode 100644 i915/tgl_huc_7.5.0.bin
>
> diff --git a/WHENCE b/WHENCE
> index be8c390..54c3714 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4124,6 +4124,9 @@ Version: DMC API/APB ver 2 release 4 for Tigerlake
>  File: i915/tgl_dmc_ver2_06.bin
>  Version: DMC API/APB ver 2 release 6 for Tigerlake
>
> +File: i915/tgl_dmc_ver2_08.bin
> +Version: DMC API/APB ver 2 release 8 for Tigerlake
> +
>  File: i915/icl_huc_9.0.0.bin
>  Version: Huc API/APB ver 9 release 0 for Icelake
>
> @@ -4142,6 +4145,12 @@ Version: Huc API/APB ver 7 release 0 for Tigerlake
>  File: i915/tgl_huc_7.0.12.bin
>  Version: Huc API/APB ver 7 release 0 for Tigerlake
>
> +File: i915/tgl_huc_7.5.0.bin
> +Version: Huc API/APB ver 7 release 5 for Tigerlake
> +
> +File: i915/rkl_dmc_ver2_02.bin
> +Version: DMC API/APB ver 2 release 2 for Rocketlake
> +
>  License: Redistributable. See LICENSE.i915 for details
>
>  ------------------------------------------------------------------------=
--
> diff --git a/i915/rkl_dmc_ver2_02.bin b/i915/rkl_dmc_ver2_02.bin
> new file mode 100644
> index 0000000..e553fbc
> Binary files /dev/null and b/i915/rkl_dmc_ver2_02.bin differ
> diff --git a/i915/tgl_dmc_ver2_08.bin b/i915/tgl_dmc_ver2_08.bin
> new file mode 100644
> index 0000000..9db379c
> Binary files /dev/null and b/i915/tgl_dmc_ver2_08.bin differ
> diff --git a/i915/tgl_huc_7.5.0.bin b/i915/tgl_huc_7.5.0.bin
> new file mode 100644
> index 0000000..bed10f3
> Binary files /dev/null and b/i915/tgl_huc_7.5.0.bin differ
