Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AAF1073CA2
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Apr 2026 11:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2EBB7C2BCB4; Wed,  8 Apr 2026 11:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F07C19421
	for <linux-firmware@kernel.org>; Wed,  8 Apr 2026 11:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775649227;
	bh=l5uGOJCrUQvKqxMFWnmcRlV1gMU/M5x1sWdVw6VCdu0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=eAGhtertipkcLfA08to6h993W5MEwrynZjWSvFnGazDFecZEGR/jZY2hIX7AgaZ49
	 OfpqRaLNgW3J2HVtJj8G5HhzrezcyH5SFxxmeK3hvmfx7f3Wzbbf3FzSZynpuhiTf5
	 +8QjZWIwwBGeZhYS76ZeiCfSK5XGC2OtjSo9I4FBhsVX1+k6VJ+TohUOjihBhvV4S4
	 n0bPAOOn5QRwIzkHt4rh1Uop4hdfivU0BlNiOmuZ6ESt3Z5uLQE9Be+D3z3aPzW3gc
	 xrXXq6HDs1CatlprlRrphXbnLjwsE0Jh0S7RHUQggRs/vOSl9hUS4PNkBFB45/wItC
	 Jlu1zXpsU9+oA==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6501c9903edso6119618d50.1
        for <linux-firmware@kernel.org>; Wed, 08 Apr 2026 04:53:47 -0700 (PDT)
X-Gm-Message-State: AOJu0YwwRwoOoFji39PPfqPwZUhsqskrZOLoU78qrWJk00gJIggOAodE
	S5X1DlRKppIsDUP+Ryhkj0w+U76iWy/PkQEnab1hqFrBfWCZMhgMPjqpL8NX7/0Vqz1zhwTk6n/
	/eVYjPit1P98t7kmI2XxhnG5zx1EVw14=
X-Received: by 2002:a53:c082:0:b0:650:1247:fe35 with SMTP id
 956f58d0204a3-6504887cba6mr14365497d50.58.1775649226355; Wed, 08 Apr 2026
 04:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260408082834.94540-1-aaron.ma@canonical.com>
In-Reply-To: <20260408082834.94540-1-aaron.ma@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 8 Apr 2026 07:53:34 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5+t0DGasgNONe5GW-bD4hJX4Hc7ZKiB7D8kwsFQKtHuw@mail.gmail.com>
X-Gm-Features: AQROBzDvDSNq1BTGAg4cQnSB767A_XW0rGbQi9eGFMMSCWyxkNvE26LLE66I2BE
Message-ID: <CA+5PVA5+t0DGasgNONe5GW-bD4hJX4Hc7ZKiB7D8kwsFQKtHuw@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: Fix ISH firmware symlink prefix for Lenovo PTL systems
To: Aaron Ma <aaron.ma@canonical.com>, Ryan Jayme <rjayme2@lenovo.com>, 
	Vishnu Sankar <vsankar@lenovo.com>, rjayme.jp@gmail.com, 
	Vishnu Sankar <vishnuocv@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Vishnu/Richie, can you review this patch?

josh

On Wed, Apr 8, 2026 at 4:28=E2=80=AFAM Aaron Ma <aaron.ma@canonical.com> wr=
ote:
>
> Tested on ThinkPad X1 2-in-1 Gen 11 (21V9SIT260) with kernel 7.0-rc6:
> renaming the symlink to ish_ptl_53c4ffad_bc3e29f7.bin loads the firmware
> successfully (v5.8.1.7782) and all three HID sensor hubs enumerate.
>
> Fixes: 87a7d3c72b19 ("Add LENOVO ISH firmware v5.8.1.7720 for X1 Carbon (=
Gen 14) and X1 2-in-1 (Gen 11)")
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  WHENCE | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index b243fee39..c46dc429b 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -9928,9 +9928,9 @@ Info: product_family - "ThinkPad X9-15 Gen 1"
>  Version: 5.8.0.7720
>
>  File: LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin
> -Link: intel/ish/ish_lnlm_53c4ffad_bc3e29f7.bin -> ../../LENOVO/ish/ish_p=
tl_lenovo_X1_2026_5.8.1.7782.bin
> +Link: intel/ish/ish_ptl_53c4ffad_bc3e29f7.bin -> ../../LENOVO/ish/ish_pt=
l_lenovo_X1_2026_5.8.1.7782.bin
>  Info: product_family - "ThinkPad X1 2-in-1 Gen 11"
> -Link: intel/ish/ish_lnlm_53c4ffad_75d6ebe2.bin -> ../../LENOVO/ish/ish_p=
tl_lenovo_X1_2026_5.8.1.7782.bin
> +Link: intel/ish/ish_ptl_53c4ffad_75d6ebe2.bin -> ../../LENOVO/ish/ish_pt=
l_lenovo_X1_2026_5.8.1.7782.bin
>  Info: product_family - "ThinkPad X1 Carbon Gen 14"
>  Version: 5.8.1.7782
>
> --
> 2.43.0
>
