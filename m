Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0E4C433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Jan 2022 14:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59D0AC340E7; Tue, 18 Jan 2022 14:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42993C340E2;
	Tue, 18 Jan 2022 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642517197;
	bh=5kkrKBsUFQ5KqEZdSRQoGGjkQplGcsNhMAuPb6M2P5c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lUUgd8F7EO723yTMrJxA/RWCysATHCQaSooHrX4Mblss1B3YcL375FQtb2Zvx0/jO
	 JF7z2BLd2KXc+5u1pGtgZIJ+b1TlteLFvf1wzq7oiosbqrUATWdoSII1IakKHlwlCR
	 Q7YsOXMqFWz0K6ZmU5RHsddy5F/60YW7x+biD0BEPeLp9CXObWMoRC/pg+NBQmbYYi
	 U5nNHb+zeyQgLBo6JY8r9zxBwS/7joaJlnI8qOrEtmpgx1Q59/1QWut7bKgQnxPgWj
	 eeXm9DDm4vcrACc6JylhPsK4xOtx3HeuzFLiJo3wvuPNw7PY9N+fcl9kb5/dWgah3d
	 6LQ/qTepu+t4g==
Received: by mail-il1-f178.google.com with SMTP id a18so11365931ilq.6;
        Tue, 18 Jan 2022 06:46:37 -0800 (PST)
X-Gm-Message-State: AOAM53103Lx8ktPLKQkKWn+yILhTf4SLETWY4Q7YS0xJlEahY0AV3gKT
	Jn4snGl6axtpzaWBC24GEsCpIwK+E9D+KxahtXM=
X-Google-Smtp-Source: ABdhPJx97WVAx/RkAF5HM0hpBC80DikdOuCxM0y+/dfoIZ3jCYW7zOiGfrP1VqxXMDvQgPN7I2SPFOYZMrVfBh03qbA=
X-Received: by 2002:a05:6e02:1c25:: with SMTP id m5mr14028384ilh.251.1642517196463;
 Tue, 18 Jan 2022 06:46:36 -0800 (PST)
MIME-Version: 1.0
References: <20220115000353.1812714-1-John.C.Harrison@Intel.com>
In-Reply-To: <20220115000353.1812714-1-John.C.Harrison@Intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Jan 2022 09:46:25 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7J1TU6Q+QptVDp-wMp7URoiYDox+Qp7Di0QDLhJVCxYw@mail.gmail.com>
Message-ID: <CA+5PVA7J1TU6Q+QptVDp-wMp7URoiYDox+Qp7Di0QDLhJVCxYw@mail.gmail.com>
Subject: Re: [CI] PR for new GuC v69.0.3
To: John Harrison <John.C.Harrison@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Kyle McMartin <kyle@kernel.org>, 
	Ben Hutchings <ben@decadent.org.uk>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Fri, Jan 14, 2022 at 7:03 PM <John.C.Harrison@intel.com> wrote:
>
> The following changes since commit b0e898fbaf377c99a36aac6fdeb7250003648ca4:
>
>   linux-firmware: Update firmware file for Intel Bluetooth 9462 (2021-11-23 12:31:45 -0500)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware guc_v69.0.3
>
> for you to fetch changes up to 548b304a35b77cd43c1242e0eae68f775bd0df2a:
>
>   i915: Add GuC v69.0.3 for all platforms (2021-12-15 13:28:54 -0800)
>
> ----------------------------------------------------------------
> John Harrison (1):
>       i915: Add GuC v69.0.3 for all platforms
>
>  WHENCE                   |  30 ++++++++++++++++++++++++++++++
>  i915/adlp_guc_69.0.3.bin | Bin 0 -> 356416 bytes
>  i915/bxt_guc_69.0.3.bin  | Bin 0 -> 216768 bytes
>  i915/cml_guc_69.0.3.bin  | Bin 0 -> 217664 bytes
>  i915/dg1_guc_69.0.3.bin  | Bin 0 -> 323968 bytes
>  i915/ehl_guc_69.0.3.bin  | Bin 0 -> 343360 bytes
>  i915/glk_guc_69.0.3.bin  | Bin 0 -> 217216 bytes
>  i915/icl_guc_69.0.3.bin  | Bin 0 -> 343360 bytes
>  i915/kbl_guc_69.0.3.bin  | Bin 0 -> 217664 bytes
>  i915/skl_guc_69.0.3.bin  | Bin 0 -> 216704 bytes
>  i915/tgl_guc_69.0.3.bin  | Bin 0 -> 343296 bytes
>  11 files changed, 30 insertions(+)
>  create mode 100644 i915/adlp_guc_69.0.3.bin
>  create mode 100644 i915/bxt_guc_69.0.3.bin
>  create mode 100644 i915/cml_guc_69.0.3.bin
>  create mode 100644 i915/dg1_guc_69.0.3.bin
>  create mode 100644 i915/ehl_guc_69.0.3.bin
>  create mode 100644 i915/glk_guc_69.0.3.bin
>  create mode 100644 i915/icl_guc_69.0.3.bin
>  create mode 100644 i915/kbl_guc_69.0.3.bin
>  create mode 100644 i915/skl_guc_69.0.3.bin
>  create mode 100644 i915/tgl_guc_69.0.3.bin
