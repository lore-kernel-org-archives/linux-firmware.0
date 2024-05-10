Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97494C25B10
	for <linux-firmware@archiver.kernel.org>; Fri, 10 May 2024 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69CA5C32781; Fri, 10 May 2024 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54783C2BBFC
	for <linux-firmware@kernel.org>; Fri, 10 May 2024 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715352707;
	bh=Zcos4CODZCc0Nn0AAvQGIKUunG47K3J9HUCmnCdtEtM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=I7YqwhvAxHJbaHJ5+QzO2touDYKmlkE54kd0c1/ItIDPAVMXVq+vaTAT7E6KdLYqI
	 QycHiKeGhBS8b7g7YLbIgFfEVdZKr9skOsSaIsNM5SWe47U9s2FOl7EQED1wPtwhct
	 MJLgkfIuc+hGqxNNlIAsv17EmbENM1/ToJEruJSqSzVNmUtRX/8zSDWLKwFYf1XKLZ
	 HUC4kWy7g+sDuJ8uyK8gHK+lUjGyfMSKU4lvTmq0LOOAhoq6UWP8RTpe2mdqii0BNN
	 gETZ27d25eJMaNNyMnqXK0dlH26SZrPW/+3J3Wco+/a+qqISjdWf2FbpKaLVz1tEpI
	 UUdtni3XT1nIQ==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de8b66d1726so2690863276.0
        for <linux-firmware@kernel.org>; Fri, 10 May 2024 07:51:47 -0700 (PDT)
X-Gm-Message-State: AOJu0YzM4owXxbgayB+I/cAwWmVUB9uHqfbCJkmBH53Pl85jrkkxP8fO
	K4GkGNLoMpW8AQglHKX8r/Al509sNH+hGHkivOBQPg2+7wwtD8RHdGHN8yFz0JbdhAfNXKtniGY
	LLTnv5vSaOXaQZOLxMpv1jY+6Tx8=
X-Google-Smtp-Source: AGHT+IH9POl0nwYolwcl4yON2PaETCb22BVGT212XIjJodT2hRxr9PuB719Hp1HPA2HRchCtYqgPNthaQOwhfXMZ9F0=
X-Received: by 2002:a25:d009:0:b0:dc6:d1a9:d858 with SMTP id
 3f1490d57ef6-dee4e4a641cmr2493117276.8.1715352706580; Fri, 10 May 2024
 07:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240509194740.358934-1-gustavo.sousa@intel.com>
In-Reply-To: <20240509194740.358934-1-gustavo.sousa@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 May 2024 08:51:35 -0600
X-Gmail-Original-Message-ID: <CA+5PVA4qTeHG3xbK-8O6xuQCnxZFeorAVqZ5tBRTD-whqq__+g@mail.gmail.com>
Message-ID: <CA+5PVA4qTeHG3xbK-8O6xuQCnxZFeorAVqZ5tBRTD-whqq__+g@mail.gmail.com>
Subject: Re: PR for BMG DMC v2.06
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/210

josh

On Thu, May 9, 2024 at 1:47=E2=80=AFPM Gustavo Sousa <gustavo.sousa@intel.c=
om> wrote:
>
> The following changes since commit 93f329774542b9b7d57abb18ea8b6542f2d8fe=
ac:
>
>   Merge branch 'robot/pr-0-1709214990' into 'main' (2024-02-29 14:10:53 +=
0000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/firmware.git tags/intel-2024-05-09
>
> for you to fetch changes up to 8724b227b8999e11cf89601fec9f6f80795d8fa8:
>
>   i915: Add BMG DMC v2.06 (2024-05-09 15:10:44 -0300)
>
> ----------------------------------------------------------------
> Intel DRM firmware intel-2024-05-09
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
>       i915: Add DG2 HuC 7.10.15
>
> Dnyaneshwar Bhadane (1):
>       i915: Update Xe2LPD DMC to v2.20
>
> Gustavo Sousa (1):
>       i915: Add BMG DMC v2.06
>
>  WHENCE               |   7 +++++--
>  i915/bmg_dmc.bin     | Bin 0 -> 45964 bytes
>  i915/dg2_huc_gsc.bin | Bin 622592 -> 630784 bytes
>  i915/xe2lpd_dmc.bin  | Bin 61208 -> 59284 bytes
>  4 files changed, 5 insertions(+), 2 deletions(-)
>  create mode 100644 i915/bmg_dmc.bin
>  mode change 100755 =3D> 100644 i915/dg2_huc_gsc.bin
