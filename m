Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9B8C28B30
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Mar 2025 14:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C2F4C4CEEC; Thu, 20 Mar 2025 14:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460F7C4CEE3
	for <linux-firmware@kernel.org>; Thu, 20 Mar 2025 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742479840;
	bh=f7ukVTr8aywL0BYf4FbnOFBI2Lcv++6fNZcU3iwR6Ss=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qduneuNOmL0sjUj2kars4cStWIefdHZqPEqH+CWLOkN0YAAikGxrrLOgjDZL2686F
	 HkNeYEWPDrYsoTWbY/VpnuHEhxbA3tGu07tm0wqMuod/4p9JFaBgIkRCJU+DS2kd5O
	 LmV6QWpRBqYaVox66pcRD/WQ42rbyaaxoIZfEhglNEKuYsmSSwM07EYoht9YUUbmgW
	 wL1l+bO137B5SHtr8D9HQ+TFZLuYJrpDH/Yd3c6EyJGlR84LYN3e/fZhrNlqisDtoi
	 a2ywkHT/dIhCmKzpsENk5Bd6bWDDIgJ+MVJS6/7VRqJwSjyfPjw+qt+eDY5wvSAHLh
	 tGZ9jfmDF2NRQ==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so627245276.2
        for <linux-firmware@kernel.org>; Thu, 20 Mar 2025 07:10:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YyKekik1DSR07OHp1tpWK7FVxVQ7rGHt3UOsXweQRmJbM+HOpQK
	pKU1uldOX554PSlrKffRy6LS7GKu8NvUslfvxTfTOpTn1GrPDGIA1riDcghzzyiygMf+EVgMOyq
	LZUJTRDf3dgi5uWxNfKEdinJlshI=
X-Google-Smtp-Source: AGHT+IEgihAVNeIvLHo5eIaQeiJT5FZ4p7xT4JCyEhGLBlRW2hH0fZNUwJvTuFKUXdvqGosnxZ6+J32ckPGSLMdi+DM=
X-Received: by 2002:a05:6902:2007:b0:e64:b9c:47bc with SMTP id
 3f1490d57ef6-e66920275demr4252661276.22.1742479839466; Thu, 20 Mar 2025
 07:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250320091503.16427-1-andres.traumann.01@gmail.com>
In-Reply-To: <20250320091503.16427-1-andres.traumann.01@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 20 Mar 2025 10:10:28 -0400
X-Gmail-Original-Message-ID: <CA+5PVA77gYc-QuswsQJZFh+aQWEQz8Vh5rhV4Q5j=ovN6T6Jqw@mail.gmail.com>
X-Gm-Features: AQ5f1Jquu1TzREHDpFvIOU7iBuoCFlEArdpRo9aNRcHu001faFhWkDAddlKkOS0
Message-ID: <CA+5PVA77gYc-QuswsQJZFh+aQWEQz8Vh5rhV4Q5j=ovN6T6Jqw@mail.gmail.com>
Subject: Re: [PATCH] cirrus: Add cs35l56 firmware symlinks for Asus UM5606KA
To: Andres Traumann <andres.traumann.01@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/495

josh

On Thu, Mar 20, 2025 at 5:15=E2=80=AFAM Andres Traumann
<andres.traumann.01@gmail.com> wrote:
>
> Symlinks previously existed for amp1 and amp2, but amp3 and amp4 were fai=
ling to load.
>
> Signed-off-by: Andres Traumann <andres.traumann.01@gmail.com>
> ---
>  WHENCE | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index 6b3506d8..85247beb 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -7935,6 +7935,8 @@ File: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-a=
mp2.bin
>  Link: cirrus/cs35l56-b0-dsp1-misc-10431264.wmfw -> cs35l56/CS35L56_Rev3.=
11.16.wmfw
>  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp1.bin -> cs35l56-b0-dsp1-m=
isc-10431df3-amp1.bin
>  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp2.bin -> cs35l56-b0-dsp1-m=
isc-10431df3-amp2.bin
> +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp3.bin -> cs35l56-b0-dsp1-m=
isc-10431df3-amp3.bin
> +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp4.bin -> cs35l56-b0-dsp1-m=
isc-10431df3-amp4.bin
>  Link: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0.wmfw -> cs35l56/CS35L5=
6_Rev3.11.16.wmfw
>  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
>  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin
> --
> 2.49.0
>
