Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC80C369AB
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Apr 2025 13:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6DAA0C4CEE5; Tue, 15 Apr 2025 13:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57804C4CEDD
	for <linux-firmware@kernel.org>; Tue, 15 Apr 2025 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744725045;
	bh=Py4WqIQI3lHNFjlVWjBDEKlptivlXCJ8rCYRfvCtIh4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=R+T6mgJGAYktdDsjbmSiAS9KUdnwvldxA0iRr+r7qpWocVck2BrofK16z0s95rVUm
	 LlCQSbGKNErk9TUFqBCJCDRzJ9h754OPLY+D2uXLmG0NjhCTpTyD6OY/CsrVB76roS
	 SFblC5Ktrd8zO/jUXWURIl4trS31E75bLhPyn+ouMmylXE7ESlGBMvhYYCA7tBpcld
	 XQr/7Z5KRjoexyH8+iXCDURQUbgJ2iuwIAQ+/dx/guDUoCQGyeEOu2kdkN/iQ3UPhU
	 BR73iFKPCABL+BdhjGrt3iHTIy+fXO5njoP8agcSbd6ssjbrJj099jbAmuNhy5+CZQ
	 asCqzar7xq1dg==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53a91756e5so5149795276.1
        for <linux-firmware@kernel.org>; Tue, 15 Apr 2025 06:50:44 -0700 (PDT)
X-Gm-Message-State: AOJu0YyC5Ykvr7BmxK+bueeT/6iqIyl0x97EltSik9cGrjnUYko0XQ4E
	HSGpWiByYCgyya/AJ16eHyqtqLdC+Rw30MkiSdh0rQ7DhCd3xMPVEmCmOZIcr0OD07HutO9pmL1
	6Dxt7kEGiA3z/8AHFuP5d2GdSp/g=
X-Google-Smtp-Source: AGHT+IFDFQ8iDbSWaRx2DqQDbJqwhMKfYT4ZZ+hjNhiYcacuWuykD06kgnxhJsIYCAi0BNOI6eiVzq+T2jMkXP+u7fo=
X-Received: by 2002:a05:6902:2190:b0:e64:3e3a:f000 with SMTP id
 3f1490d57ef6-e704decaac4mr26651917276.25.1744725043554; Tue, 15 Apr 2025
 06:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <3a95047a-36f3-4819-8d8e-4278f70d33bf@linux.intel.com>
In-Reply-To: <3a95047a-36f3-4819-8d8e-4278f70d33bf@linux.intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 15 Apr 2025 09:50:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6Pkwm=Y-a4dT4hw0ZDNP9SskA2Jk=gjX_qT2FCD+MhXA@mail.gmail.com>
X-Gm-Features: ATxdqUHYNZVQflMHNFQ4cugm56JxTAEcRX5kYNkBOQav9vjbRCXQk8rtMK2v72w
Message-ID: <CA+5PVA6Pkwm=Y-a4dT4hw0ZDNP9SskA2Jk=gjX_qT2FCD+MhXA@mail.gmail.com>
Subject: Re: intel: avs: Update topology files
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 8:39=E2=80=AFAM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> This patchset updates topology files for avs driver to align with latest
> changes in topology repository [1].
>
> Overall there were minor cleanups with incorrect ordering of XML nodes
> and added new field to assign FE DAI IDs. The FE DAI ID assignment being
> more important change, as while for current users there should be no
> noticeable difference, future kernel versions require FE DAI IDs to be
> set correctly - see [2] for full patchset and [3] for commit. Do note
> that almost all topologies available in linux-firmware tree expose only
> one FE, and already had its ID set to 0 automatically. The only one that
> really needs to be updated is HDMI topology which exposes 3 FEs and
> needs them numbered correctly, otherwise future kernel versions will
> fail to load it.
>
> [1]: https://github.com/thesofproject/avs-topology-xml
> [2]:
> https://lore.kernel.org/linux-sound/20250407124154.1713039-1-amadeuszx.sl=
awinski@linux.intel.com/
> [3]:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/=
sound/soc/intel/avs?id=3De3dc0351d7a0fdcde18ed1719c9149b1a656e7ec
>
> ---
>
> The following changes since commit 6a006cef10cebfaa282100a81cb45ad3a92127=
21:
>
>    Merge branch 'intel/guc_70441' into 'main' (2025-04-10 20:59:06 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/amadeuszslawinski-intel/linux-firmware.git
> 2025.04.15_topology_update

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/513

josh

>
> for you to fetch changes up to 75a26a64e907139c2979852003fe88cdb62c103c:
>
>    intel: avs: Update topology file for I2S Analog Devices 4567
> (2025-04-15 13:22:03 +0200)
>
> ----------------------------------------------------------------
> Amadeusz S=C5=82awi=C5=84ski (15):
>        intel: avs: Update topology file for I2S Dialog 7219
>        intel: avs: Update topology file for Digital Microphone Array
>        intel: avs: Update topology file for HDMI codecs
>        intel: avs: Update topology file for HDAudio codecs
>        intel: avs: Update topology file for I2S Maxim 98357a
>        intel: avs: Update topology file for I2S Maxim 98373
>        intel: avs: Update topology file for I2S Maxim 98927
>        intel: avs: Update topology file for I2S Nuvoton 8825
>        intel: avs: Update topology file for I2S Realtek 274
>        intel: avs: Update topology file for I2S Realtek 286
>        intel: avs: Update topology file for I2S Realtek 298
>        intel: avs: Update topology file for I2S Realtek 5514
>        intel: avs: Update topology file for I2S Realtek 5640
>        intel: avs: Update topology file for I2S Realtek 5663
>        intel: avs: Update topology file for I2S Analog Devices 4567
>
>   intel/avs/da7219-tplg.bin           | Bin 4576 -> 4576 bytes
>   intel/avs/dmic-tplg.bin             | Bin 9064 -> 9064 bytes
>   intel/avs/hda-808628xx-3ep-tplg.bin | Bin 7264 -> 7264 bytes
>   intel/avs/hda-generic-1ep-tplg.bin  | Bin 7372 -> 7372 bytes
>   intel/avs/max98357a-tplg.bin        | Bin 3228 -> 3228 bytes
>   intel/avs/max98373-tplg.bin         | Bin 3748 -> 3748 bytes
>   intel/avs/max98927-tplg.bin         | Bin 3748 -> 3748 bytes
>   intel/avs/nau8825-tplg.bin          | Bin 4576 -> 4576 bytes
>   intel/avs/rt274-tplg.bin            | Bin 4976 -> 4976 bytes
>   intel/avs/rt286-tplg.bin            | Bin 4976 -> 4976 bytes
>   intel/avs/rt298-tplg.bin            | Bin 4976 -> 4976 bytes
>   intel/avs/rt5514-tplg.bin           | Bin 3144 -> 3144 bytes
>   intel/avs/rt5640-tplg.bin           | Bin 5652 -> 5652 bytes
>   intel/avs/rt5663-tplg.bin           | Bin 4576 -> 4576 bytes
>   intel/avs/ssm4567-tplg.bin          | Bin 3740 -> 3740 bytes
>   15 files changed, 0 insertions(+), 0 deletions(-)
