Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE1BC0015E
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jul 2023 12:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03272C433C9; Mon, 24 Jul 2023 12:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E161EC433C8
	for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201503;
	bh=0smqilg0Bo8v2rJwTRmAWPyXuCL3T+Lo2V+LgdRHUBU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NY0aPgXk+6H9YOG+iBLe2rWtkk0hjWkZs5fiaNh9r4GcZfsKR+iYx5YpwWgiHONcx
	 oaeV4huHzSRgcFIqKQK2GWJM/PbME1aX0sdFz3dgllYJkXNzqTtg/pawG0/SZVNXFs
	 ZBwrhm+i33W2ttrY6sb1fAouUeaHDvRA/I0zVcXCfam2Bh9OB6zQnFLJmjvcV5Oh+P
	 YoSzC3Au5ZwzrZvVNV7txHKKBoqJjN6bOm/C1EE7ytGxXBnmdgcZiWpebFdJy9XR4T
	 JWqNrnNHuP9EENBBm/ELdhRCJFT48A3dGotOtWXjNODe3MLILthk9vEnvVw1YDW8Gp
	 UmRRmd9AOclgQ==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d08658c7713so2323970276.3
        for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 05:25:03 -0700 (PDT)
X-Gm-Message-State: ABy/qLaPlQHCov4aoZcuGUcMxN6aRPspqh0NAMh45N2dPjDO9hNETvqa
	8/jie0r9y+Hh3lAVhWdRklHyHEfxnyJj8o4JMe0=
X-Google-Smtp-Source: APBJJlGGdZJH+ZG+5LEF1m6n/zg20BNjJtQPscwaEIqKCdpYw/1Kh2udC6IXHcC825iCfXY0j/1WznvCdbgketHebec=
X-Received: by 2002:a25:2342:0:b0:d0d:2d17:3f11 with SMTP id
 j63-20020a252342000000b00d0d2d173f11mr3409968ybj.17.1690201502947; Mon, 24
 Jul 2023 05:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_MQM1sG50oq4FoOTVOrg+b+Q5is7X3rpbwSFZu7s7ZhSg@mail.gmail.com>
In-Reply-To: <CADnq5_MQM1sG50oq4FoOTVOrg+b+Q5is7X3rpbwSFZu7s7ZhSg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 08:24:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5Mx0eym4qSappjmS_5kTfz3n-fAmPVtrUn266Sn6cuiQ@mail.gmail.com>
Message-ID: <CA+5PVA5Mx0eym4qSappjmS_5kTfz3n-fAmPVtrUn266Sn6cuiQ@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The first patch generates:

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: amdgpu/gc_11_0_3_mes.bin listed in WHENCE does not exist
[jwboyer@vader linux-firmware]$

Can you fix it up and resubmit?

josh

On Fri, Jul 14, 2023 at 10:21=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> Hi,
>
> New amdgpu firmware.  Please apply!
>
> Thanks,
>
> Alex
