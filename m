Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC0CC43461
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Apr 2021 12:02:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9661D61459; Fri, 23 Apr 2021 12:02:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80E7A6144A
	for <linux-firmware@kernel.org>; Fri, 23 Apr 2021 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619179346;
	bh=Wq8SAfdIYbJ3KvjeCxjrCtzziQj5S86N/D0E3F37NC8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dyhMGauNaSOrbNhOgQpYMe843qWeYjtuS9M+GJN4lFPjmNwObmuIHCUB4L+KoCYO2
	 bTWEKZn0MnBoGzZXL+8IbyZQvgBJKB3kudKiVgwFGoTdcSgs7dCsUGxhsix+Q21RNv
	 IAYOrvKh5VXQpA2/VVztISjmZ14xAON+2VBicEn6NZ0n2ltW8zn6s/2Why+aCOHRPt
	 khbk5aoQ5Z2rNgSCEzNoLYzXWqDM6gqYkItSTXmWzhzOVoiUJDI8AOsx05d0KgjX2M
	 gd+C98ha3dj1X1hPDJfC9TVaP0UFE+EgAdiyKC8axxCrp9/cQ/OUY+3XE2oj01UEle
	 YCUvVsKmSIFNg==
Received: by mail-il1-f176.google.com with SMTP id j12so26591727ils.4
        for <linux-firmware@kernel.org>; Fri, 23 Apr 2021 05:02:26 -0700 (PDT)
X-Gm-Message-State: AOAM532ktBR683qGzCkanQ8xNDXjmAQ75UwSQH5kez/f2WzINfN0CFU/
	FIFgcD8mIVHluTMdSAvOomdc7hG1a7SsDizRzNs=
X-Google-Smtp-Source: ABdhPJwhRbrKp+X19h5yoKha5eWMgQfF/tU44SbqXoo7uziVbbWZgYmZ+6uMYLoZdxEHISaIdRNUeAoDXJ6bCpjyYR0=
X-Received: by 2002:a92:c649:: with SMTP id 9mr2557242ill.303.1619179345841;
 Fri, 23 Apr 2021 05:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210423114139.GA26468@plvision.eu>
In-Reply-To: <20210423114139.GA26468@plvision.eu>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Apr 2021 08:02:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA63TUbtb3iEFpVkH4S3qOcaaZ-sbYw7_grJMY8AA9_=AQ@mail.gmail.com>
Message-ID: <CA+5PVA63TUbtb3iEFpVkH4S3qOcaaZ-sbYw7_grJMY8AA9_=AQ@mail.gmail.com>
Subject: Re: [GIT PULL v2] linux-firmware: mrvl: prestera: Add Marvell
 Prestera Switchdev firmware 3.0 version
To: Vadym Kochan <vadym.kochan@plvision.eu>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, netdev <netdev@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	Oleksandr Mazur <oleksandr.mazur@plvision.eu>, Serhiy Boiko <serhiy.boiko@plvision.eu>, 
	Serhiy Pshyk <serhiy.pshyk@plvision.eu>, Volodymyr Mytnyk <volodymyr.mytnyk@plvision.eu>, 
	Taras Chornyi <taras.chornyi@plvision.eu>, Mickey Rachamim <mickeyr@marvell.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 7:41 AM Vadym Kochan <vadym.kochan@plvision.eu> wrote:
>
> Hi,
>
> The following changes since commit bdf929da38adb269289a750b60004841a5c55479:
>
>   rtw88: 8822c: Update normal firmware to v9.9.9 (2021-04-23 07:06:04 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/PLVision/linux-firmware.git mrvl-prestera

Thanks.  Pulled and pushed out.

josh

> for you to fetch changes up to 16052e4a41bd0d47793fa33eb718081df28efe11:
>
>   mrvl: prestera: Add Marvell Prestera Switchdev firmware 3.0 version (2021-04-23 14:14:51 +0300)
>
> ----------------------------------------------------------------
> v2:
>     1) Add entry in WHENCE
>
> Vadym Kochan (1):
>       mrvl: prestera: Add Marvell Prestera Switchdev firmware 3.0 version
>
>  WHENCE                                  |   1 +
>  mrvl/prestera/mvsw_prestera_fw-v3.0.img | Bin 0 -> 13721584 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100755 mrvl/prestera/mvsw_prestera_fw-v3.0.img
