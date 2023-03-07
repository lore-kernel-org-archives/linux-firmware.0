Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02225C6FD1B
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 14:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1157C433D2; Tue,  7 Mar 2023 14:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC299C433A4
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678200664;
	bh=bMzFZubwUmlWMtT6hccyyhTyFmOxuS5HPhNKQ89NU1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qISNHXfMcype8yzwvHr00A6nh1dvZp1GnTJDzS56ShSFRzKZ7AaRAl/w3xrd102P7
	 ieBjVChoWRqn6cVVIxXh+uvDKcTx0QZ9mhrjPk5Wc4GdAWPD0nbR/jPV0nHrpp8Sih
	 TqVixjHYnGs0hKuNOpdaczU7tgiR1n3xUVrl4fWg8jJ0ZueyNzHB3389NFemuz3bSl
	 IHY9XMjd54khpqyggR8V9OQB7QlsORYlgwoZDue6JqmGFJUecAheBS09KBqpEKraKC
	 b4pDzI141DozN2hnhjv6ICnWTS9Bvksd7GQK4ihX+HlOpfbaSmS4HDdBqLuf9ICNSk
	 PioLreN4I2a8w==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-536cb25982eso248278307b3.13
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 06:51:04 -0800 (PST)
X-Gm-Message-State: AO0yUKV15OSZGslqFLp/u/6BIg2e3cZozmUOVh3leSBtBbttdLlFxJoI
	GL70mHzF3vGpLKVZhp/lLmQ1ZzerAqSaQlYJcu0=
X-Google-Smtp-Source: AK7set8B2iTtRqkBTAVNIzEl+DNoG//cq0EoElfTrxzhH26o4A7NiHaI76K5+9BrvMIeHyzGrLLdt/LL4QOKW7iLg74=
X-Received: by 2002:a81:af59:0:b0:535:5e8c:65ef with SMTP id
 x25-20020a81af59000000b005355e8c65efmr8783406ywj.6.1678200663811; Tue, 07 Mar
 2023 06:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20230216005602.18838-1-ats@offog.org> <20230216005602.18838-2-ats@offog.org>
In-Reply-To: <20230216005602.18838-2-ats@offog.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 09:50:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4ZzzqP4xx_TpgjTjTEZLuOHoZx2HbTxxXg2aedWPv8DQ@mail.gmail.com>
Message-ID: <CA+5PVA4ZzzqP4xx_TpgjTjTEZLuOHoZx2HbTxxXg2aedWPv8DQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] intel: Fix broken links
To: Adam Sampson <ats@offog.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I got to your patch after a similar report and fixed it via a similar
commit.  My apologies for not using your patch directly.

josh

On Wed, Feb 15, 2023 at 7:56=E2=80=AFPM Adam Sampson <ats@offog.org> wrote:
>
> The target is relative to the link name.
>
> Fixes: 23afbfe8 ("intel: avs: Add AudioDSP base firmware for CNL-based pl=
atforms")
> Fixes: 284e55d9 ("intel: avs: Add AudioDSP base firmware for APL-based pl=
atforms")
> Fixes: 289e3a97 ("intel: avs: Add AudioDSP base firmware for SKL-based pl=
atforms")
> Fixes: 4296b7af ("intel: catpt: Add AudioDSP base firmware for BDW platfo=
rms")
> Signed-off-by: Adam Sampson <ats@offog.org>
> ---
>  WHENCE | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index b6199d6..e37fa73 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4070,7 +4070,7 @@ Driver: snd_soc_catpt -- Intel AudioDSP driver for =
HSW/BDW platforms
>
>  File: intel/catpt/bdw/dsp_basefw.bin
>  Version: 44b81c4d5397a63108356f58f036953d9b288c4e
> -Link: intel/IntcSST2.bin -> intel/catpt/bdw/dsp_basefw.bin
> +Link: intel/IntcSST2.bin -> catpt/bdw/dsp_basefw.bin
>
>  License: Redistributable. See LICENCE.IntcSST2 for details
>
> @@ -4081,15 +4081,15 @@ Driver: snd_soc_avs -- Intel AudioDSP driver for =
cAVS platforms
>  File: intel/avs/skl/dsp_basefw.bin
>  File: intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin
>  Version: 9.21.00.4899
> -Link: intel/dsp_fw_release.bin -> intel/avs/skl/dsp_basefw.bin
> -Link: intel/dsp_fw_kbl.bin -> intel/avs/skl/dsp_basefw.bin
> +Link: intel/dsp_fw_release.bin -> avs/skl/dsp_basefw.bin
> +Link: intel/dsp_fw_kbl.bin -> avs/skl/dsp_basefw.bin
>  File: intel/avs/apl/dsp_basefw.bin
>  Version: 9.22.01.4908
> -Link: intel/dsp_fw_bxtn.bin -> intel/avs/apl/dsp_basefw.bin
> -Link: intel/dsp_fw_glk.bin -> intel/avs/apl/dsp_basefw.bin
> +Link: intel/dsp_fw_bxtn.bin -> avs/apl/dsp_basefw.bin
> +Link: intel/dsp_fw_glk.bin -> avs/apl/dsp_basefw.bin
>  File: intel/avs/cnl/dsp_basefw.bin
>  Version: 10.23.00.8551
> -Link: intel/dsp_fw_cnl.bin -> intel/avs/cnl/dsp_basefw.bin
> +Link: intel/dsp_fw_cnl.bin -> avs/cnl/dsp_basefw.bin
>
>  License: Redistributable. See LICENCE.adsp_sst for details
>
> --
> 2.30.2
>
