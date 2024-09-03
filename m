Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90481CD343D
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Sep 2024 14:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F7C3C4CECA; Tue,  3 Sep 2024 14:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A074C4CEC8
	for <linux-firmware@kernel.org>; Tue,  3 Sep 2024 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725374866;
	bh=s0qNyF8Z0L2RIYLiNDrEXtPAa6gWe40+lDGzeOQdiK8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Qfs7ZYZoELaqff2wInrDbw8CGiFqpGy5gMjNDId9vzv1cWC4sWPuc1az/Em5LqHBm
	 BdIp5aDMJucrzG8sdQqSHTLDG0p9BMuAkoAWgYvMwO9RrUIq0EPTiauWZGUXrq7H2W
	 2hbglOWxlAyodvAhHFFK1QUrVcLLRE74mIYIv8BLxeQsyOsR9nRdFrhqZXgRBw9+Y+
	 7hdhwIQOJUrDEBUpNG5k1Kjw4S2QuB4RBzIbMKDdqPNO2aSEXTYpZWmkNqB0RYswBR
	 8+qNLYYb6agf+piik5WpSZSWsaG1FOrndQKCPYZBXbzg6Y4VePeIJjILS4Ro8hKuGP
	 b6f0soinorp4w==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-690aabe2600so43965787b3.0
        for <linux-firmware@kernel.org>; Tue, 03 Sep 2024 07:47:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YxJjFGyWG6aITqdbD81EkbzA6I9F93fIDqGYcvkjiaz7A0TjwBT
	JPBuoPnNFKeCxMGp/BkKTaoDqbIRV+TnTMIje1trJhrhDNX9TYeVdwfeAFEKECrEGMCuAza4HFa
	mMDX3sT19Q//F1C/Xz6D8GgZ4LoE=
X-Google-Smtp-Source: AGHT+IGmaP9BZ7tNhCzK5ZmT/pxf5wR0cHZ6gHfjqAkqJ4GKH+UKpeV3xtl/RHlSRE4O+beoVCJ9pfTzeTvPmazgh5c=
X-Received: by 2002:a05:690c:3245:b0:6b0:a6f0:b0da with SMTP id
 00721157ae682-6d40f340af9mr126775307b3.12.1725374865447; Tue, 03 Sep 2024
 07:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <MW5PR11MB5810E786AA5A366E2DD412ACA3932@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5810E786AA5A366E2DD412ACA3932@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 3 Sep 2024 10:47:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6EOXPTb0dQwyV9q1-bqmdfp5_OHqEwaALG0PTwRk+i+g@mail.gmail.com>
Message-ID: <CA+5PVA6EOXPTb0dQwyV9q1-bqmdfp5_OHqEwaALG0PTwRk+i+g@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-09-03
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Wireless <linux-wireless@vger.kernel.org>, 
	"kyle@infradead.org" <kyle@infradead.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"Ben Ami, Golan" <golan.ben.ami@intel.com>, "Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 10:23=E2=80=AFAM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
>
>
> This contains the new firmware for Bz devices.
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
> The following changes since commit a0ff525ced1ebcaae1ace6c4a431242c39667c=
ba:
>
>
>
>   Merge branch 'rtl81261-3' into 'main' (2024-09-03 11:24:33 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2024-09-03

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/288

josh
