Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FA5C5B543
	for <linux-firmware@archiver.kernel.org>; Fri, 30 May 2025 11:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84313C4CEEF; Fri, 30 May 2025 11:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA86C4CEEA
	for <linux-firmware@kernel.org>; Fri, 30 May 2025 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748604801;
	bh=E+0sROcsvcCG1xNPWmXpcVHR/gylobLPPmT/vsPELLY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=phqsfgPna3B6iBPyyZIr901tzX238OJ8sNFkoijED4Pz2Weti37igxn+kckBbp4+d
	 gxvDd531V0RTE0bDN98S2g3sEcjzCP3LBJgAjLkmMnEfs3alxdJ9WQuL/Y1chDj0Ub
	 fSHOgiLSFvEQgj4e15zXsJA/Ute/AT1rHEWCMS9shj82jY1OuUZHxf68TlGXt+IYh0
	 fxDU4ozNUaP9M8E9uDW32Qzaqvz6Z/jEHvbevIV/pA8t8ae2i2mGJH07imW2vQpePu
	 d0qydoxV6nU0kPMfIhltkNtykx1OXaC6dc0ckf9pOPYmj8XCbMR6aJXdWsrYmdDo9B
	 hnzoJ0g24mytQ==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso1618169276.0
        for <linux-firmware@kernel.org>; Fri, 30 May 2025 04:33:21 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzu1gCXmOYsy12gmui0YkjDwC5QJ+8LnTueAsDUmjOtCKVp1/TQ
	F8EAWbVesOQluuV3njtuA+dW00NXBFwr0cwKRDDsVS7cZurAzugK9BVkWdAuqpXrLs8KoQwuw1z
	pvEp6I2YCCrNDXuCJ31R4H1KJMqHVX94=
X-Google-Smtp-Source: AGHT+IGuk84SySpG7nX/jKQVhCP8vzri9rTDP6xzLNbce6kZNDdOeWM0Y9jcyF4JXCPwk7mGcIfoIeM9aAjmn35B3zY=
X-Received: by 2002:a05:690c:4a0f:b0:70e:1ef7:6f21 with SMTP id
 00721157ae682-70f97e1ce4bmr42378377b3.5.1748604800605; Fri, 30 May 2025
 04:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250529173808.1007279-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20250529173808.1007279-1-anthony.l.nguyen@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 30 May 2025 07:33:09 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7PVHitHKD5_ZcPOyB=3yzHXP+zWkoExWNL7fG4gK4DCA@mail.gmail.com>
X-Gm-Features: AX0GCFvIdXcCou-JQfBOf9vd1EdPnaCPt4Uc8qYAP8BqorHd5hwe_WSzb0ORRB4
Message-ID: <CA+5PVA7PVHitHKD5_ZcPOyB=3yzHXP+zWkoExWNL7fG4gK4DCA@mail.gmail.com>
Subject: Re: [linux-firmware][pull request] Intel Wired LAN Firmware Updates 2025-05-29
To: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jacob.e.keller@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 1:38=E2=80=AFPM Tony Nguyen <anthony.l.nguyen@intel=
.com> wrote:
>
> Update ice DDP packages (default, comms, and wireless_edge) to support
> E825-C devices.
>
> The following changes since commit 167118c968355b779bb2fb16078bb53bad677d=
49:
>
>   Merge branch '23.140.Rev5' into 'main' (2025-05-29 11:01:00 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/firmware.git dev-qu=
eue

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/568

josh

>
> for you to fetch changes up to 4439f5b5c5afc0c206c1e92fec39856caf092f75:
>
>   ice: update wireless_edge package to 1.3.23.0 (2025-05-29 08:06:40 -070=
0)
>
> ----------------------------------------------------------------
> Tony Nguyen (3):
>       ice: update package to 1.3.43.0
>       ice: update comms package to 1.3.55.0
>       ice: update wireless_edge package to 1.3.23.0
>
>  WHENCE                                             |   8 ++++----
>  ...e_comms-1.3.52.0.pkg =3D> ice_comms-1.3.55.0.pkg} | Bin 1434500 -> 14=
34500 bytes
>  ...1.3.20.0.pkg =3D> ice_wireless_edge-1.3.23.0.pkg} | Bin 1442692 -> 14=
42692 bytes
>  .../ice/ddp/{ice-1.3.41.0.pkg =3D> ice-1.3.43.0.pkg} | Bin 1352580 -> 13=
52580 bytes
>  4 files changed, 4 insertions(+), 4 deletions(-)
>  rename intel/ice/ddp-comms/{ice_comms-1.3.52.0.pkg =3D> ice_comms-1.3.55=
.0.pkg} (99%)
>  rename intel/ice/ddp-wireless_edge/{ice_wireless_edge-1.3.20.0.pkg =3D> =
ice_wireless_edge-1.3.23.0.pkg} (99%)
>  rename intel/ice/ddp/{ice-1.3.41.0.pkg =3D> ice-1.3.43.0.pkg} (99%)
>
> --
> 2.47.1
>
