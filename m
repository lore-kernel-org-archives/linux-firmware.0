Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39C6C27C4F
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Jun 2024 11:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C50F9C4AF4D; Tue, 18 Jun 2024 11:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8446C4AF49
	for <linux-firmware@kernel.org>; Tue, 18 Jun 2024 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718709606;
	bh=WNNc2FTdK0VKiJIzjCIkcIZLGvZbFlAQIyt6luwn0b8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IM4WCrppvenjfMiJLCWuClkkxCs0A7j8Y1CMhoF6C4ukxRSWtyIKBKOfWS7tFBR4E
	 aeUN/QpTGHQnrUJfN6GWnkqeK9pyqCypWZLTmqDxFJrZks6zGI2H90TVlEiT1pAsha
	 PEhB8DBwpOxU97tMVtF/rYW1oNc/q7MgJx5xSLBqkZe5yoUM+MXyFkA42niAJa38Nv
	 agvq1vm4+FZtjPPIakEYFaWa8lZFN3DFpRIoIFZEPyfxrzjbmkmkv2aIDagceV8OW3
	 HrrL/76+myuAdNE3xrp97wRwFMlFlmaASP/i784pU5eVw1+hMSKliHx3SraNcIO/sz
	 qgZqjT+oL93uw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6333082fb8fso33545387b3.2
        for <linux-firmware@kernel.org>; Tue, 18 Jun 2024 04:20:06 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx/LIrI21Y6EleMK+UVhDHemV125NCefeWpSSokzPb31WHU5soU
	uypWun66DKtBuBEunCzVdEBIIrQVuyq8a8N7torjo4WC9vsdIdZD7+dTMg0e8FryGgsD8dl5RVv
	6hnp94NAzYttr32ceK1YM2/kCM+Y=
X-Google-Smtp-Source: AGHT+IEl4JEJ2ibMJ3+yYk4NXRYYKysZhlPhS5EJPmd5RK13crBSLWzSDSOlXV+GW+Us+W2w2OQ6V7gclMfgcLNsIDA=
X-Received: by 2002:a81:ef0b:0:b0:60a:448:ff4f with SMTP id
 00721157ae682-63223d3b7b7mr116330727b3.41.1718709605819; Tue, 18 Jun 2024
 04:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <MW5PR11MB581090298E870AB68BB55A25A3C12@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB581090298E870AB68BB55A25A3C12@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Jun 2024 07:19:54 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4DYSnYdTQ04fS2p41RAanc_YeQ+MY35UkBZLFG5e1CvA@mail.gmail.com>
Message-ID: <CA+5PVA4DYSnYdTQ04fS2p41RAanc_YeQ+MY35UkBZLFG5e1CvA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-06-13
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>, "Damary, Guy" <guy.damary@intel.com>, 
	"Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 3:22=E2=80=AFPM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
>
>
> This contains some new and updated firmwares for all our currently
>
> maintained FW binaries.
>
>
>
> Please pull or let me know if there are any issues.
>
>
>
> --
>
> Thanks,
>
> Miri
>
>
>
> The following changes since commit ec8627effe4d94107e57ac8d54dd55468ce9e2=
af:
>
>
>
>   Merge branch 'amd-isp-staging' into 'main' (2024-05-19 11:17:51 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2024-06-13

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/228

josh

>
>
>
> for you to fetch changes up to 0f237a6c48b5412156ed4d28209800f598ab3a01:
>
>
>
>   iwlwifi: add ty/So/Ma firmwares for core88-87 release (2024-06-13 22:09=
:30 +0300)
>
>
>
> ----------------------------------------------------------------
>
> Core88
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (2):
>
>       iwlwifi: update cc/Qu/QuZ firmwares for core88-87 release
>
>       iwlwifi: add ty/So/Ma firmwares for core88-87 release
>
>
>
> WHENCE                        |  29 ++++++++++++++++-------------
>
> iwlwifi-Qu-b0-hr-b0-77.ucode  | Bin 1405980 -> 1405980 bytes
>
> iwlwifi-Qu-b0-jf-b0-77.ucode  | Bin 1322684 -> 1322684 bytes
>
>  iwlwifi-Qu-c0-hr-b0-77.ucode  | Bin 1405996 -> 1405996 bytes
>
> iwlwifi-Qu-c0-jf-b0-77.ucode  | Bin 1322700 -> 1322700 bytes
>
>  iwlwifi-QuZ-a0-hr-b0-77.ucode | Bin 1406116 -> 1406116 bytes
>
>  iwlwifi-QuZ-a0-jf-b0-77.ucode | Bin 1321956 -> 1322760 bytes
>
>  iwlwifi-cc-a0-77.ucode        | Bin 1367432 -> 1367496 bytes
>
>  iwlwifi-ma-b0-gf-a0-89.ucode  | Bin 1721440 -> 1746844 bytes
>
>  iwlwifi-ma-b0-gf-a0.pnvm      | Bin 55096 -> 55112 bytes
>
>  iwlwifi-ma-b0-gf4-a0-89.ucode | Bin 1598424 -> 1599272 bytes
>
>  iwlwifi-ma-b0-gf4-a0.pnvm     | Bin 27820 -> 27828 bytes
>
>  iwlwifi-ma-b0-hr-b0-89.ucode  | Bin 0 -> 1539360 bytes
>
>  iwlwifi-so-a0-gf-a0-89.ucode  | Bin 1709992 -> 1731172 bytes
>
>  iwlwifi-so-a0-gf-a0.pnvm      | Bin 55176 -> 55192 bytes
>
>  iwlwifi-so-a0-gf4-a0-89.ucode | Bin 1589216 -> 1589864 bytes
>
>  iwlwifi-so-a0-gf4-a0.pnvm     | Bin 27860 -> 27868 bytes
>
>  iwlwifi-so-a0-hr-b0-89.ucode  | Bin 1526136 -> 1530624 bytes
>
>  iwlwifi-ty-a0-gf-a0-89.ucode  | Bin 1651956 -> 1681232 bytes
>
>  iwlwifi-ty-a0-gf-a0.pnvm      | Bin 55020 -> 55036 bytes
>
>  20 files changed, 16 insertions(+), 13 deletions(-)
>
>  create mode 100644 iwlwifi-ma-b0-hr-b0-89.ucode
