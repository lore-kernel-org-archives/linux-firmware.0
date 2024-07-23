Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CFCC3DA63
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Jul 2024 12:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA68EC4AF12; Tue, 23 Jul 2024 12:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8972AC4AF0F
	for <linux-firmware@kernel.org>; Tue, 23 Jul 2024 12:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721738762;
	bh=qSP+E90DytgA6f73gWUtYmVzDnglm4QwqGEoyFfKQwk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SETWQYeROPqdN7zqtUAb+qFLvGLZAk9gei1e/gjCJ/NLHa9aNrIOUtfy9Q1dTFaLk
	 b9oWmfpAh9xyoPXnuNEUL3Db2qv0dJhba3SH4jHidNpTioqLik8ecPxxayKFK0Lm51
	 tCfBqpcnFLqJV/TtZkkg7MDTYBQiw2ZlJ+VyRuad39zGxqmx+CW7o+EvMNz++fOKNN
	 GD3a/H0E7XGgUdbQ5MJpQxDI4LaDFLS+EXAhizSFSn6QecbRu6iNFetBTfPyYNofFd
	 JJywm+73oWm/Z1o9vSB3GoOK/8l3GQtKYE1T8IfRHDp+J6JAKP8uEa/4Uz4slNdiWg
	 9pnfC6QcqOLmQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-66599ca3470so54918577b3.2
        for <linux-firmware@kernel.org>; Tue, 23 Jul 2024 05:46:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YzJJpWg7dHfTwhnSy3UEpWl0u/ct06flNvpg+02CClfT6BpGrdP
	qDPb60E7CtqkwPAf23Su8fXRu5Ua00wlsM6sKZ1ixrOBLClzQkD6wBsGwEXIPJj2KDXFznzlwYu
	3PrrAatp44pPVLSh3+IygCks0jR4=
X-Google-Smtp-Source: AGHT+IGFljToFte/u3ABaXhEwTD5t2eUFl0GX58/AI92OLk+uP/T8f7bkTD/KF+FQAcHUQZBiYRAS/FbAQ2ser4oUME=
X-Received: by 2002:a05:690c:2c03:b0:64b:a3f0:5eee with SMTP id
 00721157ae682-66a66c1cbe4mr107738617b3.17.1721738761634; Tue, 23 Jul 2024
 05:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <MW5PR11MB5810ABEF2612C550FC5EB8FFA3A92@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5810ABEF2612C550FC5EB8FFA3A92@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 Jul 2024 08:45:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4efKt0xeKquCbwD8brsHX8PWUezT3wSiMsDyMntmegNg@mail.gmail.com>
Message-ID: <CA+5PVA4efKt0xeKquCbwD8brsHX8PWUezT3wSiMsDyMntmegNg@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-07-23
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 6:57=E2=80=AFAM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
>
> maintained FW binaries.
>
> Please pull or let me know if there are any issues.
>
> --
>
> Thanks,
>
> Miri
>
>
>
> The following changes since commit 22bc31b25a65d90e80e83674424819cce82909=
2e:
>
>
>
>   Merge branch 'robot/patch-0-1721357501' into 'main' (2024-07-19 19:20:4=
6 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2024-07-23

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/259

josh

>
>
>
> for you to fetch changes up to f032eea14345546dd09457358413b186c08006bf:
>
>
>
>   iwlwifi: add gl FW for core89-58 release (2024-07-23 13:17:27 +0300)
>
>
>
> ----------------------------------------------------------------
>
> core89-58
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (3):
>
>       iwlwifi: update cc/Qu/QuZ firmwares for core89-58 release
>
>       iwlwifi: update ty/So/Ma firmwares for core89-58 release
>
>       iwlwifi: add gl FW for core89-58 release
>
>
>
>  WHENCE                        |  31 +++++++++++++++++--------------
>
>  iwlwifi-Qu-b0-hr-b0-77.ucode  | Bin 1405980 -> 1405980 bytes
>
>  iwlwifi-Qu-b0-jf-b0-77.ucode  | Bin 1322684 -> 1322684 bytes
>
>  iwlwifi-Qu-c0-hr-b0-77.ucode  | Bin 1405996 -> 1405996 bytes
>
>  iwlwifi-Qu-c0-jf-b0-77.ucode  | Bin 1322700 -> 1322700 bytes
>
>  iwlwifi-QuZ-a0-hr-b0-77.ucode | Bin 1406116 -> 1406116 bytes
>
>  iwlwifi-QuZ-a0-jf-b0-77.ucode | Bin 1322760 -> 1322760 bytes
>
>  iwlwifi-cc-a0-77.ucode        | Bin 1367496 -> 1367496 bytes
>
>  iwlwifi-gl-c0-fm-c0-92.ucode  | Bin 0 -> 1913128 bytes
>
>  iwlwifi-gl-c0-fm-c0.pnvm      | Bin 267272 -> 295512 bytes
>
>  iwlwifi-ma-b0-gf-a0-89.ucode  | Bin 1746844 -> 1746904 bytes
>
>  iwlwifi-ma-b0-gf-a0.pnvm      | Bin 55112 -> 55112 bytes
>
>  iwlwifi-ma-b0-gf4-a0-89.ucode | Bin 1599272 -> 1599332 bytes
>
>  iwlwifi-ma-b0-gf4-a0.pnvm     | Bin 27828 -> 27828 bytes
>
>  iwlwifi-ma-b0-hr-b0-89.ucode  | Bin 1539360 -> 1539360 bytes
>
>  iwlwifi-so-a0-gf-a0-89.ucode  | Bin 1731172 -> 1739424 bytes
>
>  iwlwifi-so-a0-gf-a0.pnvm      | Bin 55192 -> 55192 bytes
>
>  iwlwifi-so-a0-gf4-a0-89.ucode | Bin 1589864 -> 1589924 bytes
>
>  iwlwifi-so-a0-gf4-a0.pnvm     | Bin 27868 -> 27868 bytes
>
>  iwlwifi-so-a0-hr-b0-89.ucode  | Bin 1530624 -> 1530624 bytes
>
>  iwlwifi-ty-a0-gf-a0-89.ucode  | Bin 1681232 -> 1681292 bytes
>
> iwlwifi-ty-a0-gf-a0.pnvm      | Bin 55036 -> 55036 bytes
>
>  22 files changed, 17 insertions(+), 14 deletions(-)
>
>  create mode 100644 iwlwifi-gl-c0-fm-c0-92.ucode
