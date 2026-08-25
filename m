Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D514C61DBE
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Aug 2026 12:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 542D91F00A3D; Tue, 25 Aug 2026 12:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5891F000E9
	for <linux-firmware@kernel.org>; Tue, 25 Aug 2026 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787662486;
	bh=6oQeOOVj8fykIq++Xs+T30qZr9hau9oLpBfnGi/9sXw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc;
	b=UtqhXHGk/LPDXHI9hn/fUAAFNFTleCiMwXZBSzseplqcHrCTr1/F6sRrCd3a9adko
	 +CtUMYKBRvRetdaThhYaDX0lXssfgMIlODFfo4lwTUtvCOnYOPxjUx3e29yTK8offL
	 AJsc/HQ0uIje3BbOhgOaRFm9tqDUNVYw6w9K8jFZvr0pRS/QRBbPyefa/KRcrKdhCF
	 g9HRERq3fQSsREsDDQk+bXMsypCnJFDRRl/Eg7RKisxPyv6GGh7SIQEfUr7UmWf+kq
	 Au/89REsYaSWrCo5oCwR2sR9taiKYfBsO4a+nJxCE1M4pYo38Pr7KhJAp16dUxb3ci
	 BuI3Uwc2ewORA==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66c9995ca60so1254539d50.1
        for <linux-firmware@kernel.org>; Tue, 25 Aug 2026 05:54:46 -0700 (PDT)
X-Gm-Message-State: AFuF++mrUMAoUt4ACxvAzvy2KjL3CYF5B3wp+bOGZNfHKolcfO3IU5bI
	wGQCAWVNShVkPcdjn+Rb8cRHSbstyl304Gt0L9kJX+xcX6SCJkbohCwain2lzmUsYcYAFCaoY0d
	W9aEel1ylMVxKT4ZXrW65eMFt9WTOdzM=
X-Received: by 2002:a05:690e:154a:20b0:667:c8ae:f683 with SMTP id
 956f58d0204a3-66d1463805cmr1943286d50.4.1787662485572; Tue, 25 Aug 2026
 05:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <c78cb789-7904-4493-81d8-374a5225eff0@intel.com>
In-Reply-To: <c78cb789-7904-4493-81d8-374a5225eff0@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 25 Aug 2026 08:54:34 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7gpuxue-ssKJe0s62SsO9E3_Vy_+zLnMDFLMW+7WF7+Q@mail.gmail.com>
X-Gm-Features: AcwNN1UtkOqE5BChM_ZiOP7tSnoijR388j6vmm4w6LM0Ov9Dqe9KnuLesmfWyEU
Message-ID: <CA+5PVA7gpuxue-ssKJe0s62SsO9E3_Vy_+zLnMDFLMW+7WF7+Q@mail.gmail.com>
Subject: Re: [PULL] intel: Update AudioDSP firmware for BDW/SKL/APL platforms
To: Cezary Rojewski <cezary.rojewski@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1193

josh

On Wed, Aug 19, 2026 at 10:52=E2=80=AFAM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> Update a number of AudioDSP firmware binaries to their respective
> maintenance releases and add missing binary for LKF platform.
>
> ---
> The following changes since commit 0a6871b19abf5d6e024b5d208b101ae53e7fa0=
de:
>
>    Merge branch 'robot/pr-0-1787066669' into 'main' (2026-08-18 15:29:47
> +0000)
>
> are available in the Git repository at:
>
>    git@github.com:crojewsk-intel/linux-firmware.git for-upstream
>
> for you to fetch changes up to c8d7cd5ad3f84c414576068ca6d0c696ad57fe1a:
>
>    intel: avs: Add AudioDSP base firmware for LKF platforms (2026-08-19
> 16:09:45 +0200)
>
> ----------------------------------------------------------------
> Cezary Rojewski (4):
>        intel: catpt: Update AudioDSP firmware for BDW platforms
>        intel: avs: Update AudioDSP firmware for SKL-based platforms
>        intel: avs: Update AudioDSP firmware for APL-based platforms
>        intel: avs: Add AudioDSP base firmware for LKF platforms
>
>   WHENCE                                             |   8 +++++---
>   intel/avs/apl/dsp_basefw.bin                       | Bin 505632 ->
> 505632 bytes
>   intel/avs/lkf/dsp_basefw.bin                       | Bin 0 -> 624732 by=
tes
>   intel/avs/skl/dsp_basefw.bin                       | Bin 243016 ->
> 243016 bytes
>   ...sp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin | Bin 12288 ->
> 12288 bytes
>   intel/catpt/bdw/dsp_basefw.bin                     | Bin 260936 ->
> 260608 bytes
>   6 files changed, 5 insertions(+), 3 deletions(-)
>   create mode 100644 intel/avs/lkf/dsp_basefw.bin
