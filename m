Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B376FC433FE
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Apr 2022 11:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EAA2C385A5; Mon, 11 Apr 2022 11:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894ABC385A3
	for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 11:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649675927;
	bh=bk3dq/cIvUQK1tI3ZV3mZ13J4OSfW01EegrA0oxYLDk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iUJIH/pbMcV6rbkMFqm4POc4NgdUFYKlluz/q7pw2wcdplJgxl56dUJr8txGkdA4/
	 WEtCvmI8LzQxHG8/c8Yjnpw4QFh0vHIdWdusZ9tQd5hNxD1NXlPsqsHFY+71IOKlCp
	 RwGCyjugv4LJNFNX1BWQEDDzMca5R2q6Ut60+n4LIoALfNTtzXMW40Wr8apXsLgutt
	 F420BdrN+b0/L/yy3vRsFC8M5TBGCKPPPdnA6kcsyeD+T9s5/5k58cykv9AWG1cqER
	 YsGSR+awvcg+sp9UMOlB3EOaweq4JDidMVox0donoq+7NHVySTUSRXoeaOnd8RbGyE
	 b/q4hgFeGpyMQ==
Received: by mail-il1-f172.google.com with SMTP id b17so4141869ilq.5
        for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 04:18:47 -0700 (PDT)
X-Gm-Message-State: AOAM530gu46x9FYe947YX0DmR53w767O9pIEPCpEUU3D+xHCTNKwndv8
	6WVBDyoWSgh+Me2zYcaY+ZMQd4Tgk8t5TatRdJU=
X-Google-Smtp-Source: ABdhPJyG10RANSNiye2v8h6ag1BI4DIBQlPHJ9RYy0x1hYvOCrWTDnpt1lBhj/p5C077qcRV6F+EcN2tGU6ovCuphy0=
X-Received: by 2002:a05:6e02:164b:b0:2ca:255e:acf1 with SMTP id
 v11-20020a056e02164b00b002ca255eacf1mr14139768ilu.243.1649675926691; Mon, 11
 Apr 2022 04:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220408161324.2224973-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20220408161324.2224973-1-anthony.l.nguyen@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 11 Apr 2022 07:18:35 -0400
X-Gmail-Original-Message-ID: <CA+5PVA64F3sBY0HBfQ+yn3xPOVeNUva8QdMcL_RLeN7AQPPPWQ@mail.gmail.com>
Message-ID: <CA+5PVA64F3sBY0HBfQ+yn3xPOVeNUva8QdMcL_RLeN7AQPPPWQ@mail.gmail.com>
Subject: Re: [linux-firmware v1 0/2][pull request] Intel Wired LAN Firmware
 Updates 2022-04-08
To: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 12:13 PM Tony Nguyen <anthony.l.nguyen@intel.com> wrote:
>
> Update the ice comms package to a newer version and add another
> alternative package file, wireless edge, that can optionally be used.
>
> The following are changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:
>   amdgpu: update PSP 13.0.8 firmware
> and are available in the git repository at:
>   git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware dev-queue
>
> Arjun Anantharam (1):
>   ice: update ice DDP comms package to 1.3.31.0
>
> Guruprasad Rao (1):
>   ice: Add wireless edge file for Intel E800 series driver

Pulled and pushed out.

josh

>
>  WHENCE                                        |   3 ++-
>  ...ms-1.3.20.0.pkg => ice_comms-1.3.31.0.pkg} | Bin 688388 -> 717176 bytes
>  .../ice_wireless_edge-1.3.7.0.pkg}            | Bin 688388 -> 717176 bytes
>  3 files changed, 2 insertions(+), 1 deletion(-)
>  copy intel/ice/ddp-comms/{ice_comms-1.3.20.0.pkg => ice_comms-1.3.31.0.pkg} (75%)
>  rename intel/ice/{ddp-comms/ice_comms-1.3.20.0.pkg => ddp-wireless_edge/ice_wireless_edge-1.3.7.0.pkg} (74%)
>
> --
> 2.31.1
>
