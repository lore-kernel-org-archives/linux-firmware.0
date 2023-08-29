Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ADAC71153
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Aug 2023 14:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7333DC433CD; Tue, 29 Aug 2023 14:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D41AC433CB;
	Tue, 29 Aug 2023 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693320405;
	bh=aTVfCS5G8oNdVAkcUiSVyTv7+G6m0h198/8RZVHDp4o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=A1t4e8a3y3JUyrv8aobUj2xI6AC0ndaeSIxISXGaO2AOvztbetXEg4mxvNgGHpb0c
	 W7NHtgFCuL/DkFUJ76XCyueFwQRVHYiBYRbaU3OcJ8Is7fV9kBC4xa7SArARhLkPnZ
	 1TJrkIpK9huMIrNYjdtAIowWVSJxrHxIwyJOArMm8FiuDKGL5XwAHwc68rNsuuVQyW
	 CgfScIRrpMHaGrbVbMVvHFM8c2/mgCy5URrKDbr+Tjcwlzm7qUBB1yJDlNZkCD/Aio
	 Zzmt5wHbIAdAMwepYUax11pHma8rRlbrB/DFkI3jDnVkyFZ968rasrfCQMGtS3tbNu
	 oFUGbK28/lnPg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-58d70c441d5so54337637b3.2;
        Tue, 29 Aug 2023 07:46:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YzEBZnlf+Cu7+t1O8DV3h2hNr/zCgS6ebkH/2+YFwkCgj2i+iE2
	Y5IaQvMKi9KUFdZ9Ow5L7tNDqow7oc72KyKdXUw=
X-Google-Smtp-Source: AGHT+IGWVbnosjzoV5p1Pex3bCnY2iwJeAP0RxIUvAXZ7o4t8KS6z68jmajeVSJeIOuZm+dzwcwmaf2SvHhc8+lQpkQ=
X-Received: by 2002:a0d:d646:0:b0:570:77b3:1c78 with SMTP id
 y67-20020a0dd646000000b0057077b31c78mr30552225ywd.25.1693320404302; Tue, 29
 Aug 2023 07:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <ssndxmkgnqc3nkhe4l6ohs6kbrufiiv4vxukecuiz5ayki34y7@iw77itt3adlo>
In-Reply-To: <ssndxmkgnqc3nkhe4l6ohs6kbrufiiv4vxukecuiz5ayki34y7@iw77itt3adlo>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 29 Aug 2023 10:46:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7_HuOOM+s+EnD94CP5-SK6kWsH2T_app-XBh5cwAsQqQ@mail.gmail.com>
Message-ID: <CA+5PVA7_HuOOM+s+EnD94CP5-SK6kWsH2T_app-XBh5cwAsQqQ@mail.gmail.com>
Subject: Re: PR for MTL DMC v2.16
To: Gustavo Sousa <gustavo.sousa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Josh Boyer <jwboyer@kernel.org>, kyle@mcmartin.ca, 
	ben@decadent.org.uk, intel-gfx@lists.freedesktop.org, 
	Anusha Srivatsa <anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 8:56=E2=80=AFAM Gustavo Sousa <gustavo.sousa@intel.=
com> wrote:
>
> The following changes since commit 659dfe6435b77a075d9896ff34250bcaab55d7=
5b:
>
>   Merge tag 'amd-2023-08-25' of https://gitlab.freedesktop.org/drm/firmwa=
re (2023-08-29 07:27:29 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dmc-mtl_2.16

Pulled and pushed out.

josh

>
> for you to fetch changes up to 49f9e3479fb564ab96ebbfef327743b0ec2a7620:
>
>   i915: Update MTL DMC to v2.16 (2023-08-29 09:49:34 -0300)
>
> ----------------------------------------------------------------
> Gustavo Sousa (1):
>       i915: Update MTL DMC to v2.16
>
>  WHENCE           |   2 +-
>  i915/mtl_dmc.bin | Bin 52164 -> 52388 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
