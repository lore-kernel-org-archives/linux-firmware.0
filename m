Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F188CC3DA4A
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Aug 2024 13:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9BDBC4AF0B; Fri,  9 Aug 2024 13:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E95C32782
	for <linux-firmware@kernel.org>; Fri,  9 Aug 2024 13:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723210138;
	bh=3HbKysLJ3gpk9LwNrwgTKIruSF39b35cSqfhMtskgN8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SKTlvw53bR96Z0wT3EZKgwCSWDoxEGVlToK1WZiv1gBuc+9BPWL0dBGNx8R/1XPu1
	 aPOg5y5F6ciGR+kLp6o7v7r09XjpmFy9NivflOjhocEjjfgUEl71A5GYxbC4e++kba
	 9CM7EKyHYQkibq+NBWh2is5THhqAq+sbTzOuunaaz0UvdZsAgDPkCzd5xe4kh6fBRe
	 b3NMD5FyLtxnjxlNWZ3StRjS2p6oywF4sFiWRblrq3y94CYpBmfd4kkyI444PY+epo
	 NLfueonaVeTyLb9VeuzX03+WpdDow1EXmPnYd1oLnHkvCDtxGpqoSycNWRCG1RrUAW
	 7JTrcFbPE1HyQ==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-68d30057ae9so19757037b3.1
        for <linux-firmware@kernel.org>; Fri, 09 Aug 2024 06:28:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YyGzcBOPVpB/p8tKYWFcl4w1J6iFy3xtoNBeT/dw1noGnNO+pez
	rfTZKzWNQwiNUpYap88V41kibrY5cgImza/mh2RQmcQzHCBY+E0tdNgKq24dvSfJ5PcqKuz7+Ci
	6ORWlZ3yy3StDvoXwiQiWDeobFLI=
X-Google-Smtp-Source: AGHT+IFeoKSn3PlZw/dheBlUWnxZ/N1m0PihalCS2T/Ec8VKuimndFirThS+v219hfh+Z4PdLLJnagu2wG+P11BugkY=
X-Received: by 2002:a05:690c:2a43:b0:646:ebea:1da2 with SMTP id
 00721157ae682-69ec8e7a701mr16487557b3.38.1723210137782; Fri, 09 Aug 2024
 06:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <1723199857-10405-1-git-send-email-quic_dikshita@quicinc.com>
In-Reply-To: <1723199857-10405-1-git-send-email-quic_dikshita@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 9 Aug 2024 09:28:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5qm89D1fv2yfiwfTMin=n2gVqq0exs6qdaOaO2yUKgcw@mail.gmail.com>
Message-ID: <CA+5PVA5qm89D1fv2yfiwfTMin=n2gVqq0exs6qdaOaO2yUKgcw@mail.gmail.com>
Subject: Re: [PATCH v3] qcom: update path for video firmware for vpu-1/2/3.0
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, quic_vgarodia@quicinc.com, 
	dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 6:38=E2=80=AFAM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> - Rename qcom/vpu-3.0/ to qcom/vpu/ to have common sub-folder for
>   new firmware files.
> - Move firmware files from vpu-1.0/ and vpu-2.0/ to vpu/ with
>   proper names for firmware binaries and provide backwards-compatible
>   links.
>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Changes since v2:
>  - Dropped the symlink for vpu-3.0.
>
> Changes since v1:
>  - Updated firmware binary names to better names following
>    common convention.
>  - Used Link: tag in WHENCE to create symlinks.
>
>  WHENCE                                          |   9 +++++----
>  qcom/{vpu-2.0/venus.mbn =3D> vpu/vpu20_p1.mbn}    | Bin
>  qcom/{vpu-1.0/venus.mbn =3D> vpu/vpu20_p4.mbn}    | Bin
>  qcom/{vpu-3.0/vpu30_4v.mbn =3D> vpu/vpu30_p4.mbn} | Bin
>  4 files changed, 5 insertions(+), 4 deletions(-)
>  rename qcom/{vpu-2.0/venus.mbn =3D> vpu/vpu20_p1.mbn} (100%)
>  rename qcom/{vpu-1.0/venus.mbn =3D> vpu/vpu20_p4.mbn} (100%)
>  rename qcom/{vpu-3.0/vpu30_4v.mbn =3D> vpu/vpu30_p4.mbn} (100%)

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/271

josh

>
> diff --git a/WHENCE b/WHENCE
> index 0a737b6..b7dc6ff 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5961,12 +5961,13 @@ File: qcom/venus-6.0/venus.mbn
>
>  Version: VIDEO.VE.6.0-00049-PROD-1
>
> -File: qcom/vpu-1.0/venus.mbn
> -Link: qcom/vpu-1.0/venus.mdt -> venus.mbn
> +File: qcom/vpu/vpu20_p4.mbn
> +Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
>
>  Version: VIDEO.VPU.1.0-00087-PROD-1
>
> -File: qcom/vpu-2.0/venus.mbn
> +File: qcom/vpu/vpu20_p1.mbn
> +Link: qcom/vpu-2.0/venus.mbn -> ../vpu/vpu20_p1.mbn
>
>  Version: VIDEO.VPU.2.0-00049-PROD-1
>
> @@ -5979,7 +5980,7 @@ https://developer.qualcomm.com/hardware/dragonboard=
-410c/tools
>
>  Driver: iris - Qualcomm Iris video codec accelerator
>
> -File: qcom/vpu-3.0/vpu30_4v.mbn
> +File: qcom/vpu/vpu30_p4.mbn
>
>  Version: VIDEO.VPU.3.1-0076
>
> diff --git a/qcom/vpu-2.0/venus.mbn b/qcom/vpu/vpu20_p1.mbn
> similarity index 100%
> rename from qcom/vpu-2.0/venus.mbn
> rename to qcom/vpu/vpu20_p1.mbn
> diff --git a/qcom/vpu-1.0/venus.mbn b/qcom/vpu/vpu20_p4.mbn
> similarity index 100%
> rename from qcom/vpu-1.0/venus.mbn
> rename to qcom/vpu/vpu20_p4.mbn
> diff --git a/qcom/vpu-3.0/vpu30_4v.mbn b/qcom/vpu/vpu30_p4.mbn
> similarity index 100%
> rename from qcom/vpu-3.0/vpu30_4v.mbn
> rename to qcom/vpu/vpu30_p4.mbn
> --
> 2.7.4
>
