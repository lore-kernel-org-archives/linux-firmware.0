Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F55AC7EE25
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jun 2023 11:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 472B0C433A0; Mon, 12 Jun 2023 11:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30846C4339C;
	Mon, 12 Jun 2023 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686568011;
	bh=825674V/LBFg76IFobAM5jsPVxN6XSGwHnjMTWncEWE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=cOs0oTj0IigeAiys/DBQ0/J4hQLhgYGeG5pYsw4ERUH3XJL+vS28PLHEZzwWzkbH0
	 d2sDV1wA2zPFPLdgdT7aZidUGJKE0bKzkpH8dGombcqJ7C8wDkC87pqonq6NwkV/9k
	 Z7bFdPs/qLOgMMmEjK222g/7ErTrFC3YU7w+/C6/E+iYO/snYO5ev5I6LWNWtoQU8k
	 GiudnDi7zMfMkulNlfYoYV3WXyKnPBVTYYmGikosMuYWwJRlwpnRTGEzsfoKneGP5Z
	 K1erX1PO/3QCncDgSvsK6zRuEI1hYOgPqcq6ZXk0MbiSbCVQR1VjGaOeNiFLaARDCB
	 OvzrFyLUtmHrQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-56d304ef801so7243467b3.0;
        Mon, 12 Jun 2023 04:06:51 -0700 (PDT)
X-Gm-Message-State: AC+VfDxHhOcvzvWu19etwbZ6Odim7SXW/2RWy7bUJ/Q9mAVfhNRr/SGZ
	HQto8EJDwSlewRW4pY25ocBwLmBvzLG2+fKi/q8=
X-Google-Smtp-Source: ACHHUZ6nt/PpUwiU/qAR05Ed1JpojTqY+/XCAN6ZSl34u2iLfbEYXKC+8GBVq8Bu2hSKiwdZAPxVN1t2pORXXQCq1uQ=
X-Received: by 2002:a25:8682:0:b0:bcc:1d2d:1ffe with SMTP id
 z2-20020a258682000000b00bcc1d2d1ffemr1138590ybk.64.1686568010153; Mon, 12 Jun
 2023 04:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230606163345.2058790-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230606163345.2058790-1-daniele.ceraolospurio@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 12 Jun 2023 07:06:39 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4Uyzychg1ezqufBBsFr7Jtsiy9pY2tuHNV+Totu5Z=XA@mail.gmail.com>
Message-ID: <CA+5PVA4Uyzychg1ezqufBBsFr7Jtsiy9pY2tuHNV+Totu5Z=XA@mail.gmail.com>
Subject: Re: PR for HuC v8.5.0 for MTL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@kernel.org, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 12:33=E2=80=AFPM Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> The following changes since commit fc90c59beebd551dde5fe5eb3e76d36651ba08=
fb:
>
>   Merge branch 'db410c' of https://github.com/lumag/linux-firmware (2023-=
05-31 07:35:15 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware mtl_huc_v8.5.0

Pulled and pushed out.

josh

>
> for you to fetch changes up to 5de33fb45cee8d83abfe17e9e85bd74d51a2653f:
>
>   i915: Add HuC v8.5.0 for MTL (2023-06-06 09:24:40 -0700)
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
>       i915: Add HuC v8.5.0 for MTL
>
>  WHENCE               |   3 +++
>  i915/mtl_huc_gsc.bin | Bin 0 -> 565248 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100755 i915/mtl_huc_gsc.bin
